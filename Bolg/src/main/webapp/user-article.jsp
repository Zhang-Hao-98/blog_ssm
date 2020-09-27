<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<base href="${pagecontext.request.getcontextpath }">
<html lang="zh-CN">
<head>
<meta charset="utf-8">
<meta name="renderer" content="webkit">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>文章 - SOFTEEM博客管理系统</title>
<link rel="stylesheet" type="text/css" href="/assets/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="/assets/css/style.css">
<link rel="stylesheet" type="text/css" href="/assets/css/font-awesome.min.css">
<link rel="apple-touch-icon-precomposed" href="/assets/images/icon/icon.png">
<link rel="shortcut icon" href="/assets/images/icon/favicon.ico">
<script src="/assets/js/jquery-2.1.4.min.js"></script>
<!--[if gte IE 9]>
  <script src="/assets/js/jquery-1.11.1.min.js" type="text/javascript"></script>
  <script src="/assets/js/html5shiv.min.js" type="text/javascript"></script>
  <script src="/assets/js/respond.min.js" type="text/javascript"></script>
  <script src="/assets/js/selectivizr-min.js" type="text/javascript"></script>
<![endif]-->
<!--[if lt IE 9]>
  <script>window.location.href='upgrade-browser.html';</script>
<![endif]-->
</head>

<body class="user-select">
<section class="container-fluid">
  <div class="row">
    <div class="col-sm-12 col-md-12 col-lg-12  main" id="main">
      <%--<form action="" method="post" >--%>
        <h1 class="page-header">操作</h1>
        <ol class="breadcrumb">
          <li><a href="/blog/toAddBlog">增加文章</a></li>
        </ol>
        <h1 class="page-header">管理 <span class="badge">7</span></h1>
        <div class="table-responsive">
          <table class="table table-striped table-hover">
            <thead>
              <tr>
                <th><span class="glyphicon glyphicon-th-large"></span> <span class="visible-lg">选择</span></th>
                <th><span class="glyphicon glyphicon-file"></span> <span class="visible-lg">标题</span></th>
                <th><span class="glyphicon glyphicon-list"></span> <span class="visible-lg">栏目</span></th>
                <th class="hidden-sm"><span class="glyphicon glyphicon-tag"></span> <span class="visible-lg">标签</span></th>
                <th class="hidden-sm"><span class="glyphicon glyphicon-comment"></span> <span class="visible-lg">评论</span></th>
                <th class="hidden-sm"><span class="glyphicon glyphicon-comment"></span> <span class="visible-lg">阅读</span></th>
                <th><span class="glyphicon glyphicon-time"></span> <span class="visible-lg">上传日期</span></th>
                <th><span class="glyphicon glyphicon-time"></span> <span class="visible-lg">修改日期</span></th>
                <th><span class="glyphicon glyphicon-pencil"></span> <span class="visible-lg">操作</span></th>
              </tr>
            </thead>
            <tbody>
            <c:forEach var="blog" items="${UserBlogs}">
              <tr>
                <td><input type="checkbox" class="input-control" name="checked" value="${blog.blogId}" /></td>
                <td class="article-title">${blog.title}</td>
                <td>${blog.categroy.name}</td>
                <td class="hidden-sm">PHP、JavaScript</td>
                <td class="hidden-sm">${blog.commentNum}</td>
                <td class="hidden-sm">${blog.readNum}</td>
                <td>${blog.publishTime}</td>
                <td>${blog.lastModifyTime}</td>
                <td><a href="">修改</a></td>
              </tr>
            </c:forEach>
            </tbody>
          </table>
        </div>
        <footer class="message_footer">
          <nav>
            <div class="btn-toolbar operation" role="toolbar">
              <div class="btn-group" role="group"> <a class="btn btn-default" onClick="select();">全选</a> <a class="btn btn-default" onClick="reverse()">反选</a> <a class="btn btn-default" onClick="noselect()">不选</a> </div>
              <div class="btn-group" role="group">
                <button type="button" class="btn btn-default" data-toggle="tooltip" data-placement="bottom" title="删除全部选中" name="checkbox_delete">删除</button>
              </div>
            </div>
            <ul class="pagination pagenav">
              <li class="disabled"><a aria-label="Previous"> <span aria-hidden="true">&laquo;</span> </a> </li>
              <li class="active"><a href="#">1</a></li>
              <li><a href="#">2</a></li>
              <li><a href="#">3</a></li>
              <li><a href="#">4</a></li>
              <li><a href="#">5</a></li>
              <li><a href="#" aria-label="Next"> <span aria-hidden="true">&raquo;</span> </a> </li>
            </ul>
          </nav>
        </footer>
      <%--</form>--%>
    </div>
  </div>
</section>
<script src="/assets/js/bootstrap.min.js"></script>
<script src="/assets/js/admin-scripts.js"></script>
<script>
//是否确认删除
$(function(){   
	$("[name=checkbox_delete]").click(function(){
      var list = new Array();
      $('[name=checked]:checked').each(function () {
        list.push($(this).val());
      })
		if (event.srcElement.outerText == "删除") 
		{
			if(window.confirm("此操作不可逆，是否确认？"))
			{
				$.ajax({
					type: "POST",
					url: "/blog/delete",
					data: "blogids="+list,
					cache: false, //不缓存此页面
					success: function (data) {
                     alert(data);
					}
				});
			};
		};
	});   
});
</script>
</body>
</html>
