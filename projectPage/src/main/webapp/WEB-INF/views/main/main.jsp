<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.lang.String" %>
 <style>
#cardImg{
	max-width:400px;
	max-height:220px;
}
p {
	margin: 20px 0px;
}

@media ( min-width : 768px) {
	#kakao-talk-channel-chat-button {
		position: fixed;
		z-index: 999;
		right: 30px; /* 화면 오른쪽으로부터의 거리 */
		bottom: 30px; /* 화면 아래쪽으로부터의 거리 */
	}
}
/* 모바일 화면 */
@media ( max-width :767px) {
	#kakao-talk-channel-chat-button {
		position: fixed;
		z-index: 999;
		right: 15px; /* 화면 오른쪽으로부터의 거리 */
		bottom: 30px; /* 화면 아래쪽으로부터의 거리 */
	}
}

.wrap {position: absolute;left: 0;bottom: 40px;width: 288px;height: 132px;margin-left: -144px;text-align: left;overflow: hidden;font-size: 12px;font-family: 'Malgun Gothic', dotum, '돋움', sans-serif;line-height: 1.5;}
    .wrap * {padding: 0;margin: 0;}
    .wrap .info {width: 286px;height: 120px;border-radius: 5px;border-bottom: 2px solid #ccc;border-right: 1px solid #ccc;overflow: hidden;background: #fff;}
    .wrap .info:nth-child(1) {border: 0;box-shadow: 0px 1px 2px #888;}
    .info .title {padding: 5px 0 0 10px;height: 30px;background: #eee;border-bottom: 1px solid #ddd;font-size: 18px;font-weight: bold;}
    .info .close {position: absolute;top: 10px;right: 10px;color: #888;width: 17px;height: 17px;background: url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/overlay_close.png');}
    .info .close:hover {cursor: pointer;}
    .info .body {position: relative;overflow: hidden;}
    .info .desc {position: relative;margin: 13px 0 0 90px;height: 75px;}
    .desc .ellipsis {overflow: hidden;text-overflow: ellipsis;white-space: nowrap;}
    .desc .jibun {font-size: 11px;color: #888;margin-top: -2px;}
    .info .img {position: absolute;top: 6px;left: 5px;width: 73px;height: 71px;border: 1px solid #ddd;color: #888;overflow: hidden;}
    .info:after {content: '';position: absolute;margin-left: -12px;left: 50%;bottom: 0;width: 22px;height: 12px;background: url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png')}
    .info .link {color: #5085BB;}
</style>
<div class="slider">
	<ul class="slides">
		<li><c:if test="${editMainPictureVO1.image!=null}">
		<img id="pic1" src="pic_view1.do">
		</c:if>
		<img id="pic1" src="${editMainPictureVO1.filename}"> 
			<div class="caption center-align">
				<h3><span class="white-text text-darken-2">${editMainPictureVO1.text1}</span></h3>
				<h5 class="white-text text-darken-2">${editMainPictureVO1.text2}</h5>
			</div></li>
		<li><c:if test="${editMainPictureVO2.image!=null}">
		<img src="pic_view2.do"></c:if>
		<img src="${editMainPictureVO2.filename}">		
			<div class="caption right-align">
				<h3>${editMainPictureVO2.text1}</h3>
				<h5 class="light grey-text text-lighten-3"><a href="${pageContext.request.contextPath}/main/viewclub.do">${editMainPictureVO2.text2}</a></h5>
			</div></li>
		<li><c:if test="${editMainPictureVO3.image!=null}">
		<img src="pic_view3.do"></c:if>
		<img src="${editMainPictureVO3.filename}"> 
			<div class="caption right-align">
				<h3>${editMainPictureVO3.text1}</h3>
				<h5 class="light grey-text text-lighten-3"><a href="${pageContext.request.contextPath}/main/introduce/membership.do">${editMainPictureVO3.text2}</a></h5>
			</div></li>
		<li><c:if test="${editMainPictureVO4.image!=null}">
		<img src="pic_view4.do"></c:if>
		<img src="${editMainPictureVO4.filename}">
			<div class="caption center-align">
				<h4><span class="white-text text-darken-2">${editMainPictureVO4.text1}</span></h4>
				<h4 class="light grey-text text-lighten-3">${editMainPictureVO4.text2}</h4>
			</div></li>
	</ul>
	 <c:if test="${user_auth==4}">
	<div id="EditPicture" style="float:right;">
	<a class="waves-effect waves-light btn-small" href="${pageContext.request.contextPath}/main/EditPicture.do">Edit</a></div>
	</c:if>
</div>
<div id="kakao-talk-channel-chat-button"></div>
<div class="container">
	<br>
	<h4>현재 진행중인 클럽</h4>
	<div class="row">
		
		<c:forEach var="club" items="${list}">
		<div class="col-sm-6 col-lg-4">
			<p></p>
			<c:if test="${count == 0 }">
				<div>등록된 게시물이 없습니다.</div>
			</c:if>
			<c:if test="${count > 0 }">
			
			<div class="card">
			
				<div class="card-header" id="hope">${club.club_genre}</div>
				<img src="imageView.do?club_num=${club.club_num }" id="cardImg" class="responsive-img center"/>
				<div class="card-body center">
					<h5 class="card-title" style="text-align:center">${club.club_name}</h5>
					<p class="card-text" style="text-align:center">모임주기 : ${club.club_interval}</p>
					<a href="viewclubdetail.do?club_num=${club.club_num}" class="btn #8bc34a light-green">More</a>
				</div>
			</div>

			</c:if>
		</div>
		</c:forEach>
		
		
	</div>
	<div data-tockify-calendar="jmcere" data-tockify-component="jmcere"></div>	
	<h3 class="center">++CLUB 찾아 오시는길</h5>
	<div id="map" style="width:100%;height:350px;"></div>
	<br>
	<br>
</div>
<script data-cfasync="false" data-tockify-script="embed" src="https://public.tockify.com/browser/embed.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=c349bfe9afadd02b924aaa4d4de24e0f"></script>
<script type="text/javascript">
document.addEventListener('DOMContentLoaded', function() {
    var elems = document.querySelectorAll('.slider');
    var instances = M.Slider.init(elems, options);
  });

  // Or with jQuery

  $(document).ready(function(){
    $('.slider').slider();
  });
//<![CDATA[
  // 사용할 앱의 JavaScript 키를 설정해 주세요.
  Kakao.init('633cd4c97bac13201ce2cd74ba836409'); //개발자에게 주는 자바스크립트 코드 입력
  // 카카오톡 채널 1:1채팅 버튼을 생성합니다.
  Kakao.Channel.createChatButton({
    container: '#kakao-talk-channel-chat-button',
    channelPublicId: '_cxbxixoxb' // 카카오톡 채널 홈 URL에 명시된 id로 설정합니다. (채널 고유 아이디 적용)
  });
//]]>

	
  	//kakao map
	var mapContainer = document.getElementById('map'), // 지도의 중심좌표
	mapOption = {
		center : new kakao.maps.LatLng(37.597257, 127.087776), // 지도의 중심좌표
		level : 3
	// 지도의 확대 레벨
	};

	var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

	// 마우스 드래그와 모바일 터치를 이용한 지도 이동을 막는다
	map.setDraggable(false);		

	// 마우스 휠과 모바일 터치를 이용한 지도 확대, 축소를 막는다
	map.setZoomable(false);  
	
	//지도에 마커를 표시합니다 
	var marker = new kakao.maps.Marker({
		map : map,
		position : new kakao.maps.LatLng(37.597257, 127.087776)
	});

	//커스텀 오버레이에 표시할 컨텐츠 입니다
	//커스텀 오버레이는 아래와 같이 사용자가 자유롭게 컨텐츠를 구성하고 이벤트를 제어할 수 있기 때문에
	//별도의 이벤트 메소드를 제공하지 않습니다 
	var content = '<div class="wrap">'
			+ '    <div class="info">'
			+ '        <div class="title">'
			+ '            ++CLUB 본사'
			+ '            <div class="close" onclick="closeOverlay()" title="닫기"></div>'
			+ '        </div>'
			+ '        <div class="body">'
			+ '            <div class="img">'
			+ '                <img src="https://cdn.pixabay.com/photo/2016/11/07/00/50/like-1804599_960_720.jpg" width="73" height="70">'
			+ '           </div>'
			+ '            <div class="desc">'
			+ '                <div class="ellipsis">서울특별시 어딘가</div>'
			+ '                <div class="jibun ellipsis">(우) 00000 (지번) 어딘가 0000</div>'
			+ '                <div><a href="http://sb.ezenac.co.kr/" target="_blank" class="link">홈페이지</a></div>'
			+ '            </div>' + '        </div>' + '    </div>' + '</div>';

	//마커 위에 커스텀오버레이를 표시합니다
	//마커를 중심으로 커스텀 오버레이를 표시하기위해 CSS를 이용해 위치를 설정했습니다
	var overlay = new kakao.maps.CustomOverlay({
		content : content,
		map : map,
		position : marker.getPosition()
	});

	//마커를 클릭했을 때 커스텀 오버레이를 표시합니다
	kakao.maps.event.addListener(marker, 'click', function() {
		overlay.setMap(map);
	});

	//커스텀 오버레이를 닫기 위해 호출되는 함수입니다 
	function closeOverlay() {
		overlay.setMap(null);
	}
</script>