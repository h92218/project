<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/manager.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>
<div class="manager_menu">
       <ul class="manager_menu_list">
          <li><a href="${pageContext.request.contextPath}/main/manage_club.do">클럽개설신청 관리</a></li>
          <li><a href="${pageContext.request.contextPath}/main/manage_member.do">회원 관리</a></li>
          <li><a href="${pageContext.request.contextPath}/clubmanage/leaderClub.do">클럽 출결 관리</a></li>
          <li><a href="${pageContext.request.contextPath}/main/EditPicture.do">메인 이미지/텍스트 변경</a></li>
       </ul>
   </div>
   <br>
  <p class="manager_title"> 클럽 개설 신청 관리 페이지</p>
   <hr width="90%" color="green"><br><br>
   
         
     
   
   <div class="manage_club_list">
    <h5><b>승인 대기중인 신청</b></h5><br>

    <c:if test="${count1 == 0}">
	<div><br>승인 대기중인 신청이 없습니다.</div>
	</c:if>
	<c:if test="${count1 > 0}">
	<table>
	 <thead>
          <tr>
              <th>글번호</th>
              <th>작성자 ID</th>
              <th>제목</th>
              <th>클럽 이름</th>
              <th>작성일</th>
          </tr>
        </thead>
        <tbody>
	<c:forEach var="manageClub" items="${list1}">
          <tr>
            <td>${manageClub.club_num}</td>
            <td>${manageClub.mem_id}</td>
            <td><a href="manageClubDetail.do?num=${manageClub.club_num}">${manageClub.club_title}</a></td>
            <td>${manageClub.club_name}</td>
            <td>${manageClub.club_date}</td>
          </tr>
		</c:forEach>
		</tbody>
		</table>
	</c:if>	
	</div><br>
	<div style="text-align:center;">${pagingHtml1}</div>
	<br><br><br><hr width=80% color=CCCCCC><br><br><br>
	
	<div class="manage_club_list">
	<h5><b>승인된 신청</b></h5><br>
	<c:if test="${count2 == 0}">
	<div><br>승인된 신청이 없습니다.</div>
	</c:if>
	<c:if test="${count2 > 0}">
	<table>
	 <thead>
          <tr>
              <th>글번호</th>
              <th>작성자 ID</th>
              <th>제목</th>
              <th>클럽 이름</th>
              <th>작성일</th>
          </tr>
        </thead>
        <tbody>
	<c:forEach var="manageClub" items="${list2}">
          <tr>
            <td>${manageClub.club_num}</td>
            <td>${manageClub.mem_id}</td>
            <td><a href="manageClubDetail.do?num=${manageClub.club_num}">${manageClub.club_title}</a></td>
            <td>${manageClub.club_name}</td>
            <td>${manageClub.club_date}</td>
          </tr>
		</c:forEach>
		</tbody>
		</table>
	</c:if>
	</div><br>
	<div style="text-align:center;">${pagingHtml2}</div>
	<br><br><br><hr width=80% color=CCCCCC><br><br><br>
	
	<div class="manage_club_list">	
	<h5><b>반려된 신청</b></h5><br>
	<c:if test="${count3 == 0}">
	<div><br>반려된 신청이 없습니다.</div>
	</c:if>
	<c:if test="${count3 > 0}">
	<table>
	 <thead>
          <tr>
              <th>글번호</th>
              <th>작성자 ID</th>
              <th>제목</th>
              <th>클럽 이름</th>
              <th>작성일</th>
          </tr>
        </thead>
        <tbody>
	<c:forEach var="manageClub" items="${list3}">
          <tr>
            <td>${manageClub.club_num}</td>
            <td>${manageClub.mem_id}</td>
            <td><a href="manageClubDetail.do?num=${manageClub.club_num}">${manageClub.club_title}</a></td>
            <td>${manageClub.club_name}</td>
            <td>${manageClub.club_date}</td>
          </tr>
		
		</c:forEach>
		</tbody>
		</table>
	</c:if>
	</div><br>
	<div style="text-align:center;">${pagingHtml3}</div>
<br><br><br><br>
</body>
</html>