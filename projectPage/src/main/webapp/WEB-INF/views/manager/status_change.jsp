<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<div style="padding:20px 20px 20px 50px; border:1px solid;border-color:#009900; width:35%;margin:50px auto;" >
클럽의 승인상태가 '
<% 
String select=request.getParameter("select_status");


if(select.equals("1")){
	out.println("미승인");
}else if(select.equals("2")){
	out.println("승인");
}else if(select.equals("3")){
	out.println("반려");
}

%>' 으로 변경되었습니다. <br>
</div>
<div style="display:block;margin:0 auto;">
<a class="waves-effect waves-light btn" href="manage_club.do" >목록으로</a>
</div>
</body>
</html>