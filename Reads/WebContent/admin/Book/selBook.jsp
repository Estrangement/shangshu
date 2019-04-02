
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions"  prefix="fn"%>

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

<title>书籍管理</title>
</head>
<body>
<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i>
<span class="c-gray en">&gt;</span>管理中心 <span class="c-gray en">&gt;</span> <font color="cornflowerblue">书籍管理</font> <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
<div class="pd-20">
<form action="<%=path %>/book/findAllByPage">
  <div class="text-c">
     <input type="text" class="input-text" style="width:250px" placeholder="输入书籍名称关键字" value="${b.title }" name="title">
     <input id="currPage" name="currPage" type="hidden" value="${p.currPage}">
     <input id="rows" name="rows" type="hidden" value="${p.rows}">
     <button type="submit" class="btn btn-success"><i class="icon-search"></i> 搜索</button>
  </div>
  </form>
  <div class="cl pd-5 bg-1 bk-gray mt-20">
    <span class="l">
    <shiro:hasPermission name="book:delete">
    	<a href="javascript:;" onclick="datadel()" class="btn btn-danger radius"><i class="Hui-iconfont">&#xe6e2;</i> 批量删除</a>
    </shiro:hasPermission>
    <shiro:hasPermission name="book:add">
	 <a class="btn btn-primary radius" data-title="新增书籍" data-href="admin/Book/addBook.jsp" onclick="Hui_admin_tab(this)" href="javascript:;"><i class="Hui-iconfont">&#xe600;</i> 新增书籍</a>
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
      		 <th>书籍封面</th>
             <th>书籍名称</th>
             <th>书籍概要</th>
             <th>单价</th>
             <th>作者</th>
             <th>出版时间</th>
             <th>出版社</th>
             <th>审核状态</th>
             <th>操作</th>
      </tr>
    </thead>
    <tbody id="mybody">
    	<c:forEach items="${list}" var="u">
          <tr class="text-c">
           <td><input type="checkbox" value="${u.bid }" name="bid"></td>
           <td><img  src="<%=basePath%>${u.code }" width="50px;" height="50px;"></td>
           <td>${u.bname}</td>
           <td>${fn:substring(u.title,0,15)}...</td>
		   <td>${u.price}</td>
		   <td>${u.author}</td>
		   <td>${u.time}</td>
		   <td>${u.press}</td>
		   <td>
		   		<c:if test="${u.state==1 }"><span class="label label-success radius" >已审核</span></c:if>
		   		<c:if test="${u.state==0 }"><span class="label radius" >未审核</span></c:if>
		   </td>
	       <td>
	       <shiro:hasPermission name="book:shen">
	       	 <input type="hidden" value="${u.state }">
	         <c:if test="${u.state==1 }"><span ><a onclick="member_states(this,'${u.bid}')"  class="Hui-iconfont">&#xe6de;</a></span></c:if>
	         <c:if test="${u.state==0 }"><span > <a onclick="member_state(this,'${u.bid}')"  class="Hui-iconfont">&#xe603;</a></span></c:if>
	         <input type="hidden" value="${u.bid }">
	       </shiro:hasPermission>
	       <shiro:hasPermission name="book:update">
			<a style="text-decoration:none" href="<%=basePath%>/book/findByIds?id=${u.bid}"><i class="Hui-iconfont" style="color: black;" >&#xe6df;</i></a>
			</shiro:hasPermission>
	        <shiro:hasPermission name="book:delete"> 
	       <a style="text-decoration:none"  href="javascript:;" onclick="member_del(this,'${u.bid}')"><i class="Hui-iconfont" style="color: black;" >&#xe6e2;</i></a>	                       
	        </shiro:hasPermission>                       
	       </td>
        
       </tr>
      </c:forEach>
    </tbody>
  </table>
  <div id="pageNav" class="pageNav">
      <c:if test="${p.currPage!=1}">
	            <a href="<%=basePath%>/book/findAllByPage?currPage=1">首页</a>
	            <a><font color=maroon>${p.currPage}</font></a>
                <a href="<%=basePath%>/book/findAllByPage?currPage=${p.currPage-1}">上一页</a>
         </c:if>
        <c:if test="${p.currPage!=p.countPage}">
                <a href="<%=basePath%>/book/findAllByPage?currPage=${p.currPage+1}">下一页</a>
                <a><font color=maroon>${p.currPage}</font></a>
                <a href="<%=basePath%>/book/findAllByPage?currPage=${p.countPage}">尾页</a>
        
        </c:if>
  </div>
</div>
<!--_footer 作为公共模版分离出去-->
<script type="text/javascript" src="lib/jquery/1.9.1/jquery.min.js"></script> 
<script type="text/javascript" src="lib/layer/2.4/layer.js"></script>
<script type="text/javascript" src="static/h-ui/js/H-ui.min.js"></script> 
<script type="text/javascript" src="static/h-ui.admin/js/H-ui.admin.js"></script>
<!--/_footer 作为公共模版分离出去-->

<!--请在下方写此页面业务相关的脚本-->
<script type="text/javascript" src="lib/My97DatePicker/4.8/WdatePicker.js"></script> 
<script type="text/javascript" src="lib/datatables/1.10.0/jquery.dataTables.min.js"></script> 
<script type="text/javascript" src="lib/laypage/1.2/laypage.js"></script>
<script type="text/javascript">
function admin_add(title,url,w,h){
	layer_show(title,url,w,h);
}
/*资讯-添加*/
function article_add(title,url,w,h){
	var index = layer.open({
		type: 2,
		title: title,
		content: url
	});
	layer.full(index);
}
/*资讯-编辑*/
function article_edit(title,url,id,w,h){
	var index = layer.open({
		type: 2,
		title: title,
		content: url
	});
	layer.full(index);
}

<%-- $("#mybody").children().children(":last-child").children().next().click(function(){
	
	var state=$(this).prev().val();
	var bid=$(this).next().val();
	$.getJSON("<%=basePath%>/book/upstate",{"state":state,"bid":bid},function(data){
		javascript:location.replace(location.href);
			
		});
}); --%>
function member_state(obj,bid){
    layer.confirm('确认审核通过？',function(index){
        //发异步删除数据
        $.ajax({
			type:"POST",
			url:"<%=basePath%>/book/upstate",
			data:{"bid":bid},
			dataType:"json",
			success:function(d){
					if(d.message){
						layer.msg('审核已通过!', {
							icon : 1,
							time : 1000
						});
						setTimeout(function(){
							javascript:location.replace(location.href);
						},1000);
					  /* layer.msg('',{icon:1,time:1000}); */
					}
				},
				 error:function(){
					alert("错误");
				} 
		});
      
    });
}
function member_states(obj,bid){
    layer.confirm('确定要取消审核？',function(index){
        //发异步删除数据
        $.ajax({
			type:"POST",
			url:"<%=basePath%>/book/upstates",
			data:{"bid":bid},
			dataType:"json",
			success:function(d){
					if(d.message){
						layer.msg('审核已取消!', {
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
	url:'<%=basePath%>/book/deleteids', 
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



  function member_del(obj,id){
          layer.confirm('确认要删除吗？',function(index){
              //发异步删除数据
              $(obj).parents("tr").remove();
              $.ajax({
				type:"POST",
				url:"<%=basePath%>/book/delete",
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

</script>
  </body>
</html>
