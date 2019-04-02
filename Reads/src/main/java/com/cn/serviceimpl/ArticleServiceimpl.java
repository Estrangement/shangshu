package com.cn.serviceimpl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.cn.entity.Article;
import com.cn.entity.Book;
import com.cn.mapper.ArticleMapper;
import com.cn.mapper.BookMapper;
import com.cn.service.ArticleService;
@Service
public class ArticleServiceimpl implements ArticleService{
	@Resource
	ArticleMapper amp;
	@Resource
	BookMapper bmp;
	@Override
	public boolean add(Article t) {
		// TODO Auto-generated method stub
		return amp.add(t);
	}

	@Override
	public boolean delete(String id) {
		// TODO Auto-generated method stub
		return amp.delete(id);
	}

	@Override
	public boolean update(Article t) {
		// TODO Auto-generated method stub
		return amp.update(t);
	}

	@Override
	public List<Article> findAll(Article t) {
		// TODO Auto-generated method stub
		return amp.findAll(t);
	}

	@Override
	public List<Article> findAllByPage(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return amp.findAllByPage(map);
	}

	@Override
	public int findAllCount(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return amp.findAllCount(map);
	}

	@Override
	public List<Article> findByIds(String[] ids) {
		// TODO Auto-generated method stub
		return amp.findByIds(ids);
	}

	@Override
	public List<Article> suijia() {
		// TODO Auto-generated method stub
		return amp.suijia();
	}

	@Override
	public int batchdelete(String[] sid) {
		// TODO Auto-generated method stub
		return amp.batchdelete(sid);
	}

	@Override
	public int batchupdate(String[] sid) {
		// TODO Auto-generated method stub
		return amp.batchupdate(sid);
	}

	@Override
	public boolean upstate(Article c) {
		// TODO Auto-generated method stub
		return amp.upstate(c);
	}

	@Override
	public List<Book> findAll(Book t) {
		// TODO Auto-generated method stub
		return bmp.findAll(t);
	}

	@Override
	public boolean upvolume(Article c) {
		// TODO Auto-generated method stub
		return amp.upvolume(c);
	}

}
