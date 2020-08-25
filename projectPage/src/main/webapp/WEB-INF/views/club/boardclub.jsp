<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style type="text/css">
	#boardclub{
		width:50%;
		margin: 20px auto;
	}  
	
	#boardclub-center{
		text-align: center;
	}
	
	
</style>
<!-- 테스트  -->
<div class="row col s12" id="boardclub-center">
<div id="boardclub" class="center">
	<h4>클럽 개설 제안</h4>
	<!-- 검색 기능 -->
  <div class="input-field col s12">
		<form action="boardclub.do" method="get">
		<div class="col s3">
			<select name="keyfield">
				<option value="" disabled selected>검색</option>
				<option value="club_title">글 제목</option>
				<option value="club_detail">클럽 내용</option>
				<option value="mem_id">아이디</option>
			</select>
			</div>
			<div class="col s7">
				<input type="search" size="16" name="keyword" id="keyword">
			</div>
			<div class="col s2">
				<input type="submit" class="btn purple lighten-5 purple-text text-darken-4" value="검색">
			</div>
		</form>
	</div>
	<div class="right">
			<br>
			<input type="button" class="btn purple lighten-5 purple-text text-darken-4" 
					value="제안하기" onclick="location.href='openclub.do'">
	</div>
	<c:if test="${count == 0 }">
		<div>등록된 게시물이 없습니다.</div>
	</c:if>
	<c:if test="${count > 0 }">
		<div class="col s12">
			<table>
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>작성자</th>
				<th>등록일</th>
				<th>승인여부</th>
			</tr>
			<c:forEach var="club" items="${list}">
			<tr>
				<td>${club.club_num}</td>
				<td><a href="boardclubdetail.do?club_num=${club.club_num}">${club.club_title}</a></td>
				<td>${club.mem_id}</td>
				<td>${club.club_date}</td>
				<c:if test="${club.club_state == 1}">
				<td>검토예정</td>
				</c:if>
				<c:if test="${club.club_state == 2}">
				<td>승인</td>
				</c:if>
				<c:if test="${club.club_state == 3}">
				<td>승인거부</td>
				</c:if>
				<c:if test="${club.club_state == 4}">
				<td>종료됨</td>
				</c:if>
			</tr>
			</c:forEach>
			</table>
			<div class="center">${pagingHtml}</div>
		</div>
	</c:if>
</div>
</div>