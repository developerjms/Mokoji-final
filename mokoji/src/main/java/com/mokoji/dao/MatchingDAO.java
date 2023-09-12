package com.mokoji.dao;

import java.util.HashMap;
import java.util.List;

import com.mokoji.domain.ClubVO;
import com.mokoji.domain.MatchingInfoVO;
import com.mokoji.domain.MatchingVO;

public interface MatchingDAO {
      // 매칭 리스트 가져오기
      public List<HashMap<String, Object>> getMatchList(HashMap<String, Object> map);
      // 매칭 등록
      public int insertMatching(HashMap<String, Object> map);
      
      public int insertMatchingInfo(HashMap<String, Object> map);
      
      // 매칭 코드 등록
      public int selectMatching(MatchingVO vo);
      
      // 등록된 매칭 참가하기
      public int insertJoinMatching(HashMap<String, Object> map);
      // 매칭 신청한 사람 목록
      public List<HashMap<String, Object>> getAllMatch(HashMap<String, Object> map);
      // 승인 확인
      public void upMatching(MatchingInfoVO vo);
      // 승인 거절
      public void delMatching(MatchingInfoVO vo);
      
      public int getwincount(ClubVO vo);
      
      public int getlostcount(ClubVO vo);
      
      public int getwinning(ClubVO vo);
      
      // 참가 중복 방지
      public int getClubCode(HashMap<String, Object> map);
      
      public int getMatCode(HashMap<String, Object> map);
}