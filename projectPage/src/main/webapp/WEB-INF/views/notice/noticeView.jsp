<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>  
<style>
/*기본 레이아웃 */
*{
    margin:0;
    padding:0;
}
  
.page-main-style{
	margin:0 auto;
}
 
.align-center{
	margin-top:2rem;
	text-align:center;
}

/*사이드 메뉴 hover*/
.menu ul li:hover{
	background-color: #e0e0e0;
}
.menu ul li a:hover{
	color: #ff0000;
}


/*글쓰기 버튼 우측 정렬*/
.write_button{
	float:right;
}

/*float 종료*/
br.end{
	clear:both;
}

/*버튼*/
input[type="submit"], input[type="button"]{
	background-color:#33691e; 
	padding:5px 20px 5px 20px; 
	margin-bottom:20px;
	color:#fff; 
	border:none; 
	border-radius:5px;
}

/*검색결과가 없을경우*/
.result-display{
	width:400px;
	margin:50px auto;
	padding:150px 0 150px 0;
	text-align:center;
}

/*VEIW 폼*/
.notice-content tr th{
	text-align:center;
	background-color:#dcedc8;
}

/* 작은 사이즈 */
@media (max-width:649px){
	/*폰트 크기*/
    :root{
        font-size:14px;
    }   
	
	/*사이드 메뉴*/
	.menu{
		height:15rem;
		border:1px solid #e0e0e0;
	}
	.menu p{
		text-align:center;
		height:3rem;
		margin:0;
		padding-top:10px;
		color:#fff;
		background-color:#33691e;
	}
	.menu ul li{
		padding:15px 20px 15px 20px;
	}
}

/* 중간 사이즈 */
@media (min-width:650px) and (max-width:1199px){
    :root{
        font-size:16px;
    }
    
    /*화면 너비*/
    .page-main-style{
		width:90%
	}
	
	/*사이드 메뉴*/
	.menu{
		height:15rem;
		border:1px solid #e0e0e0;
	}
	.menu p{
		height:3rem;
		margin:0;
		padding-top:10px;
		color:#fff;
		background-color:#33691e;
		text-align:center;
	}
	.menu ul li{
		padding:15px 20px 15px 20px;
	}
}

/* 큰 사이즈 */
@media (min-width:1200px){
    :root{
        font-size:18px;
    }
   
   	/*화면 너비*/
	.page-main-style{
		width:90%
	}
	
	/*사이드 메뉴*/
	.menu{
		width:20%;
		height:30rem;
		border:1px solid #e0e0e0;
		margin-right:47px;
		margin-top:40px;
		margin-bottom:40px;
		float:left;
	}
	.menu p{
		margin:0;
		padding:20px 20px 20px 20px;
		text-align:center;
		color:#fff;
		background-color:#33691e;
	}
	.menu ul li{
		padding:20px 20px 20px 20px;
	}
	
	.page-content{
	width:75%;
	float:left;
	}	
}
</style>  
<div class="page-main-style">
	<div class="menu">
		<p>공지사항</p>
		<ul>
		   <li class="tab"><a href="list.do">전체 공지사항</a></li>
		   <li class="tab"><a href="http://localhost:8080/club/notice/list.do?keyfield=nt_title&keyword=%ED%81%B4%EB%9F%BD%5D">클럽별 공지사항</a></li>
		   <li class="tab"><a href="http://localhost:8080/club/notice/list.do?keyfield=nt_title&keyword=%5B%ED%8C%8C%EC%9D%B4%ED%84%B0%ED%81%B4%EB%9F%BD%5D">파이터클럽 공지사항</a></li>
	  	</ul>
	</div>
	<div class="page-content">
		<h3>${notice.nt_title}</h3>
		<table class="notice-content">
			<tr style="border-top:1px solid #000;">
				<th>번호</th>
				<td>${notice.nt_num}</td>
				<th>분류</th>
				<td>${notice.nt_category}</td>
			</tr>
			<tr>
				<th>작성자</th>
				<td>${notice.mem_id}</td>			
				<th>작성일자</th>
				<td>${notice.nt_datetime}</td>
			</tr>
			<tr>
				<th>첨부파일</th>
				<c:if test="${!empty notice.nt_filename}">
					<td><a href="file.do?nt_num=${notice.nt_num}">${notice.nt_filename}</a></td>
				</c:if>
				<c:if test="${empty notice.nt_filename}">
					<td>첨부된 파일이 없습니다.</td>
				</c:if>
				<th>조회수</th>
				<td>${notice.nt_hit}</td>				
			</tr>
		</table>
		<c:if test="${fn:endsWith(notice.nt_imgname,'.jpg') ||
					  fn:endsWith(notice.nt_imgname,'.JPG') ||
					  fn:endsWith(notice.nt_imgname,'.gif') ||
					  fn:endsWith(notice.nt_imgname,'.GIF') ||
					  fn:endsWith(notice.nt_imgname,'.png') ||
					  fn:endsWith(notice.nt_imgname,'.PNG')}">
		<div class="align-center">
			<img src="imageView.do?nt_num=${notice.nt_num}" style="max-width:500px">
		</div>
		</c:if>
		<div style="white-space: pre-line; margin:40px;">${notice.nt_content}</div>
		<hr size="1" width="100%">
		<div class="align-center">
			<%--관리자와 작성자만 수정 삭제 버튼이 활성화 됨 --%>
	 		<c:if test="${user_num == notice.mem_num || user_auth == 4}">
				<input type="button" value="수정" onclick="location.href='update.do?nt_num=${notice.nt_num}'">
				<input type="button" value="삭제" onclick="del(${notice.nt_num})">
			</c:if>
			<input type="button" value="목록" onclick="location.href='list.do'">
		</div>
	</div>	
	<br class="end">
</div>

<!-- 삭제 확인 스크립트 -->
<script>
	function del(nt_num) {
		var chk = confirm("정말 삭제하시겠습니까?");
		if (chk) {
			location.href='delete.do?nt_num=${notice.nt_num}';
		}
	}	
</script>