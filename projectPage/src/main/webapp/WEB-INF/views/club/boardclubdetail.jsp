<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<style type="text/css">
	#detailview{
		width:50%;
	}
</style>
<div class="row" id="detailview">
<div class="col s12" >
	<h4>클럽 개설 제안</h4>
			<table>
				<tbody>
					<tr>
						<td>클럽 명 :</td>
						<td>${club.club_name}</td>
					</tr>
					<tr>
						<td>영화 장르 :</td>
						<td>${club.club_genre}</td>
					</tr>
					<tr>
						<td>모임 장소 :</td>
						<td>${club.club_loc}</td>
					</tr>
					<tr>
						<td>모임 시간 :</td>
						<td>${club.club_time}</td>
					</tr>
					<tr>
						<td>시작 날짜 :</td>
						<td>${club.club_start}</td>
					</tr>
					<tr>
						<td>종료 날짜 :</td>
						<td>${club.club_end}</td>
					</tr>
					<tr>
						<td>모임 간격 :</td>
						<td>${club.club_interval}</td>
					</tr>
				</tbody>
			</table>
		<br>
		<div>
		<c:if test="${!empty club.filename }">
		<li>첨부파일 : ${club.filename}</li>
		</c:if>
		<br>
	<c:if test="${fn:endsWith(club.filename, '.jpg') ||
				  fn:endsWith(club.filename, '.JPG') ||
				  fn:endsWith(club.filename, '.gif') ||
				  fn:endsWith(club.filename, '.GIF') ||
				  fn:endsWith(club.filename, '.png') ||
				  fn:endsWith(club.filename, '.PNG') }">
	<div>
		<img src="imageView.do?club_num=${club.club_num }" class="responsive-img">
	</div>
	</c:if>
	</div>
			<br>
			<div>
			<label>모임 내용</label>
				<br>
				${club.club_detail}
			</div>
			<br>
			<br>	
	<div class=right>
			<c:if test="${user_auth ==4}">
			<input type="button" class="btn purple lighten-5 purple-text text-darken-4" value="수정" onclick="location.href='boardclubmodify.do?club_num=${club.club_num}'">
			<input type="button" class="btn purple lighten-5 purple-text text-darken-4" value="삭제" onclick="location.href='boardclubdelete.do?club_num=${club.club_num}'">
			</c:if>
			<c:if test="${user_auth ==3 && user_id == club.mem_id && club.club_state ==1}">
			<input type="button" class="btn purple lighten-5 purple-text text-darken-4" value="수정" onclick="location.href='boardclubmodify.do?club_num=${club.club_num}'">
			<input type="button" class="btn purple lighten-5 purple-text text-darken-4" value="삭제" onclick="location.href='boardclubdelete.do?club_num=${club.club_num}'">
			</c:if>
			<input type="button" class="btn purple lighten-5 purple-text text-darken-4" value="돌아가기" onclick="location.href='boardclub.do'">
		
	</div>
</div>
</div>