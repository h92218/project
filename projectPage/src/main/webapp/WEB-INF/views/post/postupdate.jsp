<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
.page-menu {
	width: 60%;
	margin: 0 auto;
}

.write_button {
	margin: 0 auto;
	float: right;
}

.align-center {
	margin-top: 2rem;
	text-align: center;
}

.table-bordered th {
	 border-color: green !important;
	 text-align:center;
}

.table-bordered td {
    border-color: green !important;
    color: black !important;
}

.table-bordered td a, .table-bordered th a{
    color: black !important;
}


</style>

<div class="page-menu">
<br><br>
	<h3>글 수정</h3>
	<form:form action="postupdate.do" enctype="multipart/form-data"
		commandName="postVO" class="write_form">
		<form:hidden path="post_num" />

		<div class="write_button">
			<button type="submit" class="btn btn-outline-success">수정 완료</button>
			<button type="button" class="btn btn-outline-success"
				onclick="location.href='postlist.do'">목록</button>
		</div>

		<table id="postWrite" class="table table-bordered">
			<tbody>
				<tr>
					<th scope="row"><label for="category">게시물 유형</label></th>
					<td scope="row">

						<p>
							<label> 
							<input name="post_category" type="radio" value="join" />
						 	<span>참여 후기</span>
						 	</label> 
						 	<label> 
						 	<input name="post_category" type="radio" value="movie" />
						 	<span>영화 후기</span>
						 	</label>
							 <c:if test="${user_auth == 4}">
						 	<label>
						 	<input name="post_category" type="radio" value="photo" />
						 	<span>사진 올리기</span>
						 	</label>	
						 	</c:if>
						 </p>
						<form:errors path="post_category" class="text-danger" />
					</td>
				</tr>
				<tr>
					<th scope="row"><label for="title">제목</label></th>
					<td scope="row"><form:input path="post_title"
							class="post_title" />
						<form:errors path="post_title" class="text-danger" /></td>
				</tr>
				<tr>
					<th scope="row"><label for="title">내용</label></th>
					<td scope="row"><form:textarea path="post_board"
							class="form-control" rows="10" placeholder=" 내용을 입력해주세요" />
						<form:errors path="post_board" class="text-danger" /></td>
				</tr>
				<tr>
					<th scope="row"><label for="upload">파일 업로드</label></th>
					<td class="post_img"><input type="file" name="upload"></td>
					<c:if test="${!empty postVO.post_imgname}">
						<br>
						<span class="align-center"><h6>
								<p class="text-danger">(${postVO.post_imgname})파일이 등록되어
									있습니다.<br> 다시 업로드 하면 기존 파일은 삭제됩니다.</p>
							</h6></span>
					</c:if>
				</tr>
			</tbody>
		</table>
	</form:form>
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

