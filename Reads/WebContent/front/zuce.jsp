<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
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
        <link rel="stylesheet" href="<%=basePath%>/assets/bootstrap/css/bootstrap.min.css">
        <link rel="stylesheet" href="<%=basePath%>/assets/css/style.css">
         <script src="<%=basePath%>/js/jquery-1.12.4.js"></script>
        <script src="<%=basePath%>/assets/js/jquery-1.8.2.min.js"></script>
        <script src="<%=basePath%>/assets/bootstrap/js/bootstrap.min.js"></script>
        <script src="<%=basePath%>/assets/js/jquery.backstretch.min.js"></script>
        <script src="<%=basePath%>/assets/js/scripts.js"></script>
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
	.myb{
		position:absolute;
		font-size: 13;
		width:180px;
		margin-left: -140px;
		margin-top: 4px;
		cursor:pointer;
	}
	.myspan1{
		margin-top: -30px;
		margin-left: 40px;
	}
	.myspan2{
		margin-top: -30px;
		margin-left: 60px;
	}
	.myspan3{
		margin-top: -30px;
		margin-left: 60px;
	}
	
</style>
 <script type="text/javascript">
 var InterValObj; //timer变量，控制时间
 var count = 60; //间隔函数，1秒执行
 var curCount;//当前剩余秒数
 var code = ""; //验证码
 var codeLength = 6;//验证码长度
        function sendCode() {
        	var number = window.document.getElementById("tel").value;
           $.ajax({
               type: "post",
               // 手机短信验证码发送程序
               url: "<%=basePath%>code",
               data: {"number":number},
               dataType: "JSON",
               success: function (b) {//通过返回值判断发送状态
                   // console.log(result);
                  if(b.message==1){
                	  $(".myspan1").html("<font color='#E80000' > - 手机号码不能为空.</font>");
                  } else if(b.message==2){
                	  $(".myspan1").html("<font color='#E80000' > - 手机号码格式错误.</font>");
                  }else if(b.message==3){
                	  $(".myspan1").html("<font color='#E80000' ></font>");
                	  curCount = count;
                      //设置button效果，开始计时
                      
                      $("#sendmsg").attr("disabled", "true");
                      $("#sendmsg").html("获取" + curCount + "秒");
                      InterValObj = window.setInterval(SetRemainTime, 1000); //启动计时器，1秒执行一次
                  }
                  
               },
            
               
           })
        }
        function SetRemainTime() {

            if (curCount == 0) {
                window.clearInterval(InterValObj);//停止计时器
                $("#sendmsg").removeAttr("disabled");//启用按钮
                $("#sendmsg").css("background-color", "");
                $("#sendmsg").html("重发验证码");
                code = ""; //清除验证码。如果不清除，过时间后，输入收到的验证码依然有效
            }
            else {
                curCount--;
                $("#sendmsg").html("获取" + curCount + "秒");
            }
        }
       
        

    </script>
    <script>
    $(function(){
    	$("#yans").blur(function(){
        	var code=$(this).val();
        	 $.ajax({
                 type: "post",
                 // 手机短信验证码发送程序
                 url: "<%=basePath%>user/yan",
                 data: {"code":code},
                 success: function (a) {//通过返回值判断发送状态
                     // console.log(result);
                    if(a.message){
                    	$(".myspan2").html("<font color='#E80000' > - 验证码不一致.</font>");
                    }else{
                    	$(".myspan2").html("<font color='#00FF00' > - 通过.</font>");
                    }
                 },
                 error:function(result){
                     console.log('error');
                 },
                 dataType: 'json'

             })
        })
        $("#username").blur(function(){
        	var username=$(this).val();
        	 $.ajax({
                 type: "post",
                 // 手机短信验证码发送程序
                 url: "<%=basePath%>user/chausername",
                 data: {"username":username},
                 success: function (a) {//通过返回值判断发送状态
                     // console.log(result);
                    if(a.message){
                    	$(".myspan3").html("<font color='#E80000' > - 用户名已存在.</font>");
                    }else{
                    	$(".myspan3").html("<font color='#00FF00' > </font>");
                    }
                 },
                 error:function(result){
                     console.log('error');
                 },
                 dataType: 'json'

             })
        })
    })
    </script>
<body>
 <div class="header">
            <div class="container">
                <div class="row">
                    <div class="logo span4">
                        <h1><a href="">iApp Register <span class="red">.</span></a></h1>
                    </div>
                   <div class="biaoa">
                        <a class="mya" href="<%=basePath%>/article/selindex" >首页</a>
                        <a class="mya" href="front/login.jsp" >登录</a>
                    </div>
                </div>
            </div>
        </div>

        <div class="register-container container">
            <div class="row">
                <div class="iphone span5">
                    <img src="assets/img/iphone.png" alt="">
                </div>
                <div class="register span6">
                    <form action="<%=path %>/user/zhuce" method="post">
                        <h2>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;REGISTER TO <span class="red"><strong>SHANGSHU</strong></span></h2>
                        <label for="truename">真实姓名</label>
                        <input type="text" id="truename" name="uname" placeholder="请输入真实姓名...">
                        <label for="age">年龄</label>
                        <input type="text" id="age" name="age" placeholder="请输入年龄...">
                        <label for="tel">电话</label><span class="myspan1" style=" font-style:oblique"></span>
                        <input type="tel" id="tel" name="tel" placeholder="请输入电话..." pattern="^1[3|4|5|7|8|9]\d{9}$"> 
                        <span style="text-align: center;" class="myb">
                			<span  onclick="sendCode()" id="sendmsg" href="javascript:;" >获取验证码</span>
            			</span>
                        <!-- <a onclick="sendCode()"  id="sendmsg" href="javascript:;" class="myb">发送验证码</a> -->
                        <label for="yans">验证码</label><span class="myspan2" style=" font-style:oblique"></span>
                        <input type="text" id="yans" name="yan" placeholder="请输入验证码...">
                        <label for="username">用户名</label><span class="myspan3" style=" font-style:oblique"></span>
                        <input type="text" id="username" name="username" placeholder="请输入用户名...">
                        <label for="pwd">密码</label>
                        <input type="password" id="pwd" name="pwd" placeholder="请输入密码...">
                        <label for="email">邮箱</label>
                        <input type="text" id="email" name="email" placeholder="请输入邮箱...">
                        <label for="address">住址</label>
                        <input type="text" id="address" name="address" placeholder="请输入住址...">
                        <button type="submit">REGISTER</button>
                    </form>
                </div>
            </div>
        </div>
        <!-- Javascript -->
       
</body>
</html>