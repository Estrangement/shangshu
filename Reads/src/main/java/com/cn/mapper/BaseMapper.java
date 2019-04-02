package com.cn.mapper;

import java.util.List;
import java.util.Map;



public interface BaseMapper<T> {
	//增加单个
	boolean add(T t);
	//删除单个
	boolean delete(String id);
	//修改
	boolean update(T t);
	//根据对象属�?�查询，也可查询全部，也可返回对�?(list.get(0) 用作校验  )
	List<T> findAll(T t);
	//分页查询
	List<T> findAllByPage(Map<String,Object> map);
	//统计数量，若findAllByPage中是根据某个条件查询的，这里条件�?要与其保持一�?
	int findAllCount(Map<String,Object> map);
	//根据多个id查询
	List<T> findByIds(String[] ids);
	//批量添加
	int batchadd(List<T> t);
	//批量删除
	int batchdelete(String[] sid);
	
}
