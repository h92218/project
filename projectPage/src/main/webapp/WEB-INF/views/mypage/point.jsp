<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style type="text/css">
	#re{
		width:50%;
		display: block;
		margin: 0 auto;
	}
</style>
<div class="col s12 m8 offset-m2 l6 offset-l3" id="re">
	<div class="card-panel grey lighten-5 z-depth-1">
		<div class="row valign-wrapper">
			<div class="col s10">
			<h3 class="center">${member.detail_name}님의 포인트 / 회원등급</h3>

				<div class="row">
					<div class="col s12 m6">
						<div class="card blue-grey darken-1">
							<div class="card-content white-text">
								<span class="card-title">${member.detail_name}님의 회원등급</span>
								<p>
								<c:if test="${member.mem_auth == 2}">
								일반회원
								</c:if>
								<c:if test="${member.mem_auth == 3}">
								우수회원 = 클럽장
								</c:if>
								<c:if test="${member.mem_auth == 4}">
								관리자
								</c:if>
								</p>
								
							</div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col s12 m6">
						<div class="card blue-grey darken-1">
							<div class="card-content white-text">
								<span class="card-title">${member.detail_name}님의 포인트 = [${member.detail_point}] POINT</span>
								<table>
									<tr>
										<td>일반회원 - </td>
										<td>0 ~ 5000 point</td>
										<td>CLUB 참여 가능</td>
									</tr>
									<tr>
										<td>우수회원 - </td>
										<td>5000 ~ 10000 point</td>
										<td>CLUB 개설 제안 가능</td>
									</tr>
									<tr>
										<td>클럽장 - </td>
										<td>5000 ~ 10000 point</td>
										<td>CLUB 운영 가능</td>
									</tr>
								</table>
							</div>
						</div>
					</div>
				</div>

			</div>
		</div>
	</div>
</div>
