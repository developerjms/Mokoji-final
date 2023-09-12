package com.mokoji.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mokoji.domain.ChallengeVO;
import com.mokoji.domain.ClubVO;

@Repository("ChallengeDAO")
public class ChallengeDAOImple implements ChallengeDAO {

	@Autowired
	private SqlSessionTemplate mybatis;

	@Override
	public int getchallcode(ChallengeVO cvo) {
		return mybatis.selectOne("ChallengeDAO.getchallcode", cvo);
	}

	@Override
	public int insertChallenge(HashMap<String, Object> paramap) {
		return mybatis.insert("ChallengeDAO.insertChallenge", paramap);
	}

	public int insertMemChallenge(HashMap<String, Object> paramap) {
		return mybatis.insert("ChallengeDAO.insertMemChallenge", paramap);
	}

	// 챌린지 리스트 가져오기
	@Override
	public List<ChallengeVO> getChallengeList(ChallengeVO vo) {
		// TODO Auto-generated method stub`
		List<ChallengeVO> list = mybatis.selectList("ChallengeDAO.getChallengeList", vo);
		return list;
	}

	// 분류별 챌린지 리스트
	@Override
	public List<ChallengeVO> getChallengeListInterest(String ctmid_name) {
		// TODO Auto-generated method stub
		return mybatis.selectList("ChallengeDAO.getSelectedChallengeList", ctmid_name);
	}

	@Override
	public List<ChallengeVO> getHighChallengeListInterest(String cthigh_name) {
		// TODO Auto-generated method stub
		return mybatis.selectList("ChallengeDAO.getSelectedHighChallengeList", cthigh_name);
	}

	@Override
	public List<ChallengeVO> getOneChallengelist(ChallengeVO vo) {
		// TODO Auto-generated method stub
		List<ChallengeVO> list = mybatis.selectList("ChallengeDAO.getOneChallengelist", vo);
		return list;
	}
}
