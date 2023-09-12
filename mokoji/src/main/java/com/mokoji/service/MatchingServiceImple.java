package com.mokoji.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mokoji.dao.MatchingDAOImple;
import com.mokoji.domain.ClubVO;
import com.mokoji.domain.MatchingInfoVO;
import com.mokoji.domain.MatchingVO;

@Service("matchingService")
public class MatchingServiceImple implements MatchingService{
   
   @Autowired
   private MatchingDAOImple matchingDAO;

   //매칭 리스트 불러오기
   @Override
   public List<HashMap<String, Object>> getMatchList(HashMap<String, Object> map) {
      // TODO Auto-generated method stub
      return matchingDAO.getMatchList(map);
   }

   //매칭 등록
   @Override
   public int insertMatching(HashMap<String, Object> map) {
      // TODO Auto-generated method stub
      return matchingDAO.insertMatching(map);
   }
   
   //매칭정보 입력
   @Override
   public int insertMatchingInfo(HashMap<String, Object> map) {
      // TODO Auto-generated method stub
      return matchingDAO.insertMatchingInfo(map);
   }
   
   //매칭 선택
   @Override
   public int selectMatching(MatchingVO vo) {
      // TODO Auto-generated method stub
      return matchingDAO.selectMatching(vo);
   }

   //참가 신청
   @Override
   public int insertJoinMatching(HashMap<String, Object> map) {
      // TODO Auto-generated method stub
      return matchingDAO.insertJoinMatching(map);
   }

   //승인 거절 리스트
   @Override
   public List<HashMap<String, Object>> getAllMatch(HashMap<String, Object> map) {
      // TODO Auto-generated method stub
      return matchingDAO.getAllMatch(map);
   }

   //승인
   @Override
   public void upMatching(MatchingInfoVO vo) {
      // TODO Auto-generated method stub
      matchingDAO.upMatching(vo);
   }

   //거절
   @Override
   public void delMatching(MatchingInfoVO vo) {
      // TODO Auto-generated method stub
      matchingDAO.delMatching(vo);
   }
   
   //승리 횟수 가져오기
   @Override
   public int getwincount(ClubVO vo) {
      return matchingDAO.getwincount(vo);
   }
   
   //패배 횟수 가져오기
   @Override
   public int getlostcount(ClubVO vo) {
      return matchingDAO.getlostcount(vo);
   }

   //승률 가져오기
   @Override
   public int getwinning(ClubVO vo) {
      // TODO Auto-generated method stub
      return matchingDAO.getwinning(vo);
   }

   //클럽코드 가져오기
   @Override
   public int getClubCode(HashMap<String, Object> map) {
      // TODO Auto-generated method stub
      return matchingDAO.getClubCode(map);
   }

@Override
public int getMatCode(HashMap<String, Object> map) {
	// TODO Auto-generated method stub
	return matchingDAO.getMatCode(map);
}
   
   
   
   
}