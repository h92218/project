<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" 
               uri="http://www.springframework.org/tags/form" %>

	
		<div class="write_main">
			<form:form action="QAlist_write.do" enctype="multipart/form-data" commandName="clubQAVO" onsubmit="return space_check();">
				<div class="writeform_header">
					건의 / 신고 글 작성
				</div>
				<table id="qaWrite" class="qaWrite">
					<tbody>
						<tr>
							<th scope="row"><label for="qa_title">제목</label></th>
							<td class="qa_title"><form:input path="qa_title" class="qa_title"/></td>
						</tr>
						<tr>
							<th scope="row"><label for="qa_content">내용</label></th>
							<td class="qa_content"><form:textarea class="qa_content" path="qa_content" rows="10" cols="100%" placeholder=" 내용을 입력해주세요" style="resize: vertical; overflow: auto;"/></td>
						</tr>
						<tr>
							<th scope="row"><label for="qa_secret">비밀글</label></th>
							<td class="secret_tf"><form:input path="qa_secret_key" maxlength="4" placeholder="비밀글을 사용하시면 비밀번호 4자리를 입력해주세요"/></td>
						</tr>		 
					</tbody>
				</table>
				<div class="btnSet">
					<button type="submit" class="btnSubmit btn">작성</button>
					<button type="button" class="btnBack btn" onclick="location.href='${pageContext.request.contextPath}/ClubQA/QAlist/QAlist.do'">목록</button>
				</div>
			</form:form>
		</div>
	
	
<script>


	function space_check() {
		if (!document.getElementById("qa_title").value.replace(
				/(^\s*)|(\s*$)/gi, "")) {
			alert("내용을 입력하세요.");
			document.getElementById("qa_title").focus();
			return false;
		}
		
		if (!document.getElementById("qa_content").value.replace(
				/(^\s*)|(\s*$)/gi, "")) {
			alert("내용을 입력하세요.");
			document.getElementById("qa_content").focus();
			return false;
		}
	}
</script>

	