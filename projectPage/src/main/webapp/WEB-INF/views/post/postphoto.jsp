<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">

<style>
.page-menu {
	width: 85%;
	margin: 0 auto;
}

.page-main-style {
	width: 85%;
	margin: 0 auto;
}

.align-center {
	text-align: center;
	border: 20px;
	padding: 10px;
}

.center {
	text-aling: center;
	margin: 0 auto;
}

.card #cardImg{
		max-width:220px;
		max-height:150px;
}

.nav-pills > li > a.active{
  background-color:#689f38 !important;
  color:white !important;
}

  .nav-pills > li.active > a:hover {
  background-color:#689f38 !important;
  color:white !important;
        }
        
.nav-link-color {
  color: #689f38;
}
.jumbotron{
	color: black;
	background-color:#e8e6d7 !important;
}
.write_button{
	float:right;
}

</style>


<div class="jumbotron jumbotron-fluid">
	<div class="container">
		<h1 class="display-6">후기게시판 입니다!</h1>
		<p class="lead">여러분들의 참여 또는 영화를 보고 나서 느낀점을 작성해주세요!</p>
	</div>
</div>

<div class="page-menu">
	<ul class="nav nav-pills nav-fill">
		<li class="nav-item"><a class="nav-link active" href="postlist.do">전체 게시판</a></li>
		<li class="nav-item"><a class="nav-link active" href="post.do?keyfield=post_category&keyword=join">참여 후기 게시판</a></li>
		<li class="nav-item"><a class="nav-link active" href="postlist.do?keyfield=post_category&keyword=movie">영화 후기 게시판</a></li>
		<li class="nav-item"><a class="nav-link active" href="postphoto.do?keyfield=post_category&keyword=photo">갤러리</a>
		</li>
	</ul>
</div>


<div class=page-main-style>
	<form action="postlist.do" method="get">


		
		<div class="write_button">
			<c:if test="${user_auth == 4}">
			<button type="button" class="btn btn-outline-success" onclick="location.href='postwrite.do'">글쓰기</button>
			</c:if>
		</div>
			<div  class="container">
			<div class="row">
			<c:forEach var="post" items="${list}">
					<div class="col-sm-6 col-lg-4">
			<div>
			
				<c:if test="${count == 0 }">
					<div class="result-disply">등록된 게시물이 없습니다.</div>
					<button class="btn waves-effect waves-light" type="submit"
						onclick="location.href='post.do'">돌아가기</button>
				</c:if>
			</div>
				<c:if test="${count > 0 }">	
				
						<div class="card" style="text-align:center">
							<div class="card-header" id="hope">${post.post_title}</div>
							<img src="imageView.do?post_num=${post.post_num }" id="cardImg" class="responsive-img center" onerror="this.src='https://lh3.googleusercontent.com/proxy/5BUDVFhVYypOGPwOdVv6h2wb6_rrd2oplQUu0eizJy1LbeNQ-eW_N5hTSeo1SAhcRLfcUkS6f3dvJ2JwaEOhLJeWHhGOXzsFEDEJXeI3TR0AtEBWCpUw0HGsh72Eh1bOZl0iGDI7CVBYCHypYHY';"/>
							 <div class="card-body" >
								<h5 class="card-title">${post.post_board}</h5>
							</div>
							<div class="card-footer">
								<c:if test="${user_auth == 4}">
									<button type="button" class="btn btn-outline-success" onclick="location.href='postdetail.do?num=${post.post_num}'">수정하기</button>
								</c:if>
							</div>
							</div>
						
						</c:if>
						</div>
					</c:forEach>
					</div>
	</div>
	</form>

	<div class=align-center>${pagingHtml}</div>


</div>
<br>



<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css"
	integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk"
	crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
	integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
	integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
	crossorigin="anonymous"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"
	integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI"
	crossorigin="anonymous"></script>
<script>

</script>

