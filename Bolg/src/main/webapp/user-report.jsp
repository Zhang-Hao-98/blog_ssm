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

  <div class="row">
    <div class="col-sm-9 col-sm-offset-1 col-md-10 col-lg-10 main" id="main">
      <h1 class="page-header">信息总览</h1>
      <div class="row placeholders">
        <div class="col-xs-6 col-sm-3 placeholder">
          <h4>文章</h4>
          <span class="text-muted">0 条</span> </div>
        <div class="col-xs-6 col-sm-3 placeholder">
          <h4>评论</h4>
          <span class="text-muted">0 条</span> </div>
        <div class="col-xs-6 col-sm-3 placeholder">
          <h4>友链</h4>
          <span class="text-muted">0 条</span> </div>
        <div class="col-xs-6 col-sm-3 placeholder">
          <h4>访问量</h4>
          <span class="text-muted">0</span> </div>
      </div>
      <h1 class="page-header">状态</h1>
      <div class="table-responsive">
        <table class="table table-striped table-hover">
          <tbody>
          <tr>
            <td>登录者: <span>admin</span>，这是您第 <span>13</span> 次登录</td>
          </tr>
          <tr>
            <td>上次登录时间: 2016-01-08 15:50:28 , 上次登录IP: ::1:55570</td>
          </tr>
          </tbody>
        </table>
      </div>
      <h1 class="page-header">系统信息</h1>
      <div class="table-responsive">
        <table class="table table-striped table-hover">
          <thead>
          <tr> </tr>
          </thead>
          <tbody>
          <tr>
            <td>管理员个数:</td>
            <td>2 人</td>
            <td>服务器软件:</td>
            <td>Apache Tomcat7.0</td>
          </tr>
          <tr>
            <td>浏览器:</td>
            <td>Chrome47</td>
            <td>JDK版本:</td>
            <td>1.8</td>
          </tr>
          <tr>
            <td>登录者IP:</td>
            <td>::1:55570</td>
            <td>MYSQL版本:</td>
            <td>5.5.40</td>
          </tr>
          <tr>
            <td>程序版本:</td>
            <td class="version">SOFTEEMCMS 1.0 <font size="-6" color="#BBB">(20160108160215)</font></td>
            <td>上传文件:</td>
            <td>可以 <font size="-6" color="#BBB">(最大文件：2M ，表单：8M )</font></td>
          </tr>
          <tr>
            <td>程序编码:</td>
            <td>UTF-8</td>
            <td>当前时间:</td>
            <td>2016-01-08 15:50:30</td>
          </tr>
          </tbody>
          <tfoot>
          <tr></tr>
          </tfoot>
        </table>
      </div>
    </div>
  </div>
</section>
<script src="/assets/js/bootstrap.min.js"></script>
<script src="/assets/js/admin-scripts.js"></script>
<script>
//是否确认删除
$(function(){   
	$("#main table tbody tr td a").click(function(){
		var name = $(this);
		var id = name.attr("rel"); //对应id  
		if (event.srcElement.outerText == "删除") 
		{
			if(window.confirm("此操作不可逆，是否确认？"))
			{
				$.ajax({
					type: "POST",
					url: "/Article/delete",
					data: "id=" + id,
					cache: false, //不缓存此页面   
					success: function (data) {
						window.location.reload();
					}
				});
			};
		};
	});   
});
</script>
</body>
</html>
