package com.SMSverification;

	import java.io.IOException;
	import java.io.PrintWriter;
	import java.util.Random;
	import java.util.regex.Pattern;

	import javax.servlet.ServletException;
	import javax.servlet.annotation.WebServlet;
	import javax.servlet.http.HttpServlet;
	import javax.servlet.http.HttpServletRequest;
	import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


	@WebServlet("/code")
	public class sendCodeServlet extends HttpServlet {
		
	    private static final long serialVersionUID = -8559217512617151073L;

	    @Override
	    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	        // TODO Auto-generated method stub
	        String phoneNumber = req.getParameter("number");
	        System.out.println("手机号码：" + phoneNumber);
	        String flag="";
	        if(phoneNumber.trim().equals("") || phoneNumber == null) {
	            System.out.println("手机号码为空！");
	            flag="1";
	        }
	        //手机号码格式判断
	        if(!phoneNumber.trim().equals("") &&!Pattern.matches("^1[3|4|5|7|8|9]\\d{9}$", phoneNumber)) {
	            System.out.println("手机格式错误！");
	            flag="2";
	        }
	        //生成一个6位0~9之间的随机字符串
	        StringBuffer buffer = new StringBuffer();
	        Random random = new Random();
	        for (int i = 0; i < 6; i++) {
	            buffer.append(random.nextInt(10));
	        }

	        resp.setContentType("text/html;charset=utf-8");
	        PrintWriter out = resp.getWriter();
	        try {
	            if(!SMScode.sendCode(phoneNumber, buffer.toString())) {
	            	System.out.println("验证码发送失败！");
	            } else {
	                //将验证码、手机号码和当前的系统时间存储到session中
	                req.getSession().setAttribute("code", buffer.toString());
	                req.getSession().setAttribute("number", phoneNumber );
	                req.getSession().setAttribute("time", System.currentTimeMillis());
	                req.getSession().setMaxInactiveInterval(60);//60秒，
	                System.out.println("验证码发送成功");
	                flag="3";
	            }
	        } catch (Exception e) {
	            // TODO Auto-generated catch block
	            e.printStackTrace();
	        }
	        
	        String json = "{\"message\":\""+flag+"\"}";
	        System.out.println(json);
	        out.write(json);
			out.flush();
	        out.close();
	    }


}
