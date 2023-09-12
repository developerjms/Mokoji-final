<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>        
<head>
  <meta charset="utf-8" />
  <link rel="icon" href="/favicon.ico" />
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <meta name="theme-color" content="#000000" />
  <title>Sign In</title>
  <link rel="stylesheet" href="././resources/style/SignIn.css" type="text/css">
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Inter%3A400"/>
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro%3A400"/>
</head>
<body>
<form name="form" action="checkMember.do" method="post">
<div class="frame-27-MjX">
  <div class="logo-removebg-preview-1-3-H7P" onclick="window.location.href='frame-16.html';"></div>
  <div class="line-75-jzy">
  </div>
  <div class="line-76-4GZ">
  </div>
  <div class="item--C7s"><a type="button" href="SignIn.do">회원가입</a></div>
  <div class="item--ry7">비밀번호 찾기</div>
  <div class="item--MQ5"></div>
  
  <div class="rectangle-359-Req"></div>
  <input type="text" class="item--L17" name="MEM_ID" placeholder="Id">
  <input type="password" class="item--zbT" name="MEM_PW" placeholder="Password">
  <input type="submit" value="로그인">
</div>
</form>
</body>
</html>