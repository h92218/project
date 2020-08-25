<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">
<style type="text/css">
/*기본 레이아웃*/
* {
	margin: 0;
	padding: 0;
}

.page-main-style {
	margin: 0 auto;
	font-family: "맑은 고딕";
}

.align-center {
	margin-top: 2rem;
	text-align: center;
}
/*사이드 메뉴 hover*/
.menu ul li:hover {
	background-color: #e0e0e0;
}
/*float 종료*/
br.end {
	clear: both;
}

.menu ul li a:hover {
	color: #ff0000;
}
/* 작은 사이즈 */
@media ( max-width :599px) {
	/*폰트 크기*/
	:root {
		font-size: 14px;
	}

	/*사이드 메뉴*/
	.menu p {
		text-align: center;
		height: 3rem;
		margin: 0;
		padding-top: 10px;
		color: #fff;
		background-color: #33691e;
	}
	.menu ul li {
		padding: 15px 20px 15px 20px;
	}
}

/* 중간 사이즈 */
@media ( min-width :600px) and (max-width:1199px) {
	:root {
		font-size: 16px;
	}

	/*화면 너비*/
	.page-main-style {
		width: 90%
	}

	/*사이드 메뉴*/
	.menu {
		height: 15rem;
		border: 1px solid #e0e0e0;
	}
	.menu p {
		height: 3rem;
		margin: 0;
		padding-top: 10px;
		color: #fff;
		background-color: #33691e;
		text-align: center;
	}
	.menu ul li {
		padding: 15px 20px 15px 20px;
	}
}

/* 큰 사이즈 */
@media ( min-width :1200px) {
	:root {
		font-size: 18px;
	}

	/*화면 너비*/
	.page-main-style {
		width: 90%
	}

	/*사이드 메뉴*/
	.menu {
		width: 20%;
		height: 30rem;
		border: 1px solid #e0e0e0;
		margin-right: 47px;
		margin-top: 40px;
		margin-bottom: 40px;
		float: left;
	}
	.menu p {
		margin: 0;
		padding: 20px 20px 20px 20px;
		text-align: center;
		color: #fff;
		background-color: #33691e;
	}
	.menu ul li {
		padding: 20px 20px 20px 20px;
	}
	.page-content {
		width: 75%;
		float: left;
	}
}

li.item {
	display: inline-block;
	vertical-align: middle;
	padding: 6px 5px 6px 0px;
	border:1px solid black;
	width: 100%;
}
div.search {
	width: 300px;
	margin: 20px auto;
}

input::placeholder {
	color: light-green;
	font-style: italic;
}
input#search_form {
	width: 230px;
	float: left;
}

button {
	margin-top: 10px;
	float: right;
}

p .material-icons {
	vertical-align: bottom;
	color: red;
}
.picture{
	float:left;
	height:160px;
	width:120px;
	margin-right: 10px;
}
ul li.mov{
	margin: 20px 0;
}
.star-rating { width:100px; }
.star-rating,.star-rating span {
	display:inline-block; height:19px; overflow:hidden; background:url('${pageContext.request.contextPath}/resources/images/star.png')no-repeat;
}
.star-rating span{ background-position:left bottom; line-height:0; vertical-align:top; }

</style>
<div class="page-main-style">
	<div class="menu">
		<p>영화 검색</p>
		<ul>
			<li class="tab"><a href="movieSearchForm.do">영화 검색</a></li>
		</ul>
	</div>
	<div class="page-content">
		<div class="search">
		<form action="movieSearch.do" method="GET">
			
				<input id="search_form" type="search" name="query"
					placeholder="영화 검색어 입력" autocomplete="off" maxlength="16" size="16">
				<button class="btn waves-effect waves-light" type="submit">
					<i class="material-icons" id="search">search</i>
				</button>
			
		</form>
		<br class="end">
		</div>
		<div>
			<ul>
				<c:if test="${empty list }">
					<li>검색된 영화가 없습니다</li>
				</c:if>
				<c:if test="${!empty list }">
					<c:forEach var="movie" items="${list}">
						<li class="mov">
							
							<a href="${movie.link }" target="_blank">
							<c:if test="${!empty movie.image }">
							<img src="${movie.image}" class="picture">
							</c:if>
							<c:if test="${empty movie.image }">
							<img src="${pageContext.request.contextPath}/resources/images/blank-img-movie.jpg" class="picture">
							</c:if>
							</a>
							<span class="title"><a href="${movie.link }" target="_blank">${movie.title}</a> | ${movie.pubDate}
							</span>
							<p>
								<b>평점</b> ${movie.userRating} /10 
								<span class="star-rating">
									<span style="width:${movie.userRating*10}%"></span>
								</span>
								<b>감독</b> ${movie.director} <br> <b>배우</b> ${movie.actor}<br>
								<%--<span class="star-rating">
									<span></span>
								</span> --%>
							</p>
						</li>
						<br class="end">
					</c:forEach>
				</c:if>
			</ul>
		</div>
	</div>
	<br class="end">
</div>

