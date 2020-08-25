<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
  
<style>
/*기본 레이아웃*/
*{
    margin:0;
    padding:0;
}
  
.page-main-style{
	margin:0 auto;
	font-family:"맑은 고딕";
}

.align-center{
	margin-top:2rem;
	text-align:center;
}
    
/*검색창 폼*/ 
form#search_form{
	border:none;
	text-align: center;
	margin-top:3rem;
}
form#search_form ul.search{
	list-style:none;
}
form#search_form ul.search li{
	margin:0 0 9px 0;
	padding:0;
	display:inline;
}
form#search_form ul.search li select{
    width:5rem;
	display:inline-block;
}
form#search_form ul.search li input[type="search"]{
    width:20rem;
	display:inline-block;
}

/*제목 일정 수 초과시 ...표시*/
.limit {
	width:250px;
    white-space: nowrap;
    overflow: hidden;
    text-overflow: ellipsis;
}

/*사이드 메뉴 hover*/
.menu ul li:hover{
	background-color: #e0e0e0;
}
.menu ul li a:hover{
	color: #ff0000;
}


/*글쓰기 버튼 우측 정렬*/
.write_button{
	float:right;
}

/*float 종료*/
br.end{
	clear:both;
}

/*버튼*/
input[type="submit"], input[type="button"]{
	background-color:#33691e; 
	padding:5px 20px 5px 20px; 
	margin-bottom:20px;
	color:#fff; 
	border:none; 
	border-radius:5px;
}

/*검색결과가 없을경우*/
.result-display{
	text-align:center;
}

/* 작은 사이즈 */
@media (max-width:599px){
	/*폰트 크기*/
    :root{
        font-size:14px;
    }   
	
	/*사이드 메뉴*/
	.menu{
		height:15rem;
		border:1px solid #e0e0e0;
	}
	.menu p{
		text-align:center;
		height:3rem;
		margin:0;
		padding-top:10px;
		color:#fff;
		background-color:#33691e;
	}
	.menu ul li{
		padding:15px 20px 15px 20px;
	}
}

/* 중간 사이즈 */
@media (min-width:600px) and (max-width:1199px){
    :root{
        font-size:16px;
    }
    
    /*화면 너비*/
    .page-main-style{
		width:90%
	}
	
	/*사이드 메뉴*/
	.menu{
		height:15rem;
		border:1px solid #e0e0e0;
	}
	.menu p{
		height:3rem;
		margin:0;
		padding-top:10px;
		color:#fff;
		background-color:#33691e;
		text-align:center;
	}
	.menu ul li{
		padding:15px 20px 15px 20px;
	}
}

/* 큰 사이즈 */
@media (min-width:1200px){
    :root{
        font-size:18px;
    }
   
   	/*화면 너비*/
	.page-main-style{
		width:90%
	}
	
	/*사이드 메뉴*/
	.menu{
		width:20%;
		height:30rem;
		border:1px solid #e0e0e0;
		margin-right:47px;
		margin-top:40px;
		margin-bottom:40px;
		float:left;
	}
	.menu p{
		margin:0;
		padding:20px 20px 20px 20px;
		text-align:center;
		color:#fff;
		background-color:#33691e;
	}
	.menu ul li{
		padding:20px 20px 20px 20px;
	}
	
	.page-content{
	width:75%;
	float:left;
	}	
}
p.club-detail{
	font-size: 16px;
}
.club_img{
	filter:brightness(50%);
}

</style>

<div class="page-main-style">
	<div class="menu">
		<p>클럽 관리</p>
		<ul>
			<li class="tab"><a href="myClub.do">나의 참여 클럽</a></li>
			<li class="tab"><a href="leaderClub.do">내가 개설한 클럽</a></li>
	  	</ul>
	</div>
	<div class="page-content">
		<h6>현재 진행 중인 클럽</h6>
		<div class="row">
		<c:if test="${empty leadersValidClub}">
		<!-- 클럽장 활동 조건 설명 -->
		<div class="col-sm-12 col-lg-4">
			<div class="card light-green darken-1">
				<div class="card-content white-text">
					<span class="card-title">진행 중 클럽</span>
					<p>클럽장으로 활동 중인 내역이 없습니다</p>
				</div>
				<div class="card-action light-green darken-1">
					<a href="/club/main/introduce/membership.do">클럽장 조건 보러 가기</a>
				</div>
			</div>
		</div>
		</c:if>
		<c:if test="${!empty leadersValidClub }">
			<c:forEach var="validClub" items="${leadersValidClub}">
			<c:if test="${validClub.club_state==2 }">
			<!-- 카드 하나 코드  -->
			<div class="col-sm-12 col-lg-4">
				<div class="card medium">
					<c:if test="${!empty validClub.filename }">
					<c:if test="${
						 fn:endsWith(validClub.filename, '.jpg') ||			 
						 fn:endsWith(validClub.filename, '.JPG') ||			 
						 fn:endsWith(validClub.filename, '.gif') ||			 
						 fn:endsWith(validClub.filename, '.GIF') ||			 
						 fn:endsWith(validClub.filename, '.png') ||			 
						 fn:endsWith(validClub.filename, '.PNG')
		 				}">
		 			<div class="card-image">
					<img src="imageView.do?club_num=${validClub.club_num }" class="club_img">
					<span class="card-title">${validClub.club_name}</span>
					</div>
					</c:if>
					</c:if>
					<c:if test="${empty validClub.filename }">
					<div class="card-image">
					<img src="${pageContext.request.contextPath}/resources/images/talk.png" class="club_img">
					<span class="card-title">${validClub.club_name}</span>
					</div>
					</c:if>
					<div class="card-content">
						<p class="club-detail">
						시작: ${validClub.club_start} | 종료: ${validClub.club_end}<br>
						주기: ${validClub.club_interval } | 시간: ${validClub.club_time }
						</p>
					</div>
					<div class="card-action" align="right">
						<a href="${pageContext.request.contextPath }/main/viewclubdetail.do?club_num=${validClub.club_num}" class="waves-effect waves-light btn-small">자세히</a>
						<a href="manageMembers.do?club_num=${validClub.club_num }" class="waves-effect waves-light btn-small">회원관리</a>
					</div>
				</div>
			</div>
			</c:if>
			</c:forEach>
		</c:if>
		</div>
		<h6>활동 종료 클럽</h6>
		<div class="row">
		<c:if test="${empty leadersPastClub }">
		<div class="col-sm-12 col-lg-4">
			<div class="card light-green darken-1">
				<div class="card-content white-text">
					<span class="card-title">종료 클럽</span>
					<p>클럽장으로 활동한 내역이 없습니다</p>
				</div>
				<div class="card-action light-green darken-1">
					<a href="/club/main/introduce/membership.do">클럽장 조건 보러 가기</a>
				</div>
			</div>
		</div>
		</c:if>
		<c:if test="${!empty leadersPastClub }">
			<!-- 카드 하나 코드  -->
			<c:forEach var="pastClub" items="${leadersPastClub}">
			<c:if test="${pastClub.club_state==2 }">
			<div class="col-sm-12 col-lg-4">
				<div class="card medium">
					<c:if test="${!empty pastClub.filename }">
						<c:if test="${
							 fn:endsWith(pastClub.filename, '.jpg') ||			 
							 fn:endsWith(pastClub.filename, '.JPG') ||			 
							 fn:endsWith(pastClub.filename, '.gif') ||			 
							 fn:endsWith(pastClub.filename, '.GIF') ||			 
							 fn:endsWith(pastClub.filename, '.png') ||			 
							 fn:endsWith(pastClub.filename, '.PNG')
			 				}">
			 			<div class="card-image">
						<img src="imageView.do?club_num=${pastClub.club_num }" class="club_img">
						<span class="card-title">${pastClub.club_name}</span>
						</div>
						</c:if>
					</c:if>
					<c:if test="${empty pastClub.filename }">
						<div class="card-image">
						<img src="${pageContext.request.contextPath}/resources/images/talk.png" class="club_img">
						<span class="card-title">${pastClub.club_name}</span>
						</div>
					</c:if>
					<div class="card-content">
						<p class="club-detail">
						시작: ${pastClub.club_start} | 종료: ${pastClub.club_end}<br>
						주기: ${pastClub.club_interval } | 시간: ${pastClub.club_time }
						</p>
					</div>
					<div class="card-action" align="right">
						<a href="${pageContext.request.contextPath }/main/viewclubdetail.do?club_num=${pastClub.club_num}" class="waves-effect waves-light btn-small">자세히</a>
					</div>
				</div>
			</div>
			</c:if>
			</c:forEach>
		</c:if>
		</div>
	</div>
	<br class="end">
</div>
