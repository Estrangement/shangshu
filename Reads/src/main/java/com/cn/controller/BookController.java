package com.cn.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.cn.entity.Article;
import com.cn.entity.Book;
import com.cn.service.BookService;
import com.cn.utils.GetTime;
import com.cn.utils.PageUtils;
import com.cn.utils.UUIDUtil;
@Controller
@RequestMapping("/book")
public class BookController {
	
	@Resource
	BookService use;
	@RequestMapping("/seltuijian")
    public String selindex(HttpServletRequest request){ 
		Book a=new Book();
		List<Book> one=use.findAll(a);
		List<Book> tuijian=use.suijia();
		request.setAttribute("tuijian", tuijian);
		request.setAttribute("one", one);
        return "front/tuijian";
    }
	@RequestMapping("/xiangqing")
    public String xiangqing(HttpServletRequest request,String bid){ 
		String[] bs={bid};
		List<Book> listid = use.findByIds(bs);
		Book bb=listid.get(0);
		List<Book> tuijian=use.suijia();
		request.setAttribute("bb", bb);
		request.setAttribute("tuijian", tuijian);
        return "front/bookinfo";
    }
	@RequestMapping("/upstate")
    public void upstate(HttpServletRequest request,HttpServletResponse response,String bid,Book ct) throws IOException{ 
		    PrintWriter out = response.getWriter();
			String json = "";
			ct.setState(1);
			ct.setBid(bid);
			boolean a=use.upstate(ct);
			if (a) {
				json = "{\"message\":true}";
			} else {
				json = "{\"message\":false}";
			}
			out.write(json);
			out.flush();
			out.close();
    }
	@RequestMapping("/upstates")
    public void upstates(HttpServletRequest request,HttpServletResponse response,String bid,Book ct) throws IOException{ 
		    PrintWriter out = response.getWriter();
			String json = "";
			ct.setState(0);
			ct.setBid(bid);
			boolean a=use.upstate(ct);
			System.out.println(a+"---1");
			if (a) {
				json = "{\"message\":true}";
			} else {
				json = "{\"message\":false}";
			}
			out.write(json);
			out.flush();
			out.close();
		
			
    }
	@RequestMapping("/findAllByPage")
	public String findAllByPage(HttpServletRequest request,Map<String,Object> map,PageUtils p,Book aa){
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
		List<Book> list=use.findAllByPage(map);
		request.setAttribute("list",list);
		request.setAttribute("p",p);
		request.setAttribute("b", aa);
        return "admin/Book/selBook";
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
	@RequestMapping("/add")
    public void add(HttpServletRequest request,HttpServletResponse response,Book b)throws IOException{ 
		PrintWriter out = response.getWriter();
	    b.setBid(UUIDUtil.getUUID());
	    b.setTime(GetTime.getStrDate("yyyy-MM-dd-HH-mm-ss"));
	    b.setType("1");
	    b.setState(0);
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
	@RequestMapping("/findByIds")
    public String findByIds(HttpServletRequest request,String id){ 
		String[] bs={id};
		List<Book> listid = use.findByIds(bs);
		Book bb=listid.get(0);
		request.setAttribute("bb", bb);
		int biao=0;
		request.setAttribute("biao", biao);
        return "admin/Book/upBook";
    }
	@RequestMapping(value="/upload",method=RequestMethod.POST)
	private String fildUpload(@RequestParam(value="file",required=false) MultipartFile file,
			HttpServletRequest request,String id)throws Exception{
		//基本表单
		
		//获得物理路径webapp所在路径
		String pathRoot = request.getSession().getServletContext().getRealPath("");
		String path="";
		if(!file.isEmpty()){
			//生成uuid作为文件名称
			String uuid = UUID.randomUUID().toString().replaceAll("-","");
			//获得文件类型（可以判断如果不是图片，禁止上传）
			String contentType=file.getContentType();
			//获得文件后缀名称
			String imageName=contentType.substring(contentType.indexOf("/")+1);
			path="/img/fload/"+uuid+"."+imageName;
			file.transferTo(new File(pathRoot+path));
		}
		String[] bs={id};
		List<Book> listid = use.findByIds(bs);
		Book bb=listid.get(0);
		request.setAttribute("bb", bb);
		System.out.println(path);
		int biao=123;
		request.setAttribute("biao", biao);
		request.setAttribute("imagesPath", path);
		return "admin/Book/upBook";
	}
	 @RequestMapping("/update")
	    public void update(HttpServletRequest request,HttpServletResponse response,Book b)throws IOException{ 
		 	PrintWriter out = response.getWriter();
		 	b.setTime(GetTime.getStrDate("yyyy-MM-dd-HH-mm-ss"));
		 	boolean ba=use.update(b);
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
	 @RequestMapping(value="/shangchuan",method=RequestMethod.POST)
		private String shangchuan(@RequestParam(value="file",required=false) MultipartFile file,
				HttpServletRequest request)throws Exception{
			//基本表单
			
			//获得物理路径webapp所在路径
			String pathRoot = request.getSession().getServletContext().getRealPath("");
			String path="";
			if(!file.isEmpty()){
				//生成uuid作为文件名称
				String uuid = UUID.randomUUID().toString().replaceAll("-","");
				//获得文件类型（可以判断如果不是图片，禁止上传）
				String contentType=file.getContentType();
				//获得文件后缀名称
				String imageName=contentType.substring(contentType.indexOf("/")+1);
				path="/img/fload/"+uuid+"."+imageName;
				file.transferTo(new File(pathRoot+path));
			}
			System.out.println(path);
			request.setAttribute("imagesPath", path);
			return "admin/Book/addBook";
		}
}
