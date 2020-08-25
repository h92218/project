<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<link rel="stylesheet" 
   href="${pageContext.request.contextPath}/resources/css/style.css">
<style type="text/css">
	#openform{
		width:50%;
	}
	#club_detail{
		width:100%;
		height:250px;
	}
</style>
<div class="row" id="openform">
	<!-- !!!!!!!!!!관리자!!!!!!!!!!!!!! -->  
	<c:if test="${user_auth ==4}">
	<form:form class="col s12" action="boardclubmodify.do" enctype="multipart/form-data" commandName="clubVO">
		<form:hidden path="club_num"/>
		<h4>클럽 개설 제안 수정</h4>
		<ul>
			<li>
				<label>클럽 승인 여부</label><p>
				<label><form:radiobutton class="filled-in" path="club_state" value="1"/><span>검토예정</span></label>
				<label><form:radiobutton class="filled-in" path="club_state" value="2"/><span>승인</span></label>
				<label><form:radiobutton class="filled-in" path="club_state" value="3"/><span>승인거부</span></label>
				<label><form:radiobutton class="filled-in" path="club_state" value="4"/><span>종료됨</span></label>
			</li>
			<br>
			<li>
				<label for="club_title">제목</label>
				<form:input path="club_title"/><form:errors path="club_title" cssClass="error-color"/>
			</li>
			<li>
				<label for="club_name">클럽 명</label>
				<form:input path="club_name"/><form:errors path="club_name" cssClass="error-color"/>
			</li>
			<li>
				<label>영화 장르</label><p>
				<label><input type="checkbox" class="filled-in" name="club_genre" id="club_genre1" value="공포/스릴러" <c:if test="${fn:contains(clubVO.club_genre,'공포/스릴러')}">checked</c:if>/><span>공포/스릴러</span></label>
				<label><input type="checkbox" class="filled-in" name="club_genre" id="club_genre2" value="로맨틱코미디/드라마" <c:if test="${fn:contains(clubVO.club_genre,'로맨틱코미디/드라마')}">checked</c:if>/><span>로맨틱코미디/드라마</span></label>
				<label><input type="checkbox" class="filled-in" name="club_genre" id="club_genre3" value="애니메이션" <c:if test="${fn:contains(clubVO.club_genre,'애니메이션')}">checked</c:if>/><span>애니메이션</span></label>
				<label><input type="checkbox" class="filled-in" name="club_genre" id="club_genre4" value="액션" <c:if test="${fn:contains(clubVO.club_genre,'액션')}">checked</c:if>/><span>액션</span></label>
				<label><input type="checkbox" class="filled-in" name="club_genre" id="club_genre5" value="SF" <c:if test="${fn:contains(clubVO.club_genre,'SF')}">checked</c:if>/><span>SF</span></label>
				&emsp;<form:errors path="club_genre" cssClass="error-color"/>
			</li>
			<br>
			<li>
				<label for="club_loc">모임 장소</label>
				<form:input path="club_loc"/><form:errors path="club_loc" cssClass="error-color"/>
			</li>
			<li>
				<label for="club_time">모임 시간</label>
				<form:input path="club_time"/><form:errors path="club_time" cssClass="error-color"/>
			</li>
			<li>
				<label for="club_start">시작 날짜</label>
				<form:input path="club_start"/>
			</li>
			<li>
				<label for="club_end">종료 날짜</label>
				<form:input path="club_end"/>
			</li>
			<li>
				<label>모임 주기</label><p>
				<label><input type="checkbox" class="filled-in"  name="club_interval" id="club_interval1" value="월요일" <c:if test="${fn:contains(clubVO.club_interval,'월요일')}">checked</c:if>/><span>월요일</span></label>
				<label><input type="checkbox" class="filled-in"  name="club_interval" id="club_interval2" value="화요일" <c:if test="${fn:contains(clubVO.club_interval,'화요일')}">checked</c:if>/><span>화요일</span></label>
				<label><input type="checkbox" class="filled-in"  name="club_interval" id="club_interval3" value="수요일" <c:if test="${fn:contains(clubVO.club_interval,'수요일')}">checked</c:if>/><span>수요일</span></label>
				<label><input type="checkbox" class="filled-in"  name="club_interval" id="club_interval4" value="목요일" <c:if test="${fn:contains(clubVO.club_interval,'목요일')}">checked</c:if>/><span>목요일</span></label>
				<label><input type="checkbox" class="filled-in"  name="club_interval" id="club_interval5" value="금요일" <c:if test="${fn:contains(clubVO.club_interval,'금요일')}">checked</c:if>/><span>금요일</span></label>
				<label><input type="checkbox" class="filled-in"  name="club_interval" id="club_interval6" value="토요일" <c:if test="${fn:contains(clubVO.club_interval,'토요일')}">checked</c:if>/><span>토요일</span></label>
				<label><input type="checkbox" class="filled-in"  name="club_interval" id="club_interval7" value="일요일" <c:if test="${fn:contains(clubVO.club_interval,'일요일')}">checked</c:if>/><span>일요일</span></label>
				&emsp;<form:errors path="club_interval" cssClass="error-color"/>
			</li>
			<br>
			<li>
				<label for="upload">클럽 이미지</label>
				<input type="file" name="upload" id="upload"/>
				<c:if test="${!empty clubVO.filename }">
					<span>(${clubVO.filename })파일이 등록되어 있습니다. 다시 업로드하면 기존파일은 삭제됩니다.</span>
				</c:if>
			</li>
			<br>
			<li>
				<label for="club_detail">클럽 내용</label>&emsp;<form:errors path="club_detail" cssClass="error-color"/>
				<textarea name="club_detail" id="club_detail">${clubVO.club_detail}</textarea>
			</li>
		</ul>
		<div class=right>
			<input type="submit" class="btn purple lighten-5 purple-text text-darken-4" value="개설/수정하기">
			<input type="button" class="btn purple lighten-5 purple-text text-darken-4" value="돌아가기" onclick="location.href='boardclub.do'">
		</div>
	</form:form>
</c:if>
	
	<!-- !!!!!!!!!우수회원!!!!!!!!!!!!! -->

<c:if test="${user_auth == 3}">
	<form:form class="col s12" action="boardclubmodify2.do" enctype="multipart/form-data" commandName="clubVO">
		<form:hidden path="club_num"/>
		<h4>클럽 개설 제안 수정</h4>
		<ul>
			<li>
				<label for="club_title">제목</label>
				<form:input path="club_title"/><form:errors path="club_title" cssClass="error-color"/>
			</li>
			<li>
				<label for="club_name">클럽 명</label>
				<form:input path="club_name"/><form:errors path="club_name" cssClass="error-color"/>
			</li>
			<li>
				<label>영화 장르</label><p>
				<label><input type="checkbox" class="filled-in" name="club_genre" id="club_genre1" value="공포/스릴러" <c:if test="${fn:contains(clubVO.club_genre,'공포/스릴러')}">checked</c:if>/><span>공포/스릴러</span></label>
				<label><input type="checkbox" class="filled-in" name="club_genre" id="club_genre2" value="로맨틱코미디/드라마" <c:if test="${fn:contains(clubVO.club_genre,'로맨틱코미디/드라마')}">checked</c:if>/><span>로맨틱코미디/드라마</span></label>
				<label><input type="checkbox" class="filled-in" name="club_genre" id="club_genre3" value="애니메이션" <c:if test="${fn:contains(clubVO.club_genre,'애니메이션')}">checked</c:if>/><span>애니메이션</span></label>
				<label><input type="checkbox" class="filled-in" name="club_genre" id="club_genre4" value="액션" <c:if test="${fn:contains(clubVO.club_genre,'액션')}">checked</c:if>/><span>액션</span></label>
				<label><input type="checkbox" class="filled-in" name="club_genre" id="club_genre5" value="SF" <c:if test="${fn:contains(clubVO.club_genre,'SF')}">checked</c:if>/><span>SF</span></label>
				&emsp;<form:errors path="club_genre" cssClass="error-color"/>
			</li>
			<br>
			<li>
				<label for="club_loc">모임 장소</label>
				<form:input path="club_loc"/><form:errors path="club_loc" cssClass="error-color"/>
			</li>
			<li>
				<label for="club_time">모임 시간</label>
				<form:input path="club_time"/><form:errors path="club_time" cssClass="error-color"/>
			</li>
			<li>
				<label for="club_start">시작 날짜</label>
				<form:input path="club_start"/>
			</li>
			<li>
				<label for="club_end">종료 날짜</label>
				<form:input path="club_end"/>
			</li>
			<li>
				<label>모임 주기</label><p>
<label><input type="checkbox" class="filled-in"  name="club_interval" id="club_interval1" value="월요일" <c:if test="${fn:contains(clubVO.club_interval,'월요일')}">checked</c:if>/><span>월요일</span></label>
				<label><input type="checkbox" class="filled-in"  name="club_interval" id="club_interval2" value="화요일" <c:if test="${fn:contains(clubVO.club_interval,'화요일')}">checked</c:if>/><span>화요일</span></label>
				<label><input type="checkbox" class="filled-in"  name="club_interval" id="club_interval3" value="수요일" <c:if test="${fn:contains(clubVO.club_interval,'수요일')}">checked</c:if>/><span>수요일</span></label>
				<label><input type="checkbox" class="filled-in"  name="club_interval" id="club_interval4" value="목요일" <c:if test="${fn:contains(clubVO.club_interval,'목요일')}">checked</c:if>/><span>목요일</span></label>
				<label><input type="checkbox" class="filled-in"  name="club_interval" id="club_interval5" value="금요일" <c:if test="${fn:contains(clubVO.club_interval,'금요일')}">checked</c:if>/><span>금요일</span></label>
				<label><input type="checkbox" class="filled-in"  name="club_interval" id="club_interval6" value="토요일" <c:if test="${fn:contains(clubVO.club_interval,'토요일')}">checked</c:if>/><span>토요일</span></label>
				<label><input type="checkbox" class="filled-in"  name="club_interval" id="club_interval7" value="일요일" <c:if test="${fn:contains(clubVO.club_interval,'일요일')}">checked</c:if>/><span>일요일</span></label>
				&emsp;<form:errors path="club_interval" cssClass="error-color"/>
			</li>
			<br>
			<li>
				<label for="upload">클럽 이미지</label>
				<input type="file" name="upload" id="upload"/>
				<c:if test="${!empty clubVO.filename }">
					<span>(${clubVO.filename })파일이 등록되어 있습니다. 다시 업로드하면 기존파일은 삭제됩니다.</span>
				</c:if>
			</li>
			<br>
			<li>
				<label for="club_detail">클럽 내용</label>&emsp;<form:errors path="club_detail" cssClass="error-color"/>
				<textarea name="club_detail" id="club_detail">${clubVO.club_detail}</textarea>
			</li>
		</ul>
		<div class=right>
			<input type="submit" class="btn purple lighten-5 purple-text text-darken-4" value="수정하기">
			<input type="button" class="btn purple lighten-5 purple-text text-darken-4" value="돌아가기" onclick="location.href='boardclub.do'">
		</div>
	</form:form>
</c:if>
</div>