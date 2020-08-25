<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<style>
#postImg{
		max-width:100px;
		max-height:100px;
	}
.page-menu{
	width: 85%;
	margin: 0 auto;
}


.page-main-style {
	width: 60%;
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

.border-success tr{
	align:center;
}


.table-bordered th {
	 border-color: #e9ecef !important;
	 background-color:#8bc34a !important;
	 color: white !important;
}

.table-bordered td {
    border-color: #e9ecef !important;
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

p.skipboard{
	white-space: nowrap;
	width: 100px;
    overflow:hidden;
    text-overflow: ellipsis;
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
	
	
			<div class="write_button">
			<c:if test="${!empty user_num}">
			<button type="button" class="btn btn-outline-success" onclick="location.href='postwrite.do'">글쓰기</button>
			</c:if>
			</div>
	
	
	<div class="align-center">
				<c:if test="${count == 0 }">
			<div class="result-disply">등록된 게시물이 없습니다.</div>
			<button class="btn waves-effect waves-light" type="submit" onclick="location.href='post.do'">돌아가기</button>
				</c:if>
			</div>




	
		<c:if test="${count > 0 }">
			<table class="table table-bordered">
	<!-- 				<thead>
				<tr>
						<th>번호</th>
						<th>제목</th>
						<th>작성자</th>
						<th>등록일</th>
						<th>조회수</th>
					</tr>
 				</thead>-->
				<tbody class="border-success">
					<c:forEach var="post" items="${list}">
						<tr class=align-center>
							<td rowspan="4" width=1%>
							<img src="imageView.do?post_num=${post.post_num}" class="responsive-img" id="postImg" onerror="this.src='https://static.thenounproject.com/png/340719-200.png';">
							</td>
						</tr>
						<tr>
							<td width=30%><a href="postdetail.do?num=${post.post_num}">${post.post_title}</a></td>
							</tr>
						<tr>
							<td width=40%><p class="skipboard">${post.post_board}</p></td>
						</tr>
						<tr>
							<td width=30%>
							${post.mem_id}
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</c:if>

<div class=align-center>${pagingHtml}</div>
		
	
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
