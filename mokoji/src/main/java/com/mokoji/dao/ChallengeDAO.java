package com.mokoji.dao;

import java.util.HashMap;
import java.util.List;

import com.mokoji.domain.ChallengeVO;

public interface ChallengeDAO {

	// 챌린지 등록
	public int getchallcode(ChallengeVO cvo);

	public int insertChallenge(HashMap<String, Object> paramap);

	public int insertMemChallenge(HashMap<String, Object> paramap);

	// 챌린지 리스트 가져오기
	public List<ChallengeVO> getChallengeList(ChallengeVO vo);

	// 하위 카테고리로 챌린지 리스트
	public List<ChallengeVO> getChallengeListInterest(String ctmid_name);

	// 상위 카테고리로 챌린지 리스트
	public List<ChallengeVO> getHighChallengeListInterest(String cthigh_name);

	// 동호회코드로 챌린지 1개
	public List<ChallengeVO> getOneChallengelist(ChallengeVO vo);
}
