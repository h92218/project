<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" 
               uri="http://www.springframework.org/tags/form" %>

	
		<div class="write_main">
			<form:form action="QAmain_write.do" enctype="multipart/form-data" commandName="clubAQVO">
				<div class="writeform_header">
					자주하는 질문 추가
				</div>
				<table id="qaWrite" class="qaWrite">
					<tbody>
						<tr>
							<th scope="row"><label for="qa_title">제목</label></th>
							<td class="qa_title"><form:input path="aq_title" class="qa_title" placeholder="자주하는 질문에 들어갈 제목을 입력해주세요"/></td>
						</tr>
						<tr>
							<th scope="row"><label for="qa_content">내용</label></th>
							<td class="qa_content"><form:textarea class="qa_content" path="aq_content" rows="10" cols="100%" style="resize: vertical; overflow: auto;" placeholder="자주하는 질문에 들어갈 내용을 입력해주세요"/></td>
						</tr>
						
						 
					</tbody>
				</table>
				<div class="btnSet">
					<button type="submit" class="btnSubmit btn">작성</button>
					<button type="button" class="btnBack btn" onclick="location.href='${pageContext.request.contextPath}/ClubQA/QAmainForm.do'">목록</button>
				</div>
			</form:form>
		</div>