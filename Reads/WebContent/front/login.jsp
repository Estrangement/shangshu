<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
 
<base href="<%=basePath%>">
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="">
        <meta name="author" content="">

        <!-- CSS -->
        <link rel='stylesheet' href='http://fonts.googleapis.com/css?family=PT+Sans:400,700'>
        <link rel='stylesheet' href='http://fonts.googleapis.com/css?family=Oleo+Script:400,700'>
        <link rel="stylesheet" href="<%=basePath%>/assetslogin/bootstrap/css/bootstrap.min.css">
        <link rel="stylesheet" href="<%=basePath%>/assetslogin/css/style.css">
</head>
<style>
	.biaoa{
		float:left;
		margin-left: 610px;
		margin-top: 20px;
	}
	.mya{
		color: black;
		margin-left: 10px;
	}
	.abc{
		position:absolute;
		margin-top: 10px;
		margin-left: -50px;
	}
	
</style>
<body>
 <div class="header">
            <div class="container">
                <div class="row">
                    <div class="logo span4">
                        <h1><a href="">LOGIN <span class="red">.</span></a></h1>
                    </div>
                    <div class="biaoa">
                        <a class="mya" href="<%=basePath%>/article/selindex" >返回首页</a>
                        <a class="mya" href="front/zuce.jsp" >注册</a> 
                    </div>
                </div>
            </div>
        </div>
<img alt= "" src="" style="margin-left: 150px">
        <div class="register-container container">
            <div class="row">
                <div class="iphone span5">
                    <!-- <img src="assets/img/iphone.png" alt=""> -->
                </div>
                <div class="register span6">
                    <form action="<%=basePath %>/user/login" method="post">
                        <h2>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;LOGIN TO <span class="red"><strong>SHANGSHU</strong></span></h2>
                        <label for="username">用户名</label>
                        <input type="text" id="username" name="username" placeholder="请输入用户名..." value="${username }">
                        <label for="password">密码</label>
                        <input type="password" id="pwd" name="pwd" placeholder="请输入密码..." value="pwd">
                        <button type="submit">登录</button><br><span class="abc"><c:if test="${cuo!=null }">${cuo}</c:if></span>
                    </form>
                </div>
            </div>
        </div>
        
        
        
		
        <!-- Javascript -->
        <script src="<%=basePath%>/assetslogin/js/jquery-1.8.2.min.js"></script>
        <script src="<%=basePath%>/assetslogin/bootstrap/js/bootstrap.min.js"></script>
        <script src="<%=basePath%>/assetslogin/js/jquery.backstretch.min.js"></script>
        <script src="<%=basePath%>/assetslogin/js/scripts.js"></script>
</body>
</html>