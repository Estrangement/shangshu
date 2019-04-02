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
import com.cn.entity.User;
import com.cn.service.ArticleService;
import com.cn.utils.GetTime;
import com.cn.utils.PageUtils;
import com.cn.utils.UUIDUtil;
@Controller
@RequestMapping("/article")
public class ArticleController {
	
	@Resource
	ArticleService use;
	@RequestMapping("/selindex")
    public String selindex(HttpServletRequest request){ 
		Article a=new Article();
		a.setType("阅读指导");
		List<Article> yue=use.findAll(a);
		
		Article b=new Article();
		b.setType("教育资讯");
		List<Article> jiao=use.findAll(b);
		
		Article c=new Article();
		c.setType("精选好文");
		List<Article> jing=use.findAll(c);
		
		Book d=new Book();
		d.setType("a");
		List<Book> xiaa=use.findAll(d);
		
		Book e=new Book();
		e.setType("b");
		List<Book> xiab=use.findAll(e);
		
		request.setAttribute("yue", yue);
		request.setAttribute("jiao", jiao);
		request.setAttribute("jing", jing);
		request.setAttribute("xiaa", xiaa);
		request.setAttribute("xiab", xiab);
        return "front/index";
    }
	
	@RequestMapping("/xiangqing")
    public String xiangqing(HttpServletRequest request,String aid){ 
		
		String[] bs={aid};
		List<Article> listid = use.findByIds(bs);
		Article bb=listid.get(0);
		List<Article> tuijian=use.suijia();
		Article ace=new Article();
		ace.setVolume(bb.getVolume()+1);
		ace.setAid(aid);
		use.upvolume(ace);
		request.setAttribute("bb", bb);
		request.setAttribute("tuijian", tuijian);
		
        return "front/readinginfo";
    }
	@RequestMapping("/selread")
    public String selread(HttpServletRequest request,Article a){ 
		a.setType("read");
		List<Article> read=use.findAll(a);
		List<Article> tuijian=use.suijia();
		request.setAttribute("tuijian", tuijian);
		request.setAttribute("read", read);
        return "front/read";
    }
	@RequestMapping("/gengduo")
    public String gengduo(HttpServletRequest request,Article a){ 
		a.setType("read");
		List<Article> read=use.findAll(a);
		List<Article> tuijian=use.suijia();
		Article ab=new Article();
		ab.setType("more");
		List<Article> gengduo=use.findAll(ab);
		request.setAttribute("tuijian", tuijian);
		request.setAttribute("read", read);
		request.setAttribute("gengduo", gengduo);
        return "front/read";
    }
	@RequestMapping("/upstate")
    public void upstate(HttpServletRequest request,HttpServletResponse response,String aid,Article ct) throws IOException{ 
		    PrintWriter out = response.getWriter();
		    User u=(User)request.getSession().getAttribute("admin");
			String json = "";
			ct.setState(1);
			ct.setAid(aid);
			ct.setSname(u.getUname());
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
    public void upstates(HttpServletRequest request,HttpServletResponse response,String aid,Article ct) throws IOException{ 
		    PrintWriter out = response.getWriter();
			String json = "";
			ct.setState(0);
			ct.setAid(aid);
			ct.setSname("");
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
	@RequestMapping("/findAllByPage")
	public String findAllByPage(HttpServletRequest request,Map<String,Object> map,PageUtils p,Article aa){
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
		List<Article> list=use.findAllByPage(map);
		request.setAttribute("list",list);
		request.setAttribute("p",p);
		request.setAttribute("b", aa);
        return "admin/Article/selArticle";
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
    public void add(HttpServletRequest request,HttpServletResponse response,Article b)throws IOException{ 
		PrintWriter out = response.getWriter();
	    b.setAid(UUIDUtil.getUUID());
	    b.setTime(GetTime.getStrDate("yyyy-MM-dd-HH-mm-ss"));
	    b.setType("read");
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
		List<Article> listid = use.findByIds(bs);
		Article bb=listid.get(0);
		System.out.println(bb.getPhoto()+"------");
		request.setAttribute("bb", bb);
		int biao=0;
		request.setAttribute("biao", biao);
        return "admin/Article/upArticle";
    }
	@RequestMapping(value="/upload",method=RequestMethod.POST)
	private String fildUpload(@RequestParam(value="file",required=false) MultipartFile file,
			HttpServletRequest request,String id)throws Exception{
		System.out.println(id+"--------------");
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
		List<Article> listid = use.findByIds(bs);
		Article bb=listid.get(0);
		request.setAttribute("bb", bb);
		System.out.println(path);
		int biao=123;
		request.setAttribute("biao", biao);
		request.setAttribute("imagesPath", path);
		return "admin/Article/upArticle";
	}
	 @RequestMapping("/update")
	    public void update(HttpServletRequest request,HttpServletResponse response,Article b)throws IOException{ 
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

}
