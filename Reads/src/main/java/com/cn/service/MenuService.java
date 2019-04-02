package com.cn.service;

import java.util.List;
import java.util.Map;

import com.cn.entity.Menu;

public interface MenuService {
		boolean add(Menu t);
		boolean delete(String id);
		boolean update(Menu t);
		List<Menu> findAll(Menu t);
		List<Menu> findAllByPage(Map<String,Object> map);
		int findAllCount(Map<String,Object> map);
		List<Menu> findByIds(String[] ids);
		int batchdelete(String[] sid);
}
