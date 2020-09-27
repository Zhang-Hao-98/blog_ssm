<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<base href="${pagecontext.request.getcontextpath }">
<html lang="zh-CN">
    <head>
        <meta charset="utf-8">
        <meta name="renderer" content="webkit">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>写文章 - SOFTEEM博客管理系统</title>
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

                <div class="col-sm-12 col-md-12 col-lg-12 main" id="main">
                    <div class="row">
                        <form action="/blog/blogAdd" method="post" enctype="multipart/form-data" class="add-article-form">
                            <div class="col-md-9">
                                <h1 class="page-header">撰写新文章</h1>
                                <div class="form-group">
                                    <label for="article-title" class="sr-only">标题</label>
                                    <input type="text" id="article-title" name="title" class="form-control" placeholder="在此处输入标题" required autofocus autocomplete="off">
                                </div>
                                <div class="form-group" id="editor">
                                    <textarea style="display: none" name="content" id="txtIntro"></textarea>
                                </div>
                                <div class="add-article-box">
                                    <h2 class="add-article-box-title"><span>描述</span></h2>
                                    <div class="add-article-box-content">
                                        <textarea class="form-control" name="describe" autocomplete="off"></textarea>
                                        <span class="prompt-text">描述是可选的手工创建的内容总结，并可以在网页描述中使用</span>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-3">
                                <h1 class="page-header">操作</h1>
                                <div class="add-article-box">
                                    <h2 class="add-article-box-title"><span>栏目</span></h2>
                                    <div class="add-article-box-content">
                                        <ul class="category-list">
                                            <c:forEach var="categroy" items="${categroyList}">
                                                <li>
                                                    <label>
                                                        <input name="categroyid" type="radio" value="${categroy.categroyId}" checked>
                                                        ${categroy.name} <em class="hidden-md">( 栏目ID: <span>${categroy.categroyId}</span> )</em></label>
                                                </li>
                                            </c:forEach>

                                        </ul>
                                    </div>
                                </div>
                                <div class="add-article-box">
                                    <h2 class="add-article-box-title"><span>标签</span></h2>
                                    <div class="add-article-box-content">
                                        <input type="text" class="form-control" placeholder="输入新标签" name="tags" autocomplete="off">
                                        <span class="prompt-text">多个标签请用英文逗号,隔开</span> </div>
                                </div>
                                <div class="add-article-box">
                                    <h2 class="add-article-box-title"><span>标题图片</span></h2>
                                    <div class="add-article-box-content">
                                        <input type="text" class="form-control" placeholder="点击按钮选择图片" id="pictureUpload" name="titlepic" autocomplete="off">
                                        <input type="file" name="photo" id="picture" style="display: none">
                                    </div>
                                    <div class="add-article-box-footer">
                                        <button class="btn btn-default" type="button" ID="upImage" onclick="$('#picture').click()">选择</button>
                                    </div>
                                </div>
                                <div class="add-article-box">
                                    <h2 class="add-article-box-title"><span>发布</span></h2>
                                    <div class="add-article-box-content">
                                        <p><label>状态：</label><span class="article-status-display">未发布</span></p>
                                        <p><label>公开度：</label><input type="radio" name="visibility" value="0" checked/>公开 <input type="radio" name="visibility" value="1" />加密</p>
                                        <p><label>发布于：</label><span class="article-time-display"><input style="border: none;" type="datetime" name="time" value="2016-01-09 17:29:37" /></span></p>
                                    </div>
                                    <div class="add-article-box-footer">
                                        <button class="btn btn-primary" type="submit" name="submit">发布</button>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </section>

        <script src="/assets/js/bootstrap.min.js"></script>
        <script src="/assets/js/admin-scripts.js"></script>
        <script src="/wangEditor-3.1.1/release/wangEditor.min.js"></script>
        <%--<script src="/assets/lib/ueditor/ueditor.config.js"></script>--%>
        <%--<script src="/assets/lib/ueditor/ueditor.all.min.js"> </script>--%>
        <%--<script src="/assets/lib/ueditor/lang/zh-cn/zh-cn.js"></script>--%>
        <%--<script id="uploadEditor" type="text/plain" style="display:none;"></script>--%>
        <script type="text/javascript">
            var E = window.wangEditor
            var editor = new E('${'#editor'}')
            var $text1 = $('#txtIntro');
            // 监控wangEditor中的内容变化，并将html内容同步更新到 textarea
            editor.customConfig.onchange = function (html) {
                $text1.val(html);
            }


            //开启debug模式
            editor.customConfig.debug = true;
            // 关闭粘贴内容中的样式
            editor.customConfig.pasteFilterStyle = false
            // 忽略粘贴内容中的图片
            editor.customConfig.pasteIgnoreImg = true
            // 使用 base64 保存图片
            editor.customConfig.uploadImgShowBase64 = true
            editor.customConfig.uploadFileName = 'myFile'; //设置文件上传的参数名称
            editor.customConfig.uploadImgServer = '/blog/upload'
            editor.customConfig.uploadImgHooks = {
                before: function(xhr, editor, files) {

                },
                success: function(xhr, editor, result) {
                    console.log("上传成功");
                },
                fail: function(xhr, editor, result) {
                    console.log("上传失败,原因是" + result);
                },
                error: function(xhr, editor) {
                    console.log("上传出错");
                },
                timeout: function(xhr, editor) {
                    console.log("上传超时");
                }
            }
            editor.create()

            $text1.val(editor.txt.html());// 初始化 textarea 的值

        </script>
    </body>
</html>