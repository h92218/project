<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style type="text/css">
	#st{
		width:50%;
	}
	
</style>
<script type="text/javascript">
	$(document).ready(function(){
		$('#naver_login').click(function(){		
			open('../mypage/naver_login.do','confirm','toolbar=no,location=no,status=no,scrollbars=no,resizable=no,width=500,height=300');
		});
	});
</script>
     <nav class="nav-extended">
    <div class="nav-wrapper light-green">
      <a href="${pageContext.request.contextPath}/main/main.do" class="brand-logo center" >++ CLUB</a>
      <a href="#" data-target="dropdown1" class="sidenav-trigger dropdown-trigger btn light-green" id="mobile-demo"><i class="material-icons">!</i></a>
    
      
		  <!-- Dropdown Structure -->
	  <ul id='dropdown1' class='dropdown-content '>
	  	<c:if test="${empty user_id}">
	    <li><a href="#modal1" class="modal-trigger">Login</a></li>
	    </c:if>
	    <c:if test="${!empty user_id}">
	    <li><a href="${pageContext.request.contextPath}/main/logout.do">LogOut</a></li>
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
        <li><a class="waves-effect waves-light btn modal-trigger light-green" href="#modal1">LOGIN</a></li>
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
    <!-- 로그인  -->
    <div id="modal1" class="modal modal-fixed-footer">
	    <div class="modal-content">
			<div class="row">
				<form class="col s12" action="mainLogin.do" method="post" id="login_check1">
				<div class="nav-wrapper light-green">
				<a href="#" class="brand-logo center">LOGIN</a>
				</div>
					<div class="row">
						<div class="input-field col s12">
							<input placeholder="아이디를 입력하세요!" type="text" id="mem_id1" name="mem_id1" class="validate"/> 
							<span id="msg_id"></span>
						</div>
					</div>					
					<div class="row">
						<div class="input-field col s12">
							<input placeholder="비밀번호를 입력하세요!" type="password" id="detail_passwd1" name="detail_passwd1" class="validate"/> 
							<span id="msg_passwd"></span>
						</div>
					</div>
					<input type="button" value="취소" class="modal-close btn" onclick="location.href='${pageContext.request.contextPath}/main/main.do'">
					<input type="submit"  value="로그인" class="modal-close btn"> 
					<input type="button" value="네이버로 로그인" id="naver_login" class="modal-close btn">
					<input type="button" value="회원가입" class="modal-close btn" onclick="location.href='${pageContext.request.contextPath}/mypage/register.do'">
					<input type="button" value="비밀번호 찾기" class="modal-close btn" onclick="location.href='${pageContext.request.contextPath}/mypage/findPasswd.do'">
				</form>
			</div>
			<div class="row">
			<div class="card-panel teal lighten-2">회원가입을 하시면 ++CLUB 의 모임에 참가 하실수 있습니다.</div>
			</div>
		</div>
    </div> 
    <!-- 로그인  -->
    <div class="nav-content light-green darken-2 center">
      <ul class="tabs tabs-transparent"> 
        <li class="tab"><a href="${pageContext.request.contextPath}/main/main.do">홈</a></li>
        <li class="tab"><a href="${pageContext.request.contextPath}/main/introduce.do">소개</a></li>
        <li class="tab"><a href="${pageContext.request.contextPath}/main/viewclub.do">클럽 현황</a></li>
        <c:if test="${!empty user_id}"> 
        <li class="tab"><a href="${pageContext.request.contextPath}/mypage/local.do">장소찾기</a></li>
        </c:if>
        <li class="tab"><a href="${pageContext.request.contextPath}/movieSearch/movieSearchForm.do">영화찾기</a></li>
        <li class="tab"><a href="${pageContext.request.contextPath}/post/postlist.do">후기</a></li>
        <li class="tab"><a href="${pageContext.request.contextPath}/ClubQA/QAmainForm.do">Q & A</a></li>
        <li class="tab"><a href="${pageContext.request.contextPath}/notice/list.do">공지사항</a></li>
      </ul>
    </div>
  </nav>
<script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
<script type="text/javascript">

	$('.dropdown-trigger').dropdown();
	document.addEventListener('DOMContentLoaded', function() {
		var elems = document.querySelectorAll('.modal');
		var instances = M.Modal.init(elems);
	});
	
	var checkLogin = 0;
	
	$('#login_check1').submit(function(){
		if($('#mem_id1').val() == ''){
			$('#msg_id').css('color','red').text('아이디를 입력하세요.')
		}
		if($('#detail_passwd1').val() == ''){
			$('#msg_passwd').css('color','red').text('비밀번호를 입력하세요.')
		}
		
		$('#msg_id').text('');
		$('#msg_passwd').text('');
		
		$.ajax({
			url:'${pageContext.request.contextPath}/main/mainLogin.do',
			type:'post',
			data:{mem_id1 : $('#mem_id1').val(), 
				detail_passwd1 : $('#detail_passwd1').val()},
			dataType:'json',
			cache:false,
			timeout:30000,
			success:function(data){
				if(data.result == 'Check'){
					checkLogin = 1;
					location.href='${pageContext.request.contextPath}/main/main.do';
					alert('로그인 성공!');
				}else if(data.result == 'NotCheck'){
					alert('아이디 또는 비밀번호가 일치하지 않습니다.');
					checkLogin = 0;
				}else if(data.result == 'emptyCheck'){
					alert('아이디 또는 비밀번호를 입력하세요.');
					checkLogin = 0;
					history.go(0);
					return;
				}else{
					alert('로그인 체크 오류!');
					checkLogin = 0;
					location.href='${pageContext.request.contextPath}/main/main.do';
				}
			},
			error:function(){
				checkLogin = 0;
				alert('네트워크 오류발생!!');
				location.href='${pageContext.request.contextPath}/main/main.do';
			}
		});
		if(checkLogin == 0){
			history.go(0);
		}else if(checkLogin == 1){
			location.href='${pageContext.request.contextPath}/main/main.do';
			alert('로그인 성공!');
		}
	});
	
</script>




  








