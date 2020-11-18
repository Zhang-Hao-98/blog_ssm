<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<base href="${pagecontext.request.getcontextpath }">
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="description" content="">
        <meta name="keywords" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
        <title>BLOG index with sidebar & slider | Amaze UI Examples</title>
        <meta name="renderer" content="webkit">
        <meta http-equiv="Cache-Control" content="no-siteapp"/>
        <link rel="icon" type="image/png" href="/assets/i/favicon.png">
        <meta name="mobile-web-app-capable" content="yes">
        <link rel="icon" sizes="192x192" href="/assets/i/app-icon72x72@2x.png">
        <meta name="apple-mobile-web-app-capable" content="yes">
        <meta name="apple-mobile-web-app-status-bar-style" content="black">
        <meta name="apple-mobile-web-app-title" content="Amaze UI"/>
        <link rel="apple-touch-icon-precomposed" href="/assets/i/app-icon72x72@2x.png">
        <meta name="msapplication-TileImage" content="/assets/i/app-icon72x72@2x.png">
        <meta name="msapplication-TileColor" content="#0e90d2">
        <link rel="stylesheet" href="/assets/css/amazeui.min.css">
        <link rel="stylesheet" href="/assets/css/app.css">
    </head>

    <body id="blog">

        <header class="am-g am-g-fixed blog-fixed blog-text-center blog-header">

        </header>
        <hr>
        <!-- nav start -->
        <nav class="am-g am-g-fixed blog-fixed blog-nav">
            <button class="am-topbar-btn am-topbar-toggle am-btn am-btn-sm am-btn-success am-show-sm-only blog-button"
                    data-am-collapse="{target: '#blog-collapse'}"><span class="am-sr-only">导航切换</span> <span
                    class="am-icon-bars"></span></button>

            <div class="am-collapse am-topbar-collapse" id="blog-collapse">
                <ul class="am-nav am-nav-pills am-topbar-nav">
                    <li class="am-active"><a href="/blog-index.jsp">首页</a></li>
                    <li class="am-dropdown" data-am-dropdown>
                        <a class="am-dropdown-toggle" data-am-dropdown-toggle href="javascript:;">
                            我的 <span class="am-icon-caret-down"></span>
                        </a>
                        <ul class="am-dropdown-content">
                            <c:choose>
                                <c:when test="${!empty sessionScope.user}">
                                    <li><a href="/user-index.jsp">个人中心</a></li>
                                    <li><a href="/blog-my-list.jsp">博客</a></li>
                                    <li><a href="/user/loginOut">退出</a></li>
                                </c:when>
                                <c:when test="${empty sessionScope.user}">
                                    <li><a href="/login.jsp">登录</a></li>
                                    <li><a href="/register.jsp">注册</a></li>
                                </c:when>
                            </c:choose>
                        </ul>
                    </li>
                    <li><a href="lw-timeline.html">浏览记录</a></li>
                </ul>
                <form class="am-topbar-form am-topbar-right am-form-inline" role="search">
                    <div class="am-form-group">
                        <input type="text" class="am-form-field am-input-sm" placeholder="搜索">
                    </div>
                </form>
            </div>
        </nav>
        <hr>
        <!-- nav end -->
        <!-- banner start -->
        <div class="am-g am-g-fixed blog-fixed am-u-sm-centered blog-article-margin">
            <div data-am-widget="slider" class="am-slider am-slider-b1" data-am-slider='{&quot;controlNav&quot;:false}'>
                <ul class="am-slides">
                    <li>
                        <img src="/assets/i/b1.jpg">
                        <div class="blog-slider-desc am-slider-desc ">
                            <div class="blog-text-center blog-slider-con">
                                <span><a href="" class="blog-color">Article &nbsp;</a></span>
                                <h1 class="blog-h-margin"><a href="">总在思考一句积极的话</a></h1>
                                <p>那时候刚好下着雨，柏油路面湿冷冷的，还闪烁着青、黄、红颜色的灯火。
                                </p>
                                <span class="blog-bor">2015/10/9</span>
                                <br><br><br><br><br><br><br>
                            </div>
                        </div>
                    </li>
                    <li>
                        <img src="/assets/i/b2.jpg">
                        <div class="am-slider-desc blog-slider-desc">
                            <div class="blog-text-center blog-slider-con">
                                <span><a href="" class="blog-color">Article &nbsp;</a></span>
                                <h1 class="blog-h-margin"><a href="">总在思考一句积极的话</a></h1>
                                <p>那时候刚好下着雨，柏油路面湿冷冷的，还闪烁着青、黄、红颜色的灯火。
                                </p>
                                <span>2015/10/9</span>
                            </div>
                        </div>
                    </li>
                    <li>
                        <img src="/assets/i/b3.jpg">
                        <div class="am-slider-desc blog-slider-desc">
                            <div class="blog-text-center blog-slider-con">
                                <span><a href="" class="blog-color">Article &nbsp;</a></span>
                                <h1 class="blog-h-margin"><a href="">总在思考一句积极的话</a></h1>
                                <p>那时候刚好下着雨，柏油路面湿冷冷的，还闪烁着青、黄、红颜色的灯火。
                                </p>
                                <span>2015/10/9</span>
                            </div>
                        </div>
                    </li>
                    <li>
                        <img src="/assets/i/b2.jpg">
                        <div class="am-slider-desc blog-slider-desc">
                            <div class="blog-text-center blog-slider-con">
                                <span><a href="" class="blog-color">Article &nbsp;</a></span>
                                <h1 class="blog-h-margin"><a href="">总在思考一句积极的话</a></h1>
                                <p>那时候刚好下着雨，柏油路面湿冷冷的，还闪烁着青、黄、红颜色的灯火。
                                </p>
                                <span>2015/10/9</span>
                            </div>
                        </div>
                    </li>
                </ul>
            </div>
        </div>
        <!-- banner end -->

        <!-- content srart -->
        <div class="am-g am-g-fixed blog-fixed">
            <div class="am-u-md-8 am-u-sm-12" id="contents">

                <article class="am-g blog-entry-article">
                    <div class="am-u-lg-6 am-u-md-12 am-u-sm-12 blog-entry-img">
                        <img src="/assets/i/f10.jpg" alt="" class="am-u-sm-12">
                    </div>
                    <div class="am-u-lg-6 am-u-md-12 am-u-sm-12 blog-entry-text">
                        <span><a href="" class="blog-color">article &nbsp;</a></span>
                        <span> @amazeUI &nbsp;</span>
                        <span>2015/10/9</span>
                        <h1><a href="">我本楚狂人，凤歌笑孔丘</a></h1>
                        <p>我们一直在坚持着，不是为了改变这个世界，而是希望不被这个世界所改变。
                        </p>
                        <p><a href="" class="blog-continue">continue reading</a></p>
                    </div>
                </article>

            </div>

            <div class="am-u-md-4 am-u-sm-12 blog-sidebar">
                <div class="blog-sidebar-widget blog-bor">
                    <h2 class="blog-text-center blog-title"><span>About ME</span></h2>
                    <img src="/assets/i/f14.jpg" alt="about me" class="blog-entry-img">
                    <p>妹纸</p>
                    <p>
                        我是妹子UI，中国首个开源 HTML5 跨屏前端框架
                    </p>
                    <p>我不想成为一个庸俗的人。十年百年后，当我们死去，质疑我们的人同样死去，后人看到的是裹足不前、原地打转的你，还是一直奔跑、走到远方的我？</p>
                </div>
                <div class="blog-sidebar-widget blog-bor">
                    <h2 class="blog-text-center blog-title"><span>Contact ME</span></h2>
                    <p>
                        <a href=""><span class="am-icon-qq am-icon-fw am-primary blog-icon"></span></a>
                        <a href=""><span class="am-icon-github am-icon-fw blog-icon"></span></a>
                        <a href=""><span class="am-icon-weibo am-icon-fw blog-icon"></span></a>
                        <a href=""><span class="am-icon-reddit am-icon-fw blog-icon"></span></a>
                        <a href=""><span class="am-icon-weixin am-icon-fw blog-icon"></span></a>
                    </p>
                </div>
                <div class="blog-clear-margin blog-sidebar-widget blog-bor am-g ">
                    <h2 class="blog-title"><span>TAG cloud</span></h2>
                    <div class="am-u-sm-12 blog-clear-padding">
                        <a href="" class="blog-tag">amaze</a>
                        <a href="" class="blog-tag">妹纸 UI</a>
                        <a href="" class="blog-tag">HTML5</a>
                        <a href="" class="blog-tag">这是标签</a>
                        <a href="" class="blog-tag">Impossible</a>
                        <a href="" class="blog-tag">开源前端框架</a>
                    </div>
                </div>
                <div class="blog-sidebar-widget blog-bor">
                    <h2 class="blog-title"><span>么么哒</span></h2>
                    <ul class="am-list">
                        <li><a href="#">每个人都有一个死角， 自己走不出来，别人也闯不进去。</a></li>
                        <li><a href="#">我把最深沉的秘密放在那里。</a></li>
                        <li><a href="#">你不懂我，我不怪你。</a></li>
                        <li><a href="#">每个人都有一道伤口， 或深或浅，盖上布，以为不存在。</a></li>
                    </ul>
                </div>
            </div>
        </div>
        <!-- content end -->


        <footer class="blog-footer">
            <div class="am-g am-g-fixed blog-fixed am-u-sm-centered blog-footer-padding">
                <div class="am-u-sm-12 am-u-md-4- am-u-lg-4">
                    <h3>模板简介</h3>
                    <p class="am-text-sm">这是一个使用amazeUI做的简单的前端模板。<br> 博客/ 资讯类 前端模板 <br> 支持响应式，多种布局，包括主页、文章页、媒体页、分类页等<br>嗯嗯嗯，不知道说啥了。外面的世界真精彩<br><br>
                        Amaze UI 使用 MIT 许可证发布，用户可以自由使用、复制、修改、合并、出版发行、散布、再授权及贩售 Amaze UI 及其副本。</p>
                </div>
                <div class="am-u-sm-12 am-u-md-4- am-u-lg-4">
                    <h3>社交账号</h3>
                    <p>
                        <a href=""><span class="am-icon-qq am-icon-fw am-primary blog-icon blog-icon"></span></a>
                        <a href=""><span class="am-icon-github am-icon-fw blog-icon blog-icon"></span></a>
                        <a href=""><span class="am-icon-weibo am-icon-fw blog-icon blog-icon"></span></a>
                        <a href=""><span class="am-icon-reddit am-icon-fw blog-icon blog-icon"></span></a>
                        <a href=""><span class="am-icon-weixin am-icon-fw blog-icon blog-icon"></span></a>
                    </p>
                    <h3>Credits</h3>
                    <p>我们追求卓越，然时间、经验、能力有限。Amaze UI 有很多不足的地方，希望大家包容、不吝赐教，给我们提意见、建议。感谢你们！</p>
                </div>
                <div class="am-u-sm-12 am-u-md-4- am-u-lg-4">
                    <h1>我们站在巨人的肩膀上</h1>
                    <h3>Heroes</h3>
                    <p>
                    <ul>
                        <li>jQuery</li>
                        <li>Zepto.js</li>
                        <li>Seajs</li>
                        <li>LESS</li>
                        <li>...</li>
                    </ul>
                    </p>
                </div>
            </div>
            <div class="blog-text-center">© 2015 AllMobilize, Inc. Licensed under MIT license. Made with love By
                LWXYFER
            </div>
        </footer>


        <!--[if (gte IE 9)|!(IE)]><!-->
        <script src="/assets/js/jquery.min.js"></script>
        <!--<![endif]-->
        <![endif]-->
        <script src="/assets/js/amazeui.min.js"></script>

    </body>
    <script>
        var pageInfo;
        $(function () {
            goPage(1);
        })
        //获取分页
        function goPage(cp) {
            $.get('/blog/toBlogList/'+cp, function (data) {
                data = data.extend.pageInfo;
                pageInfo = data;
                console.info("后"+data.nextPage);
                var list = data.list;
                var tadata = '';
                for (var i = 0; i < list.length; i++) {
                    tadata += '<article class="am-g blog-entry-article">';
                    tadata += '<div class="am-u-lg-6 am-u-md-12 am-u-sm-12 blog-entry-img">';
                    tadata += '<img src="/'+list[i].picture+'" alt="" class="am-u-sm-12" height="200px">';
                    tadata += '</div>';
                    tadata += '<div class="am-u-lg-6 am-u-md-12 am-u-sm-12 blog-entry-text">';
                    tadata += '<span><a href="/blog/showblog/'+list[i].blogId+'" class="blog-color">'+list[i].user.username+' &nbsp;</a></span>';
                    tadata += '<span> @amazeUI &nbsp;</span>';
                    tadata += '<span>'+list[i].publishTime+'</span>';
                    tadata += '<h1><a href="/blog/showblog/'+list[i].blogId+'">'+list[i].title+'</a></h1>';
                    tadata += '<p>'+list[i].describe+'</p>';
                    tadata += '<p><a href="" class="blog-continue">continue reading</a></p>';
                    tadata += '</div>';
                    tadata += '</article>';
                }
                tadata +=' <ul class="am-pagination">';
                tadata +='<li class="am-pagination-prev"><a href="#" id="prev" onclick="goPage('+data.prePage+')">&laquo; Prev</a></li>';
                tadata +='<li class="am-pagination-next"><a href="#" id="next" onclick="goPage('+data.nextPage+')">Next &raquo;</a></li>';
                tadata +='</ul>';
                $('#contents')[0].innerHTML = tadata;
            });
        }

    </script>
</html>