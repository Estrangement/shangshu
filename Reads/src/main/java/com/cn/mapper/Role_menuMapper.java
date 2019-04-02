package com.cn.mapper;

import java.util.List;

import com.cn.entity.Role_menu;

public interface Role_menuMapper extends BaseMapper<Role_menu>{
	List<Role_menu> zuolian(String rid);
}
