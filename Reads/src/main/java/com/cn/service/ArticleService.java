package com.cn.service;

import java.util.List;
import java.util.Map;

import com.cn.entity.Article;
import com.cn.entity.Book;


public interface ArticleService {
	boolean add(Article t);
	boolean delete(String id);
	boolean update(Article t);
	List<Article> findAll(Article t);
	List<Article> findAllByPage(Map<String,Object> map);
	int findAllCount(Map<String,Object> map);
	List<Article> findByIds(String[] ids);
	List<Article> suijia();
	int batchdelete(String[] sid);
	boolean upstate(Article c);
	int batchupdate(String[] sid);
	List<Book> findAll(Book t);
	boolean upvolume(Article c);
}
