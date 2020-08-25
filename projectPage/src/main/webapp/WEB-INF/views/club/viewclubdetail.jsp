<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<style type="text/css">
#clubdetail {
	padding: 0 50px 0 50px;
}
</style>
<div id="clubdetail" class="col s12 m8 offset-m2 l6 offset-l3">
	<h4>클럽 상세 페이지</h4>
	<div class="row valign-wrapper">
		<div class="col s2">
			<c:if
				test="${fn:endsWith(club.filename, '.jpg') ||
				  fn:endsWith(club.filename, '.JPG') ||
				  fn:endsWith(club.filename, '.gif') ||
				  fn:endsWith(club.filename, '.GIF') ||
				  fn:endsWith(club.filename, '.png') ||
				  fn:endsWith(club.filename, '.PNG') }">
				<img src="imageView.do?club_num=${club.club_num }"
					class="responsive-img">
			</c:if>

		</div>
		<div id="detail-table" class="col s10">
			<table>
				<tbody>
					<tr>
						<td>클럽 명 :</td>
						<td>${club.club_name}</td>
					</tr>
					<tr>
						<td>영화 장르 :</td>
						<td>${club.club_genre}</td>
					</tr>
					<tr>
						<td>모임 장소 :</td>
						<td>${club.club_loc}</td>
					</tr>
					<tr>
						<td>모임 시간 :</td>
						<td>${club.club_time}</td>
					</tr>
					<tr>
						<td>시작 날짜 :</td>
						<td>${club.club_start}</td>
					</tr>
					<tr>
						<td>종료 날짜 :</td>
						<td>${club.club_end}</td>
					</tr>
					<tr>
						<td>모임 간격 :</td>
						<td>${club.club_interval}</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
	<p>
		<label>모임 내용</label> <br> ${club.club_detail}
	</p>
	<div class="center">
		<c:if test="${user_auth == 4}">
			<input type="button" class="btn purple lighten-5 purple-text text-darken-4" value="개설상태변경"
				onclick="location.href='boardclubmodify.do?club_num=${club.club_num}'">
		</c:if>
		<button data-target="modal1" class="btn modal-trigger purple lighten-5 purple-text text-darken-4">참여하기</button>
		<div id="modal1" class="modal">
			<div class="modal-content">
				<h4>클럽 참여 신청</h4>
				<p><p>
				<img src="https://cdn.pixabay.com/photo/2017/11/24/10/43/admission-2974645_960_720.jpg"
					class="responsive-img" width="500">
				<p><b>[${club.club_name}]</b>클럽 참여를 원하시는 분은 하단의 '참여하기' 버튼을 눌러주세요!!<br>
				참여하기 버튼을 누르시면 클럽장이 회원님의 연락처를 열람할 수 있습니다.<br>
				이에 동의하시면 버튼을 눌러주세요.</p>
			</div>
			<c:if test="${user_auth == 2 || user_auth == 3 || user_auth == 4}">
			<a href="${pageContext.request.contextPath}/main/checkClub.do?club_num=${club.club_num}" id="apply" class="modal-close waves-effect waves-green btn-flat">참여하기</a>
			</c:if>
			<c:if test="${empty user_id}">
			<a onclick="M.toast({html: '로그인후 이용해주세요.'})" class="modal-close waves-effect waves-green btn-flat">참여하기</a>
			</c:if>
			<c:if test="${user_auth == 5}">
			<a onclick="M.toast({html: '++club 일반회원으로 회원가입후 이용이 가능한 서비스입니다.'})" class="modal-close waves-effect waves-green btn-flat">참여하기</a>
			</c:if>
			
			<a href="#" class="modal-close waves-effect waves-green btn-flat">닫기</a>
		</div>
		<input type="button" class="btn purple lighten-5 purple-text text-darken-4" value="돌아가기"
				onclick="location.href='viewclub.do'">
	</div>
</div>
<script>

document.addEventListener('DOMContentLoaded', function() {
    var elems = document.querySelectorAll('.modal');
    var instances = M.Modal.init(elems, options);
  });

  // Or with jQuery

  $(document).ready(function(){
    $('.modal').modal();
  });
  
  
  $('#apply').click(function(){
	 $.ajax({
		url:'checkClub.do',
		type:'post',
		data: {club_num : ${club.club_num}},
		dataType: 'json',
		cache: false,
		success:function(data){
			if(data.result=='success'){
				location.href='${pageContext.request.contextPath}/clubmanage/myClub.do';
			}else if(data.result=='error'){
				alert('이미 신청하신 클럽입니다!!');
				history.go(0);
			}
		},
		error:function(){
			alert('클럽 신청 서비스 오류 발생');
			return false;
		}
	 });
  });
</script>
