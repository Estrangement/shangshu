package com.cn.serviceimpl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.cn.entity.Menu;
import com.cn.entity.Role;
import com.cn.entity.Role_menu;
import com.cn.entity.User;
import com.cn.mapper.MenuMapper;
import com.cn.mapper.RoleMapper;
import com.cn.mapper.Role_menuMapper;
import com.cn.service.Role_menuService;
@Service
public class Role_menuServiceimpl implements Role_menuService{
	@Resource
	Role_menuMapper rmp;
	@Resource
	private RoleMapper rem;
	@Resource
	private MenuMapper ump;
	@Override
	public boolean add(Role_menu t) {
		// TODO Auto-generated method stub
		return rmp.add(t);
	}

	@Override
	public boolean delete(String id) {
		// TODO Auto-generated method stub
		return rmp.delete(id);
	}

	@Override
	public boolean update(Role_menu t) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public List<Role_menu> findAll(Role_menu t) {
		// TODO Auto-generated method stub
		return rmp.findAll(t);
	}

	@Override
	public List<Role_menu> findAllByPage(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return rmp.findAllByPage(map);
	}

	@Override
	public int findAllCount(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return rmp.findAllCount(map);
	}

	@Override
	public List<Role_menu> findByIds(String[] ids) {
		// TODO Auto-generated method stub
		return rmp.findByIds(ids);
	}

	@Override
	public Map<String, Object> addname() {
		Map<String, Object> map = new HashMap<String, Object>();
		List<Menu> lia=ump.findAll(null);
		List<Role> libc=rem.findAll(null);
		map.put("lia", lia);
		map.put("libc", libc);
		return map;
	}

	@Override
	public int batchdelete(String[] sid) {
		// TODO Auto-generated method stub
		return rmp.batchdelete(sid);
	}

}
