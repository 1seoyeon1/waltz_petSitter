<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<!-- jquery CDN -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<!-- fullcalendar CDN -->
<link href='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/main.min.css' rel='stylesheet' />
<script src='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/main.min.js'></script>
<!-- fullcalendar 언어 CDN -->
<script src='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/locales-all.min.js'></script>

<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ" crossorigin="anonymous"></script>

<script type="text/javascript">
document.addEventListener('DOMContentLoaded', function() {
	var ajax_last_num = 0;
  var calendarEl = document.getElementById('calendar');
  var current_ajax_num = ajax_last_num;

  var calendar = new FullCalendar.Calendar(calendarEl, {
	  aspectRatio: '1.35',
		height : '630px',
    locale : 'ko',
    defaultDate : new Date(),
    events:
				 // db에서 일정 불러오기
        function(start,end,successCallback){
            $.ajax({
                url : '/sitter/reserveList?sitter_email=${profileView.sitter_email}',
                type : 'get',
                dataType : 'json',
                contentType : 'application/json; charset=UTF-8',
                beforeSend : function(jsonSt){
                	ajax_last_num = ajax_last_num + 1;
                },
                 success : function(jsonSt){
                	 if(current_ajax_num == ajax_last_num - 1){
                 result = jsonSt.result
                    var events = [];
                    $.each(jsonSt,function(idx,item){
                        var title = jsonSt[idx].user_email;
                        var startDay = jsonSt[idx].start_date;
                        var endDay = jsonSt[idx].end_date;
                        var sttime=jsonSt[idx].st_time;
                        var edtime=jsonSt[idx].ed_time;
                        if(item.chk == 0){
                            if(item.all_day==1){
                                calendar.addEvent({
                                    start : startDay,
                                    end : endDay,
                                    backgroundColor : 'orange',
                                    borderColor:'orange',
                                    title : "종일"
                                    });
                                        }
                            else{
                        calendar.addEvent({
                            start : startDay,
                            end : endDay,
                            title : sttime+"~"+edtime,
                            backgroundColor : 'orange',
                            borderColor : 'orange'
                            });
                                }
                        }
                        else if(item.chk == 1){
                            if(item.all_day==1){
                        calendar.addEvent({
                            start : startDay,
                            end : endDay,
                            title : "종일"
                            });
                                }
                            else{
                        calendar.addEvent({
                            start : startDay,
                            end : endDay,
                            title : sttime+"~"+edtime
                            });
                                }
                        
                            }
                        });
                    successCallback(events);
                    } 
                 }
                })
   				 }
  });

  calendar.render();
});
function openWin(sitter_email){
	var url = "/sitter/profileImageEV?sitter_email=${profileView.sitter_email}";
	var name= "imagePopup";
	var option="_blank, width=400, height=350, resizable=false";
	window.open(url,name,option);
	}

function click_add(sitter_email){
	var url="/sitter/sittReserve?sitter_email=${profileView.sitter_email}";
	var name="schedulePopup";
	var option="width=600, height=430, left=100, top=50";
	window.open(url,name,option);
	}

</script>

<link href="/resources/css/sitter/sitterdetail.css"rel="stylesheet">
<meta charset="UTF-8">
<title>프로필 보기</title>
</head>
<body>

<c:import url="../common/nav.jsp"></c:import>
<div class="topdiv">
<div class="page-top">
<h2 class="top-h">훈련사  상세보기</h2>
</div>
<c:if test="${profileView.sitter_email eq sessionScope.sitter}">
<div>
<a class="newrq" href="/sitter/rq_list?rd=0">새로운 요청건이 ${newrq} 건 있습니다.</a>
</div>
</c:if>
</div>

<div class="detaillist">
	<p id="btnc" class="btnn" onclick="location.href='/sitter/profileBoard'">목록으로</p>
<form name="viewForm" role="form" method="GET" action="/sitter/profileEditView">
<input type="hidden" name="sitter_email" value="${profileView.sitter_email}">
<div class="im-if">

<div class="id-img">
<div class="p-gr">
<p class="detailtop-p"> 훈련사  </p> 
<p class="detailtop-p"> ${profileView.sitter_email} </p>
<c:if test="${profileView.sitter_email eq sessionScope.sitter}">
<button class="btnn" id="subbtn" type="submit" style="margin-top: 10px;">정보수정</button>
</c:if>
</div>
<div class="img-rate">
<img src="/upload/sitter_profile/${profileView.sitter_image}"/><br>
<div class="rate">
<h5 class="rate-h">평점 </h5>
<div class="st-t"><p class="st"></p></div>
<img class="rateimg" src="/upload/img/rate.png">
<input type="text" id="rate" name="rate" value="<fmt:formatNumber value="${profileView.rate}" pattern="0.0"/>" readonly/>
</div>
<c:if test="${profileView.sitter_email eq sessionScope.sitter}">
<div id="btnw" class="btnn"onclick="openWin()">이미지수정</div>
</c:if>
</div>
</div>

<div class="info-loc">
<div class="info">

<div class="if-textpt">
<div class="loc-label"> <p>기본 정보  </p> </div>
<hr>
<div class="if-text">
<p class="info-p">이름</p>
<input type="text" id="sitter_name" name="sitter_name" value="${profileView.mksitter_name}" readonly/>
</div>
<div class="if-text">
<p class="info-p">성별</p>
<input type="text" id="sitter_gender" name="sitter_gender" value="${profileView.sitter_gender}" readonly/>
</div>
<div class="if-text" style="margin-right : 20px;">
<p class="info-p">요금</p>
<input style="margin-bottom: 8px;" type="number" id="sitter_price" name="sitter_price" value="${profileView.sitter_price}" readonly><p style="margin-top: 4px;">원</p>
</div>
<div class="if-text">
<p class="info-p">전화번호</p>
<input style="padding-bottom: 7px;" type="text" id="sitter_phone" name="sitter_phone" value="${profileView.mksitter_phone}" readonly/>
</div>
</div>

</div>

<div class="locpt">

<div class="loc-top">
<div class="info-p" style="margin: 9px 0; width : 70px;">
<p> 활동 지역 </p>
</div>
<div class="loc-info">
<input type="text" id="sitter_addr" name="sitter_addr" value="${profileView.sitter_addr}" readonly/>
</div>
</div>

<div class="map" style="border:none;">
<div id="map" style="width:270px;height:250px;"></div>
</div>

</div>
</div>

</div>

<hr>

<div class="calpt">

<div class="cal-p">
<p> 예약 현황 </p>
</div>
<div class="sign-calendar">
<div class="rqbtn">
<c:if test="${sessionScope.member != null}">
<p id="btnr" class="btnn" onclick="click_add()">예약 신청하기</p>
</c:if>
</div>
<div class="signpt">
<p class="sign" style="background-color:orange;"></p><p style="margin-right:10px;">예약 신청중</p>
<p class="sign" style="margin-left:40px; background-color:#337ab7;"></p><p>예약 완료</p>
</div>
<div id='calendar'></div>
</div>

</div>

<hr>

<div class="exp-intro">
  <div class="exp">
<div class="cal-p">
<p>경력 사항</p>
</div>
<textarea id="sitter_exp" name="sitter_exp" readonly><c:out value="${profileView.sitter_exp}"/></textarea>
</div>
<div class="intro">
<div class="cal-p">
<p>자기 소개</p>
</div>
<textarea id="sitter_intro" name="sitter_intro" readonly><c:out value="${profileView.sitter_intro}"/></textarea>
</div>
</div>





</form>
</div>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=1807e8ae240d702dcb6050c5664fbef8&libraries=services"></script>
<script>
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
				draggable: false,
        level: 3 // 지도의 확대 레벨
    };  

// 지도를 생성합니다    
var loc = document.getElementById('sitter_addr').value;
var map = new kakao.maps.Map(mapContainer, mapOption); 

// 주소-좌표 변환 객체를 생성합니다
var geocoder = new kakao.maps.services.Geocoder();

// 주소로 좌표를 검색합니다
geocoder.addressSearch( loc , function(result, status) {

    // 정상적으로 검색이 완료됐으면 
     if (status === kakao.maps.services.Status.OK) {

        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

        // 결과값으로 받은 위치를 마커로 표시합니다
        var marker = new kakao.maps.Marker({
            map: map,
            position: coords
        });

        // 인포윈도우로 장소에 대한 설명을 표시합니다
        var customOverlay = new kakao.maps.CustomOverlay({
            position: coords,
            content: '<div style="margin-bottom : 120px; background : #fff; border: 3px solid  #1890FF;border-radius:9px;width:70px;text-align:center;padding:6px 0; font-size:12px;">시터위치</div>'
        });  
        customOverlay.setMap(map);
        //infowindow.open(map, marker);

        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
        map.setCenter(coords);
    } 
});    
</script>
<c:import url="../common/footer.jsp"></c:import>
</body>
</html>