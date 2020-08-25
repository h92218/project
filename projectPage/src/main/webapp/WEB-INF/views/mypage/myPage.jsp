<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<ul id="slide-out" class="sidenav">
	<li><a class="waves-effect" href="${pageContext.request.contextPath}/mypage/local.do">장소 찾기</a></li>
	<li><div class="divider"></div></li>
	<li><a class="waves-effect" href="${pageContext.request.contextPath}/mypage/update.do">정보 수정</a></li>
	<li><div class="divider"></div></li>
	<li><a class="waves-effect" href="${pageContext.request.contextPath}/mypage/delete.do">회원 탈퇴</a></li>
	<li><div class="divider"></div></li>
	<li><a class="waves-effect" href="${pageContext.request.contextPath}/mypage/point.do">포인트</a></li>
	<li><div class="divider"></div></li>
	<li><a class="waves-effect" href="${pageContext.request.contextPath}/clubmanage/myClub.do">나의클럽목록</a></li>
	<li><div class="divider"></div></li>
	<li><a class="waves-effect" href="${pageContext.request.contextPath}/clubmanage/leaderClub.do">내가 개설한 클럽 목록</a></li>
	<li><div class="divider"></div></li>
</ul>
<div class="col s12 m8 offset-m2 l6 offset-l3">
	<div class="card-panel grey lighten-5 z-depth-1">
		<div class="row valign-wrapper">
			<div class="col s2 center">
			<c:if test="${
							 fn:endsWith(member.detail_img, '.jpg') ||			 
							 fn:endsWith(member.detail_img, '.JPG') ||			 
							 fn:endsWith(member.detail_img, '.gif') ||			 
							 fn:endsWith(member.detail_img, '.GIF') ||			 
							 fn:endsWith(member.detail_img, '.png') ||			 
							 fn:endsWith(member.detail_img, '.PNG')
			 				}">
				<img src="imageView.do?mem_num=${member.mem_num}" class="responsive-img">	
			</c:if> 
			
			</div>
			<div class="col s10">
			<h3>${member.detail_name}님의 정보</h3>
			<p>
				<span class="black-text">
				<table class="highlight">
						<tbody>
							<tr>
								<td>아이디 -</td>
								<td>${member.mem_id}</td>
							</tr>
							<tr>
								<td>이메일 -</td>
								<td>${member.detail_email}</td>
							</tr>
							<tr>
								<td>전화번호 -</td>
								<td>${member.detail_cell}</td>
							</tr>
							<tr>
								<td>닉네임 -</td>
								<td>${member.detail_nick}</td>
							</tr>
						</tbody>
					</table>
				</span><br>
				<a href="#" data-target="slide-out" class="sidenav-trigger btn right">상세 메뉴</a> 
			</div>
		</div>
	</div>
</div>
<script type="text/javascript">
	document.addEventListener('DOMContentLoaded', function() {
		var elems = document.querySelectorAll('.sidenav');
		var instances = M.Sidenav.init(elems, options);
	});

	// Initialize collapsible (uncomment the lines below if you use the dropdown variation)
	// var collapsibleElem = document.querySelector('.collapsible');
	// var collapsibleInstance = M.Collapsible.init(collapsibleElem, options);

	// Or with jQuery
	
	$(document).ready(function() {
		$('.sidenav').sidenav();
	});
</script>