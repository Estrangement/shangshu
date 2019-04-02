package com.cn.service;

import java.util.List;
import java.util.Map;

import com.cn.entity.Role_menu;




public interface Role_menuService {
		//增加单个
		boolean add(Role_menu t);
		//删除单个
		boolean delete(String id);
		//修改
		boolean update(Role_menu t);
		//根据对象属性查询，也可查询全部，也可返回对象(list.get(0) 用作校验  )
		List<Role_menu> findAll(Role_menu t);
		//分页查询
		List<Role_menu> findAllByPage(Map<String,Object> map);
		//统计数量，若findAllByPage中是根据某个条件查询的，这里条件需要与其保持一致
		int findAllCount(Map<String,Object> map);
		//根据多个id查询
		List<Role_menu> findByIds(String[] ids);
		Map<String,Object> addname();
		int batchdelete(String[] sid);
}
