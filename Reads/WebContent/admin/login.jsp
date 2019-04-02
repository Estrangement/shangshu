<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
 
<base href="<%=basePath%>">
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<title>后台登录</title>
	<link rel="shortcut icon" href="style&js/favicon.ico" type="image/x-icon" />
    <link rel="stylesheet" href="style&js/css/font.css">
	<link rel="stylesheet" href="style&js/css/xadmin.css">
    <script type="text/javascript" src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>
    <script src="style&js/lib/layui/layui.js" charset="utf-8"></script>
    <script type="text/javascript" src="style&js/js/xadmin.js"></script>
    <script src="style&js/js/jquery.min.js"></script>
    <link rel="stylesheet" href="css/login/jquery.idcode.css" />
	<script src="http://www.jq22.com/jquery/jquery-1.10.2.js"></script>
	<script src="js/login/jquery.idcode.js"></script>
</head>
<body class="login-bg">
    
    <div class="login layui-anim layui-anim-up">
        <div class="message">管理登录</div>
        <div id="darkbannerwrap"></div>
        
        <form method="post" class="layui-form" action="<%=basePath %>/user/login">
            <input name="username" placeholder="用户名"  type="text" lay-verify="required" class="layui-input" >
            <hr class="hr15">
            <input name="pwd" lay-verify="required" placeholder="密码"  type="password" class="layui-input">
            <hr class="hr15">
            <input  lay-verify="required" placeholder="请输入验证码"  type="text" class="layui-input"  class="txtVerification" id="Txtidcode">
             <span id="idcode"></span>
            <hr class="hr15">
            <input value="登录" lay-submit lay-filter="login" style="width:100%;" type="submit" id="btns">
            <hr class="hr20" >
        </form>
    </div>

    <script>
        //验证码校验
			$.idcode.setCode();
			$("#btns").click(function (){
				var IsBy = $.idcode.validateCode(); 
				alert(IsBy);
				console.log(IsBy);
			});
		</script>
    <!-- 底部结束 -->
   
</body>
</html>