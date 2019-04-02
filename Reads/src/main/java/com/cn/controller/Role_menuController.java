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
import com.cn.service.Role_menuService;
import com.cn.utils.PageUtils;
import com.cn.utils.UUIDUtil;
@Controller
@RequestMapping("/rom")
public class Role_menuController {
	
	@Resource
	Role_menuService use;
	@RequestMapping("/findAllByPage")
	public String findAllByPage(HttpServletRequest request,Map<String,Object> map,PageUtils p,Role_menu aa){
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
		List<Role_menu> list=use.findAllByPage(map);
		request.setAttribute("list",list);
		request.setAttribute("p",p);
		request.setAttribute("b", aa);
        return "admin/Role_menu/selRole_menu";
	}
	  @RequestMapping("/add")
	    public String add(HttpServletRequest request,HttpServletResponse response,Role_menu b,String[] ids,String rid) throws IOException{ 
		  for(int i=0;i<ids.length;i++) {
			  b.setRmid(UUIDUtil.getUUID());
			  b.setRid(rid);
			  b.setMid(ids[i]);
			  boolean ba= use.add(b);
			  PrintWriter out = response.getWriter();
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
	        return "forward:findAllByPage";
	    }

	
	  @RequestMapping("/addname")
	    public String addname(HttpServletRequest request,Relation b,Map<String,Object> map){ 
			map=use.addname();
		    List<Menu> lia=(List)map.get("lia");
		    List<Role> libc=(List)map.get("libc");
		    request.setAttribute("lia", lia);
		    request.setAttribute("libc", libc);
	        return "admin/Role_menu/addRole_menu";
	    }
	 
	  @RequestMapping("/update")
	    public String update(HttpServletRequest request,Role_menu b){ 
		  use.update(b);
	        return "forward:findAllByPage";
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
	    public String findByIds(HttpServletRequest request,String uid){ 
			String[] bs={uid};
			List<Role_menu> listid = use.findByIds(bs);
			Role_menu bb=listid.get(0);
			request.setAttribute("bb", bb);
			
	        return "admin/Role_menu/upRole";
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
