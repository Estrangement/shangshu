package com.cn.mapper;


import java.util.List;

import com.cn.entity.Article;

public interface ArticleMapper extends BaseMapper<Article>{
	List<Article> suijia();
	int batchupdate(String[] sid);
	boolean upstate(Article c);
	boolean upvolume(Article c);

}
