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
	<h3>[장르별 클럽]</h3><br>
	<div>
	<a href="clubgenre.do?keyfield=club_genre&keyword=%EC%95%A0%EB%8B%88%EB%A9%94%EC%9D%B4%EC%85%98" 
		class="waves-effect waves-light btn #1b5e20 green darken-4">애니메이션</a>&emsp;
	<a href="clubgenre.do?keyfield=club_genre&keyword=%EC%95%A1%EC%85%98"
		class="waves-effect waves-light btn #1b5e20 green darken-4">액션</a>&emsp;
	<a href="clubgenre.do?keyfield=club_genre&keyword=%EB%A1%9C%EB%A7%A8%ED%8B%B1%EC%BD%94%EB%AF%B8%EB%94%94/%EB%93%9C%EB%9D%BC%EB%A7%88"
		class="waves-effect waves-light btn #1b5e20 green darken-4">로맨틱코미디/드라마</a>&emsp;
	<a href="clubgenre.do?keyfield=club_genre&keyword=SF" 
		class="waves-effect waves-light btn #1b5e20 green darken-4">SF</a>&emsp;
	<a href="clubgenre.do?keyfield=club_genre&keyword=%EA%B3%B5%ED%8F%AC/%EC%8A%A4%EB%A6%B4%EB%9F%AC"
		class="waves-effect waves-light btn #1b5e20 green darken-4">공포/스릴러</a>
	</div>
	<hr width="90%" color="green"><br>
	<br>
	<!-- 장르별 클럽 출력 -->
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