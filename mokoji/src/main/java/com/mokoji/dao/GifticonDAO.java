package com.mokoji.dao;

import java.util.HashMap;
import java.util.List;

import com.mokoji.domain.GiftCategoryVO;
import com.mokoji.domain.GifticonVO;

public interface GifticonDAO {
	
	//기프티콘샵 이동시
	public List<GifticonVO> AllgifticonList(GifticonVO vo);
	
	//카테고리 선택 비동기
	public List<GifticonVO> selectGifticon(String shophigh_name);
	
	//기프티콘 토탈화면
	public List<GifticonVO> allGiftList(GifticonVO vo);
	
	//기프트토탈페이지 중카테고리 추출
	public List<GiftCategoryVO> getMiddleList(String shophigh_name);
	
	//기프트토탈페이지 검색기능
	public List<HashMap<String, Object>> searchGift(HashMap<String, Object> map);
	
	//기프트 디테일페이지 이동
	public List<GifticonVO> goGiftshopDetails(GifticonVO vo);
	
	//기프티콘 구입
	public void insertBuyGift(HashMap<String, Object> map);
	
	public void updateMemGift(HashMap<String, Object> map);
	
	public int getMemPoint(int code);
}
