package com.cn.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.ejb.Remove;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.DisabledAccountException;
import org.apache.shiro.authc.ExcessiveAttemptsException;
import org.apache.shiro.authc.ExpiredCredentialsException;
import org.apache.shiro.authc.IncorrectCredentialsException;
import org.apache.shiro.authc.LockedAccountException;
import org.apache.shiro.authc.UnknownAccountException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.authz.UnauthorizedException;
import org.apache.shiro.subject.Subject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.cn.entity.Relation;
import com.cn.entity.Role;
import com.cn.entity.User;
import com.cn.exception.CustomException;
import com.cn.service.UserService;
import com.cn.utils.ExporExcel;
import com.cn.utils.PageUtils;
import com.cn.utils.UUIDUtil;
import com.cn.vo.UserRoleMenuVo;
@Controller
@RequestMapping("user")
public class UserController {
	
	@Resource
	UserService use;
	@RequestMapping("/login")
	public String login(HttpServletRequest request,User aa) throws Exception{
		List<User> um=use.findAll(aa);
		if(um.size()>0) {
			User bb=um.get(0);
			request.getSession().setAttribute("admin",bb);
			UsernamePasswordToken token = new UsernamePasswordToken(aa.getUsername(), aa.getPwd());
			//设置为不记住�?
		    token.setRememberMe(false);  
		    Subject subject = SecurityUtils.getSubject();  
		    subject.login(token);
		    //如果登陆成功的话，则不会有什么异常，此时如果调用isAuthenticated()方法，则会返回true
		    String msg="";
			try {
				if (subject.isAuthenticated()) {
			    	// 登录成功
					return "forward:/article/selindex";
		        }else{
					return "front/login";
		        }
			} catch (IncorrectCredentialsException e) {  
		       System.out.println("登录密码错误!");
		        return "front/login";  
		    } catch (ExcessiveAttemptsException e) {  
		    	System.out.println("登录失败次数过多");
		        return "front/login"; 
		    } catch (LockedAccountException e) {  
		    	System.out.println("帐号已被锁定!");
		        return "front/login"; 
		    } catch (DisabledAccountException e) {  
		    	System.out.println("帐号已被禁用!");
		        msg = "";  
		        return "front/login";  
		    } catch (ExpiredCredentialsException e) {  
		    	System.out.println("帐号已过期！");
		        return "front/login";  
		    } catch (UnknownAccountException e) { 
		    	System.out.println("帐号不存在或者已被锁!");
		        return "front/login";   
		    } catch (UnauthorizedException e) {  
		    	System.out.println("您没有得到相应的授权!");
		    	return "front/login"; 
		    }
		}else {
			request.setAttribute("cuo", "账号或密码有误");
			return "front/login"; 
		}
		
	}
	@RequestMapping("/daochu")
	public void export(HttpServletRequest request, HttpServletResponse response) {
	    User uu = new User();//创建实体类对象
	    List<User> encryptList = use.findAll(uu);
	    ExporExcel<User> ee= new ExporExcel<User>();
	    String[] headers = {"用户id","真实姓名","用户名","密码","年龄","电话","性别","邮箱","住址"};
	    String fileName = "用户表";
	    ee.exportExcel(headers,encryptList,fileName,response);
	}
	 @RequestMapping(value="daoruaa", produces = "application/text; charset=utf-8") 
	 public void ajaxUploadExcel( @RequestParam("upfile") MultipartFile file,HttpServletRequest request,HttpServletResponse response) throws Exception {  
	        String msg = use.ajaxUploadExcel(request, response);
			response.setContentType("text/html;charset=UTF-8");//这些设置必须要放在getWriter的方法之前，
			response.getWriter().print(msg);
	}
	 @RequestMapping(value="daoru", produces = "application/text; charset=utf-8") 
	    public String UploadExcel(HttpServletRequest request,HttpServletResponse response) throws Exception {  
		 System.out.println("6666");
		 use.ajaxUploadExcel(request, response);
	        return "forward:findAllByPage";
	    }
	@RequestMapping("/houduan")
	public String houduan(HttpServletRequest request,User aa) throws Exception{
		User u=(User)request.getSession().getAttribute("admin");
		if(u!=null) {
			// 登录成功
			
			Map<String, Object> map=new HashMap<String, Object>();
		    //falg=3 查询button
		    map.put("falg", "2");
		    map.put("username", u.getUsername());
		    
	    	List<UserRoleMenuVo> list1=use.findUsersRoleMenuMap(map);
	    	UserRoleMenuVo urmv=list1.get(0);
	    	System.out.println(urmv.getName()+urmv.getUrl());
			map.put("falg", "2");
			List<UserRoleMenuVo> list2=use.findUsersRoleMenuMap(map);
			request.setAttribute("menu1", urmv);
			request.setAttribute("menu2", list2);
			return "admin/index";
		}else {
			return "front/login";
		}
    	
	 }
	@RequestMapping("/rolename")
    public String addname(HttpServletRequest request){ 
	    List<Role> libc=use.addname();
	    request.setAttribute("libc", libc);
        return "admin/User/addUser";
    }
	@RequestMapping("/chausername")
    public void chausername(HttpServletRequest request,HttpServletResponse response,String username)throws IOException{ 
		PrintWriter out = response.getWriter();
		String json = "";
		User uu=new User();
		uu.setUsername(username);
	    List<User> libc=use.findAll(uu);
	    if (libc.size()>0) {
			json = "{\"message\":true}";
		} else {
			json = "{\"message\":false}";
		}
		out.write(json);
		out.flush();
		out.close();
    }
	@RequestMapping("/yan")
    public void yan(HttpServletRequest request,HttpServletResponse response,String code) throws IOException{
		 PrintWriter out = response.getWriter();
		String codes=(String) request.getSession().getAttribute("code");
		System.out.println(codes);
		String json = "";
		if (code.equals(codes)) {
			json = "{\"message\":false}";
		} else {
			json = "{\"message\":true}";
		}
		out.write(json);
		out.flush();
		out.close();
    }
	@RequestMapping("/findAllByPage")
	public String findAllByPage(HttpServletRequest request,Map<String,Object> map,PageUtils p,User aa){
		int page=(p.getCurrPage() - 1) * p.getRows();
		int row=p.getRows();
		map.put("page", page);
		map.put("row", row);
		map.put("p", p);
		map.put("b", aa);
		int aaaaa=use.findAllCount(map);
		p.setTotalNumber(aaaaa);
		int currPage=p.getCurrPage();
		if (currPage!=0){
			p.setCurrPage(currPage);
			if (p.getCurrPage() > p.getCountPage()) {
				p.setCurrPage(1);
			}
		}
		List<User> list=use.findAllByPage(map);
		request.setAttribute("list",list);
		request.setAttribute("p",p);
		request.setAttribute("b", aa);
        return "admin/User/selUser";
	}
	  @RequestMapping("/add")
	    public void add(HttpServletRequest request,User b,String[] rid,HttpServletResponse response) throws IOException{ 
		  String uid=UUIDUtil.getUUID();
		  b.setUid(uid);
		  PrintWriter out = response.getWriter();
		  b.setState(1);
		 	boolean ba=use.add(b);
		 	Relation t=new Relation();
		 	for(int i=0;i<rid.length;i++) {
		 		t.setUrid(UUIDUtil.getUUID());
		 		t.setRid(rid[i]);
		 		t.setUid(uid);
		 		boolean bd=use.add(t);
		 	}
		 	
			String json = "";
			if (ba) {
				json = "{\"message\":true}";
			} else {
				json = "{\"message\":false}";
			}
			out.write(json);
			out.flush();
			out.close();
	    }
	  @RequestMapping("/zhuce")
	    public String zhuce(HttpServletRequest request,User b){ 
		  String uid=UUIDUtil.getUUID();
		  b.setUid(uid);
		  b.setState(0);
		  b.setSex("男");
		  boolean ba=use.add(b);
		  if(ba) {
			  request.setAttribute("username", b.getUsername());
			  request.setAttribute("pwd", b.getPwd());
			  return "front/login";
		  }else {
			  return "front/zuce";
		  }
	    }
	  @RequestMapping("/update")
	    public void update(HttpServletRequest request,User b,String[] rid,HttpServletResponse response) throws IOException{ 
		  PrintWriter out = response.getWriter();
		  String uid=b.getUid();
		  System.out.println(uid);
		  use.deleteur(uid);
		  if(rid!=null) {
			  boolean ba= use.update(b);
			  Relation t=new Relation();
			 	for(int i=0;i<rid.length;i++) {
			 		t.setUrid(UUIDUtil.getUUID());
			 		t.setRid(rid[i]);
			 		t.setUid(b.getUid());
			 		boolean bd=use.add(t);
			 	}
				String json = "";
				if (ba) {
					json = "{\"message\":true}";
				} else {
					json = "{\"message\":false}";
				}
				out.write(json);
				out.flush();
				out.close();
		  }else{
			    String json = "";
				json = "{\"message\":false}";
				
				out.write(json);
				out.flush();
				out.close();
		  }
		  
	    }
	  @RequestMapping("/delete")
	    public void delete(HttpServletResponse response,String id) throws IOException{ 
			boolean b = use.delete(id);
			boolean bb=use.deletea(id);
			PrintWriter out = response.getWriter();
			String json = "";
			if (b) {
				json = "{\"message\":true}";
			} else {
				json = "{\"message\":false}";
			}
			out.write(json);
			out.flush();
			out.close();
	    }
	  @RequestMapping("/findByIds")
	    public String findByIds(HttpServletRequest request,String uid){ 
			String[] bs={uid};
			List<Relation> listid = use.findByIds(bs);
			Relation bb=listid.get(0);
			List<Relation> zuo=use.zuolian(uid);
			request.setAttribute("libc", zuo);
			request.setAttribute("bb", bb);
	        return "admin/User/upUser";
	    }
	  @RequestMapping("/tui")
	    public String tui(HttpServletRequest request){ 
		  	request.getSession().removeAttribute("admin");
	        return "front/login";
	    }
	  
	  @RequestMapping("/deleteids")
	    public void deleteids(HttpServletResponse response,String[] checkedId) throws IOException{ 
		  int b=use.batchdelete(checkedId);
		  int bb=use.batchdeletea(checkedId);
		  PrintWriter out = response.getWriter();
			String json = "";
			if (b>0) {
				json = "{\"message\":true}";
			} else {
				json = "{\"message\":false}";
			}
			out.write(json);
			out.flush();
			out.close();
	    }
}
