package com.cn.mapper;

import java.util.List;

import com.cn.entity.Relation;

public interface RelationMapper extends BaseMapper<Relation>{
	List<Relation> zuolian(String uid);
	boolean deletea(String uid);
	int batchdeletea(String[] uid);
}	
