<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<style type="text/css">
	#re{
		width:50%;
	}
</style>
<div class="row" id="re">
		<h3>회원 탈퇴</h3>
		<div class="row">
			<div class="col s12 m5">
				<div class="card-panel #ef9a9a red lighten-3">
					<span>[주의사항]<br>회원탈퇴처리가 되면 동일한 ID로는 재가입이 불가하고 현재 소유하신 포인트와 회원등급 모두 소멸됩니다.</span></div>
				</div>
		</div>
		<table class="responsive-table">
          <tr>
            <td>Q&A</td>
            <td>게시글 모두 삭제</td>
          </tr>
          <tr>
            <td>클럽 제안</td>
            <td>게시글 모두 삭제</td>
          </tr>
          <tr>
            <td>클럽 내역</td>
            <td>내역 모두 삭제</td>
          </tr>
          <tr>
            <td>후기</td>
            <td>게시글 모두 삭제</td>
          </tr>
          <tr>
            <td>포인트</td>
            <td>소유한 포인트 삭제</td>
          </tr>
          <tr>
            <td>회원등급</td>
            <td>재가입시 일반회원</td>
          </tr>
      </table>
      <br>	
</div>
		<div class="center">
			<a class="waves-effect waves-light btn modal-trigger #ef9a9a red lighten-3 black-text" href="#modal3">회원탈퇴</a>
			<input type="button" class="btn #ef9a9a red lighten-3 black-text" value="홈으로" onclick="location.href='${pageContext.request.contextPath}/main/main.do'">
		</div>
		<br>
  <!-- Modal Structure -->
  <div id="modal3" class="modal">
    <div class="modal-content">
      <h4>회원 탈퇴 확인</h4>
      <div class="card-panel #ef9a9a red lighten-3">
      	<span>[주의사항]<br>회원탈퇴처리가 되면 동일한 ID로는 재가입이 불가하고 현재 소유하신 포인트와 회원등급 모두 소멸됩니다.</span>
      </div>
      <table class="responsive-table">
          <tr>
            <td>Q&A</td>
            <td>게시글 모두 삭제</td>
          </tr>
          <tr>
            <td>클럽 제안</td>
            <td>게시글 모두 삭제</td>
          </tr>
          <tr>
            <td>클럽 내역</td>
            <td>내역 모두 삭제</td>
          </tr>
          <tr>
            <td>후기</td>
            <td>게시글 모두 삭제</td>
          </tr>
          <tr>
            <td>포인트</td>
            <td>소유한 포인트 삭제</td>
          </tr>
          <tr>
            <td>회원등급</td>
            <td>재가입시 일반회원</td>
          </tr>
      </table>
    </div>
    <div class="modal-footer">
      <form:form action="delete.do">
      	<input type="submit" value="회원탈퇴" class="modal-close waves-effect waves-green btn-flat">
      </form:form>
      <a href="#!" class="modal-close waves-effect waves-green btn-flat">뒤로가기</a>
    </div>
  </div>



