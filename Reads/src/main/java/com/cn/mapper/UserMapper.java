package com.cn.mapper;

import java.util.List;
import java.util.Map;

import com.cn.entity.User;
import com.cn.vo.UserRoleMenuVo;

public interface UserMapper extends BaseMapper<User>{
	List<UserRoleMenuVo> findUsersRoleMenuMap(Map<String, Object> map)throws Exception;
	
}
