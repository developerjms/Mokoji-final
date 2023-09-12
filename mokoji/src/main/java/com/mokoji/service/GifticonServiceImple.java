package com.mokoji.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mokoji.dao.GifticonDAOImple;
import com.mokoji.domain.GiftCategoryVO;
import com.mokoji.domain.GifticonVO;

@Service("gifticonService")
public class GifticonServiceImple implements GifticonService {

	@Autowired
	private GifticonDAOImple gifticonDAO;
	
	//기프티콘샵 이동시
	@Override
	public List<GifticonVO> AllgifticonList(GifticonVO vo) {
		// TODO Auto-generated method stub
		return gifticonDAO.AllgifticonList(vo);
	}
	
	//카테고리 선택 비동기
	@Override
	public List<GifticonVO> selectGifticon(String shophigh_name){
		return gifticonDAO.selectGifticon(shophigh_name);
	}

	//기프티콘 토탈화면
	@Override
	public List<GifticonVO> allGiftList(GifticonVO vo){
		return gifticonDAO.allGiftList(vo);
	}
	
	
	//기프트토탈페이지 중카테고리 추출
	@Override
	public List<GiftCategoryVO> getMiddleList(String shophigh_name){
		return gifticonDAO.getMiddleList(shophigh_name);
	}
	
	//기프트토탈페이지 검색기능
	@Override
	public List<HashMap<String, Object>> searchGift(HashMap<String, Object> map){
		return gifticonDAO.searchGift(map);
	}
	
	//기프트 디테일페이지 이동
	@Override
	public List<GifticonVO> goGiftshopDetails(GifticonVO vo) {
		return gifticonDAO.goGiftshopDetails(vo);
	}
	
	//기프티콘 구입
	@Override
	public void insertBuyGift(HashMap<String, Object> map){
		gifticonDAO.insertBuyGift(map);
	}
	
	@Override
	public void updateMemGift(HashMap<String, Object> map) {
		gifticonDAO.updateMemGift(map);
	}
	
	@Override
	public int getMemPoint(int code) {
		return gifticonDAO.getMemPoint(code);
	}


}
