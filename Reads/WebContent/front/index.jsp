<%@ page language="java" contentType="text/html; charset=Utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<base href="<%=basePath%>">
<html xmlns="http://www.w3.org/1999/xhtml" lang="en"><!--[if lt IE 7 ]><html class="ie ie6" lang="en"> <![endif]--><!--[if IE 7 ]><html class="ie ie7" lang="en"> <![endif]--><!--[if IE 8 ]><html class="ie ie8" lang="en"> <![endif]--><!--[if (gte IE 9)|!(IE)]><!--><!--<![endif]--><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

    <!-- Basic Page Needs
  ================================================== -->
	
	<title>首页</title>
	
	
    <!-- Mobile Specific Metas
  ================================================== -->
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    
    <link rel="alternate icon" type="images/icon.png" href=" images/icon.png">
    
    <!-- CSS
  ================================================== -->
  	<link rel="stylesheet" href="<%=basePath%>css/index/zerogrid.css">
	<link rel="stylesheet" href="<%=basePath%>css/index/style.css">
	<link rel="stylesheet" href="<%=basePath%>css/index/menu.css">
	<link rel="stylesheet" href="<%=basePath%>css/index/responsiveslides.css">
	<link href="<%=basePath%>css/index/font-awesome.min.css" rel="stylesheet" type="text/css">
    <script src="<%=basePath%>js/index/GetData.js" type="text/javascript"></script>

	<script src="<%=basePath%>js/index/jquery-latest.min.js"></script>
	<script src="<%=basePath%>js/index/script.js"></script>
    <script src="<%=basePath%>js/index/jquery183.min.js"></script>
    <script src="<%=basePath%>js/index/responsiveslides.min.js"></script>
    
    <script>
		// You can also use "$(window).load(function() {"
        $(function() {
            homepageload();
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
	
	
	<style type="text/css">
        .div_hdad {
            width: 110px;
            height: 305px;
            position: fixed;
            right: 0;
            top: 40%;
            margin-top: -50px;
            z-index:9999;
            
        }
        .callbacks_nav {
		  position: absolute;
		  -webkit-tap-highlight-color: rgba(0,0,0,0);
		  top: 52%;
		  left: 0;
		  opacity: 0.7;
		  z-index: 3;
		  text-indent: -9999px;
		  overflow: hidden;
		  text-decoration: none;
		  height: 61px;
		  width: 38px;
		  background: transparent url("<%=basePath%>/img/index/themes.gif") no-repeat left top;
		  margin-top: -45px;
    }
	  .f-right{
	  }
	  .span11{
	  	position: absolute;
	  	margin-left: 265px;
	  	margin-top: -33px;
	  }
    </style>
	
	
</head>
<body>
<div id="div1" class="div_hdad">
<a href="http://117.132.9.157:8083/Activities/LS_0/Index.aspx" target="_blank">
<img src="img/index/lshd_home_ad.png" alt="" style="border:2xp solid #000;">
</a>
</div>
<div class="wrap-body">

<!-- /////////////////////////////////////////Top -->
<div id="divmenu" style="z-index:9999;background:#f4f4f4;margin:auto;width:100%;">
<div class="top">
	<div class="zerogrid">
		<div class="row">
			<div class="f-left">
				<span> 中小学文献信息中心 </span>
				<span>4006-757-868</span>
				<!--<span><i class="fa fa-envelope"></i> shangshu2007@sina.com</span>-->
			</div>
			<div class="f-right">
					<span class="span1">
				    <c:if test="${admin.state==1 }"><a href="user/houduan">开发者模式</a></c:if>
				    <c:if test="${admin!=null }"><a href="<%=basePath%>/user/tui">退出登录</a> </c:if>
					<c:if test="${admin==null }"><a href="front/zuce.jsp">注册</a>  </c:if>
					<c:if test="${admin==null }"><a href="front/login.jsp">登录</a> </c:if>
					<%--<c:if test="${admin.state==0 }">${admin.uname }</c:if>
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

<div id="divtop3" class="bg-white">
	<div class="zerogrid" style="width:100%;max-width:1280px;">
		<!-- Slideshow -->
		<div class="callbacks_container">
			<ul class="rslides callbacks callbacks1" id="slider">
				<li id="callbacks1_s0" class="" style="display: block; float: none; position: absolute; opacity: 0; z-index: 1; transition: opacity 500ms ease-in-out;">
				<div id="li0">
					<img src="img/index/read636880654799553366.jpg" alt="" style="width:100%;max-height:500px;">
					<div class="caption">
						<a href="<%=basePath%>/article/xiangqing?aid=c95e5a880b8d440e82e92277416ae4a0" target="_blank" style="color:#fff;">
							<h1>陈宝生部长:减负再难也要减</h1>
						</a>
						<span>减负作为一个多因一果的综合征，一定要系统治理。</span>
					</div>
				</div>
				</li>
				<li id="callbacks1_s1" class="" style="float: none; position: absolute; opacity: 0; z-index: 1; display: list-item; transition: opacity 500ms ease-in-out;">
				<div id="li1">
					<img src="img/index/read636858181842120089.jpg" alt="" style="width:100%;max-height:500px;">
					<div class="caption">
						<a href="<%=basePath%>/article/xiangqing?aid=6440837cd97f4501b6188f737303b978" target="_blank" style="color:#fff;">
							<h1>"四大难题"治理成效几何？教育部基础教育司回应</h1>
						</a>
						<span>课外负担重、“择校热”、“大班额”以及儿童早期教育，是群众最关心的4个教育问题。</span>
					</div>
				</div>
				</li>
				<li id="callbacks1_s2" class="callbacks1_on" style="float: left; position: relative; opacity: 1; z-index: 2; display: list-item; transition: opacity 500ms ease-in-out;">
				<div id="li2">
					<img src="img/index/read636858191873784587.jpg" alt="" style="width:100%;max-height:500px;">
					<div class="caption">
						<a href="<%=basePath%>/article/xiangqing?aid=d95da8cd689a44cb950d2e044064c429" target="_blank" style="color:#fff;">
							<h1>科幻文学迎来黄金时代？</h1>
						</a>
						<span>科幻，在2019年开年迎来好时光，刘慈欣多部作品登畅销榜。</span>
					</div>
				</div>
				</li>
			</ul><a href="index.html#" class="callbacks_nav callbacks1_nav prev">Previous</a><a href="index.html#" class="callbacks_nav callbacks1_nav next">Next</a>
		</div>
		<div class="clear"></div>
	</div>
</div>

<!--////////////////////////////////////Container-->


<section id="container" class="home-page">
	<div class="wrap-container clearfix">
		<div id="main-content">
		<div class="div_index_ad">
            <div class="div_index_ad_l">
                <img src="img/index/Wlib_AD22.jpg"/>
            </div>
            <div class="div_index_ad_r">
            <p class="div_ad_title">HX2000云图书馆管理系统</p>
            <p>HX2000云图书馆覆盖了各级教育行业用户的图书馆信息化管理需求，从图书选择、订购，到图书到馆、书目编辑、流通、统计等，把与图书有关的各个环节的人、物、信息都集中统一在网站平台上，为用户提供多种全面的信息化集成服务！</p>
            <div class="div_xq"><a href="front/fuwu.jsp">查看详情</a></div>
             <img src="img/index/Wlib_AD32.png"/>
            
            </div>
        </div>
			<section class="content-box box-1 box-style-1"><!--Start Box-->
				
				<div class="wrap-box">
				
					<div class="zerogrid">
				
						<div class="row">
						<c:forEach items="${yue }" var="y">
							<div class="col-1-3">
								<div class="wrap-col">
									<div class="sub-title" style="background-color:#086DFF;">
										<h2>${y.type}</h2>
									</div>
									<div class="item" id="divhomereadright">
										<img src="${y.photo}" style="width:500px">
										<div class="item-content">
											<a href="<%=basePath%>/article/xiangqing?aid=${y.aid }" target="_blank" style="line-height:40px;font-weight:bold;font-size:25px;">${y.title }</a>
											<div class="info">${y.time} ${y.source}</div><span class="span11">阅读量：${y.volume}</span>
											<p>${y.brief}</p>
										</div>
									</div>
								</div>
							</div>
							</c:forEach>
							
							<div class="col-1-3">
								<div class="wrap-col">
									<div class="sub-title" style="background-color:#086DFF;">
										<h2>教育咨询</h2>
									</div>
									<div id="divcenter">
									<c:forEach items="${jiao }" var="j">
										<div class="row">
											<div class="item">
												<div class="item-content">
													<a href="<%=basePath%>/article/xiangqing?aid=${j.aid }" target="_blank" style="line-height:25px;font-weight:bold;font-size:20px;">${j.title }</a>
													<div class="info">${j.time} |${j.source}</div><span class="span11">阅读量：${j.volume}</span>
													
													<p>${j.brief}</p>
												</div>
											</div>
										</div>
										</c:forEach>
										
									</div>
								</div>
							</div>
							
							
							<div class="col-1-3">
								<c:forEach items="${jing }" var="ji">
								<div class="wrap-col">
									<div class="sub-title" style="background-color:#086DFF;">
										<h2>${ji.type}</h2>
									</div>
									<div id="divright">
										<a href="<%=basePath%>/article/xiangqing?aid=${ji.aid }" target="_blank" style="line-height:40px;font-weight:bold;font-size:25px;">${ji.title}</a>	
										<img src="${ji.photo}" style="width:380px;">
										<p>${ji.brief}</p>
									</div>
									<a href=" <%=basePath%>/article/selread" class="button bt1">查看更多</a>
								</div>
								</c:forEach>
							</div>
						</div>
					</div>
				</div>
			</section>
			<div><img src="img/index/shangshu-slogan2.png" style="width:100%;" alt=""></div>
			<section class="content-box box-4 box-style-1"><!--Start Box-->
				<div class="wrap-box">
					<div class="zerogrid">
						<div class="row">
							<div class="col-1-4">
								<div class="wrap-col">
									<!--<div class="sub-title" style="background-color:#F4F4F4;color:#F4F4F4;">
										<h2>&nbsp;</h2>
									</div>-->
									<div class="item" style="min-height:415px;padding:3px;text-align:center;">
										
										<img src="img/index/banner3.png" class="ssyd_ad">
										
									</div>
									
								</div>
							</div>
							<div class="col-2-4">   
								<div class="wrap-col" id="divhomebooks">
								<c:forEach items="${xiaa }" var="xa">
									<div class="row">
										<div class="item">
											<div class="col-1-3">
												<div class="item-date-box">
													<div class="item-caption-inner">
														<div class="item-caption-inner1">
															<img src="${xa.code }" alt="" style="height:190px;">
														</div>
													</div>
												</div>
											</div>
											<div class="col-2-3">
												<div class="item-content">
													<a href=" <%=basePath%>/book/xiangqing?bid=${xa.bid }" target="_blank" style="line-height:25px;font-weight:bold;font-size:20px;"> ${xa.bname}</a>
													<div class="info">${xa.time}| ${xa.author}</div>
													<p>${xa.title}</p>
												</div>
											</div>
											<div class="clear">
											</div>
										</div>
									</div>
					
								</c:forEach>
								</div>
							</div>
							<div class="col-1-4">
								<div class="wrap-col" id="divbooks2" style="text-align:center;">
									<c:forEach items="${xiab }" var="xb">
									<div class="item">
										<img src="${xb.code }" style="height:178px;">
										<div class="item-content">
											<a href=" <%=basePath%>/book/xiangqing?bid=${xb.bid }">
												<h3>${xb.bname }</h3>
											</a>
											<p>${xb.title}</p>
										</div>
									</div>
									</c:forEach>
								</div>
							</div>
						</div>
					</div>
				</div>
			</section>
			
			
			
			
			
		</div>
	</div>
</section>

<!--////////////////////////////////////Footer-->
<footer>
	<div class="zerogrid wrap-footer">
		<div class="row">
			<div class="col-1-4 col-footer-1">
				<div class="wrap-col">
					<h3>相关链接</h3>
					<!--<p><a href="http://180.153.28.120:8801/ssw/VCenter/2.1.0/?162" target="_blank">常州市中小学文献信息网</a></p> -->
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

<!-- &nbsp;<img src="img/read/read636885996644797083.jpg" style="margin-left: 150px;" width="400px;" height="200px"> -->
</div>
</body></html>