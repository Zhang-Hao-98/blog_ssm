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
        <h1 class="page-header">管理 <span class="badge" id="blogNum">7</span></h1>
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
            <tbody id="contents">
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
            <ul class="pagination pagenav" id="pagenation">

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

  goPage(1);

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

//获取分页
function goPage(cp) {
  $.get('/blog/toBlogForUser/'+cp, function (data) {
    data = data.extend.pageInfo;
    pageInfo = data;
    console.info("后"+data.nextPage);
    var list = data.list;
    var tadata = '';
    for (var i = 0; i < list.length; i++) {
      tadata += '<tr>';
      tadata += '<td><input type="checkbox" class="input-control" name="checked" value="'+list[i].blogId+'" /></td>';
      tadata += '<td class="article-title">'+list[i].title+'</td>' ;
      tadata += '<td>'+list[i].categroy.name+'</td>' ;
      tadata += '<td class="hidden-sm">PHP、JavaScript</td>\n' ;
      tadata += '<td class="hidden-sm">'+list[i].commentNum+'</td>' ;
      tadata += '<td class="hidden-sm">'+list[i].readNum+'</td>' ;
      tadata += '<td>'+list[i].publishTime+'</td>' ;
      tadata += '<td>'+list[i].lastModifyTime+'</td>' ;
      tadata += '<td><a href="">修改</a></td>' ;
      tadata += '</tr>';
    }
    $('#contents')[0].innerHTML = tadata;
    $('#blogNum').html(data.total);
    genPageLink(data)
  });
}

//分页连接
function genPageLink(data) {
    var ul = '';
    if (data.pageNum == 1) {
        ul += ' <li class="disabled"><a aria-label="Previous" onclick="goPage('+data.prePage+')"> <span aria-hidden="true">&laquo;</span> </a> </li>';
    } else {
        ul += ' <li ><a aria-label="Previous" onclick="goPage('+data.prePage+')"> <span aria-hidden="true">&laquo;</span> </a> </li>';
    }

    //中间也
    for (var i = 1; i <= data.pages; i++) {
        if (data.pageNum == i) {
            ul += '<li class="active"><a href="javascript:goPage(' + i + ');">' + i + '</a></li>';
        } else {
            ul += '<li ><a href="javascript:goPage(' + i + ');">' + i + '</a></li>';
        }
    }

    //下一页
    if (data.pageNum == data.pages) {
        ul += '<li class="disabled"><a href="javascript:goPage(' + data.nextPage + ');">&raquo;</a></li>';
    } else {
        ul += '<li><a href="javascript:goPage(' + data.nextPage + ');">&raquo;</a></li>';
    }

    $('#pagenation')[0].innerHTML = ul;
}
</script>
</body>
</html>
