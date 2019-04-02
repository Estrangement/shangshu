<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
    #yidong{
    	margin-left: -100px;
    }
    .lll{
    	margin-left: -100px;
    }
    #kuan{
    	width: 450px;
    }
</style>
<body>
<article class="page-container">
   <nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i>
         <span class="c-gray en">&gt;</span><a href="<%=basePath%>/role/findAllByPage">角色管理</a> 
         <span class="c-gray en">&gt;</span> <font color="cornflowerblue">角色录入</font>
            <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a>
     </nav>
	<form class="form form-horizontal" id="form-admin-add">
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>角色名称：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text"   name="jname">
				<span id="span_B"></span>
			</div>
		</div>
		<div class="row cl">
			
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>网站角色：</label>
			<div class="formControls col-xs-8 col-sm-9" id="yidong">
			
			<c:forEach items="${menu }" var="me">
				<dl class="permission-list">
					<dt>
						<label>
							<input type="checkbox" value="" name="user-Character-0" id="user-Character-1">
							${me.name }</label>
					</dt>
					<dd>
						<dl class="cl permission-list2" > 
							<dt >
							<dd id="kuan">
							<label class="lll">
									<input type="checkbox" value="${me.id }" name="ids" id="user-Character-1-0-0">
									${me.name }</label>
							<c:forEach items="${button }" var="bu">
								<c:if test="${bu.parent_id==me.id }">
								<label class="">
									<input type="checkbox" value="${bu.id }" name="ids" id="user-Character-1-0-0">
									${bu.name }</label>
								</c:if>
							</c:forEach>
							</dd>
						</dl>
					</dd>
				</dl>
				</c:forEach>
			</div>
		</div>
		<div class="row cl">
			<div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-3" id="guanbi">
				<input class="btn btn-primary radius" type="submit" value="&nbsp;&nbsp;提&nbsp;&nbsp;交&nbsp;&nbsp;">&nbsp;&nbsp;
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
	$(".permission-list dt input:checkbox").click(function(){
		$(this).closest("dl").find("dd input:checkbox").prop("checked",$(this).prop("checked"));
	});
	$(".permission-list2 dd input:checkbox").click(function(){
		var l =$(this).parent().parent().find("input:checked").length;
		var l2=$(this).parents(".permission-list").find(".permission-list2 dd").find("input:checked").length;
		if($(this).prop("checked")){
			$(this).closest("dl").find("dt input:checkbox").prop("checked",true);
			$(this).parents(".permission-list").find("dt").first().find("input:checkbox").prop("checked",true);
		}
		else{
			if(l==0){
				$(this).closest("dl").find("dt input:checkbox").prop("checked",false);
			}
			if(l2==0){
				$(this).parents(".permission-list").find("dt").first().find("input:checkbox").prop("checked",false);
			}
		}
	});
	
});
</script>
<script type="text/javascript">
$(function(){
	$('.skin-minimal input').iCheck({
		checkboxClass: 'icheckbox-blue',
		radioClass: 'iradio-blue',
		increaseArea: '20%'
	});
	
	$("#form-admin-add").validate({
		rules:{
			jname:{
				required:true,
			},
		},
		onkeyup:false,
		focusCleanup:true,
		success:"valid",
		submitHandler:function(form){
			$(form).ajaxSubmit({
				type: 'post',
				url: "<%=path %>/role/add" ,
				success: function(data){
					if(data.message){
					layer.msg('录入失败！', {
					icon : 2,
					time : 1000
					});
					}else{
						layer.msg('录入成功！', {
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