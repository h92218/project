<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<style type="text/css">
	#re{
		width:50%;
	}
</style>
<div class="row" id="re">
<form:form path="update.do" commandName="memberVO" enctype="multipart/form-data" class="col s12" id="update_form">
	<form:hidden path="mem_num"/>
	<h4 class="center">정보 수정</h4>
	<ul>
		<li>
			<label for="detail_nick">닉네임</label>	
			<form:input path="detail_nick"/>
			<form:errors path="detail_nick"/>
		</li>
		<li>
			<label for="detail_cell">전화번호</label>	
			<form:input path="detail_cell"/>
			<form:errors path="detail_cell"/>
		</li>
		<li>
			<label for="detail_passwd">비밀번호</label>	
			<form:password path="detail_passwd"/>
			<form:errors path="detail_passwd"/>
		</li>
		<li>
			<label for="upload">프로필 사진</label>	
			<input type="file" name="upload" id="upload">
			<c:if test="${!empty memberVO.detail_img}">
			<span>[${memberVO.detail_img}] 파일이 등록되어있습니다.재 등록시 기존파일을 삭제됩니다.</span>	
			</c:if>
		</li>
		<li>
			<c:if test="${!empty memberVO.detail_img}">
				<img src="imageView.do?mem_num=${memberVO.mem_num}" id="rad" class="responsive-img">	
			</c:if>
		</li>
	</ul>
	<div class="center">
		<input type="submit" value="수정하기" class="btn">
		<input type="button" value="뒤로가기" class="btn" onclick="location.href='${pageContext.request.contextPath}/main/main.do'">
	</div>	
</form:form>
</div>
<script type="text/javascript">
	$('#update_form').submit(function(){
		if($('#detail_nick').val()==''){
			alert('닉네임을 입력하세요.');
			return;
		}
		if($('#detail_cell').val()==''){
			alert('전화번호를 입력하세요.');
			return;
		}
		if($('#detail_passwd').val()==''){
			alert('비밀번호를 입력하세요.');
			return;
		}
	});
</script>