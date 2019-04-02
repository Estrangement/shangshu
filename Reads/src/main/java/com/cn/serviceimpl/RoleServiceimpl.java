package com.cn.serviceimpl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.cn.entity.Menu;
import com.cn.entity.Role;
import com.cn.entity.Role_menu;
import com.cn.mapper.MenuMapper;
import com.cn.mapper.RoleMapper;
import com.cn.mapper.Role_menuMapper;
import com.cn.service.RoleService;
@Service
public class RoleServiceimpl implements RoleService{
	@Resource
	private RoleMapper rem;
	@Resource
	Role_menuMapper rmp;
	@Resource
	private MenuMapper ump;
	@Override
	public boolean add(Role t) {
		// TODO Auto-generated method stub
		return rem.add(t);
	}

	@Override
	public boolean delete(String id) {
		// TODO Auto-generated method stub
		return rem.delete(id);
	}

	@Override
	public boolean update(Role t) {
		// TODO Auto-generated method stub
		return rem.update(t);
	}

	@Override
	public List<Role> findAll(Role t) {
		// TODO Auto-generated method stub
		return rem.findAll(t);
	}

	@Override
	public List<Role> findAllByPage(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return rem.findAllByPage(map);
	}

	@Override
	public int findAllCount(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return rem.findAllCount(map);
	}

	@Override
	public List<Role> findByIds(String[] ids) {
		// TODO Auto-generated method stub
		return rem.findByIds(ids);
	}

	@Override
	public int batchdelete(String[] sid) {
		// TODO Auto-generated method stub
		return rem.batchdelete(sid);
	}

	@Override
	public Map<String, Object> addname() {
		Map<String, Object> map = new HashMap<String, Object>();
		Menu me=new Menu();
		Menu nu=new Menu();
		me.setType("menu");
		nu.setType("button");
		List<Menu> menu=ump.findAll(me);
		List<Menu> button=ump.findAll(nu);
		map.put("menu", menu);
		map.put("button", button);
		return map;
	}

	@Override
	public boolean addr(Role_menu t) {
		// TODO Auto-generated method stub
		return rmp.add(t);
	}

	@Override
	public List<Role_menu> zuolian(String rid) {
		// TODO Auto-generated method stub
		return rmp.zuolian(rid);
	}

	@Override
	public boolean deleterid(String id) {
		// TODO Auto-generated method stub
		return rmp.delete(id);
	}


}
