package com.cn.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cn.entity.Menu;
import com.cn.entity.Relation;
import com.cn.entity.Role;
import com.cn.entity.Role_menu;
import com.cn.service.RoleService;
import com.cn.utils.PageUtils;
import com.cn.utils.UUIDUtil;
@Controller
@RequestMapping("/role")
public class RoleController {
	
	@Resource
	RoleService use;
	@RequestMapping("/findAllByPage")
	public String findAllByPage(HttpServletRequest request,Map<String,Object> map,PageUtils p,Role aa){
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
		
		List<Role> list=use.findAllByPage(map);
		request.setAttribute("list",list);
		request.setAttribute("p",p);
		request.setAttribute("b", aa);
        return "admin/Role/selRole";
	}
	  @RequestMapping("/add")
	    public void add(HttpServletRequest request,HttpServletResponse response,String[] ids,String jname) throws IOException{
		  PrintWriter out = response.getWriter();
		  String rid=UUIDUtil.getUUID();
		  if(ids.length>0) {
			  Role_menu rm=new Role_menu();
			  for(int i=0;i<ids.length;i++) {
				  System.out.println(ids[i]);
				  rm.setRmid(UUIDUtil.getUUID());
				  rm.setRid(rid);
				  rm.setMid(ids[i]);
				  boolean bc=use.addr(rm);
			  }
			  Role r=new Role();
			  r.setRid(rid);
			  r.setRname(jname);
			  boolean ba=use.add(r);
				String json = "";
				if (ba) {
					json = "{\"message\":true}";
				} else {
					json = "{\"message\":false}";
				}
				out.write(json);
				out.flush();
				out.close();
		  }else {
			  Role r=new Role();
			  r.setRid(rid);
			  r.setRname(jname);
			  boolean ba=use.add(r);
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
	    }
	  @RequestMapping("/addname")
	    public String addname(HttpServletRequest request,Relation b,Map<String,Object> map){ 
			map=use.addname();
		    List<Menu> menu=(List)map.get("menu");
		    List<Menu> button=(List)map.get("button");
		    request.setAttribute("menu", menu);
		    request.setAttribute("button", button);
	        return "admin/Role/addRole";
	    }
	  @RequestMapping("/update")
	    public void update(HttpServletRequest request,HttpServletResponse response,String[] ids,String jname,String rid) throws IOException{ 
		  boolean a=use.deleterid(rid);
		  if(ids!=null) {
			  Role rr=new Role();
			  rr.setRid(rid);
			  rr.setRname(jname);
			  boolean b=use.update(rr);
			  Role_menu rm=new Role_menu();
			  for(int i=0;i<ids.length;i++) {
				  rm.setRmid(UUIDUtil.getUUID());
				  rm.setRid(rid);
				  rm.setMid(ids[i]);
				  boolean bc=use.addr(rm);
			  }
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
		  }else {
			  PrintWriter out = response.getWriter();
				String json = "";
				if (a) {
					json = "{\"message\":true}";
				} else {
					json = "{\"message\":false}";
				}
				out.write(json);
				out.flush();
				out.close();
		  }
		 
	    }
	  @RequestMapping("/delete")
	    public void delete(HttpServletResponse response,String id) throws IOException{ 
			boolean b = use.delete(id);
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
	    public String findByIds(HttpServletRequest request,String rid){ 
		  String[] bs={rid};
			List<Role> list = use.findByIds(bs);
			Role bb=list.get(0);
			request.setAttribute("bb", bb);
		    List<Role_menu> listid = use.zuolian(rid);
			request.setAttribute("menu", listid);
			request.setAttribute("button", listid);
	        return "admin/Role/upRole";
	    }
	  @RequestMapping("/deleteids")
	    public void deleteids(HttpServletResponse response,String[] checkedId) throws IOException{ 
		  int b=use.batchdelete(checkedId);
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
