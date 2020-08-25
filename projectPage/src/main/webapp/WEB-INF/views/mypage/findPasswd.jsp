<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<style type="text/css">
	#re{
		width:50%;
	}
</style>  
<div class="row" id="re">
<form:form action="findPasswd.do" class="col s12" id="resultPasswd_form" commandVO="memberVO">
	<h3 class="center">비밀번호 찾기</h3>
	<ul>
		<li>
			<label for="mem_id">아이디</label>
			<input type="text" id="mem_id" name="mem_id">
			<input type="button" value="아이디확인" id="checkId" class="right btn">
			<img src="${pageContext.request.contextPath}/resources/images/ajax-loader.gif" width="16" height="16" style="display:none;" id="loading">
			<span id="message_id"></span>
		</li>
		<li>
			<label for="detail_name">이름</label>
			<input type="text" id="detail_name" name="detail_name">
		</li>
		<li>
			<label for="detail_email">이메일</label>
			<input type="text" id="detail_email" name="detail_email">
			<input type="button" value="인증번호 발송" id="check_email" class="right btn">
			<span id="message_email"></span>
		</li>
		<li>
			<label for="check_emailcode">인증번호 입력</label>
			<input type="text" id="check_emailcode" name="check_emailcode">
			<input type="button" value="인증번호 확인" id="check_code" class="right btn">
			<span id="message_code"></span>
		</li>
		<li>
			<p>
			<p>
		</li>
		<li>
			<div class="card-panel teal lighten-2 center">
			아이디 중복체크와 이메일 인증번호가 일치해야 비밀번호를 확인하실 수 있습니다.
			</div>
		</li>
		<li>
			<span id="result_passwd"></span>
		</li>
	</ul>
	<br>
		<div class="center">
			<input type="submit" value="비밀번호 찾기" class="btn">
			<input type="button" value="홈으로" class="btn" onclick="location.href='${pageContext.request.contextPath}/main/main.do'">
			<br>
		</div>
</form:form>		
</div> 
<script src="https://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>
<script type="text/javascript">
	var check1 = 0;
	var checkEmail = 0;
	
	//아이디 존재여부 체크
	$('#checkId').click(function(){
		if($('#mem_id').val()==''){
			$('#message_id').css('color','red').text('아이디를 입력하세요.');
			return;
		}
		$('#message_id').text('');//아이디 메세지 초기화
		
		$.ajax({
			url : 'findPasswdid.do',
			type : 'post',
			data : {id : $('#mem_id').val()},
			dataType : 'json',
			cache : false,
			timeout : 30000,
			success : function(data){
				if(data.result=='idDuplicated'){
					$('#message_id').css('color','#000').text('아이디 체크완료!');
					check1 = 1;
				}else if(data.result=='idNotFound'){
					$('#message_id').css('color','red').text('없는 아이디입니다.');
					check1 = 0;
				}else{
					check1 = 0;
					alert('아이디 체크 오류');
				}
			},
			error:function(){
				check1 = 0;
				alert('네트워크 오류발생!');
			}
		});
	});
	
	$('#mem_id').keydown(function(){
		check1 = 0;
		$('#message_id').text('');
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
				} else if(data.result == 'failure'){
					$('#message_email').css('color','red').text('인증번호 발송 오류.');
				} else{
					alert('인증번호 발송 오류.');
				}
			},
			error : function(){
				alert('네트워크 오류발생!');
			}
		});
		
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
	
	//submit 이벤트 발생시 인증번호 입력 체크 여부 확인
	$('#resultPasswd_form').submit(function(){
		if (checkEmail == 0){
			$('#message_email').css('color','red').text('이메일 인증 필수!');
			if($('#detail_email').val() == ''){
				$('#detail_email').focus();
			}
			return false;
		}else{
			alert('임시 비밀번호가 발송되었습니다.');
			checkEmail = 1;
		}
	});
	
	
</script>