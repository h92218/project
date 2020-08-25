<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
 <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/manager.css">
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
div.edit_title{
text-align:center; width:100%;
}
div.formform{
text-align:center;
width : 90%
}

div.boxbox{
display:block;
margin:0 auto;
border:1px solid #CCCCCC; 
width:45%;
}

</style>
</head>
<body>
<div class="manager_menu">
       <ul class="manager_menu_list">
          <li><a href="${pageContext.request.contextPath}/main/manage_club.do">클럽개설신청 관리</a></li>
          <li><a href="${pageContext.request.contextPath}/main/manage_member.do">회원 관리</a></li>
          <li><a href="${pageContext.request.contextPath}/clubmanage/leaderClub.do">클럽 출결 관리</a></li>
          <li><a href="${pageContext.request.contextPath}/main/EditPicture.do">메인 이미지/텍스트 변경</a></li>
       </ul>
   </div><br>
 <p class="manager_title"> 메인 이미지/텍스트 편집</p>
   <hr width="90%" color="green"><br><br>
   

 <!-- 첫번째 사진 선택 폼 -->
 <div class="edit_title"><h6><b>첫번째 화면에 등록할 사진을 선택하거나 이미지 URL을 입력하세요</b></h6></div> <br><br> 
 <div class="formform row">
  <div class="boxbox">
<form:form id="upload1" enctype="multipart/form-data" commandName="EditMainPictureVO" > 
  	<input type="hidden" name="picture_order" value="1"/>
  	<br><h5>이미지파일 선택</h5><br>
  	<input type="file" name="pic_upload" id="file1"/><br>
   <br><br><input type="submit" class="btn-small lime lighten-3" value="미리보기" 
   onclick="javascript: form.action='pic_preview.do';form.target='_blank';"
   style="width:80%; color:black;">
	<br><br><input type="submit" class="btn-small lime lighten-2" value="선택한 사진으로 배경 설정하기"
	onclick="javascript: form.action='pic_process.do';" style="width:80%;color:black;">	
   	<br><br>	
  </form:form>
  </div>
  
	<!-- 첫번째 사진 선택 폼 끝 -->
  
  	<!-- 첫번째 사진 url 등록 폼 -->
  	<div class="boxbox">
  <form method="get" name="form" id="upload2">
  <input type="hidden" name="picture_order"  value="1"/>
 	<br><h5>이미지 URL 입력</h5><br>
   <input type="url" name="filename" id="url1"placeholder="예)https://www.example.com/photo/08/13/picture.jpg" style="width:90%;">
	<br><br><input type="submit" class="btn-small lime lighten-3" value="미리보기 " 
   onclick="javascript: form.action='url_preview.do';form.target='_blank';"
   style="width:80%;color:black;">
	<br><br><input type="submit" class="btn-small lime lighten-2" value="선택한 사진으로 배경 설정하기"
	onclick="javascript: form.action='url_process.do';" style="width:80%;margin-bottom:10px;color:black;">	
   	<br><br>
   	</form>
   	</div></div>
   	<!-- 첫번째 사진 url 등록 폼 끝 -->
   	
   	<!-- 첫번째 텍스트 등록 폼  -->
   	<div style="display:block;margin:0 auto;border:1px solid #CCCCCC; width:85%;text-align:center;" >
   	<br><h5>메인 텍스트 입력</h5>
   	<form:form id="text_upload1" enctype="multipart/form-data" commandName="EditMainPictureVO">  
   	<input type="hidden" name="picture_order" value="1">
   	상단 텍스트 :　<input type="text" name="text1" id="text1_1" placeholder="첫번째 텍스트 입력" style="width:80%">
   	<br>하단 텍스트 :　<input type="text" name="text2" id="text1_2" placeholder="두번째 텍스트 입력" style="width:80%">
   	<br><br>
   	<input type="submit" class="btn-small lime lighten-3" value="미리보기 " 
   onclick="javascript: form.action='text_preview.do';form.target='_blank';"
   style="width:40%;color:black;">
	<br><br><input type="submit" class="btn-small lime lighten-2" value="텍스트 설정하기"
	onclick="javascript: form.action='text_process.do';" style="width:40%;margin-bottom:10px;color:black;">
	<br><br>
   	</form:form>
   	</div>

   	<!-- 첫번째 텍스트 등록 폼 끝-->
   	
   	
   	<br><br><hr width="90%" color="green"><br><br>
   	
  <!-- 두번째 사진 선택 폼 -->
 <div class="edit_title"><h6><b>두번째 화면에 등록할 사진을 선택하거나 이미지 URL을 입력하세요</b></h6></div> <br><br> 
 <div class="formform row">
  <div class="boxbox">
<form:form id="upload3" enctype="multipart/form-data" commandName="EditMainPictureVO" > 
  	<input type="hidden" name="picture_order"  value="2"/>
  	<br><h5>이미지파일 선택</h5><br>
  	<input type="file" name="pic_upload" id="file2"/><br>
   <br><br><input type="submit" class="btn-small lime lighten-3" value="미리보기 " 
   onclick="javascript: form.action='pic_preview.do';form.target='_blank';"
   style="width:80%;color:black;">
	<br><br><input type="submit" class="btn-small lime lighten-2" value="선택한 사진으로 배경 설정하기"
	onclick="javascript: form.action='pic_process.do';" style="width:80%;color:black;">	
   	<br><br>	
  </form:form>
  </div>
  
	<!-- 두번째 사진 선택 폼 끝 -->
  
  	<!-- 두번째 사진 url 등록 폼 -->
  	<div class="boxbox">
  <form method="get" name="form" id="upload4">
  <input type="hidden" name="picture_order"  value="2"/>
 	<br><h5>이미지 URL 입력</h5><br>
   <input type="url" name="filename" id="url2" placeholder="예)https://www.example.com/photo/08/13/picture.jpg" style="width:90%;">
	<br><br><input type="submit" class="btn-small lime lighten-3" value="미리보기 " 
   onclick="javascript: form.action='url_preview.do';form.target='_blank';"
   style="width:80%;color:black;">
	<br><br><input type="submit" class="btn-small lime lighten-2" value="선택한 사진으로 배경 설정하기"
	onclick="javascript: form.action='url_process.do';" style="width:80%;margin-bottom:10px;color:black;">	
   	<br><br>
   	</form>
   	</div></div>
   	<!-- 두번째 사진 url 등록 폼 끝 -->
   	
   	   	
   	<!-- 두번째 텍스트 등록 폼  -->
   	<div style="display:block;margin:0 auto;border:1px solid #CCCCCC; width:85%;text-align:center;" >
   	<br><h5>메인 텍스트 입력</h5>
   	<form:form id="text_upload2" enctype="multipart/form-data" commandName="EditMainPictureVO">  
   	<input type="hidden" name="picture_order" value="2">
   	상단 텍스트 :　<input type="text" name="text1" id="text2_1" placeholder="첫번째 텍스트 입력" style="width:80%">
   	<br>하단 텍스트 :　<input type="text" name="text2" id="text2_2" placeholder="두번째 텍스트 입력" style="width:80%">
   	<br><br>
   	<input type="submit" class="btn-small lime lighten-3" value="미리보기 " 
   onclick="javascript: form.action='text_preview.do';form.target='_blank';"
   style="width:40%;color:black;">
	<br><br><input type="submit" class="btn-small lime lighten-2" value="텍스트 설정하기"
	onclick="javascript: form.action='text_process.do';" style="width:40%;margin-bottom:10px;color:black;">
	<br><br>
   	</form:form>
   	</div>

   	<!-- 두번째 텍스트 등록 폼 끝-->
   	
   	  	<br><br><hr width="90%" color="green"><br><br>
   	
  <!-- 세번째 사진 선택 폼 -->
 <div class="edit_title"><h6><b>세번째 화면에 등록할 사진을 선택하거나 이미지 URL을 입력하세요</b></h6></div> <br><br> 
 <div class="formform row">
  <div class="boxbox">
<form:form id="upload5" enctype="multipart/form-data" commandName="EditMainPictureVO" > 
  	<input type="hidden" name="picture_order"  value="3"/>
  	<br><h5>이미지파일 선택</h5><br>
  	<input type="file" name="pic_upload" id="file3"/><br>
   <br><br><input type="submit" class="btn-small lime lighten-3" value="미리보기 " 
   onclick="javascript: form.action='pic_preview.do';form.target='_blank';"
   style="width:80%;color:black;">
	<br><br><input type="submit" class="btn-small lime lighten-2" value="선택한 사진으로 배경 설정하기"
	onclick="javascript: form.action='pic_process.do';" style="width:80%;color:black;">	
   	<br><br>	
  </form:form>
  </div>
  
	<!-- 세번째 사진 선택 폼 끝 -->
  
  	<!-- 세번째 사진 url 등록 폼 -->
  	<div class="boxbox">
  <form method="get" name="form" id="upload6">
  <input type="hidden" name="picture_order"  value="3"/>
 	<br><h5>이미지 URL 입력</h5><br>
   <input type="url" name="filename" id="url3" placeholder="예)https://www.example.com/photo/08/13/picture.jpg" style="width:90%;">
	<br><br><input type="submit" class="btn-small lime lighten-3" value="미리보기 " 
   onclick="javascript: form.action='url_preview.do';form.target='_blank';"
   style="width:80%;color:black;">
	<br><br><input type="submit" class="btn-small lime lighten-2" value="선택한 사진으로 배경 설정하기"
	onclick="javascript: form.action='url_process.do';" style="width:80%;margin-bottom:10px;color:black;">	
   	<br><br>
   	</form>
   	</div></div>
   	<!-- 세번째 사진 url 등록 폼 끝 -->
   	
   	   	
   	<!-- 세번째 텍스트 등록 폼  -->
   	<div style="display:block;margin:0 auto;border:1px solid #CCCCCC; width:85%;text-align:center;" >
   	<br><h5>메인 텍스트 입력</h5>
   	<form:form id="text_upload3" enctype="multipart/form-data" commandName="EditMainPictureVO">  
   	<input type="hidden" name="picture_order" value="3">
   	상단 텍스트 :　<input type="text" name="text1" id="text3_1" placeholder="첫번째 텍스트 입력" style="width:80%">
   	<br>하단 텍스트 :　<input type="text" name="text2" id="text3_2" placeholder="두번째 텍스트 입력" style="width:80%">
   	<br><br>
   	<input type="submit" class="btn-small lime lighten-3" value="미리보기 " 
   onclick="javascript: form.action='text_preview.do';form.target='_blank';"
   style="width:40%;color:black;">
	<br><br><input type="submit" class="btn-small lime lighten-2" value="텍스트 설정하기"
	onclick="javascript: form.action='text_process.do';" style="width:40%;margin-bottom:10px;color:black;">
	<br><br>
   	</form:form>
   	</div>

   	<!-- 세번째 텍스트 등록 폼 끝-->
   	
   	  	<br><br><hr width="90%" color="green"><br><br>
   	
  <!-- 네번째 사진 선택 폼 -->
 <div class="edit_title"><h6><b>네번째 화면에 등록할 사진을 선택하거나 이미지 URL을 입력하세요</b></h6></div> <br><br> 
 <div class="formform row">
  <div class="boxbox">
<form:form id="upload7" enctype="multipart/form-data" commandName="EditMainPictureVO" > 
  	<input type="hidden" name="picture_order"  value="4"/>
  	<br><h5>이미지파일 선택</h5><br>
  	<input type="file" name="pic_upload" id="file4"/><br>
   <br><br><input type="submit" class="btn-small lime lighten-3" value="미리보기 " 
   onclick="javascript: form.action='pic_preview.do';form.target='_blank';"
   style="width:80%;color:black;">
	<br><br><input type="submit" class="btn-small lime lighten-2" value="선택한 사진으로 배경 설정하기"
	onclick="javascript: form.action='pic_process.do';" style="width:80%;color:black;">	
   	<br><br>	
  </form:form>
  </div>
  
	<!-- 네번째 사진 선택 폼 끝 -->
  
  	<!-- 네번째 사진 url 등록 폼 -->
  	<div class="boxbox">
  <form method="get" name="form" id="upload8">
  <input type="hidden" name="picture_order"  value="4"/>
 	<br><h5>이미지 URL 입력</h5><br>
   <input type="url" name="filename" id="url4" placeholder="예)https://www.example.com/photo/08/13/picture.jpg" style="width:90%;">
	<br><br><input type="submit" class="btn-small lime lighten-3" value="미리보기 " 
   onclick="javascript: form.action='url_preview.do';form.target='_blank';"
   style="width:80%;color:black;">
	<br><br><input type="submit" class="btn-small lime lighten-2" value="선택한 사진으로 배경 설정하기"
	onclick="javascript: form.action='url_process.do';" style="width:80%;margin-bottom:10px;color:black;">	
   	<br><br>
   	</form>
   	</div></div>
   	<!-- 네번째 사진 url 등록 폼 -->
   	
   	   	
   	<!-- 네번째 텍스트 등록 폼  -->
   	<div style="display:block;margin:0 auto;border:1px solid #CCCCCC; width:85%;text-align:center;" >
   	<br><h5>메인 텍스트 입력</h5>
   	<form:form id="text_upload4" enctype="multipart/form-data" commandName="EditMainPictureVO">  
   	<input type="hidden" name="picture_order" value="4">
   	상단 텍스트 :　<input type="text" name="text1" id="text4_1" placeholder="첫번째 텍스트 입력" style="width:80%">
   	<br>하단 텍스트 :　<input type="text" name="text2" id="text4_2" placeholder="두번째 텍스트 입력" style="width:80%">
   	<br><br>
   	<input type="submit" class="btn-small lime lighten-3" value="미리보기 " 
   onclick="javascript: form.action='text_preview.do';form.target='_blank';"
   style="width:40%;color:black;">
	<br><br><input type="submit" class="btn-small lime lighten-2" value="텍스트 설정하기"
	onclick="javascript: form.action='text_process.do';" style="width:40%;margin-bottom:10px;color:black;">
	<br><br>
   	</form:form>
   	</div><br><br><br>

   	<!-- 네번째 텍스트 등록 폼 끝-->
</body>
<script>

	$('#upload1').submit(function(){
		if($('input[id="file1"]').val()==''){
			alert('파일을 선택하세요');
			return false;
		};
	});
	
	$('#upload2').submit(function(){
		if($('input[id="url1"]').val()==''){
			alert('이미지 URL을 입력하세요');
			return false;
		};
	});
	
	$('#upload3').submit(function(){
		if($('input[id="file2"]').val()==''){
			alert('파일을 선택하세요');
			return false;
		};
	});
	
	$('#upload4').submit(function(){
		if($('input[id="url2"]').val()==''){
			alert('이미지 URL을 입력하세요');
			return false;
		};
	});
	
	$('#upload5').submit(function(){
		if($('input[id="file3"]').val()==''){
			alert('파일을 선택하세요');
			return false;
		};
	});
	
	$('#upload6').submit(function(){
		if($('input[id="url3"]').val()==''){
			alert('이미지 URL을 입력하세요');
			return false;
		};
	});
	
	$('#upload7').submit(function(){
		if($('input[id="file4"]').val()==''){
			alert('파일을 선택하세요');
			return false;
		};
	});
	
	$('#upload8').submit(function(){
		if($('input[id="url4"]').val()==''){
			alert('이미지 URL을 입력하세요');
			return false;
		};
	});
	
	$('#text_upload1').submit(function(){
		if($('input[id="text1_1"]').val()==''){
			alert('첫번째 텍스트를 입력하세요');
			return false;
		}
		if($('input[id="text1_2"]').val()==''){
			alert('두번째 텍스트를 입력하세요');
			return false;
		}
	})
	
	$('#text_upload2').submit(function(){
		if($('input[id="text2_1"]').val()==''){
			alert('첫번째 텍스트를 입력하세요');
			return false;
		}
		if($('input[id="text2_2"]').val()==''){
			alert('두번째 텍스트를 입력하세요');
			return false;
		}
	})
	
	$('#text_upload3').submit(function(){
		if($('input[id="text3_1"]').val()==''){
			alert('첫번째 텍스트를 입력하세요');
			return false;
		}
		if($('input[id="text3_2"]').val()==''){
			alert('두번째 텍스트를 입력하세요');
			return false;
		}
	})
	
	$('#text_upload4').submit(function(){
		if($('input[id="text4_1"]').val()==''){
			alert('첫번째 텍스트를 입력하세요');
			return false;
		}
		if($('input[id="text4_2"]').val()==''){
			alert('두번째 텍스트를 입력하세요');
			return false;
		}
	})
	
	

</script>
</html>