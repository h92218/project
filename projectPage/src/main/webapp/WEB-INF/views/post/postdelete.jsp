<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글 삭제</title>
</head>
<body>
<div class="page-main">
	<h2>글 삭제 </h2>
	<form:form actionin="delete.do" commandName="postVO">
		<form:hidden path="post_num"/>
		
		<div class="write_button">
			<button type="submit" class="btn btn-outline-success">삭제</button>
			<button type="button" class="btn btn-outline-success" onclick="location.href='postlist.do'">목록</button>
		</div>
	</form:form>
</div>
</body>
</html>