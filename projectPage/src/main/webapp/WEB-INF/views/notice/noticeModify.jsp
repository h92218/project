<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
/*기본 레이아웃*/
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

.error-color{
	color:#ff0000;
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
		<h3>글수정</h3>
		<form:form action="update.do" enctype="multipart/form-data" commandName="noticeVO" class="write_form">
			<form:hidden path="nt_num"/>
			<ul>
				<li>
					<label>게시판 분류</label>
					<label><input type="radio" id="nt_category1" name="nt_category" value="전체" <c:if test="${noticeVO.nt_category == '전체'}">checked</c:if>><span>전체</span></label>
					<label><input type="radio" id="nt_category2" name="nt_category" value="클럽" <c:if test="${noticeVO.nt_category == '클럽'}">checked</c:if>><span>클럽</span></label>
					<label><input type="radio" id="nt_category3" name="nt_category" value="파이터클럽" <c:if test="${noticeVO.nt_category == '파이터클럽'}">checked</c:if>><span>파이터클럽</span></label>
					<form:errors path="nt_category" cssClass="error-color"/>
				</li>			
				<li>
					<label for="nt_title">제목</label>
					<form:input path="nt_title" maxlength="26"/>
					<form:errors path="nt_title" cssClass="error-color"/>
				</li>
				<li>    
					<label for="nt_content">내용</label>
					<form:textarea path="nt_content" style="height:250px;"/>
					<form:errors path="nt_content" cssClass="error-color"/>
				</li>
				<li>
					<label for="upload">이미지파일 업로드</label>
					<input type="file" name="upload" id="upload">
					<c:if test="${!empty noticeVO.nt_imgname}">
					<br>
					<span>(${noticeVO.nt_imgname})파일이 등록되어 있습니다. 다시 업로드하면 기존파일은 삭제됩니다.</span>
					</c:if>
				</li>			
				<li>
					<label for="upload2">파일 업로드</label>
					<input type="file" name="upload2" id="upload2">
					<c:if test="${!empty noticeVO.nt_filename}">
					<br>
					<span>(${noticeVO.nt_filename})파일이 등록되어 있습니다. 다시 업로드하면 기존파일은 삭제됩니다.</span>
					</c:if>
				</li>
			</ul>
			<div class="align-center">
				<input type="submit" value="수정">
				<input type="button" value="목록" onclick="location.href='list.do'">
			</div>
		</form:form>
	</div>
	<br class="end">
</div>