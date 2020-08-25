<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<form:form action="QAmainForm.do" commandName="ClubQAVO">

	<div class="QA_main">
		<div class="QAmain_header">
			<div class="header">Q & A에 오신 것을 환영합니다</div>
			<div class="QAmain_header_select">
				<hr class="main_hr" width="85%">
				<ul class="QAmain_select">
					<li><a href="#">자주하는 질문</a></li>
					<li><a
						href="${pageContext.request.contextPath}/ClubQA/QAlist/QAlist.do">건의 / 신고 
							게시판</a></li>
					<li><a
						href="${pageContext.request.contextPath}/ClubQA/QA1_1/QA1_1_list.do">질문 게시판</a></li>
				</ul>
			</div>

		</div>
	</div>
	<p></p>
	<div class="collapse_main">
		<div class="collapse_header_search" style="font-family: 'Youth';">
		자주하는 질문 TOP ${ count }
		</div>
		<!-- collapse 시작 -->
		<c:forEach var="clubqa" items="${list}">
		<button type="button" class="collapsible">${clubqa.aq_title}</button>
		<div class="collapse_content" style="text-align: left;">
		<p>${ clubqa.aq_content }
			
			
			<a style="font-size:0.7rem;" href="https://accounts.kakao.com/login?continue=http%3A%2F%2Fpf.kakao.com%2F_cxbxixoxb%2Fchat%3Fapi_ver%3D1.1%26kakao_agent%3Dsdk%252F1.39.4%2520os%252Fjavascript%2520sdk_type%252Fjavascript%2520lang%252Fko-KR%2520device%252FWin32%2520origin%252Fhttp%25253A%25252F%25252Flocalhost%25253A8080%26app_key%3D633cd4c97bac13201ce2cd74ba836409%26referer%3Dhttp%253A%252F%252Flocalhost%253A8080%252Fclub%252FClubQA%252FQAmainForm.do">
			더 많은 정보나 1:1 상담이 필요하시면 오른쪽 하단의 <mark>"톡상담"</mark>을 이용해 주세요</a></p><c:if test="${ user_auth > 3 }">
			<a style="font-size:0.5rem;" href="QAmain_delete.do?num=${clubqa.aq_num}">삭제</a>
			</c:if>
		</div>
		</c:forEach>
		<!-- collapse 끝 -->
		<div class="align-center">${pagingHtml}</div>	
		<c:if test="${ user_auth > 3 }">
		<div class="qamain_button">
		<button type="button" class="btn" onclick="location.href='${pageContext.request.contextPath}/ClubQA/QAmain_write.do'">자주하는 질문 추가하기</button>
		</div>
		</c:if>
	</div>
	
	<h1>
		<br>
	</h1>
</form:form>

<script>
	var coll = document.getElementsByClassName("collapsible");
	var i;

	for (i = 0; i < coll.length; i++) {
		coll[i].addEventListener("click", function() {
			this.classList.toggle("active");
			var content = this.nextElementSibling;
			if (content.style.maxHeight) {
				content.style.maxHeight = null;
			} else {
				content.style.maxHeight = content.scrollHeight + "px";
			}
		});
	}
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