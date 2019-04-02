<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %><!--日期格式化的jar包  -->

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
 
<base href="<%=basePath%>">
<html>
<head>
<meta charset="utf-8">
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<meta http-equiv="Cache-Control" content="no-siteapp" />
<link rel="Bookmark" href="/favicon.ico" >
<link rel="Shortcut Icon" href="/favicon.ico" />
<link rel="stylesheet" type="text/css" href="<%=basePath%>/static/h-ui/css/H-ui.min.css" />
<link rel="stylesheet" type="text/css" href="<%=basePath%>/static/h-ui.admin/css/H-ui.admin.css" />
<link rel="stylesheet" type="text/css" href="<%=basePath%>/lib/Hui-iconfont/1.0.8/iconfont.css" />
<link rel="stylesheet" type="text/css" href="<%=basePath%>/static/h-ui.admin/skin/default/skin.css" id="skin" />
<link rel="stylesheet" type="text/css" href="<%=basePath%>/static/h-ui.admin/css/style.css" />
<title>系统录入</title>
</head>
<style>
    #form-member-add {
       width:490px;
       margin-top: 50px;
    }
    #form-member-add a{
       text-decoration:none;
    }
    #keke{
    	margin-left: -100px;
    }
    .seex{
    	position:absolute;
    	margin-left: 145px;
    }
</style>
<body>
<article class="page-container">
	<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i>
         <span class="c-gray en">&gt;</span><a href="<%=basePath%>/user/findAllByPage">用户管理</a> 
         <span class="c-gray en">&gt;</span> <font color="cornflowerblue">信息修改</font>
            <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a>
     </nav>
	<form  class="form form-horizontal" id="form-admin-add">
	<input type="hidden" value="${bb.uid}" name="uid">
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"  ><span class="c-red">*</span>姓名：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text" value="${bb.uname}"  id="tum" name="uname" >
				<span id="span_B"></span>
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>年龄：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text" value="${bb.age}"  id="tum" name="age">
				<span id="span_B"></span>
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>性别：</label>
			<div class="seex">
				<input type="radio"   name="sex" value="男" <c:if test="${bb.sex=='男'}">checked="checked"</c:if> >男
				<input type="radio"   name="sex" value="女" <c:if test="${bb.sex=='女'}">checked="checked"</c:if>>女
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>电话：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text" value="${bb.tel}"  id="tum" name="tel">
				<span id="span_B"></span>
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>登录名：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text" value="${bb.username}"  id="tum" name="username">
				<span id="span_B"></span>
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>密码：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text" value="${bb.pwd}"  id="tum" name="pwd">
				<span id="span_B"></span>
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>邮箱：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text" value="${bb.email}"  id="tum" name="email">
				<span id="span_B"></span>
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>住址：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text" value="${bb.address}"  id="tum" name="address">
				<span id="span_B"></span>
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>权限：</label>
			<div class="formControls col-xs-8 col-sm-9 skin-minimal" id="keke">
			<c:forEach items="${libc}" var="u" >
					<div class="radio-box">
					<input name="rid" type="checkbox" id="sex-1" value="${u.rid }"  <c:if test='${u.uid!=null}'>checked='checked'</c:if>>
					<label for="sex-1">${u.rname }</label>
				</div>
			</c:forEach>	
			</div>
		</div>
		<div class="row cl">
			<div id="guanbi" class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-3">
				<input class="btn btn-primary radius" type="submit" value="&nbsp;&nbsp;保&nbsp;&nbsp;存&nbsp;&nbsp;">&nbsp;&nbsp;
			</div>
		</div>
	</form>
</article>

<!--_footer 作为公共模版分离出去--> 
<script type="text/javascript" src="<%=basePath%>/lib/jquery/1.9.1/jquery.min.js"></script> 
<script type="text/javascript" src="<%=basePath%>/lib/layer/2.4/layer.js"></script>
<script type="text/javascript" src="<%=basePath%>/static/h-ui/js/H-ui.min.js"></script> 
<script type="text/javascript" src="<%=basePath%>/static/h-ui.admin/js/H-ui.admin.js"></script> <!--/_footer 作为公共模版分离出去-->

<!--请在下方写此页面业务相关的脚本-->
<script type="text/javascript" src="<%=basePath%>/lib/jquery.validation/1.14.0/jquery.validate.js"></script> 
<script type="text/javascript" src="<%=basePath%>/lib/jquery.validation/1.14.0/validate-methods.js"></script> 
<script type="text/javascript" src="<%=basePath%>/lib/jquery.validation/1.14.0/messages_zh.js"></script> 
<script type="text/javascript">
$(function(){
	$('.skin-minimal input').iCheck({
		checkboxClass: 'icheckbox-blue',
		radioClass: 'iradio-blue',
		increaseArea: '20%'
	});
	
	$("#form-admin-add").validate({
		rules:{
			uname:{
				required:true,
			},
			age:{
				required:true,
			},
			sex:{
				required:true,
			},
			tel:{
				required:true,
			},
			username:{
				required:true,
			},
			pwd:{
				required:true,
			},
			email:{
				required:true,
			},
			address:{
				required:true,
			},
		},
		onkeyup:false,
		focusCleanup:true,
		success:"valid",
		submitHandler:function(form){
			$(form).ajaxSubmit({
				type: 'post',
				url: "<%=path %>/user/update" ,
				success: function(data){
					if(data.message){
					layer.msg('修改失败！', {
					icon : 2,
					time : 1000
					});
					}else{
						layer.msg('修改成功！', {
						icon : 1,
						time : 1000
					});
					setTimeout(function(){
						window.parent.location.reload(location.href);
						var index = parent.layer.getFrameIndex(window.name);
						parent.$('.btn-refresh').click();
						parent.layer.close(index);
					},1000);
					}
				}
			});
		}
	});
});
</script> 
<!--/请在上方写此页面业务相关的脚本-->
</body>
</html>