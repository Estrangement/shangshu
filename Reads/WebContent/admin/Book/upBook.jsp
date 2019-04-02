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
<!--[if lt IE 9]>
<script type="text/javascript" src="lib/html5shiv.js"></script>
<script type="text/javascript" src="lib/respond.min.js"></script>
<![endif]-->
<link rel="stylesheet" type="text/css" href="<%=basePath%>/static/h-ui/css/H-ui.min.css" />
<link rel="stylesheet" type="text/css" href="<%=basePath%>/static/h-ui.admin/css/H-ui.admin.css" />
<link rel="stylesheet" type="text/css" href="<%=basePath%>/lib/Hui-iconfont/1.0.8/iconfont.css" />
<link rel="stylesheet" type="text/css" href="<%=basePath%>/static/h-ui.admin/skin/default/skin.css" id="skin" />
<link rel="stylesheet" type="text/css" href="<%=basePath%>/static/h-ui.admin/css/style.css" />
<!--[if IE 6]>
<script type="text/javascript" src="lib/DD_belatedPNG_0.0.8a-min.js" ></script>
<script>DD_belatedPNG.fix('*');</script>
<![endif]-->
<!--/meta 作为公共模版分离出去-->

<title>新增文章 - 资讯管理 - H-ui.admin v3.1</title>
<meta name="keywords" content="H-ui.admin v3.1,H-ui网站后台模版,后台模版下载,后台管理系统模版,HTML后台模版下载">
<meta name="description" content="H-ui.admin v3.1，是一款由国人开发的轻量级扁平化网站后台模板，完全免费开源的网站后台管理系统模版，适合中小型CMS后台系统。">
</head>
<link rel="stylesheet" type="text/css" href="<%=basePath%>/kindeditor/themes/simple/simple.css"/>
<script charset="utf-8" src="<%=basePath%>/kindeditor/kindeditor-all.js"></script>
<script charset="utf-8" src="<%=basePath%>/kindeditor/lang/zh-CN.js"></script>
<script charset="utf-8" src="<%=basePath%>/kindeditor/js/jquery-1.11.2.min.js"></script>
<style>
	#articletitle{
	margin-left: 0px;
}
#guan{
	margin-left:55px;
}
#to{
	margin-left: -50px;
}
#btn-star{
margin-left: 9px;
margin-top: 5px;
}
#filePicker{
	margin-left: 18px;
	margin-top: 5px;
}
</style>
<body>
<article class="page-container">
		<div class="row cl">
			
			<label class="form-label col-xs-4 col-sm-2"><span class="c-red" id="guan">*</span>书籍封面：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<c:if test="${biao==0 }"><img  src="<%=basePath%>${bb.code }" width="100px" height="80px;"></c:if>
			<c:if test="${imagesPath !=null}"><img  src="<%=basePath%>${imagesPath }" width="100px" height="80px;"></c:if>
			<form action="<%=basePath%>/book/upload" method="post" enctype="multipart/form-data">
				<div class="uploader-thum-container">
					<input type="hidden" value="${bb.bid }" name="id">
					<div id="filePicker"><input type="file" name="file"/></div>
					
					<button id="btn-star" class="btn btn-default btn-uploadstar radius ml-10" type="submit">开始上传</button>
				</div>
			</form>
			</div>
			 
		</div>
	<form  class="form form-horizontal" id="form-admin-add" >
		<input type="hidden" value="${imagesPath }" name="code">
		<input type="hidden" value="${bb.bid }" name="bid">
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>书籍名称：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text" value="${bb.bname }" placeholder="" id="articletitle" name="bname">
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2">书籍概括：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text" value="${bb.title }" placeholder="" id="articletitle" name="title">
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2">单价：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text" value="${bb.price }" placeholder="" id="articletitle" name="price">
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2">作者：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text" value="${bb.author }" placeholder="" id="articletitle" name="author">
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2">出版社：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text" value="${bb.press }" placeholder="" id="articletitle" name="press">
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2">书籍简介：</label>
			<div class="formControls col-xs-8 col-sm-9"> 
				<textarea id="editor_id1" name="content" style="width:700px;height:300px;">${bb.content }
            </textarea>
			</div>
		</div>
		<div class="row cl">
			<div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-2">
				<button  class="btn btn-primary radius" type="submit"><i class="Hui-iconfont">&#xe632;</i> 保存并提交审核</button>
			</div>
		</div>
	</form>
</article>

<!--_footer 作为公共模版分离出去-->
<script type="text/javascript" src="lib/jquery/1.9.1/jquery.min.js"></script> 
<script type="text/javascript" src="lib/layer/2.4/layer.js"></script>
<script type="text/javascript" src="static/h-ui/js/H-ui.min.js"></script> 
<script type="text/javascript" src="static/h-ui.admin/js/H-ui.admin.js"></script> <!--/_footer /作为公共模版分离出去-->

<!--请在下方写此页面业务相关的脚本-->
<script type="text/javascript" src="lib/My97DatePicker/4.8/WdatePicker.js"></script>
<script type="text/javascript" src="lib/jquery.validation/1.14.0/jquery.validate.js"></script> 
<script type="text/javascript" src="lib/jquery.validation/1.14.0/validate-methods.js"></script> 
<script type="text/javascript" src="lib/jquery.validation/1.14.0/messages_zh.js"></script>
<script type="text/javascript" src="lib/webuploader/0.1.5/webuploader.min.js"></script> 
<script type="text/javascript" src="lib/ueditor/1.4.3/ueditor.config.js"></script> 
<script type="text/javascript" src="lib/ueditor/1.4.3/ueditor.all.min.js"> </script> 
<script type="text/javascript" src="lib/ueditor/1.4.3/lang/zh-cn/zh-cn.js"></script>
<script>
        KindEditor.ready(function(K) {
            // 实例化编辑器1
            editor1 = K.create('#editor_id1',{
            uploadJson : 'kindeditor/jsp/upload_json.jsp',
            fileManagerJson : 'kindeditor/jsp/file_manager_json.jsp',
            allowFileManager : true,   //否开启【浏览服务器】功能
            items:['source', '|', 'undo', 'redo', '|', 'preview', 'print', 'template', 'code', 'cut', 'copy', 'paste',
                    'plainpaste', 'wordpaste', '|', 'justifyleft', 'justifycenter', 'justifyright',
                    'justifyfull', 'insertorderedlist', 'insertunorderedlist', 'indent', 'outdent', 'subscript',
                    'superscript', 'clearhtml', 'quickformat', 'selectall', '|', 'fullscreen', '/',
                    'formatblock', 'fontname', 'fontsize', '|', 'forecolor', 'hilitecolor', 'bold',
                    'italic', 'underline', 'strikethrough', 'lineheight', 'removeformat', '|', 'image', 'multiimage',
                    'flash', 'media', 'insertfile', 'table', 'hr', 'emoticons', 'baidumap', 'pagebreak',
                    'anchor', 'link', 'unlink', '|', 'about'
            ],themeType : 'simple',
            afterBlur: function(){this.sync();}
            });
    });
       

        $("#form-admin-add").validate({
    		rules:{
    			bname:{
    				required:true,
    			},
    			title:{
    				required:true,
    			},
    			price:{
    				required:true,
    			},
    			author:{
    				required:true,
    			},
    			press:{
    				required:true,
    			},
    		},
    		onkeyup:false,
    		focusCleanup:true,
    		success:"valid",
    		submitHandler:function(form){
    			$(form).ajaxSubmit({
    				type: 'post',
    				url: "<%=path %>/book/update" ,
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
    					window.location.href = '<%=basePath%>/book/findAllByPage';
    					}
    				}
    			});
    		}
    	});
</script>

<!--/请在上方写此页面业务相关的脚本-->
</body>
</html>