<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.*"%>


<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<link href="/resources/css/sitter/sitterpopup.css"rel="stylesheet">
<!-- timepicker -->
<link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.css">

<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="//code.jquery.com/jquery-3.2.1.min.js"></script>
<!-- datepicker -->
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.18.0/moment.min.js"></script>

<script type="text/javascript">

window.onload=function(){
/* document.getElementById("sitter_email").value=opener.document.getElementById("sitter_email").value; */
	
var btn=document.getElementById("ok-button");
btn.onclick=function(){
	var val= $("input:radio[name='all_day']:checked").val();
	if(val==1){
		$(".st_time , .ed_time").val("00:00");
		}
	else{
		var Now = new Date();
		var date = Now.getFullYear()+"-";
		date += Now.getMonth()+1;
		date += "-"+Now.getDay(); 
		var NowTime = Number(Now.getHours())+3;
	var st = Number($("input[name='st_time']").val().substring(0,2));
	var ed = Number($("input[name='ed_time']").val().substring(0,2));
		if($("#start_date").val()==$("#end_date").val() || $("#start_date").val()==date){
			
			if(st<NowTime){
				alert("당일예약은 약 3시간 전부터 예약 가능합니다.");
				$("input[name='st_time']").focus();
				return;
				}
		}
			if(ed<st){
				alert("종료시간은 시작시간 이후로 선택해주세요.");
				$("input[name='ed_time']").focus();
				return;
				}
	}
	if($("#subject").val() == ""){
		alert("제목을 입력해주세요");
		$("#subject").focus();
		return;}
	if($("#start_date").val()==""){
		alert("시작일을 선택해주세요");
		$("#start_date").focus();
		return;
		}
	if($("#end_date").val()==""){
		alert("종료일을 선택해주세요");
		$("#end_date").focus();
		return;
		}
	if($("#memo").val()=="")
		if(confirm("전달하실 특이사항이 없습니까?")==false)
			return;
			alert("예약 신청했습니다.");
	window.opener.name = "profileDetail";
	document.scheduleData.target="profileDetail";
	document.scheduleData.action="/sitter/sittReserve_rq";
	document.scheduleData.method="POST";
	document.scheduleData.submit();
			self.close();
}
};

$( function() {
    var dateFormat = "yy-mm-dd",
      from = $( "#start_date" )
        .datepicker({
          dateFormat : 'yy-mm-dd',
          setDate : '0',
          minDate : '0',
          yearSuffix: "년",
        	monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12'],
        	monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
         dayNamesMin: ['일','월','화','수','목','금','토'],
         dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'],
          changeMonth: true,
        })
        .on( "change", function() {
          to.datepicker( "option", "minDate", getDate( this ) );
        }),
      to = $( "#end_date" ).datepicker({
    	  dateFormat : 'yy-mm-dd',
        minDate : '0',
        setDate : '+1D',
        yearSuffix: "년",
    	monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12'],
    	monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
     dayNamesMin: ['일','월','화','수','목','금','토'],
     dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'],
        changeMonth: true,
      })
      .on( "change", function() {
        from.datepicker( "option", "maxDate", getDate( this ) );
      });
 
    function getDate( element ) {
      var date;
      try {
        date = $.datepicker.parseDate( dateFormat, element.value );
      } catch( error ) {
        date = null;
      }
 
      return date;
    }
  } );

<!--timepicker-->
$(document).ready(function(){
    $('input.st_time').timepicker({
        timeFormat : 'HH:mm',
        interval : 60, 
        });
    $('input.ed_time').timepicker({
        timeFormat : 'HH:mm',
        interval : 60, 
        });
});

function handlech(src){
	var val=src.value;
	if(val==0){
		$('.st_time , .ed_time').css('display','inline');
		}
	else
		$('.st_time , .ed_time').css("display",'none');
}

</script>
<meta charset="UTF-8">
<title>예약 신청</title>
</head>
<body>
<div class = "group" id = "popupGroup">	
	<div class="page-top">
		<h1 class="top-h"> 예약 신청 </h1>
	<hr>
	</div>
	
	<div class = "group-body">
	<form id = "scheduleData" name="scheduleData" method="POST">
	<input type="hidden" id="sitter_email" name="sitter_email" value="${sitter_email}">
	<input type="hidden" id="user_email" name="user_email" value="${member}">
		<div class = "domain">
		<p> 제목 </p>
		<input class = "subject" id = "subject" type = "text" name = "subject" placeholder="제목을 입력해주세요" autocomplete='off'>
		</div>
		<div class="domain">
		<p>이용날짜 </p>
		<div class="s-e_date">
		<div class = "domain">
		<input class = "date" id = "start_date" type = "text" name = "start_date" placeholder="시작 날짜를 선택하세요" autocomplete='off'>
		</div>
		<div class = "domain">
		<input class = "date" id = "end_date" type = "text" name = "end_date" placeholder="종료 날짜를 선택하세요" autocomplete='off'>
		</div>
		</div>
		</div>
		
		<div class = "domain">
		<p> 이용 시간 </p>
		<div class="all_day-r">
		<input type="radio" class="all_day" name="all_day" value="1" onchange="handlech(this)" checked>종일
		<input type="radio" class="all_day" name="all_day" value="0" onchange="handlech(this)">시간 선택
		</div>
		<div id="timech">
			<input type="text" class="st_time" name="st_time" placeholder="시작시간" style="display:none;" autocomplete='off'>
			<input type="text" class="ed_time" name="ed_time" placeholder="종료시간" style="display:none;" autocomplete='off'>
		</div>
		</div>
		
		<div class = "domain">
			<p> 전달사항 </p>
		<div>
			<textarea id = "memo" name = "memo" rows = "5" cols = "50" placeholder="전달사항을 입력하세요"></textarea> 
		</div>
		</div>
		
	</form>
		<button id="ok-button" type="button">확인</button>
	</div>	
</div>
<script src="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.js"></script>
</body>
</html>