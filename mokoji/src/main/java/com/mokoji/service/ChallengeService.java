package com.mokoji.service;

import java.util.HashMap;
import java.util.List;

import com.mokoji.domain.ChallengeVO;

public interface ChallengeService {
	// 챌린지 등록
	
	public int getchallcode(ChallengeVO cvo);
	
	public int insertChallenge(HashMap<String, Object> paramap);
	
	public int insertMemChallenge(HashMap<String, Object> paramap);

	// 동호회 리스트 가져오기
	public List<ChallengeVO> getChallengeList(ChallengeVO vo);

	// 하위 카테고리로 동호회 리스트
	public List<ChallengeVO> getChallengeList(String ctmid_name);

	// 상위 카테고리로 동호회 리스트
	public List<ChallengeVO> getHighChallengeList(String cthigh_name);

	// 동호회 코드로 동호회 1개 검색
	public List<ChallengeVO> getOneChallengelist(ChallengeVO vo);

}
