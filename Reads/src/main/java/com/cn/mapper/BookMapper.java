package com.cn.mapper;

import java.util.List;

import com.cn.entity.Book;

public interface BookMapper extends BaseMapper<Book>{
	List<Book> suijia();
	int batchupdate(String[] sid);
	boolean upstate(Book c);
}
