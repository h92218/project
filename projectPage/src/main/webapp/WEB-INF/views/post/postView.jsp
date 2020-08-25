<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html>
<meta charset="UTF-8">
<title>후기 게시글</title>
<style>

.page-main-style {
	width: 80%;
	margin: 0 auto;
}

.align-center{
	margin-top:2rem;
	text-align:center;
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


</style>

	<div class="page-main-style">
		<br><br>
		<table class="table table-bordered">
			<tr>
				<th>제목</th>
				<td>${post.post_title}</td>
				<th>작성자</th>
				<td>${post.mem_id}</td>
				
			</tr>
			<tr>
				<th>작성일</th>
				<td>${post.post_date}</td>
				<th>조회수</th>
				<td>${post.post_hit}</td>
			</tr>
			
		
		</table>
		<div class="align-center">
		<hr size="1" width="100%">
		<c:if test="${fn:endsWith(post.post_imgname,'.jpg') ||
					  fn:endsWith(post.post_imgname,'.JPG') ||				  
					  fn:endsWith(post.post_imgname,'.gif') ||				  
					  fn:endsWith(post.post_imgname,'.GIF') ||				  
					  fn:endsWith(post.post_imgname,'.png') ||				  
					  fn:endsWith(post.post_imgname,'.PNG')}">
			<img src="imageView.do?post_num=${post.post_num}" class="responsive-img">
		</c:if>
		</div>
		<div>${post.post_board}</div>
		<hr size="1" width="100%">
		<div class="align-center">
			<%--관리자와 작성자만 수정 삭제 버튼이 활성화 됨 --%>
	 		<c:if test="${user_num == post.mem_num || user_auth == 4}">
	 			<button type="button" class="btn btn-outline-success" onclick="location.href='postupdate.do?num=${post.post_num}'">글수정</button>
	 			<button type="button" class="btn btn-outline-success" onclick="location.href='postdelete.do?num=${post.post_num}'">글삭제</button>
			</c:if>
			<button type="button" class="btn btn-outline-success" onclick="location.href='postlist.do'">목록</button>
		</div>
</div>
</body>
</html>


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