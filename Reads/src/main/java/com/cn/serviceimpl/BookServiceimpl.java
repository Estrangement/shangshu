package com.cn.serviceimpl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.cn.entity.Article;
import com.cn.entity.Book;
import com.cn.mapper.ArticleMapper;
import com.cn.mapper.BookMapper;
import com.cn.service.BookService;
@Service
public class BookServiceimpl implements BookService{
	@Resource
	BookMapper bmp;
	@Resource
	ArticleMapper amp;
	@Override
	public boolean add(Book t) {
		// TODO Auto-generated method stub
		boolean a=bmp.add(t);
		if(a) {
			return true;
		}else {
			return false;
		}
		
	}

	@Override
	public boolean delete(String id) {
		boolean a=bmp.delete(id);
		if(a) {
			return true;
		}else {
			return false;
		}
	}

	@Override
	public boolean update(Book t) {
		boolean a=bmp.update(t);
		if(a) {
			return true;
		}else {
			return false;
		}
	}

	@Override
	public List<Book> findAll(Book t) {
		// TODO Auto-generated method stub
		return bmp.findAll(t);
	}

	@Override
	public List<Book> findAllByPage(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return bmp.findAllByPage(map);
	}

	@Override
	public int findAllCount(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return bmp.findAllCount(map);
	}

	@Override
	public List<Book> findByIds(String[] ids) {
		// TODO Auto-generated method stub
		return bmp.findByIds(ids);
	}

	@Override
	public List<Book> suijia() {
		// TODO Auto-generated method stub
		return bmp.suijia();
	}

	@Override
	public int batchdelete(String[] sid) {
		// TODO Auto-generated method stub
		return bmp.batchdelete(sid);
	}

	@Override
	public int batchupdate(String[] sid) {
		// TODO Auto-generated method stub
		return bmp.batchupdate(sid);
	}

	@Override
	public boolean upstate(Book c) {
		// TODO Auto-generated method stub
		return bmp.upstate(c);
	}

}
