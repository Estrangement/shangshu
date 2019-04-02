<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
 
<base href="<%=basePath%>">
<html lang="en"><!--<![endif]--><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

    <!-- Basic Page Needs
  ================================================== -->
	
	<title>服务</title>
	  <meta name="description" content="专注于青少年阅读指导。推荐优秀读本，提供流行文化，分享最鲜资讯。">
	  <meta name="author" content="215451139@qq.com">
	  <meta name="keywords" content="尚書在线,尚书在线,尚书网,江苏省中小学文献信息网,文献网,网络读书,读书活动,在线阅读,获奖名单,校园动态,集群图书馆,云图书馆">    	
	
	
    <!-- Mobile Specific Metas
  ================================================== -->
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    
    <!-- CSS
  ================================================== -->
  	<link rel="stylesheet" href="<%=basePath%>/css/fuwu/zerogrid.css">
	<link rel="stylesheet" href="<%=basePath%>/css/fuwu/style.css">
	<link rel="stylesheet" href="<%=basePath%>/css/fuwu/menu.css">
	<link rel="stylesheet" href="<%=basePath%>/css/fuwu/responsiveslides.css">
	<link href="<%=basePath%>/css/fuwu/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link href="<%=basePath%>/css/fuwu/XBStyle.css" rel="stylesheet" type="text/css">
	<script src="<%=basePath%>/js/fuwu/jquery-latest.min.js"></script>
	<script src="<%=basePath%>/js/fuwu/script.js"></script>
    <script src="<%=basePath%>/js/fuwu/jquery183.min.js"></script>
    <script src="<%=basePath%>/js/fuwu/responsiveslides.min.js"></script>
    <script src="<%=basePath%>/js/fuwu/layer.js" type="text/javascript"></script>
    <link rel="stylesheet" href="<%=basePath%>/css/fuwu/layer.css" id="layui_layer_skinlayercss" style="">
    <script src="<%=basePath%>/js/fuwu/GetData.js" type="text/javascript"></script>
    <script>
		// You can also use "$(window).load(function() {"
		$(function () {
		  // Slideshow 
		  $("#slider").responsiveSlides({
			auto: true,
			pager: false,
			nav: true,
			speed: 500,
			namespace: "callbacks",
			before: function () {
			  $('.events').append("<li>before event fired.</li>");
			},
			after: function () {
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
	<!--[if lt IE 8]>
       <div style=' clear: both; text-align:center; position: relative;'>
         <a href="http://windows.microsoft.com/en-US/internet-explorer/products/ie/home?ocid=ie6_countdown_bannercode">
           <img src="http://storage.ie6countdown.com/assets/100/images/banners/warning_bar_0000_us.jpg" border="0" height="42" width="820" alt="You are using an outdated browser. For a faster, safer browsing experience, upgrade for free today." />
        </a>
      </div>
    <![endif]-->
    <!--[if lt IE 9]>
		<script src="js/html5.js"></script>
		<script src="js/css3-mediaqueries.js"></script>
	<![endif]-->
    
</head>
<style>
	.div_Ser_middle{
		width:100%;max-width:1280px;
		margin:auto;
		background-image:url(<%=basePath%>/img/fuwu/yun_s_03.jpg);
		min-height:680px;
		text-align:center;
		vertical-align:middle;
		padding-top:80px;
		position:relative;
		margin-top:30px;
		color:#fff;
	}
</style>
<body>
<div class="wrap-body">

<!-- /////////////////////////////////////////Top -->
<div id="divmenu" style="z-index:9999;background:#f4f4f4;margin:auto;width:100%;">
<div class="top">
	<div class="zerogrid">
		<div class="row">
			<div class="f-left">
				<span>中小学文献信息中心 </span>
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
<div class="div_Ser_top">
    <img src="img/fuwu/Service_top_wz.png">
    <div class="div_Ser_top_js">
        <blockquote>通过建设区域一体化的集群式云图书馆服务管理平台，打破了传统图书馆封闭的、各自为政的管理模式，将区域内纸质图书、期刊、数字图书的管理集中在一个工作平台上，动态地实现区域内纸质图书、期刊、数字图书的联合采购、联机编目、查询检索、在线阅读、下载借阅、馆际互借等，创建一个通过互联网建立起来的开放、联合、互动、实时、高效的新型中小学图书馆管理模式，有效的整合各个图书馆的智力资源和劳动力资源，从而达到提高中小学图书馆的工作质量和工作效率、规范工作流程、提高管理水平的目的。</blockquote>
        <div class="div_ser_top_lib"><a href="http://tsg.shangshu.com/" target="_blank">云图书馆</a></div>
    </div>
</div>

 <!--<img src="images/acts_top.png" class="readingtopimg" />-->
 <div class="divzw"></div>
 <div class="divzw"></div>
 <div class="divzw"></div>
<div class="divmain">

<div class="div_tsgn">——基础功能——</div>
<div class="divtsgnbox">
  <div class="divts">
      <img src="img/fuwu/bm.png" alt="">
        <p class="ts_title">图书采编</p>
        <p>简编、自定义编目灵活切换，云Marc调用，种次号智能填写，书标、条码打印</p>
  </div>
  <div class="divts">
    <img src="img/fuwu/jsz.png" alt="">
        <p class="ts_title">证件管理</p>
        <p>证件、照片导入，批量注销、批量分班、借书证打印，指纹采集</p>
  </div>
  <div class="divts">
   <img src="img/fuwu/jie.png" alt="">
        <p class="ts_title">流通管理</p>
        <p>借书、还书、丢书登记、丢书返还、污损登记、校际借阅、自助借还、指纹借阅</p>
  </div>
  <div class="divts">
  <img src="img/fuwu/buy.png" alt="">
        <p class="ts_title">在线订购</p>
        <p>集中采购、零星采购灵活选择，订购、编目、验收、入库流程严谨，订单报表简明清晰</p>
  
  </div>
  <div class="divts">
    <img src="img/fuwu/mobile.png" alt="">
    <p class="ts_title">移动应用</p>
    <p>借阅记录、在线续借、预约查询、馆藏检索、评论荐购、移动借书证</p>
  </div>
  <div class="divts">
    <img src="img/fuwu/setting_home.png" alt="">
    <p class="ts_title">系统管理</p>
    <p>书库管理、借阅标准、馆员管理、权限分配</p>
  </div>
</div>
<div class="divzw"></div>  
 <div class="divzw"></div>
  <div class="divzw"></div>
<div class="div_tsgn">——特色功能——</div>
<div class="divtsgnbox">
  <div class="divts">
      <img src="img/fuwu/ser_ts1.png" alt="">
        <p class="ts_title">智能采编</p>
        <p>云Mrac快速定位图书基本信息，编目更快、更标准</p>
  </div>
  <div class="divts">
    <img src="img/fuwu/ser_ts2.png" alt="">
        <p class="ts_title">数据智能分析与回补</p>
        <p>错误数据智能查找更正，缺失数据智能填补</p>
  </div>
  <div class="divts">
   <img src="img/fuwu/ser_ts3.png" alt="">
        <p class="ts_title">自助借还</p>
        <p>自助借还特点、自助借还特点自助借还特点</p>
  </div>
  <div class="divts">
  <img src="img/fuwu/ser_ts4.png" alt="">
        <p class="ts_title">指纹借阅</p>
        <p>生物识别技术，解决每年办卡、补卡的烦恼</p>
  
  </div>
  <div class="divts">
    <img src="img/fuwu/ser_ts5.png" alt="">
    <p class="ts_title">虚拟书架</p>
    <p>虚拟场景定位图书位置，找书更快更准</p>
  </div>
  <div class="divts">
    <img src="img/fuwu/ser_ts6.png" alt="">
    <p class="ts_title">大数据智能分析</p>
    <p>大数据智能分析描述，大数据智能分析描述</p>
  </div>
</div>  


<div class="div_Ser_middle">
    <div class="div_Ser_m_title">产品优势</div>
    <div class="div_Ser_ys_box">
        <div class="div_ser_ys">
             <img src="img/fuwu/ser_ys01.png" alt="">
             <p class="div_ser_ys_t">专业</p>
             <p class="div_ser_ys_c">
             20年专业图书馆服务，先进的管理理念，坚持图书馆行业云计算最高标准；运维专家7*24小时快速专业响应，保障您业务的稳定运营。
             </p>
        </div>
        <div class="div_ser_ys">
            <img src="img/fuwu/ser_ys02.png" alt="">
             <p class="div_ser_ys_t">安全</p>
             <p class="div_ser_ys_c">
             数据智能备份，确保数据不会丢失；完善的安防体系，确保系统不受攻击，数据不会泄漏。
             </p>
        </div>
        <div class="div_ser_ys">
             <img src="img/fuwu/ser_ys03.png" alt="">
             <p class="div_ser_ys_t">创新</p>
             <p class="div_ser_ys_c">
             生物识别技术、RFID自助借还、大数据分析、云数据共享等一系列创新技术，给图书馆管理带来更智能的体验。
             </p>
        </div>
        <div class="div_ser_ys">
             <img src="img/fuwu/ser_ys04.png" alt="">
             <p class="div_ser_ys_t">易用</p>
             <p class="div_ser_ys_c">
             充分研究客户使用场景和使用习惯，精心打造的用户界面更加清晰、简洁、美观、易用。
             </p>
        </div>
        <div class="div_ser_ys">
            <img src="img/fuwu/ser_ys05.png" alt="">
             <p class="div_ser_ys_t">智能</p>
             <p class="div_ser_ys_c">
             智能分析系统数据，为您的决策分析提供完善的数据支持服务。
             </p>
        </div>
    </div>  
    <div class="div_Ser_sy">
    <div class="div_Ser_sysq" onclick="">免费申请试用</div>
    </div>
     
</div>

    
</div>

<div id="divsqtj" class="div_khzx">
    <div style="font-size:34px;color:#EA5404;">在线申请</div>
    <div style="font-size:24px;color:#8C8C8C;margin-top:10px;">Online Application</div>
    <input id="txtxm" type="text" class="csstxtxm" placeholder="请输入姓名">
    <input id="txttel" type="text" class="csstxttel" placeholder="请输入联系电话">
    <div style="margin-top:20px;">
    您是：
        <label><input id="Radio1" type="radio" name="usertype" value="1">学校</label>
        <label><input id="Radio2" type="radio" name="usertype" value="0">代理商</label>
        <label><input id="Radio3" type="radio" name="usertype" value="2">教育管理机构</label>        
    </div>
    
    <input id="Submit1" type="button" value="提交" onclick="submitkhzx()" style="width:355px;height:45px;color:#fff;background-color:#EB5405;margin-top:30px;border-radius:5px;">
</div>
    



<br><br><br>


<!--////////////////////////////////////Footer-->
<footer>

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
					<p><a href="http://www.beian.gov.cn/portal/registerSystemInfo?recordcode=32041102000260" target="_blank">
						苏公网安备 32041102000261号</a></p>
				</div>
			</div>
		
			
			<div class="col-1-4 col-footer-4">
				<div class="wrap-col">
					<h3>联系我们</h3>
					<span>shangshu2007@sina.com</span>
					<span>4006-757-868</span>
					<span>常州市, 新北区, 通江中路609号</span>
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

<script type="text/javascript">
    function showdiv() {
        layer.open({
            title:'在线申请',
            type: 1,
            area: ['460px', '470px'],
            fixed: false, //不固定
            maxmin: false,            
            content: $("#divsqtj")
        });
    }
</script>
</div>
</body></html>