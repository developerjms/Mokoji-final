package com.mokoji.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mokoji.dao.SocialingDAOImple;
import com.mokoji.domain.CategoryVO;
import com.mokoji.domain.SocialingInfoVO;
import com.mokoji.domain.SocialingVO;

@Service("socialingService")
public class SocialingServiceImple implements SocialingService {

	@Autowired
	private SocialingDAOImple socialingDAO;

	@Override
	public int selectSocialcode(SocialingVO vo) {
		return socialingDAO.selectSocialcode(vo);
	}

	@Override
	public int insertSocialing(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return socialingDAO.insertSocialing(map);
	}

	@Override
	public int insertSocialinfo(HashMap<String, Object> map) {
		return socialingDAO.insertSocialinfo(map);
	}

	// 하위 카테고리로 소렬링 리스트 가져오기
	@Override
	public List<SocialingVO> getHighSocialListInterest(String cthigh_name) {
		return socialingDAO.getHighSocialListInterest(cthigh_name);
	}

	// 상위 카테고리로 동호회 리스트 가져오기
	@Override
	public List<SocialingVO> getSocialListInterest(String ctmid_name) {
		return socialingDAO.getSocialListInterest(ctmid_name);

	}

	@Override
	public List<SocialingVO> getSocialList(SocialingVO vo) {
		return socialingDAO.getSocialList(vo);
	}

	@Override
	public List<SocialingVO> getOneSocialList(SocialingVO vo) {
		return socialingDAO.getOneSocialList(vo);
	}

	@Override
	public int checkMemSocial(HashMap<String, Object> map) {
		return socialingDAO.checkMemSocial(map);
	}

	@Override
	public int getmemctcode(HashMap<String, Object> map) {
		return socialingDAO.getmemctcode(map);
	}

	@Override
	public List<HashMap<String, Object>> getAllMemSocial(SocialingVO vo) {
		return socialingDAO.getAllMemSocial(vo);
	}

	@Override
	public void joinsocial(HashMap<String, Object> map) {
		socialingDAO.joinsocial(map);
	}

	// 소셜링 입금내역 확인목록추출
	public List<HashMap<String, Object>> getsocialpay(HashMap<String, Object> map) {
		return socialingDAO.getsocialpay(map);
	}

	// 소셜링 입금확인
	public void upsocialpay(SocialingInfoVO vo) {
		socialingDAO.upsocialpay(vo);
	}

	// 승인확인
	@Override
	public void upsocialing(SocialingInfoVO vo) {
		// TODO Auto-generated method stub
		socialingDAO.upsocialing(vo);
	}

	// 승인 거절
	@Override
	public void delsocialing(SocialingInfoVO vo) {
		// TODO Auto-generated method stub
		socialingDAO.delsocialing(vo);
	}

	//지역으로 소셜링 검색
	@Override
	public List<HashMap<String, Object>> searchSocialByLoc(SocialingVO svo) {
		// TODO Auto-generated method stub
		return socialingDAO.searchSocialByLoc(svo);
	}

	//카테고리로 소셜링 검색
	@Override
	public List<HashMap<String, Object>> searchSocialByCate(CategoryVO ctvo) {
		// TODO Auto-generated method stub
		return socialingDAO.searchSocialByCate(ctvo);
	}

}
