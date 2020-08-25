<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" 
               uri="http://www.springframework.org/tags/form" %>
 <%@ taglib prefix="c"
                uri="http://java.sun.com/jsp/jstl/core" %>

	
		<div class="write_main">
			<form:form action="QA1_1_update.do" enctype="multipart/form-data" commandName="clubQA1_1VO" onsubmit="return space_check();">
				<form:hidden path="qa1_1num"/>
				<div class="writeform_header">
					글 수정
				</div>
				<table id="qaWrite" class="qaWrite">
					<tbody>
						<tr>
							<th scope="row"><label for="qa_title">제목</label></th>
							<td class="qa_title"><form:input path="qa1_1title" class="qa_title"/></td>
						</tr>
						<tr>
							<th scope="row"><label for="qa_content">내용</label></th>
							<td class="qa_content"><form:textarea class="qa_content" path="qa1_1content" rows="10" cols="100%" style="resize: vertical; overflow: auto;"/></td>
						</tr>
						<tr>
							<th scope="row"><label for="qa_secret">비밀글</label></th>
							<td class="secret_tf"><form:password path="qa1_1secret_key" maxlength="4" placeholder="비밀번호 4자리를 입력해주세요"/></td>
						</tr> 
					</tbody>
				</table>
				<div class="btnSet">
					<button type="submit" class="btnSubmit btn">수정 완료</button>
					<button type="button" class="btnBack btn" onclick="location.href='${pageContext.request.contextPath}/ClubQA/QA1_1/QA1_1_list.do'">목록</button>
				</div>
			</form:form>
		</div>
	
	
<script>

/*
$(document).ready(function(){
	$("#qa_secret").change(function(){
		if($("#qa_secret").is(":checked")){
			
		} else {
			
		}
		
		$('#secret_tf').append(secret_tf);
		
	});
}); 
*/
</script>

	