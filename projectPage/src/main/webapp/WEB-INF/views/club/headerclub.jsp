<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
     <nav class="nav-extended">
    <div class="nav-wrapper light-green">
      <a href="${pageContext.request.contextPath }/main/main.do" class="brand-logo center" >++ CLUB</a>
      <a href="#" data-target="dropdown1" class="sidenav-trigger dropdown-trigger btn light-green" id="mobile-demo"><i class="material-icons">!</i></a>
	
	  <!-- Dropdown Structure -->
	  <ul id='dropdown1' class='dropdown-content'>
	  	<c:if test="${empty user_id}">
	    <li><a href="${pageContext.request.contextPath}/main/main.do">LOGIN</a></li>
	    </c:if>
	    <c:if test="${!empty user_id}">
	    <li><a href="${pageContext.request.contextPath}/main/logout.do">LOGOUT</a></li>
	   	</c:if>
	    <c:if test="${user_auth == 2 || user_auth == 3 || user_auth == 4}">
	    <li><a href="${pageContext.request.contextPath}/mypage/myPage.do">MY PAGE</a></li>
	    </c:if>
	    <c:if test="${user_auth == 5}">
	    <li><a onclick="M.toast({html: '간편로그인 회원은 MYPAGE열람이 불가합니다.'})">MY PAGE</a></li>
	    </c:if>
	     <c:if test="${user_auth==4}">
		<li><a href="${pageContext.request.contextPath}/main/manage_club.do">관리자페이지</a></li>
		</c:if>
	  </ul>

      <ul id="nav-mobile" class="right hide-on-med-and-down">
        <c:if test="${empty user_id}">
	    <li><a href="${pageContext.request.contextPath}/main/main.do">LOGIN</a></li>
	    </c:if>
	    <c:if test="${!empty user_id}">
	    <li><a href="${pageContext.request.contextPath}/main/logout.do">LOGOUT</a></li>
	   	</c:if>
	    <c:if test="${user_auth == 2 || user_auth == 3 || user_auth == 4}">
	    <li><a href="${pageContext.request.contextPath}/mypage/myPage.do">MY PAGE</a></li>
	    </c:if>
	    <c:if test="${user_auth == 5}">
	    <li><a onclick="M.toast({html: '간편로그인 회원은 MYPAGE열람이 불가합니다.'})">MY PAGE</a></li>
	    </c:if>
	     <c:if test="${user_auth==4}">
		<li><a href="${pageContext.request.contextPath}/main/manage_club.do">관리자페이지</a></li>
		</c:if>
      </ul>
    </div>
    <div class="nav-content light-green darken-2 center">
      <ul class="tabs tabs-transparent"> 
        <li class="tab"><a href="viewclub.do">전체 클럽</a></li>
        <li class="tab"><a href="clubgenre.do">장르별 클럽</a></li>
        <li class="tab"><a href="clubinterval.do">요일별 클럽</a></li>
        <li class="tab"><a href="${pageContext.request.contextPath}/main/introduce/fightclub.do">파이트클럽 크루</a></li>
        <c:if test="${user_auth >=3}"><li class="tab"><a href="boardclub.do">클럽 개설 제안</a></li></c:if>
      </ul>
    </div>
  </nav>
  <script
  src="https://code.jquery.com/jquery-3.5.1.js"
  integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc="
  crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>  
<script type="text/javascript">
document.addEventListener('DOMContentLoaded', function() {
    var elems = document.querySelectorAll('select');
    var instances = M.FormSelect.init(elems, options);
  });

  // Or with jQuery

  $(document).ready(function(){
    $('select').formSelect();
  });
  
  $('.dropdown-trigger').dropdown();
	document.addEventListener('DOMContentLoaded', function() {
		var elems = document.querySelectorAll('.modal');
		var instances = M.Modal.init(elems);
	});
  
</script>