<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<style type="text/css">
@charset "utf-8";
/* CSS Document */
.warp {
  position: absolute;
  width:300px;
  height:250px;
  left:50%;
  top:50%;
  margin-left:-150px;
  margin-top:-125px;
}
.login_table{ 
	width:300px;
    height:250px;
}
.login_table tr{
	height:40px;
}
.back{
	 width:100px; 
     height:30px; 
	 display:block;
     background:#11b3d0;
	 line-height:30px;
	 font-weight:bold;
	 color:#FFF;
	 margin:0 auto;
	 font-weight:bold;
	 font-size:12px;
	 font-family:"微软雅黑";
	 text-decoration:none;
	 text-align:center;
	 }
.back:hover{ background:#005393;}
</style>
<title>404页面</title>
</head>

<body>
<div class="warp">
    	<div class="login_table">
        	<table cellpadding="0" cellspacing="0" border="0">
            	<tr>
                	
                	<td >
                    	<img src="<%=basePath%>img/404.jpg"/>
                    </td>
                </tr>

                <tr>
                    <td style="text-align:center; font-family:'微软雅黑'; color:#646464;">哎呀亲... 您访问的页面出错了！<br/>
                    <span style="font-size:10px; line-height:25px;">您输入的网址有误或者链接已经过期。</span>
                    </td>
                </tr>
                <tr>
                	<td >
                     	<a href="javascript:window.history.back();" class="back">返回上一页</a>	
                    </td>
                </tr>
            </table>
        </div>
    </div>
</body>
</html>