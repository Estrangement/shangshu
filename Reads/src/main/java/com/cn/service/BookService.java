package com.cn.service;

import java.util.List;
import java.util.Map;

import com.cn.entity.Article;
import com.cn.entity.Book;


public interface BookService {
	boolean add(Book t);
	boolean delete(String id);
	boolean update(Book t);
	List<Book> findAll(Book t);
	List<Book> findAllByPage(Map<String,Object> map);
	int findAllCount(Map<String,Object> map);
	List<Book> findByIds(String[] ids);
	List<Book> suijia();
	int batchdelete(String[] sid);
	int batchupdate(String[] sid);
	boolean upstate(Book c);
}
