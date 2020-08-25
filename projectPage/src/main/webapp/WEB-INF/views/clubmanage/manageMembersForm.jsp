<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
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
		<h6>${club.club_name} 회원 관리</h6>
		<table>
			<tr>
				<th>프로필</th>
				<th>이름</th>
				<th>별명</th>
				<th>연락처</th>
				<th>이메일</th>
				<th>참석일</th>
				<th>참석율</th>
				<th>오늘 출석</th>
			</tr>
			<c:if test="${empty clubMembers }">
				모임 신청 회원이 없습니다.
			</c:if>
			<c:if test="${!empty clubMembers }">
			<form action="manageMembers.do" method="post">
			<c:forEach var="member" items="${clubMembers }">
			<input type="hidden" name="club_num" value="${member.club_num }">
			<tr>
				<c:if test="${empty member.detail_img }">
					<td><img class="circle" width="50" src="${pageContext.request.contextPath}/resources/images/profile.png"></td>
				</c:if>
				<c:if test="${!empty member.detail_img }">
				<c:if test="${
						 fn:endsWith(member.detail_img, '.jpg') ||			 
						 fn:endsWith(member.detail_img, '.JPG') ||			 
						 fn:endsWith(member.detail_img, '.gif') ||			 
						 fn:endsWith(member.detail_img, '.GIF') ||			 
						 fn:endsWith(member.detail_img, '.png') ||			 
						 fn:endsWith(member.detail_img, '.PNG')
		 				}">
					<td><img class="circle" width="50" src="profileImage.do?mem_num=${member.mem_num }"></td>
				</c:if>
				</c:if>
					<td>${member.detail_name }</td>
					<td>${member.detail_nick }</td>
					<td>${member.detail_cell }</td>
					<td>${member.detail_email }</td>
					<td>${member.join_date }</td>
					<td><fmt:formatNumber value="${member.attendance_rate}" pattern="0"/>%</td>
					<td>
						<div class="switch">
							    <label>
							      	<span style="color:grey;font-size:medium;">불참</span>
							      <input type="checkbox" name="attendance" value="${member.mem_num }">
							      <span class="lever"></span>
							      	<span style="color:green;font-size:medium;">참석</span>
				    			</label>
			 			 </div>
		 			</td>
			</tr>
			</c:forEach>
			<tr>
				<td colspan="8" style="text-align:center">
					<button id="submit" class="btn waves-effect waves-light" type="submit" name="action">출석 제출
				    			<i class="material-icons">send</i>
				  	</button>
			  	<td>
		  	</tr>
			</form>
			</c:if>
		</table>
	</div>
	<br class="end">
</div>

<script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
<script src="https://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>