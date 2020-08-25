<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!-- 222123 -->
<form action="QAlist.do" method="get">
	<div class="QA_main">
		<!-- QA 페이지 입장 메인 select -->
		<div class="QAmain_header">
			<div class="header">Q & A에 오신 것을 환영합니다</div>
			<div class="QAmain_header_select">
				<hr class="main_hr" width="85%">
				<ul class="QAmain_select">
					<li><a href="${pageContext.request.contextPath}/ClubQA/QAmainForm.do">자주하는 질문</a></li>
					<li><a
						href="${pageContext.request.contextPath}/ClubQA/QAlist/QAlist.do">건의 / 신고 
							게시판</a></li>
					<li><a
						href="${pageContext.request.contextPath}/ClubQA/QA1_1/QA1_1_list.do">질문 게시판</a></li>
				</ul>
			</div>
		</div>
		<p></p>
		<!-- QA 페이지 입장 메인 select -->
		<div>
		<div class="QAbody">
			<div class="QAbody_header">
			<div class="QAlist_main_header"><h5>건의 / 신고 게시판</h5></div>
				<c:if test="${count == 0}">
				<div class="qa_display">등록된 게시물이 없습니다</div>
				</c:if>
				<c:if test="${count > 0}">
				<table class="QAbody_table" width="100%">
					<tr class="QAbody_thead">
						<th width="5%">No.</th>
						<th width="45%">제목</th>
						<th width="13%">ID</th>
						<th width="12%">DATE</th>
						<th width="10%">답변 여부</th>
						<th width="5%">Hit</th>
					</tr>
					<c:forEach var="clubqa" items="${list}">
					<tr style="font-size: 0.9rem;" class="QAbody_tbody">
						<td class="li_class" id="clubqa_num" style="text-align: center;">${clubqa.qa_num}</td>
						<td>
							<a <c:if test="${ clubqa.qa_secret_key != null && user_auth != 4}">class="clubqa_title"</c:if> href="QAlist_detail.do?num=${clubqa.qa_num}" data-p="${clubqa.qa_secret_key}">
							
							${clubqa.qa_title}
							<c:if test="${ clubqa.qa_secret_key != null }">
							<img src="../../resources/images/secret_lock.png">
							</c:if>
						</a></td>
						<td class="li_class">${clubqa.mem_id}</td>
						<td class="li_class" style="text-align: center;">${clubqa.qa_datetime}</td>
						<td class="li_class" style="text-align: center;">
						<c:choose> 
							<c:when test="${ clubqa.re_cnt > 0 }">
								답변완료
							</c:when>
							<c:when test="${ clubqa.re_cnt == 0 }">
								처리중
							</c:when>
						</c:choose>
						</td>
						<td class="li_class" style="text-align: center;">${clubqa.qa_hit}</td>
					</tr>
					</c:forEach>
					<!-- 테스트 td -->
				</table>
				</c:if>
				<div class="align-center">${pagingHtml}</div>	
				<c:if test="${empty user_num}">
				<div class="btnSet" style='float: right;'>
				로그인 후 작성 가능합니다.
				</div>
				</c:if>	
				<c:if test="${!empty user_num}">
				<div class="btnSet" style='float: right;'>
				<input type="button" class="btn" onclick="location.href='${pageContext.request.contextPath}/ClubQA/QAlist/QAlist_write.do'" value="글쓰기" >
				</div>
				</c:if>
				<h1><br></h1>
			</div>
			
		</div>
		</div>
	</div>

</form>

<script>

$(function(){
		$('.clubqa_title').click(function(){
			var qa_secret_key = $(this).attr('data-p');
			var test = prompt("비밀글입니다. 비밀번호를 입력하세요", "");
			if(!test) {
				return false;
			}	
			if(test.toLowerCase() == qa_secret_key) {
				alert('비밀번호가 맞았습니다!');
			} else {
				alert('비밀번호가 맞지 않습니다');
				return false;
			}
				
			
			
	});		
	
});
</script>


<!-- 카카오톡 톡상담 API -->
<style>
/* pc 화면 */
@media (min-width: 768px) {
    #kakao-talk-channel-chat-button {
    position: fixed;
    z-index: 999;
    right: 30px; /* 화면 오른쪽으로부터의 거리 */
    bottom: 30px; /* 화면 아래쪽으로부터의 거리 */
    }
}
/* 모바일 화면 */
@media (max-width:767px) {
    #kakao-talk-channel-chat-button {
    position: fixed;
    z-index: 999;
    right: 15px; /* 화면 오른쪽으로부터의 거리 */
    bottom: 30px; /* 화면 아래쪽으로부터의 거리 */
    }
}
</style>

<div id="kakao-talk-channel-chat-button"></div>

<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<script type='text/javascript'>
  //<![CDATA[
    // 사용할 앱의 JavaScript 키를 설정해 주세요.
    Kakao.init('633cd4c97bac13201ce2cd74ba836409');
    // 카카오톡 채널 1:1채팅 버튼을 생성합니다.
    Kakao.Channel.createChatButton({
      container: '#kakao-talk-channel-chat-button',
      channelPublicId: '_cxbxixoxb' // 카카오톡 채널 홈 URL에 명시된 id로 설정합니다.
    });
  //]]>
</script>
<!-- 카카오톡 톡상담 API -->