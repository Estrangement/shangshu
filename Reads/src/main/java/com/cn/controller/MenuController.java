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
import com.cn.service.MenuService;
import com.cn.utils.PageUtils;
import com.cn.utils.UUIDUtil;
@Controller
@RequestMapping("/menu")
public class MenuController {
	
	@Resource
	MenuService use;
	@RequestMapping("/findAllByPage")
	public String findAllByPage(HttpServletRequest request,Map<String,Object> map,PageUtils p,Menu aa){
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
		List<Menu> list=use.findAllByPage(map);
		request.setAttribute("list",list);
		request.setAttribute("p",p);
		request.setAttribute("b", aa);
        return "admin/Menu/selMenu";
	}
	  @RequestMapping("/addmenu")
	    public void addmeu(HttpServletRequest request,HttpServletResponse response,Menu b) throws IOException{ 
		    b.setId(UUIDUtil.getUUID());
		    b.setType("menu");
		    b.setParent_id("null");
			
			PrintWriter out = response.getWriter();
		 	boolean ba=use.add(b);
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
	  @RequestMapping("/addbutton")
	    public void addbutton(HttpServletRequest request,HttpServletResponse response,Menu b) throws IOException{ 
		    b.setId(UUIDUtil.getUUID());
		    b.setType("button");
			PrintWriter out = response.getWriter();
		 	boolean ba=use.add(b);
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
	  @RequestMapping("/addname")
	    public String addname(HttpServletRequest request,Menu b){ 
		  
		    b.setType("menu");
		    List<Menu> lia=use.findAll(b);
		    request.setAttribute("lia", lia);
	        return "admin/Menu/addButton";
	    }
	  @RequestMapping("/update")
	    public void update(HttpServletRequest request,HttpServletResponse response,Menu b) throws IOException{ 
		  PrintWriter out = response.getWriter();
		 	boolean ba= use.update(b);
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
	    public String findByIds(HttpServletRequest request,String id){ 
			String[] bs={id};
			List<Menu> listid = use.findByIds(bs);
			Menu bb=listid.get(0);
			request.setAttribute("bb", bb);
			
	        return "admin/Menu/upMenu";
	    }
	  @RequestMapping("/deleteids")
	    public void deleteids(HttpServletResponse response,String[] checkedId) throws IOException{ 
		  System.out.println("jinlaile");
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
