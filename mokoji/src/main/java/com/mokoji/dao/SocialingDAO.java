package com.mokoji.dao;

import java.util.HashMap;
import java.util.List;

import com.mokoji.domain.CategoryVO;
import com.mokoji.domain.SocialingInfoVO;
import com.mokoji.domain.SocialingVO;

public interface SocialingDAO {
	// 소셜링 등록
	public int selectSocialcode(SocialingVO vo);

	public int insertSocialing(HashMap<String, Object> map);

	public int insertSocialinfo(HashMap<String, Object> map);

	public List<SocialingVO> getHighSocialListInterest(String cthigh_name);

	public List<SocialingVO> getSocialListInterest(String ctmid_name);

	public List<SocialingVO> getSocialList(SocialingVO vo);

	public List<SocialingVO> getOneSocialList(SocialingVO vo);

	public int checkMemSocial(HashMap<String, Object> map);

	public int getmemctcode(HashMap<String, Object> map);

	public List<HashMap<String, Object>> getAllMemSocial(SocialingVO vo);

	public void joinsocial(HashMap<String, Object> map);

	// 소셜링 입금내역 확인목록추출
	public List<HashMap<String, Object>> getsocialpay(HashMap<String, Object> map);

	// 소셜링 입금확인
	public void upsocialpay(SocialingInfoVO vo);

	// 승인 확인
	public void upsocialing(SocialingInfoVO vo);

	// 승인 거절
	public void delsocialing(SocialingInfoVO vo);
	
	//지역으로 소셜링 검색
	public List<HashMap<String, Object>> searchSocialByLoc(SocialingVO svo);
	
	//카테고리로 소셜링 검색
	public List<HashMap<String, Object>> searchSocialByCate(CategoryVO ctvo);
}