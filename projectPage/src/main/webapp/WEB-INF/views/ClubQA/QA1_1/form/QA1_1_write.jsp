<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" 
               uri="http://www.springframework.org/tags/form" %>

	
		<div class="write_main">
			<form:form action="QA1_1_write.do" enctype="multipart/form-data" commandName="clubQA1_1VO" onsubmit="return space_check();">
				<div class="writeform_header">
					질문 글 작성
				</div>
				<table id="qaWrite" class="qaWrite">
					<tbody>
						<tr>
							<th scope="row"><label for="qa_title">제목</label></th>
							<td class="qa_title"><form:input path="qa1_1title" class="qa_title"/></td>
						</tr>
						<tr>
							<th scope="row"><label for="qa_content">내용</label></th>
							<td class="qa_content"><form:textarea class="qa_content" path="qa1_1content" rows="10" cols="100%" placeholder=" 내용을 입력해주세요" style="resize: vertical; overflow: auto;"/></td>
						</tr>
						<tr>
							<th scope="row"><label for="qa_secret">비밀글</label></th>
							<td class="secret_tf"><form:input path="qa1_1secret_key" maxlength="4" placeholder="비밀글을 사용하시면 비밀번호 4자리를 입력해주세요"/></td>
						</tr>
						<!-- 
						<tr>
							<th scope="row"><label for="file">파일 업로드</label></th>
							<td class="file"><input type="file" name="file"></td>
						</tr>
						 -->
					</tbody>
				</table>
				<div class="btnSet">
					<button type="submit" class="btnSubmit btn">작성</button>
					<button type="button" class="btnBack btn" onclick="location.href='${pageContext.request.contextPath}/ClubQA/QA1_1/QA1_1_list.do'">목록</button>
				</div>
			</form:form>
		</div>
	
	
<script>


function space_check() {
	if (!document.getElementById("qa1_1title").value.replace(
			/(^\s*)|(\s*$)/gi, "")) {
		alert("내용을 입력하세요.");
		document.getElementById("qa1_1title").focus();
		return false;
	}
	
	if (!document.getElementById("qa1_1content").value.replace(
			/(^\s*)|(\s*$)/gi, "")) {
		alert("내용을 입력하세요.");
		document.getElementById("qa1_1content").focus();
		return false;
	}
}

</script>

	