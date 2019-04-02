<%@ page language="java" contentType="text/html; charset=Utf-8"
    pageEncoding="Utf-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions"  prefix="fn"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<base href="<%=basePath%>">
<!DOCTYPE html>
<!-- saved from url=(0039) books.html -->
<html lang="en"><!--<![endif]--><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

    <!-- Basic Page Needs
  ================================================== -->
	
	<title>荐书</title>
	
	
    <!-- Mobile Specific Metas
  ================================================== -->
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
      <link rel="alternate icon" type="images/icon.png" href=" images/icon.png">
    <!-- CSS
  ================================================== -->
  	<link rel="stylesheet" href="css/tuijian/zerogrid.css">
	<link rel="stylesheet" href="css/tuijian/style.css">
	<link rel="stylesheet" href="css/tuijian/menu.css">
	<link rel="stylesheet" href="css/tuijian/responsiveslides.css">
	<link href="css/tuijian/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link href="css/tuijian/XBStyle.css" rel="stylesheet" type="text/css">
	<script src="js/tuijian/jquery-latest.min.js"></script>
	<script src="js/tuijian/script.js"></script>
    <script src="js/tuijian/jquery183.min.js"></script>
    <script src="js/tuijian/responsiveslides.min.js"></script>
    <script src="js/tuijian/GetData.js" type="text/javascript"></script>
    <script>
		// You can also use "$(window).load(function() {"
        $(function() {
            bookspageload();
            // Slideshow 
            $("#slider").responsiveSlides({
                auto: true,
                pager: false,
                nav: true,
                speed: 500,
                namespace: "callbacks",
                before: function() {
                    $('.events').append("<li>before event fired.</li>");
                },
                after: function() {
                    $('.events').append("<li>after event fired.</li>");
                }
            });
        });
	</script>
	<script>
	    // 菜单固定
	    $(function() {
	        //获取要定位元素距离浏览器顶部的距离
	        var navH = $("#divmenu").offset().top+100;

	        //滚动条事件
	        $(window).scroll(function() {
	            //获取滚动条的滑动距离
	            var scroH = $(this).scrollTop();
	            //滚动条的滑动距离大于等于定位元素距离浏览器顶部的距离，就固定，反之就不固定
	           // alert(navH + "_" + scroH);
	            if (scroH >= navH) {
	                $("#divmenu").css({ "position": "fixed" });

	            } else if (scroH < navH) {
	                $("#divtop").css({ "display": "block" });
	                $("#divmenu").css({ "position": "relative" });

	            }
	        })
	    })
	
	</script>
</head>
<body>
<div class="wrap-body">

<!-- /////////////////////////////////////////Top -->
<div id="divmenu" style="z-index: 9999; background: rgb(244, 244, 244); margin: auto; width: 100%; position: relative;">
<div class="top">
	<div class="zerogrid">
		<div class="row">
			<div class="f-left">
				<span> 中小学文献信息中心 </span>
				<span>4006-757-868</span>
			</div>
			<div class="f-right">
					<span class="span1">
					<%-- <c:if test="${admin.state==0 }">${admin.uname }</c:if>
					<c:if test="${admin!=null }"><a href="<%=basePath%>/user/tui">退出登录</a> </c:if>
					<c:if test="${admin==null }"><a href="front/zuce.jsp">注册</a>  </c:if>
					<c:if test="${admin==null }"><a href="front/login.jsp">登录</a> </c:if> --%>
				</span>
			</div>
		</div>
	</div>
</div>

<!--////////////////////////////////////Header-->
<header>
	<div class="wrap-header zerogrid">
		<div class="row">
			<div id="cssmenu"><div id="menu-button">ShangShu</div>
				<ul>
				   <li class="active"><a href="<%=basePath%>/article/selindex">首页</a></li>
				   <li><a href="<%=basePath%>/article/selread">阅读</a></li>
				   <li><a href="<%=basePath%>/book/seltuijian">荐书</a></li>
				   <li><a href="front/fuwu.jsp">服务</a></li>
				</ul>
			</div>
			<a href="<%=basePath%>/article/selindex" class="logo"><img src="img/index/logo.png" alt="shangshu.com"></a>
		</div>
	</div>
</header>
</div>

<div class="divzw"></div>
 <img src="img/tuijian/shangshu_books_top.png" class="readingtopimg">
 <div class="divzw"></div>
<div class="divmain">
   
<div class="div_m_r">
    <div class="b_div_m_r_fl">
    <ul>
        <li onclick="GETbooksbylitext(&#39;必读书目&#39;)">必读书目</li>
        <li onclick="GETbooksbylitext(&#39;重温经典&#39;)">重温经典</li>
        <li onclick="GETbooksbylitext(&#39;名家荐书&#39;)">名家荐书</li>
        <li onclick="GETbooksbylitext(&#39;新书上架&#39;)">新书上架</li>
        </ul>
    </div>
    <div class="div_m_r_wntj">为您推荐</div>
    <div class="div_m_r_wntj1">
        <ul id="ul5tj">
        	 <c:forEach items="${tuijian }" var="t">
        	<li><a href="<%=basePath%>/book/xiangqing?bid=${t.bid }">${fn:substring(t.title,0,25)}</a></li>
        </c:forEach>
        </ul>
    </div><div class="divzw"></div>
</div>
<div class="b_div_m_l">
<div id="divbookslist"> 
<c:forEach items="${one }" var="o">
	<div class="div_book">
		<a href="<%=basePath%>/book/xiangqing?bid=${o.bid }" target="_blank"> 
			<img src="<%=basePath%>${o.code }">
			<p>${fn:substring(o.title,0,15)}...</p>
		</a> 
	</div> 
	</c:forEach>
</div>
    
    <div class="div_m_bm">
        <div class="div_more" onclick="Getbooksmore()">查看更多</div><input id="setops" type="hidden" value="15"> <input id="txtli" type="hidden" value="">
    </div>
    <div class="divzw"></div>
    <div class="divzw"></div>
</div>



<br><br><br>


<!--////////////////////////////////////Footer-->
<footer style="text-align:left;">

	<div class="zerogrid wrap-footer">
		<div class="row">
			<div class="col-1-4 col-footer-1">
				<div class="wrap-col">
					<h3>相关链接</h3>
					<p><a href="http://180.153.28.120:8801/ssw/VCenter/2.1.0/?162" target="_blank">常州市中小学文献信息网</a></p>
					<p><a href="http://117.132.9.157:8808/" target="_blank">济宁市中小学文献信息中心</a></p>
					<p><a href="http://120.55.243.93:8053/" target="_blank">广西壮族自治区中小学文献信息中心</a></p>
					<p><a href="http://tushu.lyge.cn/" target="_blank">连云港市中小学文献信息中心</a></p>
					<p><a href="http://202.99.209.243:8888/" target="_blank">迎泽区中小学文献信息中心</a></p>
				</div>
			</div>
			<div class="col-1-4 col-footer-2">
				<div class="wrap-col">
					<h3>关于我们</h3>
					<p><a href="http://www.hx2000.com.cn/" target="_blank">常州华教软件技术开发有限公司</a></p>
					<p>Copyright © 2018 Huajiao. All Rights Reserved</p>
					<p><a href="http://www.miitbeian.gov.cn/" target="_blank">苏ICP备05083287号</a></p>
					<p><a href="http://www.beian.gov.cn/portal/registerSystemInfo?recordcode=32041102000260" target="_blank">苏公网安备 32041102000261号</a></p>
				</div>
			</div>
		
			
			<div class="col-1-4 col-footer-4">
				<div class="wrap-col">
					<h3>联系我们</h3>
					<span> shangshu2007@sina.com</span>
					<span> 4006-757-868</span>
					<span> 常州市, 新北区, 通江中路609号</span>
				</div>
			</div>
			<div class="col-1-4 col-footer-3">
				<div class="wrap-col">
					<h3>尚书悦读</h3>
					<div class="row">
						<div class="col-1-3">
							<div class="wrap-col" style="width:160px;height:160px;">
								<a href=" <%=basePath%>/article/selindex"><img src="img/index/6.png" style="width:160px;height:160px;"></a>
							
						</div>
						
					</div>
				</div>
			</div>
		</div>
	</div>
	</div>
</footer>


</div>
</div></body></html>