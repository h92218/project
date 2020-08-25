<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<nav class="nav-extended">
	<div class="nav-wrapper light-green">
		<a href="#" class="brand-logo center">클럽 관리</a>
	</div>
	<div class="nav-content light-green darken-2 center">
		<ul class="tabs tabs-transparent">
			<li><a href="${pageContext.request.contextPath}/main/main.do">홈</a></li>
			<c:if test="${!empty user_id}">
      		<li><a onclick="M.toast({html: '로그 아웃 되었습니다.'})" href="${pageContext.request.contextPath}/main/logout.do">LOGOUT</a></li>
      	    </c:if>
			<c:if test="${user_auth == 2 || user_auth == 3 || user_auth == 4}">
	   		<li><a href="${pageContext.request.contextPath}/mypage/myPage.do">MY PAGE</a></li>
	    	</c:if>
		</ul>
	</div>
</nav>
<script type="text/javascript">
document.addEventListener('DOMContentLoaded', function() {
    var elems = document.querySelectorAll('.dropdown-trigger');
    var instances = M.Dropdown.init(elems, options);
  });
</script>











