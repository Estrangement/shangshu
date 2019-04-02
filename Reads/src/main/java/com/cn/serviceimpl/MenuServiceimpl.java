package com.cn.serviceimpl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.cn.entity.Menu;
import com.cn.mapper.MenuMapper;
import com.cn.service.MenuService;
@Service
public class MenuServiceimpl implements MenuService{
	@Resource
	private MenuMapper mnm;
	@Override
	public boolean add(Menu t) {
		// TODO Auto-generated method stub
		return mnm.add(t);
	}

	@Override
	public boolean delete(String id) {
		// TODO Auto-generated method stub
		return mnm.delete(id);
	}

	@Override
	public boolean update(Menu t) {
		// TODO Auto-generated method stub
		return mnm.update(t);
	}

	@Override
	public List<Menu> findAll(Menu t) {
		// TODO Auto-generated method stub
		return mnm.findAll(t);
	}

	@Override
	public List<Menu> findAllByPage(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return mnm.findAllByPage(map);
	}

	@Override
	public int findAllCount(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return mnm.findAllCount(map);
	}

	@Override
	public List<Menu> findByIds(String[] ids) {
		// TODO Auto-generated method stub
		return mnm.findByIds(ids);
	}

	@Override
	public int batchdelete(String[] sid) {
		// TODO Auto-generated method stub
		return mnm.batchdelete(sid);
	}

}
