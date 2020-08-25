<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>  
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<style type="text/css">
	#re{
		width:50%;
	}
</style>
<div class="row" id="re">
	<form:form class="col s12" action="register.do" commandName="memberVO" id="register_form" encType="multipart/form-data">
	<h4 class="center">회원가입</h4>
		<ul>
			<li>
				<label for="mem_id">아이디</label>
				<form:input path="mem_id"/>
				<input type="button" value="ID중복체크" id="confirmId" class="right btn">
				<img src="${pageContext.request.contextPath}/resources/images/ajax-loader.gif" width="16" height="16" style="display:none;" id="loading">
				<span id="message_id"></span>
				<form:errors path="mem_id" cssClass="error-color"/>
			</li>
			<li>
				<label for="detail_name">이름</label>
				<form:input path="detail_name"/>
				<span id="message_name"></span>
				<form:errors path="detail_name" cssClass="error-color"/>
			</li>
			<li>
				<label for="detail_passwd">비밀번호</label>
				<form:password path="detail_passwd"/>
				<form:errors path="detail_passwd" cssClass="error-color"/>
			</li>
			<li>
				<label for="detail_nick">별명</label>
				<form:input path="detail_nick"/>
			</li>
			<li>
				<label for="detail_cell">전화번호</label>
				<form:input path="detail_cell"/>
				<form:errors path="detail_cell" cssClass="error-color"/>
			</li>
			<li>
				<label for="detail_email">이메일</label>
				<input type="email" id="detail_email" name="detail_email">
				<input type="button" value="인증번호 발송" id="check_email" class="right btn">
				<span id="message_email"></span>
				<form:errors path="detail_email" cssClass="error-color"/>
			</li>
			<li>
				<label for="check_emailcode">인증번호 입력</label>
				<input type="text" id="check_emailcode" name="check_emailcode">
				<input type="button" value="인증번호 확인" id="check_code" class="right btn">
				<span id="message_code"></span>
			</li>
			<li>
				<label for="upload">프로필 사진</label>
				<input type="file" name="upload" id="upload">
			</li>
		</ul>
		<div class="center">
			<input type="submit" value="회원 가입" class="btn">
			<input type="button" value="뒤로 가기" class="btn" onclick="location.href='${pageContext.request.contextPath}/main/main.do'">
		</div>
	</form:form>
</div>	
<script type="text/javascript">
	var checkId = 0;
	var checkEmail = 0;
	
	//아이디 중복 체크
	$('#confirmId').click(function(){
			 if($.trim($('#mem_id').val())==''){
				$('#message_id').css('color','red').text('아이디를 입력하세요.');
				return;
			}else{
				
			$('#message_id').text('');//메시지 초기화
			$('#loading').show();//로딩 이미지 노출
			
			$.ajax({
				url:'confirmId.do',
				type:'post',
				data:{mem_id:$('#mem_id').val()},
				dataType:'json',
				cache:false,
				timeout:30000,
				success:function(data){
					$('#loading').hide();//로딩 이미지 감추기
					if(data.result == 'idNotFound'){
						$('#message_id').css('color', '#000').text('등록가능ID');
						checkId = 1;
					}else if(data.result == 'idDuplicated'){
						$('#message_id').css('color', 'red').text('중복된ID');
						checkId = 0;
					}else{
						checkId = 0;
						alert('ID중복체크 오류');
					}
				},
				error:function(){
					checkId=0;
					$('#loading').hide();//로딩 이미지 감추기
					alert('네트워크 오류 발생');
				}
			});
			}
		});
	

	//아이디 중복 안내 메시지 초기화 및 아이디 중복 값 초기화
	$('#register_form #mem_id').keydown(function() {
		checkId = 0;
		$('#message_id').text('');
	});

	//submit 이벤트 발생시 아이디 중복 체크 여부 확인
	$('#register_form').submit(function() {
		if (checkId == 0) {
			$('#message_id').css('color', 'red').text('아이디 중복 체크 필수 !');
			if ($('#mem_id').val() == '') {
				$('#mem_id').focus();
			}
			return false;
		}
	});
	
	//이메일 체크
	$('#check_email').click(function(){
		
		if($('#detail_email').val() == ''){
			$('#message_email').css('color','red').text('이메일을 입력하세요.');
			return;
		}
		if($('#mem_name').val() == ''){
			$('#message_name').css('color','red').text('이름을 입력하세요.');
			return;
		}
		$('#message_email').text('');//메세지 초기화작업
		$('#message_name').text('');//메세지 초기화작업
		
		$.ajax({
			url:'emailcheck.do',
			type:'post',
			data:{name:$('#detail_name').val(), send_email:$('#detail_email').val()},
			dataType : 'json',
			cache : false,
			timeout : 30000,
			success:function(data){
				if(data.result == 'success'){
					$('#message_email').css('color','#000').text('인증번호가 발송되었습니다.');
					checkEmail = 1;
				} else if(data.result == 'failure'){
					$('#message_email').css('color','red').text('인증번호 발송 오류.');
					checkEmail = 0;
				} else{
					checkEmail = 0;
					alert('인증번호 발송 오류.');
				}
			},
			error : function(){
				checkEmail = 0;
				alert('네트워크 오류발생!');
			}
		});
		
	});
	//submit 이벤트 발생시 인증번호 입력 체크 여부 확인
	$('#register_form').submit(function(){
		if (checkEmail == 0){
			$('#message_email').css('color','red').text('이메일 인증 필수!');
			if($('#detail_email').val() == ''){
				$('#detail_email').focus();
			}
			return false;
			
		}
		
	});
	$('#check_code').click(function(){
		if($('#check_emailcode').val() == ''){
			$('#check_emailcode').focus();
			$('#message_code').css('color','red').text('인증번호를 입력하세요.');
			return false;
		}
		
		$.ajax({
			url:'emailcodecheck.do',
			type:'post',
			data:{emailcode:$('#check_emailcode').val()},
			dataType : 'json',
			cache : false,
			timeout : 30000,
			success:function(data){
				if(data.result == 'good'){
						$('#message_code').css('color','#000').text('인증번호가 일치합니다.');
						$('check_emailcode').val().disabled();
						checkEmail = 1;
				} else if(data.result == 'fail'){
					$('#message_code').css('color','red').text('인증번호 불일치.');
					checkEmail = 0;
				} else{
					checkEmail = 0;
					alert('인증번호 발송 오류.');
				}
			},
			error : function(){
				checkEmail = 0;
				alert('네트워크 오류발생!');
			}
		});
	});
	
	
</script>