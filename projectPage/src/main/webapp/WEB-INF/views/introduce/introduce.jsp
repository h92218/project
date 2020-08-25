<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/introduce.css">
<meta charset="UTF-8">
<title>++CLUB 소개</title>

    <body>
   <div class="introduce_menu">
       <ul class="introduce_menu_list">
          <li><a href="${pageContext.request.contextPath}/main/introduce.do">++CLUB</a></li>
          <li><a href="${pageContext.request.contextPath}/main/introduce/fightclub.do">파이트클럽</a></li>
          <li><a href="${pageContext.request.contextPath}/main/introduce/membership.do">회원 멤버십</a></li>
       </ul>
   </div>
   <br>
  <p class="introduce_title"> ++CLUB을 소개합니다.</p>
   <hr width="90%" color="green"><br>
   
<img src="/club/resources/images/talk.png"><br>

	<div class="introduce_card_center">
    <div class="col s12 m6">
      <div class="card blue-grey darken-1">
        <div class="card-content white-text">
          <span class="card-title"><b>++CLUB</b></span>
          <p>
          <h6><b>영화를 사랑하고 일상을 사랑하는 사람들의 모임</b></h6>
          	영화에 나오는 다양한 장면들의 주인공이 되거나 <br>
          	한 번쯤 해보고 싶었던 활동들을 해보거나, 눈여겨 봤던 장면들에 대해 이야기해보세요<br>
          	함께 영화를 봐도 좋고 영화를 만들어도 좋습니다. 무엇이든지 ++CLUB에서 맘껏 즐기세요^^
          </p>

        </div>
        <div class="card-action">
          <a href="viewclub.do"><b>클럽참여 신청하러 가기</b></a>
        </div>
      </div>
    </div>
 </div>
</body>
</html>