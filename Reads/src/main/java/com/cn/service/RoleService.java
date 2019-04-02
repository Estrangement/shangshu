package com.cn.service;

import java.util.List;
import java.util.Map;

import com.cn.entity.Role;
import com.cn.entity.Role_menu;



public interface RoleService {
	//增加单个
	boolean add(Role t);
	//删除单个
	boolean delete(String id);
	//修改
	boolean update(Role t);
	//根据对象属性查询，也可查询全部，也可返回对象(list.get(0) 用作校验  )
	List<Role> findAll(Role t);
	//分页查询
	List<Role> findAllByPage(Map<String,Object> map);
	//统计数量，若findAllByPage中是根据某个条件查询的，这里条件需要与其保持一致
	int findAllCount(Map<String,Object> map);
	//根据多个id查询
	List<Role> findByIds(String[] ids);
	int batchdelete(String[] sid);
	Map<String,Object> addname();
	boolean addr(Role_menu t);
	List<Role_menu> zuolian(String rid);
	boolean deleterid(String id);
}
