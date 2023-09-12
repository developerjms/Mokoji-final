package com.mokoji.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mokoji.dao.ChallengeDAOImple;
import com.mokoji.domain.ChallengeVO;

@Service("challengeService")
public class ChallengeServiceImple implements ChallengeService {

	@Autowired
	private ChallengeDAOImple challengeDAO;

	@Override
	public int getchallcode(ChallengeVO cvo) {
		return challengeDAO.getchallcode(cvo);
	}
	
	@Override
	public int insertChallenge(HashMap<String, Object> paramap) {
		return challengeDAO.insertChallenge(paramap);
	}
	@Override
	public int insertMemChallenge(HashMap<String, Object> paramap) {
		return challengeDAO.insertMemChallenge(paramap);
	}
	

	// 챌린지 리스트
	@Override
	public List<ChallengeVO> getChallengeList(ChallengeVO vo) {
		// TODO Auto-generated method stub
		return challengeDAO.getChallengeList(vo);
	}

	// 챌린지 관심사 리스트 가져오기
	@Override
	public List<ChallengeVO> getChallengeList(String ctmid_name) {
		// TODO Auto-generated method stub
		return challengeDAO.getChallengeListInterest(ctmid_name);
	}

	@Override
	public List<ChallengeVO> getHighChallengeList(String cthigh_name) {
		// TODO Auto-generated method stub
		return challengeDAO.getHighChallengeListInterest(cthigh_name);
	}

	@Override
	public List<ChallengeVO> getOneChallengelist(ChallengeVO vo) {
		// TODO Auto-generated method stub
		return challengeDAO.getOneChallengelist(vo);
	}

}
