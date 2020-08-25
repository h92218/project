<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<style type="text/css">
	#cardImg{
		max-width:400px;
		max-height:220px;
	}
</style>
<div class="container center">
	<br>
	<h3>[현재 진행중인 클럽]</h3>
	<div class="row">
		<c:forEach var="club" items="${list}">
		<div class="col-sm-6 col-lg-4">
			<p></p>
			<c:if test="${count == 0 }">
				<div>등록된 게시물이 없습니다.</div>
			</c:if>
			<c:if test="${count > 0 }">
			
			<div class="card">
				<div class="card-header">${club.club_genre}</div>
				<img
					src="imageView.do?club_num=${club.club_num }" id="cardImg" class="responsive-img center"/>
				<div class="card-body center">
					<h5 class="card-title" style="text-align:center">${club.club_name}</h5>
					<p class="card-text" style="text-align:center">모임주기 : ${club.club_interval}</p>
					<a href="viewclubdetail.do?club_num=${club.club_num}" class="btn #8bc34a light-green">More</a>
				</div>
			</div>
			
			</c:if>
		</div>
		</c:forEach>
	</div>
</div>