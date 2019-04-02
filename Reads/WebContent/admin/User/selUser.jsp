
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
 
<base href="<%=basePath%>">

<html>
<meta charset="utf-8">
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<meta http-equiv="Cache-Control" content="no-siteapp"/>
<link rel="stylesheet" type="text/css" href="static/h-ui/css/H-ui.min.css" />
<link rel="stylesheet" type="text/css" href="static/h-ui.admin/css/H-ui.admin.css" />
<link rel="stylesheet" type="text/css" href="lib/Hui-iconfont/1.0.8/iconfont.css" />
<link rel="stylesheet" type="text/css" href="static/h-ui.admin/skin/default/skin.css" id="skin" />
<link rel="stylesheet" type="text/css" href="static/h-ui.admin/css/style.css" />

<title>系统管理</title>
</head>
<body>
<article class="page-container">
	<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i>
<span class="c-gray en">&gt;</span>管理中心 <span class="c-gray en">&gt;</span> <font color="cornflowerblue">用户管理</font> <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
<div class="pd-20">
<form action="<%=path %>/user/findAllByPage">
  <div class="text-c">
     <input type="text" class="input-text" style="width:250px" placeholder="输入账号" value="${b.username }" name="username">
     <input id="currPage" name="currPage" type="hidden" value="${p.currPage}">
     <input id="rows" name="rows" type="hidden" value="${p.rows}">
     <button type="submit" class="btn btn-success"><i class="icon-search"></i> 搜索</button>
  </div>
  </form>
  <div class="cl pd-5 bg-1 bk-gray mt-20">
    <span class="l">
    <shiro:hasPermission name="user:delete"> 
      <a href="javascript:;" onclick="datadel()" class="btn btn-danger radius"><i class="Hui-iconfont">&#xe6e2;</i> 批量删除</a>
     </shiro:hasPermission> 
     <shiro:hasPermission name="user:add"> 
      <a href="javascript:;" onclick="admin_add('添加用户','<%=basePath%>/user/rolename','700','500')" class="btn btn-primary radius">
	 <i class="Hui-iconfont">&#xe600;</i> 添加用户
	 </a>
     </shiro:hasPermission> 
     <shiro:hasPermission name="user:delete"> 
      <a href="javascript:;"  onclick="daochu()" class="btn btn-danger radius"><i class="Hui-iconfont">&#xe608;</i> 导出数据</a>
     </shiro:hasPermission> 
     <shiro:hasPermission name="user:delete"> 
      <a href="javascript:;" onclick="admin_add('导入数据','admin/User/daoru.jsp','700','500')" class="btn btn-primary radius">
	 <i class="Hui-iconfont">&#xe604;</i> 导入数据
	 </a>
     </shiro:hasPermission> 
    </span>
    <span class="r">
        <div id="d1">
	                                 第 <font color=maroon>${p.currPage}</font>页/
	                                 共 <font color=maroon>${p.countPage}</font>页
	                &nbsp;&nbsp;共 <font color=maroon>${p.getTotalNumber() }</font>条记录
	     </div>
    </span>
  </div>
    <table class="table table-border table-bordered table-hover table-bg table-sort">
    <thead>
      <tr class="text-c">
			 <th width="25"><input type="checkbox" value="" name="" id="allSelect" class="allSelect"></th>
             <th>用户ID</th>
             <th>真实姓名</th>
             <th>性别</th>
             <th>年龄</th>
             <th>电话</th>
             <th>邮箱</th>
             <th>住址</th>
             <th>登录名</th>
             <th>登录密码</th>
             <th>角色</th>
             <th>操作</th>
      </tr>
    </thead>
    <tbody>
    	<c:forEach items="${list}" var="u">
          <tr class="text-c">
		   <td><input type="checkbox" value="${u.uid }" name="uid"></td>           
		   <td>${u.uid}</td>
           <td>${u.uname}</td> 
           <td>${u.sex}</td> 
           <td>${u.age}</td> 
           <td>${u.tel}</td> 
           <td>${u.email}</td> 
           <td>${u.address}</td> 
           <td>${u.username}</td>
		   <td>${u.pwd}</td>
		   <td>${u.quanxian}</td>
	       <td>
	        <shiro:hasPermission name="user:update">
	<a style="text-decoration:none" onclick="admin_add('修改用户','<%=basePath%>/user/findByIds?uid=${u.uid}','700','500')"><i class="Hui-iconfont" style="color: black;">&#xe6df;</i></a></shiro:hasPermission>
	        <shiro:hasPermission name="user:delete"> <a style="text-decoration:none"  href="javascript:;" onclick="member_del(this,'${u.uid}')"><i class="Hui-iconfont" style="color: black;" >&#xe6e2;</i></a>	</shiro:hasPermission>                       
	       </td>
        
       </tr>
      </c:forEach>
    </tbody>
  </table>
  <div id="pageNav" class="pageNav">
      <c:if test="${p.currPage!=1}">
	            <a href="<%=basePath%>/user/findAllByPage?currPage=1"">首页</a>
	            <a><font color=maroon>${p.currPage}</font></a>
                <a href="<%=basePath%>/user/findAllByPage?currPage=${p.currPage-1}">上一页</a>
         </c:if>
        <c:if test="${p.currPage!=p.countPage}">
                <a href="<%=basePath%>/user/findAllByPage?currPage=${p.currPage+1}">下一页</a>
                <a><font color=maroon>${p.currPage}</font></a>
                <a href="<%=basePath%>/user/findAllByPage?currPage=${p.countPage}">尾页</a>
        
        </c:if>
  </div>
</div>
</article>

<!--_footer 作为公共模版分离出去--> 
<script type="text/javascript" src="lib/jquery/1.9.1/jquery.min.js"></script> 
<script type="text/javascript" src="lib/layer/2.4/layer.js"></script>
<script type="text/javascript" src="static/h-ui/js/H-ui.min.js"></script> 
<script type="text/javascript" src="static/h-ui.admin/js/H-ui.admin.js"></script> <!--/_footer 作为公共模版分离出去-->

<!--请在下方写此页面业务相关的脚本-->
<script type="text/javascript" src="lib/jquery.validation/1.14.0/jquery.validate.js"></script> 
<script type="text/javascript" src="lib/jquery.validation/1.14.0/validate-methods.js"></script> 
<script type="text/javascript" src="lib/jquery.validation/1.14.0/messages_zh.js"></script> 
<script type="text/javascript">
  function member_del(obj,id){
          layer.confirm('确认要删除吗？',function(index){
              //发异步删除数据
              $(obj).parents("tr").remove();
              $.ajax({
				type:"POST",
				url:"<%=basePath%>/user/delete",
				data:{"id":id},
				dataType:"json",
				success:function(d){
						if(d.message){
							layer.msg('已删除', {
								icon : 1,
								time : 1000
							});
							setTimeout(function(){
								javascript:location.replace(location.href);
							},1000);
						}
					},
					 error:function(){
						alert("错误");
					} 
			});
            
          });
      }
  function daochu(){
	  layer.confirm('确认要导出到EXCEl工作表吗？',function(index){
	  window.location.href="<%=basePath%>/user/daochu"; 
	  layer.msg('已开始下载', {
			icon : 1,
			time : 1000
		});
		setTimeout(function(){
			javascript:location.replace(location.href);
		},1000);
	});
  }

</script>
<script type="text/javascript">
function datadel(){ 
		layer.confirm('确认要删除吗?',function(index){ 
		// 获取所有选中的checked框 
		var option = $(":checked"); 
		var checkedId = ""; 
		var boo=true; 
		//拼接除全选框外,所有选中的id, 
		for (var i = 0, len = option.length; i < len; i++) { 
		if (boo) { 
		if (option[i].id=='allSelect') { 
		boo=true; 
		}else { 
		boo=false; 
		checkedId += option[i].value; 
		} 
		}else{ 
		checkedId += ","+option[i].value; 
		} 
		} 
		$.ajax({ 
		type: "post", 
		url:'<%=basePath%>/user/deleteids', 
		data : { 
		"checkedId":checkedId 
		}, 
		dataType:"json", 
		success: function(data){
			if(data.message){
				layer.msg('已删除', {
					icon : 1,
					time : 1000
				});
				setTimeout(function(){
					javascript:location.replace(location.href);
				},1000);
			}else{
				layer.msg('删除失败', {
					icon : 2,
					time : 1000
					});
			}
		}
		}); 
		}); 
	}

function admin_add(title,url,w,h){
	layer_show(title,url,w,h);
	
}
</script> 
<!--/请在上方写此页面业务相关的脚本-->
</body>
</html>