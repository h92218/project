<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/manager.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
<meta charset="UTF-8">
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
div.member_list{
display: block; margin: 0px auto; width:80%;
}
#modify_member{display: block; margin: 0px auto;width:60%;}
</style>
</head>
<body>
	<div class="manager_menu">
		<ul class="manager_menu_list">
		  <li><a href="${pageContext.request.contextPath}/main/manage_club.do">클럽개설신청 관리</a></li>
          <li><a href="${pageContext.request.contextPath}/main/manage_member.do">회원 관리</a></li>
          <li><a href="${pageContext.request.contextPath}/clubmanage/leaderClub.do">클럽 출결 관리</a></li>
          <li><a href="${pageContext.request.contextPath}/main/EditPicture.do">메인 이미지/텍스트 변경</a></li>
		</ul>
	</div>
	<br>
	<p class="manager_title">회원 관리 페이지</p>
	<hr width="90%" color="green">
	<br>
	
<form id="complete" action="modify_process.do" method="post">
<div class="member_list">
<table class="centered">
	 <thead>
          <tr>
              <th>회원 번호</th>
              <th>ID</th>
              <th>이름</th>
              <th>회원등급</th>
              <th>보유 포인트</th>
			 <th>가입 날짜</th>
          </tr>
        </thead>
        <tbody>
<c:forEach var="member" items="${list}">
<input type="hidden" name="mem_num" value="${member.mem_num}" id="mem_num">
<tr>
<td>${member.mem_num}</td>
<td>${member.mem_id}</td>
<td>${member.detail_name}</td>
<td>
<div id="modify_member">
<select class="browser-default" name="mem_auth" id="authselect">
<c:if test="${member.mem_auth==0}">
	<option value="0" selected>탈퇴회원(현재등급)</option>
	<option value="1">블랙회원</option>
	<option value="2">일반회원</option>
	<option value="3">우수회원</option>
</c:if>
<c:if test="${member.mem_auth==1}">
	<option value="1" selected>블랙회원(현재등급)</option>
	<option value="0">탈퇴회원</option>
	<option value="2">일반회원</option>
	<option value="3">우수회원</option>
</c:if>
<c:if test="${member.mem_auth==2}">
	<option value="2" selected>일반회원(현재등급)</option>
	<option value="0">탈퇴회원</option>
	<option value="1">블랙회원</option>
	<option value="3">우수회원</option>
</c:if>
<c:if test="${member.mem_auth==3}">
	<option value="3" selected>우수회원(현재등급)</option>
	<option value="0">탈퇴회원</option>
	<option value="1">블랙회원</option>
	<option value="2" >일반회원</option>
</c:if>
</select>
</div>
</td>
<td>
<div id="modify_member"><input type="number" id="point" name="detail_point" min="0" max="10000" value="${member.detail_point}"></div>
</td>
<td>${member.detail_date}</td>
</tr>
</c:forEach>
</tbody></table><br>
<div class="row">
<div style="width:70%"><font style="color:red;"><b>※ 일반, 우수 등급으로 변경시 회원 포인트를 맞게 입력해야 등급 변경이 가능<br>
(포인트만 변경하는 경우 등급은 자동 변경)</b><br>
일반회원 : 0~4999 point <br>
우수회원 : 5000~10000 point </font></div>
<div style="width:30%;text-align:right;">
	<button class="btn" type="submit"
			name="action2">변경완료</button></div><br>
			</div>
			
			</div> 
</form>

<script>




</script>
</body>
</html>