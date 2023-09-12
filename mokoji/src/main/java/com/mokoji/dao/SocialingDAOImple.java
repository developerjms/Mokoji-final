package com.mokoji.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mokoji.domain.CategoryVO;
import com.mokoji.domain.SocialingInfoVO;
import com.mokoji.domain.SocialingVO;

@Repository("SocialingDAO")
public class SocialingDAOImple implements SocialingDAO {
	@Autowired
	private SqlSessionTemplate mybatis;

	// 소셜링 등록
	@Override
	public int selectSocialcode(SocialingVO vo) {
		return mybatis.selectOne("SocialingDAO.selectSocialcode", vo);
	}

	@Override
	public int insertSocialing(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return mybatis.insert("SocialingDAO.insertSocialing", map);
	}

	@Override
	public int insertSocialinfo(HashMap<String, Object> map) {
		return mybatis.insert("SocialingDAO.insertSocialinfo", map);
	}

	// 소셜링 상위카테고리
	@Override
	public List<SocialingVO> getHighSocialListInterest(String cthigh_name) {
		List<SocialingVO> list = mybatis.selectList("SocialingDAO.getHighSocialListInterest", cthigh_name);
		return list;
	}

	// 소셜링 하위카테고리
	@Override
	public List<SocialingVO> getSocialListInterest(String ctmid_name) {
		List<SocialingVO> list = mybatis.selectList("SocialingDAO.getSocialListInterest", ctmid_name);
		return list;

	}

	// 소셜링 전체
	@Override
	public List<SocialingVO> getSocialList(SocialingVO VO) {
		List<SocialingVO> list = mybatis.selectList("SocialingDAO.getSocialList");
		return list;
	}

	@Override
	public List<SocialingVO> getOneSocialList(SocialingVO vo) {
		List<SocialingVO> list = mybatis.selectList("SocialingDAO.getOneSocialList", vo);
		return list;
	}

	@Override
	public int checkMemSocial(HashMap<String, Object> map) {
		Integer cnt = mybatis.selectOne("SocialingDAO.checkMemSocial", map);
		if (cnt == null) {
			cnt = 0;
		}
		return cnt;
	}

	@Override
	public int getmemctcode(HashMap<String, Object> map) {
		Integer cnt = mybatis.selectOne("SocialingDAO.getmemctcode", map);
		if (cnt == null) {
			cnt = 0;
		}
		return cnt;
	}

	@Override
	public List<HashMap<String, Object>> getAllMemSocial(SocialingVO vo) {
		List<HashMap<String, Object>> list = mybatis.selectList("SocialingDAO.getAllMemSocial", vo);
		return list;
	}

	@Override
	public void joinsocial(HashMap<String, Object> map) {
		mybatis.insert("SocialingDAO.joinsocial", map);
	}

	// 소셜링 입금내역 확인목록 추출
	@Override
	public List<HashMap<String, Object>> getsocialpay(HashMap<String, Object> map) {
		List<HashMap<String, Object>> list = mybatis.selectList("SocialingDAO.getsocialpay", map);
		return list;
	}

	// 소셜링 입금확인
	@Override
	public void upsocialpay(SocialingInfoVO vo) {
		mybatis.update("SocialingDAO.upsocialpay", vo);
	}

	@Override
	public void upsocialing(SocialingInfoVO vo) {
		// TODO Auto-generated method stub
		mybatis.update("SocialingDAO.upsocialing", vo);
	}

	
	@Override
	public void delsocialing(SocialingInfoVO vo) {
		// TODO Auto-generated method stub
		mybatis.delete("SocialingDAO.delsocialing", vo);
	}

	//지역으로 소셜링 검색
	@Override
	public List<HashMap<String, Object>> searchSocialByLoc(SocialingVO svo) {
		// TODO Auto-generated method stub
		List<HashMap<String, Object>> list = mybatis.selectList("SocialingDAO.searchSocialByLoc", svo);
		return list;
	}

	//카테고리로 소셜링 검색
	@Override
	public List<HashMap<String, Object>> searchSocialByCate(CategoryVO ctvo) {
		// TODO Auto-generated method stub
		List<HashMap<String, Object>> list = mybatis.selectList("SocialingDAO.searchSocialByCate", ctvo);
		return list;
	}

}
