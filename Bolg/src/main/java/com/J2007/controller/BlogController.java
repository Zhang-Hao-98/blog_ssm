package com.J2007.controller;

import com.J2007.pojo.Blog;
import com.J2007.pojo.Categroy;
import com.J2007.pojo.User;
import com.J2007.service.BlogService;
import com.J2007.service.CategroyService;
import com.github.pagehelper.PageInfo;
import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import utils.State;
import utils.WangEditor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.Date;
import java.util.List;
import java.util.UUID;

@Controller
@RequestMapping("/blog")
public class BlogController {

    @Autowired
    private BlogService blogService;

    @Autowired
    private CategroyService categroyService;

    @RequestMapping("toAddBlog")
    public String toAddBlog(ModelMap modelMap) {
        List<Categroy> list = categroyService.selectAll();
        modelMap.addAttribute("categroyList", list);
        return "user-addarticle";
    }

    @RequestMapping("toBlogList/{pageNum}")
    @ResponseBody
    public State toBlogList(@PathVariable("pageNum")int pageNum) {
        PageInfo<Blog> pageInfo = blogService.findBlogTysPage(pageNum, 5);
        return State.success().add("pageInfo", pageInfo);
    }

    @RequestMapping("toBlogForUser/{pageNum}")
    @ResponseBody
    public State toBlogByUser(HttpSession session,@PathVariable("pageNum")int pageNum) {
        User user = (User)session.getAttribute("user");
        PageInfo<Blog> pageInfo = blogService.findByUser(user.getUserId(),pageNum,10);
        return State.success().add("pageInfo", pageInfo);
    }


    @RequestMapping("blogAdd")
    public String BlogAdd(@ModelAttribute Blog blog,String categroyid,@RequestParam(value = "photo", required = false) MultipartFile multipartFile, Model model, HttpServletRequest request) throws IOException {

        // 图片上传
        String realPath = request.getSession().getServletContext().getRealPath("");
        InputStream inputStream = multipartFile.getInputStream();
        String contextPath = request.getContextPath();
        // 服务器根目录的路径
        String path = null;
        if(contextPath.length()>0) {
            path = realPath.replace(contextPath.substring(1), "");
        }else{
            path = realPath;
        }
        // 根目录下新建文件夹upload，存放上传图片
        String uploadPath = path + "//image";
//            System.out.println("uploadPath:"+uploadPath);
        /* 获取上传文件的后缀 */
        String suffix = multipartFile.getOriginalFilename().substring (multipartFile.getOriginalFilename().lastIndexOf("."));

        /* 保存文件名称 */
        String filename = UUID.randomUUID().toString()+ suffix;
            System.out.println("filename:"+filename);
        // 将文件上传的服务器根目录下的upload文件夹
        File file = new File(uploadPath, filename);
        FileUtils.copyInputStreamToFile(inputStream, file);

        HttpSession session = request.getSession();

        User user = (User)session.getAttribute("user");

        Categroy categroy = categroyService.selectById(Integer.parseInt(categroyid));
        blog.setCategroy(categroy);
        blog.setPicture("image//"+filename);
        blog.setUser(user);
        blog.setCommentNum(0);
        blog.setReadNum(0);
        blog.setPublishTime(new Date());
        blog.setLastModifyTime(new Date());
        System.out.println(blog);
        if (blogService.insertBlog(blog)) {
            model.addAttribute("msg", "博客提交成功！");
        } else {
            model.addAttribute("msg", "博客提交失败！");
        }
        return "user-addarticle";
    }

    @PostMapping("/upload")
    @ResponseBody
    public WangEditor addUmg(@RequestParam(value = "myFile", required = false) MultipartFile multipartFile, HttpServletRequest request) throws IOException {
        try {
            // 获取服务器真实路径
            String realPath = request.getSession().getServletContext().getRealPath("");
            InputStream inputStream = multipartFile.getInputStream();
            String contextPath = request.getContextPath();
            // 服务器根目录的路径
            String path = null;
            if(contextPath.length()>0) {
                path = realPath.replace(contextPath.substring(1), "");
            }else{
                path = realPath;
            }
            // 根目录下新建文件夹upload，存放上传图片
            String uploadPath = path + "//upload";
//            System.out.println("uploadPath:"+uploadPath);
            /* 获取上传文件的后缀 */
            String suffix = multipartFile.getOriginalFilename().substring (multipartFile.getOriginalFilename().lastIndexOf("."));

            /* 保存文件名称 */
            String filename = UUID.randomUUID().toString()+ suffix;
//            System.out.println("filename:"+filename);
            // 将文件上传的服务器根目录下的upload文件夹
            File file = new File(uploadPath, filename);
            FileUtils.copyInputStreamToFile(inputStream, file);
            // 返回图片访问路径
            String url = request.getScheme() + "://" + request.getServerName()
                    + ":" + request.getServerPort() + "/upload/" + filename;

//            System.out.println("url:"+url);
            String[] strs = {url};
            WangEditor we = new WangEditor();
            we.setErrno(new Integer(0));
            we.setData(strs);
            return we;
        } catch (IOException e) {
            //log.error("上传文件失败", e);
            e.printStackTrace();
        }
        return null;
    }

    @RequestMapping("delete")
    @ResponseBody
    public String deleteBlog(int[] blogids,Model model) {
        for (int blogid : blogids) {
            System.out.println(blogid);
        }
        if (blogService.deleteBlog(blogids)) {
            return "博客删除成功！";
        } else {
            return "博客删除失败！";
        }
    }

    @RequestMapping(value = "showblog/{blogId}",method = RequestMethod.GET)
    public String showBlog(@PathVariable("blogId") int blogId,Model model) {
        System.out.println(blogId);
        Blog blog = blogService.findById(blogId);
        model.addAttribute("blog", blog);
        return "/blog-show";
    }
}
