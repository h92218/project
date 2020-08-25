<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>   
  
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
@media (max-width:649px){
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
	
	.limit {
	width:200px;
	}
}

/* 중간 사이즈 */
@media (min-width:650px) and (max-width:1199px){
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
	 
	.limit {
	width:300px;
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
	
	.limit {
	width:400px;
	}
}
</style>
<div class="page-main-style">
	<div class="menu">
		<p>공지사항</p>
		<ul>
		   <li class="tab"><a href="list.do">전체 공지사항</a></li>
		   <li class="tab"><a href="http://localhost:8080/club/notice/list.do?keyfield=nt_category&keyword=%ED%81%B4%EB%9F%BD">클럽별 공지사항</a></li>
		   <li class="tab"><a href="http://localhost:8080/club/notice/list.do?keyfield=nt_category&keyword=%ED%8C%8C%EC%9D%B4%ED%84%B0%ED%81%B4%EB%9F%BD">파이터클럽 공지사항</a></li>
	  	</ul>
	</div>
	<div class="page-content">
		<h3>공지사항</h3>
		<form id="search_form" action="list.do" method="get">
			<ul class="search">
				<li>
					<select name="keyfield">
						<option value="nt_title">제목</option>
						<option value="nt_content">내용</option>
						<option value="mem_id">작성자</option>
					</select>
				</li>
				<li>
					<input type="search" size="16" name="keyword" id="keyword" placeholder="Search">
				</li>
				<li>
					<input type="submit" value="찾기" >
				</li>
			</ul>
		</form>
		<div class="write_button">
			<%--관리자와 클럽장만 글쓰기 버튼이 활성화 됨 --%>
			<c:if test="${user_auth == 3 || user_auth == 4}">
				<input type="button" value="글쓰기" onclick="location.href='write.do'">
			</c:if>
		</div>	
		<c:if test="${count == 0}">
			<table class="notice_list">
				<tr style="border-bottom:1px solid #000">
					<th>번호</th>
					<th>분류</th>
					<th width="250">제목</th>
					<th>작성자</th>
					<th>등록일</th>
					<th>조회수</th>
				</tr>
				<tr>
					<td colspan="6" class="result-display">등록된 게시물이 없습니다.</td>
				</tr>
			</table>
		</c:if>
		<c:if test="${count > 0}">
		<table class="notice_list">
			<tr style="border-bottom:1px solid #000">
				<th>번호</th>
				<th>분류</th>
				<th width="250">제목</th>
				<th>작성자</th>
				<th>등록일</th>
				<th>조회수</th>
			</tr>
			<c:forEach var="notice" items="${list}">
				<tr>
					<td>${notice.nt_num}</td>
					<td>${notice.nt_category}</td>
					<td><div class="limit"><a href="detail.do?nt_num=${notice.nt_num}">${notice.nt_title}</a></div></td>
					<td>${notice.mem_id}</td>
					<td>${notice.nt_datetime}</td>
					<td>${notice.nt_hit}</td>
				</tr>
			</c:forEach>
		</table>
			<div class="align-center">${pagingHtml}</div>	
			<br>
		</c:if>
	</div>	
	<br class="end">
</div>