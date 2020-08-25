<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>    

<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/js/jquery-3.5.0.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/js/board.reply.js"></script>
	
<!-- 질문 상세페이지  -->
<form:form action="QAlist_detial.do" enctype="multipart/form-data"
	commandName="clubQAVO">
	<div class="QAlist_detail">
		<div class="QAlist_detail_header">
			<h4>${clubqa.qa_title}</h4>
		</div>
		<table class="QAlist_detail_table" frame="void">
			<tr>
				<th>작성자</th>
				<td width="250">${clubqa.mem_id}</td>
				<th style="border-left: thin solid gray;">등록일</th>
				<td>${clubqa.qa_datetime}</td>
			</tr>
			<tr>
				<th>조회수</th>
				<td>${clubqa.qa_hit}</td>
				<th style="border-left: thin solid gray;">답변 여부</th>
				<td><span id="re_label" style="font-size: 0.9rem;">처리중</span></td>
			</tr>
			<tr class="QA_content">
				<td colspan="4" height="200">${clubqa.qa_content}</td>
			</tr>
			<c:if test="${!empty clubqa.qa_filename}">
			<tr>
				<td>
				첨부파일 : <a href="file.do?num=${clubqa.qa_num}">${clubqa.qa_filename}</a></td>
			</tr>
			<c:if test="${fn:endsWith(clubqa.qa_filename,'.jpg') || 
	              			fn:endsWith(clubqa.qa_filename,'.JPG') ||
	              			fn:endsWith(clubqa.qa_filename,'.gif') ||
	              			fn:endsWith(clubqa.qa_filename,'.GIF') ||
	              			fn:endsWith(clubqa.qa_filename,'.png') ||
	              			fn:endsWith(clubqa.qa_filename,'.PNG')}">
			<tr>
				<td><img src="imageView.do?num=${clubqa.qa_num}" style="max-width:500px"></td>
			</tr>
			</c:if>
			</c:if>
		</table>
		<p>
		<br>
		</p>
	</div>
	<!-- 질문 상세페이지  -->
</form:form>

<!-- 댓글 관련 UI 시작 -->
<!-- 댓글 작성 -->

<div id="reply_div" class="reply_div">
	<span id="reply_title">댓글 달기</span>
	<div class="reply_header"></div>
	<form id="re_form" class="re_form">
	
		<input type="hidden" name="qa_num" value="${clubqa.qa_num}"
			id="qa_num"> <input type="hidden" name="mem_num"
			value="${user_num}" id="mem_num"> <input type="hidden"
			name="mem_id" value="${user_id}" id="mem_id">

		<textarea rows="5" cols="30" name="qa_reply_content"
			id="qa_reply_content" class="rep-content"
			<c:if test="${empty user_num}">disabled="disabled"</c:if>><c:if
				test="${!empty user_num && user_auth < 4}">관리자만 작성할 수 있습니다.</c:if></textarea>
		<c:if test="${!empty user_num && user_auth > 3}">
			<div id="re_second" class="re_submit">
				<input type="submit" id="re_submit" class="btn" value="전송" style="display:inline;">
				
			</div>
			
		</c:if>
		<c:if test=""></c:if>
		
	</form>
</div>


<!-- 댓글 목록 출력 -->
<div id="output"></div>
<div class="paging-button" style="display: none;">
	<input type="button" value="다음글 보기">
</div>
<div id="loading" style="display: none;">
	<img
		src="${pageContext.request.contextPath}/resources/images/ajax-loader.gif">
</div>
<!-- 댓글 관련 UI 끝 -->

<!-- 조건 체크 -->
<div id="button_select">
	<div align="right">
		<%-- 글 수정 및 삭제를 하려면 로그인한 후 
	                로그인 아이디와 작성자 아이디가 일치해야 함. --%>
		<c:if test="${!empty user_id && user_id == clubqa.mem_id}">
			<input type="button" value="수정" class="btn"
				onclick="location.href='QAlist_update.do?num=${clubqa.qa_num}'">
		</c:if>
		<c:if test="${user_id == clubqa.mem_id || user_auth > 3}">
			<input type="button" value="삭제" class="btn"
				onclick="location.href='QAlist_delete.do?num=${clubqa.qa_num}'">
		</c:if>
		<input type="button" class="btn" value="목록" onclick="location.href='QAlist.do'">
	</div>
</div>
<!-- 조건 체크 -->
<script>
function resize(obj) {
	  obj.style.height = "1px";
	  obj.style.height = (12+obj.scrollHeight)+"px";
	}
	
	autosize($("textArea"))
</script>
