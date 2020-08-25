<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	session.invalidate();
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>네이버 로그아웃</title>
<script type="text/javascript">
	window.onload=function(){
		location.href='../main/main.do';
	};
</script>
</head>
<body>
<iframe src="http://nid.naver.com/nidlogin.logout" style="width:0;height:0"></iframe>
</body>
</html>