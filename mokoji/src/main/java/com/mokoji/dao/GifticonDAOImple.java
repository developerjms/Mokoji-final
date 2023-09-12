package com.mokoji.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mokoji.domain.GiftCategoryVO;
import com.mokoji.domain.GifticonVO;

@Repository("GifticonDAO")
public class GifticonDAOImple implements GifticonDAO {
	
	@Autowired
	private SqlSessionTemplate mybatis;
	
	@Override
	public List<GifticonVO> AllgifticonList(GifticonVO vo){
		List<GifticonVO> list = mybatis.selectList("GifticonDAO.AllgifticonList", vo);
		return list;
	}
	
	@Override
	public List<GifticonVO> selectGifticon(String shophigh_name){
		List<GifticonVO> list = mybatis.selectList("GifticonDAO.selectGifticon", shophigh_name);
		return list;
	}
	
	@Override
	public List<GifticonVO> allGiftList(GifticonVO vo){
		List<GifticonVO> list = mybatis.selectList("GifticonDAO.allGiftList", vo);
		return list;
	}

	@Override
	public List<GiftCategoryVO> getMiddleList(String shophigh_name){
		List<GiftCategoryVO> list = mybatis.selectList("GifticonDAO.getMiddleList", shophigh_name);
		return list;
	}
	
	@Override
	public List<HashMap<String, Object>> searchGift(HashMap<String, Object> map){
		return mybatis.selectList("GifticonDAO.searchGift", map);
	}
	
	@Override
	public List<GifticonVO> goGiftshopDetails(GifticonVO vo) {
		 List<GifticonVO> list = mybatis.selectList("GifticonDAO.goGiftshopDetails", vo);
		 return list;
	}
	
	@Override
	public void insertBuyGift(HashMap<String, Object> map){
	mybatis.insert("GifticonDAO.insertBuyGift", map);
	}
	
	@Override
	public void updateMemGift(HashMap<String, Object> map) {
		mybatis.update("GifticonDAO.updateMemGift", map);
	}
	
	@Override
	public int getMemPoint(int code) {
		return mybatis.selectOne("GifticonDAO.getMemPoint", code);
	}
	
	
}
