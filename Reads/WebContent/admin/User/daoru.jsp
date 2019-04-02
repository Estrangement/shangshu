<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<meta http-equiv="Content-Type" content="multipart/form-data; charset=utf-8" />
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
<script type="text/javascript" src="<%=basePath%>/js/ajaxfileupload.js"></script>
<title>系统录入</title>
</head>
<style>
    #mdiv{
       position:absolute;
       margin-top: 15px;
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
    
    #btn-star{
    margin-top:20px;
	margin-left: -90px;
}

#upfile{
	margin-left: -80px;
	margin-top: 16px;
}
</style>
<body>
<article class="page-container">
<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i>
         <span class="c-gray en">&gt;</span><a href="<%=basePath%>/user/findAllByPage">用户管理</a> 
         <span class="c-gray en">&gt;</span> <font color="cornflowerblue">导入数据</font>
            <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a>
     </nav>
     <form method="post"  enctype="multipart/form-data" id="form1" action="<%=basePath%>user/daoru" >
     <div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><div id="mdiv"><span class="c-red">*</span>上传文件：</div></label>
			<div class="formControls col-xs-8 col-sm-9">
				<input id="upfile" type="file" name="upfile" accept=".xls,.xlsx" />
				<span id="span_B"></span>
			</div>
		</div>
		
		<div class="row cl">
			<div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-3" id="guanbi">
				<input class="btn btn-primary radius" id="btn-star" type="submit" value="&nbsp;&nbsp;提&nbsp;&nbsp;交&nbsp;&nbsp;">&nbsp;&nbsp;
			</div>
		</div>
	</form>
	<%-- <form method="post"  enctype="multipart/form-data" id="form1" action="<%=basePath%>user/daoru" class="">  
        <table>  
         <tr>  
            <td>上传文件: </td>  
            <td> <input id="upfile" type="file" name="upfile" accept=".xls,.xlsx" /></td>  
            <td><input  type="submit" value="提交"  id="btn"/></td>  
         </tr>  
        </table>    
    </form> --%>
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
	
	$("#btn-star").click(function(){  
		
		setTimeout(function(){
			window.parent.location.reload(location.href);
			var index = parent.layer.getFrameIndex(window.name);
			parent.layer.close(index);
		},100);
		layer.msg('录入成功！', {
			icon : 1,
			time : 1000
		});
	   });
	
	
});
	   

	
</script> 
<!--/请在上方写此页面业务相关的脚本-->
</body>
</html>