<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/introduce.css">
<meta charset="UTF-8">
<title>fightclub 소개</title>

    <body>
   <div class="introduce_menu">
       <ul class="introduce_menu_list">
          <li><a href="${pageContext.request.contextPath}/main/introduce.do">++CLUB</a></li>
          <li><a href="${pageContext.request.contextPath}/main/introduce/fightclub.do">파이트클럽</a></li>
          <li><a href="${pageContext.request.contextPath}/main/introduce/membership.do">회원 멤버십</a></li>
       </ul>
   </div>
   <br>
  <p class="introduce_title"> ++CLUB의 파이트클럽 크루를 소개합니다.</p>
   <hr width="90%" color="green"><br>
   <img src="/club/resources/images/fight2.jpg"><br>
   <img src="/club/resources/images/fight1.png">
    <p style="text-align:center;">영화 "파이트 클럽" 중 </p><br>
   

	<div class="introduce_card_center">
    <div class="col s12 m6">
      <div class="card blue-grey darken-1">
        <div class="card-content white-text">
          <span class="card-title"><b>파이트 클럽 크루</b></span>
          <p>영화 "파이트 클럽"을 모티브로 하였습니다.<br>
          “위험한 세상속 내몸은 내가 지키자!”라는 취지로 시작된 파이트 클럽입니다.<br>
          권투 및 격투기를 연습하며 체력을 기르고 신체를 단련합니다. </p><br>
     
    ● 일시 : 매주 토요일 2:00pm~05:pm (매월 2회)<br>
    ● 기간 : 정해진 기간 없음<br>
     ● 장소 : ++CLUB 체육관<br>
   ● 내용 : 기초체력 단련 | 초보자를 위한 격투기 연습 | 스파링<br>
    ● 비용 : 월 2만원<br>
  

        </div>
        <div class="card-action">
          <a href="${pageContext.request.contextPath}/main/viewclubdetail.do?club_num=162"><b>참여 신청하러 가기</b></a>
        </div>
      </div>
    </div>
 </div>


</body>
</html>