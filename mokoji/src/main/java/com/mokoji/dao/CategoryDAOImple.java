package com.mokoji.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mokoji.domain.CategoryVO;

@Repository("CategoryDAO")
public class CategoryDAOImple implements CategoryDAO {

	@Autowired
	private SqlSessionTemplate mybatis;

	@Override
	public List<CategoryVO> getCateHighList(CategoryVO vo) {
		// TODO Auto-generated method stub
		List<CategoryVO> list = mybatis.selectList("CategoryDAO.getCateHighList", vo);
		return list;
	}

	@Override
	public List<CategoryVO> getCateMidList(String cthigh_name) {
		// TODO Auto-generated method stub
		List<CategoryVO> list = mybatis.selectList("CategoryDAO.getCateMidList", cthigh_name);
		return list;
	}

	//상위 카테고리
	@Override
	public List<CategoryVO> getCateList(CategoryVO vo) {
		// TODO Auto-generated method stub
		List<CategoryVO> list2 = mybatis.selectList("CategoryDAO.getCateList", vo);
		return list2;

	}
	//하위 카테고리
	@Override
	public List<CategoryVO> getCateList2(CategoryVO vo) {
		// TODO Auto-generated method stub
		List<CategoryVO> list = mybatis.selectList("CategoryDAO.getCateList2", vo);
		return list;

	}
}