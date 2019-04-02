package com.cn.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cn.entity.Relation;
import com.cn.entity.Role;
import com.cn.entity.User;
import com.cn.vo.UserRoleMenuVo;



public interface UserService {
	//增加单个
	boolean add(User t);
	//删除单个
	boolean delete(String id);
	//修改
	boolean update(User t);
	//根据对象属性查询，也可查询全部，也可返回对象(list.get(0) 用作校验  )
	List<User> findAll(User t);
	//分页查询
	List<User> findAllByPage(Map<String,Object> map);
	//统计数量，若findAllByPage中是根据某个条件查询的，这里条件需要与其保持一致
	int findAllCount(Map<String,Object> map);
	//根据多个id查询
	List<Relation> findByIds(String[] ids);
	List<UserRoleMenuVo> findUsersRoleMenuMap(Map<String, Object> map)throws Exception;
	User login(String username,String pwd);
	int batchdelete(String[] sid);
	List<Role> addname();
	boolean add(Relation t);
	boolean update(Relation t);
	List<Relation> findAll(Relation t);
	List<Relation> zuolian(String uid);
	boolean deleteur(String id);
	boolean deletea(String uid);
	int batchdeletea(String[] uid);
	String ajaxUploadExcel(HttpServletRequest request,HttpServletResponse response) throws Exception;
}	
