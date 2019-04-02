package com.cn.serviceimpl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.cn.entity.Relation;
import com.cn.entity.Role;
import com.cn.entity.User;
import com.cn.mapper.RelationMapper;
import com.cn.mapper.RoleMapper;
import com.cn.mapper.UserMapper;
import com.cn.service.RelationService;
@Service
public class RelationServiceimpl implements RelationService{
	@Resource
	private RelationMapper ram;
	@Resource
	private RoleMapper rem;
	@Resource
	private UserMapper ump;
	@Override
	public boolean add(Relation t) {
		// TODO Auto-generated method stub
		return ram.add(t);
	}

	@Override
	public boolean delete(String id) {
		// TODO Auto-generated method stub
		return ram.delete(id);
	}

	@Override
	public boolean update(Relation t) {
		// TODO Auto-generated method stub
		return ram.update(t);
	}

	@Override
	public List<Relation> findAll(Relation t) {
		// TODO Auto-generated method stub
		return ram.findAll(t);
	}

	@Override
	public List<Relation> findAllByPage(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return ram.findAllByPage(map);
	}

	@Override
	public int findAllCount(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return ram.findAllCount(map);
	}

	@Override
	public List<Relation> findByIds(String[] ids) {
		// TODO Auto-generated method stub
		return ram.findByIds(ids);
	}

	@Override
	public Map<String, Object> addname() {
		Map<String, Object> map = new HashMap<String, Object>();
		List<Role> libc=rem.findAll(null);
		
		map.put("libc", libc);
		// TODO Auto-generated method stub
		return map;
	}

	@Override
	public int batchdelete(String[] sid) {
		// TODO Auto-generated method stub
		return ram.batchdelete(sid);
	}

	

}
