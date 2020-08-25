<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.lang.String" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">
<script src="https://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>

<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>

</head>
<body>
<nav class="nav-extended">

<!--  헤더 -->
    <div class="nav-wrapper light-green">
      <a href="#" class="brand-logo center" >++ CLUB</a>
    
    </div>
   
    <div class="nav-content light-green darken-2 center">
      <ul class="tabs tabs-transparent"> 
        <li class="tab"><a href="#">홈</a></li>
        <li class="tab"><a href="#">소개</a></li>
        <li class="tab"><a href="#">클럽 현황</a></li>

        <li class="tab"><a href="#">장소찾기</a></li>

        <li class="tab"><a href="#">영화찾기</a></li>
        <li class="tab"><a href="#">후기</a></li>
        <li class="tab"><a href="#">Q & A</a></li>
        <li class="tab"><a href="#">공지사항</a></li>
      </ul>
    </div>
    </nav>
    <!-- 헤더끝 -->
    <div class="slider">
	<ul class="slides">
		<li><img src="<%=request.getParameter("filename")%>">
			<div class="caption center-align">
				<h3><span class="white-text text-darken-2">Hello, We Are ++CLUB!</span></h3>
				<h5 class="white-text text-darken-2">++CLUB 에 오신것을 환영합니다!!</h5>
			</div></li>
			
		<li><img src="<%=request.getParameter("filename")%>">	
			<div class="caption right-align">
				<h3>현재 진행중인 다양한 모임에 참석하세요!</h3>
				<h5 class="light grey-text text-lighten-3"><a href="#">참여하러가기</a></h5>
			</div></li>
			
		<li> <img src="<%=request.getParameter("filename")%>">
			<div class="caption right-align">
				<h3>포인트를 쌓아 우수회원이 되어 나만의 모임을 만들수 있습니다!</h3>
				<h5 class="light grey-text text-lighten-3"><a href="#">회원 멤버십보러가기</a></h5>
			</div></li>
		<li> <img src="<%=request.getParameter("filename")%>">
			<div class="caption center-align">
				<h4><span class="white-text text-darken-2">지금 바로,</span></h4>
				<h4 class="light grey-text text-lighten-3">++CLUB에서 다양한 사람들과 모임을 가져보세요 :-)</h4>
			</div></li>
	</ul></div>
     
  
  <script data-cfasync="false" data-tockify-script="embed" src="https://public.tockify.com/browser/embed.js"></script>
  <script type="text/javascript">
document.addEventListener('DOMContentLoaded', function() {
    var elems = document.querySelectorAll('.slider');
    var instances = M.Slider.init(elems, options);
  });

  // Or with jQuery

  $(document).ready(function(){
    $('.slider').slider();
  });
  </script>
</body>
</html>