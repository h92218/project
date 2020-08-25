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

<div id="clubgenre" class="center">
	<br>
	<h3>[요일별 클럽]</h3>
	<br>
	<div>
	<a href="clubinterval.do?keyfield=club_interval&keyword=%EC%9B%94%EC%9A%94%EC%9D%BC"
			class="waves-effect waves-circle waves-light btn-floating #1b5e20 green darken-4">월</a>&emsp;
			<a href="clubinterval.do?keyfield=club_interval&keyword=%ED%99%94%EC%9A%94%EC%9D%BC"
			class="waves-effect waves-circle waves-light btn-floating #1b5e20 green darken-4">화</a>&emsp;
			<a href="clubinterval.do?keyfield=club_interval&keyword=%EC%88%98%EC%9A%94%EC%9D%BC"
			class="waves-effect waves-circle waves-light btn-floating #1b5e20 green darken-4">수</a>&emsp;
			<a href="clubinterval.do?keyfield=club_interval&keyword=%EB%AA%A9%EC%9A%94%EC%9D%BC"
			class="waves-effect waves-circle waves-light btn-floating #1b5e20 green darken-4">목</a>&emsp;
			<a href="clubinterval.do?keyfield=club_interval&keyword=%EA%B8%88%EC%9A%94%EC%9D%BC"
			class="waves-effect waves-circle waves-light btn-floating #1b5e20 green darken-4">금</a>&emsp;
			<a href="clubinterval.do?keyfield=club_interval&keyword=%ED%86%A0%EC%9A%94%EC%9D%BC"
			class="waves-effect waves-circle waves-light btn-floating #1b5e20 green darken-4">토</a>&emsp;
		<a href="clubinterval.do?keyfield=club_interval&keyword=%EC%9D%BC%EC%9A%94%EC%9D%BC"
			class="waves-effect waves-circle waves-light btn-floating #1b5e20 green darken-4">일</a>	
	</div>
	<hr width="90%" color="green"><br>
	<br>
	<!-- 요일별 클럽 출력 -->
	<div class="container">
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
							<img src="imageView.do?club_num=${club.club_num }" id="cardImg"
								class="responsive-img center" />
							<div class="card-body">
								<h5 class="card-title">${club.club_name}</h5>
								<p class="card-text">${club.club_interval}</p>
								<a href="viewclubdetail.do?club_num=${club.club_num}"
									class="btn #8bc34a light-green">More</a>
							</div>
						</div>

					</c:if>
				</div>
			</c:forEach>
		</div>
	</div>
</div>