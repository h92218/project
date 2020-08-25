<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">
<style>

.page-menu{
	width: 85%;
	margin: 0 auto;
}

.page-main-style {
	width: 85%;
	margin: 0 auto;
}

.align-center {
	text-align: center;
	border:20px;
	padding:10px;
}

.center { 
	text-aling:center;
	margin:0 auto;
}

.write_button{
	float:right;
}

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
	border: 1px solid #689f38;
}
form#search_form ul.search li input[type="search"]{
    width:20rem;
	display:inline-block;
	
}

.table-bordered th {
	 border-color: green !important;
	 background-color:#8bc34a !important;
	 color: white !important;
}

.table-bordered td {
    border-color: green !important;
    color: black !important;
}

.table-bordered td a, .table-bordered th a{
    color: black !important;
}



.nav-pills > li > a.active{
  background-color:#689f38 !important;
  color:white !important;
}

  .nav-pills > li.active > a:hover {
  background-color:#689f38 !important;
  color:white !important;
        }
        
.nav-link-color {
  color: #689f38;
}

.jumbotron{
	color: black;
	background-color:#e8e6d7 !important;
}
</style>


<div class="jumbotron jumbotron-fluid">
  <div class="container">
    <h1 class="display-6">후기게시판 입니다!</h1>
    <p class="lead">여러분들의 참여 또는 영화를 보고 나서 느낀점을 작성해주세요!</p>
  </div>
</div>

<div class="page-menu">
	<ul class="nav nav-pills nav-fill">
		<li class="nav-item"><a class="nav-link active" href="postlist.do">전체 게시판</a></li>
		<li class="nav-item"><a class="nav-link active" href="post.do?keyfield=post_category&keyword=join">참여 후기 게시판</a></li>
		<li class="nav-item"><a class="nav-link active" href="postlist.do?keyfield=post_category&keyword=movie">영화 후기 게시판</a></li>
		<li class="nav-item"><a class="nav-link active" href="postphoto.do?keyfield=post_category&keyword=photo">갤러리</a>
		</li>
	</ul>
</div>

<div class=page-main-style>
	<form id="search_form" action="postlist.do" method="get">
		<ul id="search_form" class="search">
			<li>
				<select name="keyfield">
					<option value="post_title">제목</option>
					<option value="post_board">내용</option>
				</select>
			</li>		
			<li>
				<input type="search" size="20%" name="keyword" id="keyword"> 
				<button type="submit" class="btn btn-outline-success" id="keyword">찾기</button>
			</li>
			
		<div class="write_button">
			<c:if test="${!empty user_num}">
			 <button type="button" class="btn btn-outline-success" onclick="location.href='postwrite.do'">글쓰기</button>
			</c:if>
		</div>
				<c:if test="${count == 0 }">
			<div class="result-disply">등록된 게시물이 없습니다.</div>
			<button class="btn waves-effect waves-light" type="submit" onclick="location.href='post.do'">돌아가기</button>
				</c:if>
		</ul>


		
		<c:if test="${count > 0 }">
			<div class="container">
			<table class="table table-bordered">
				<thead>
					<tr>
						<th>분류</th>
						<th>제목</th>
						<th>작성자</th>
						<th>등록일</th>
						<th>조회수</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="post" items="${list}">
						<tr>
							<td>
								<c:if test="${post.post_category == 'join'}">
								참여후기
								</c:if>
								<c:if test="${post.post_category == 'movie'}">
								영화후기
								</c:if>
								<c:if test="${post.post_category == 'photo'}">
								갤러리
								</c:if>
							</td>
							<td><a href="postdetail.do?num=${post.post_num}">${post.post_title}</a></td>
							<td>${post.mem_id}</td>
							<td>${post.post_date}</td>
							<td>${post.post_hit}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
</div>



			
			<div class=align-center>${pagingHtml}</div>
		</c:if>
	</form>
</div>



<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css"
	integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk"
	crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
	integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
	integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
	crossorigin="anonymous"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"
	integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI"
	crossorigin="anonymous"></script>
<script>

</script>


