<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page errorPage="error"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>schedule_calendar</title>
<link
	href="//cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/css/bootstrap.css"
	rel="stylesheet" />
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js">
</script>

<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript"
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>
<script src="http://code.jquery.com/jquery-1.10.1.min.js"></script>
<script src="http://code.jquery.com/jquery-migrate-1.2.1.min.js"></script>

<style>
div {
	font-size: 1.5vw;
}

.boxCalendarParent {
	position: relative;
	overflow: hidden;
	display: inline-block;
	width: 10vw;
	height: 10vw;
	margin: 0px;
	padding: 0px;
	border: 0px solid #aaaaaa;
}

.planClass {
	position: static;
	top: auto;
	left: auto;
	display: inline-block;
	width: 100%;
	height: 1vw;
	border: 0px solid #aaaaaa;
	background-color: coral;
}
</style>

<script src="resources/moment-with-locales.js"></script>
<script type="text/javascript">

var planId;

	/* 프로젝트 시작일과 마감일을 받아서 시작 */

	var startdate = moment('${pj.startdate}').format('YYYY-MM-DD-hh-mm-ss');
	var enddate = moment('${pj.enddate}').format('YYYY-MM-DD-hh-mm-ss');

	console.log('원래 프로젝트 기간:::' + startdate + '~' + enddate);

	var firstDate = stringToDate(startdate);
	console.log('firstDate ::::::::' + firstDate);
	var firstDateYear = moment(firstDate).format('YYYY');
	console.log('firstDateYear ::::::::' + firstDateYear);
	firstDate = new Date(firstDateYear, firstDate.getMonth(), 1);
	startdate = moment(firstDate).format('YYYY-MM-DD-hh-mm-ss');

	var lastDate = stringToDate(enddate);
	console.log('lastDate ::::::::' + lastDate);
	var lastDateYear = moment(lastDate).format('YYYY');
	console.log('lastDateYear ::::::::' + lastDateYear);
	lastDate = new Date(lastDateYear, lastDate.getMonth() + 1, 0);

	enddate = moment(lastDate).format('YYYY-MM-DD-HH-mm-ss');

	console.log('달력 출력:::' + startdate + '~' + enddate);

	var todayDate = new Date();
	var todayDateToString = moment(todayDate).format('YYYY-MM-DD-HH-mm-ss');

	var todayDateXval = null; 
	//스케쥴의 열의 수
	var scheduleVariety = 10;

	//종료일과 시작일의 차를 구함(종료일-시작일)
	function calDateRange(startdate, enddate) {
		var FORMAT = "-";

		if (startdate.length != 19) {
			return null;
		}

		if (enddate.length != 19) {
			return null;
		}

		if (startdate.indexOf(FORMAT) < 0 || enddate.indexOf(FORMAT) < 0)
			return null;

		var start_dt = startdate.split(FORMAT);
		var end_dt = enddate.split(FORMAT);

		start_dt[1] = (Number(start_dt[1]) - 1) + "";
		end_dt[1] = (Number(end_dt[1]) - 1) + "";

		var from_dt = new Date(start_dt[0], start_dt[1], start_dt[2],
				00, 00, 00);
		var to_dt = new Date(end_dt[0], end_dt[1], end_dt[2], 00,
				00, 00);

		if (from_dt > to_dt) {
			return parseInt((from_dt.getTime() - to_dt.getTime())
					/ (1000 * 60 * 60 * 24));
		} else {
			return parseInt((to_dt.getTime() - from_dt.getTime())
					/ (1000 * 60 * 60 * 24));
		}
	}

	function stringToDate(varDate) {
		var FORMAT = "-";

		// FORMAT을 포함한 길이를 체크
		if (varDate.length != 19)
			return null;

		// FORMAT이 있는지 체크
		if (varDate.indexOf(FORMAT) < 0)
			return null;

		// 년, 월, 일 구분
		var var_dt = varDate.split(FORMAT);

		var_dt[1] = (Number(var_dt[1]) - 1) + "";

		var return_dt = new Date(var_dt[0], var_dt[1], var_dt[2], var_dt[3],
				var_dt[4], var_dt[5]);

		return return_dt;
	}

	function pageLoad() {

		document.getElementById('scheduleDiv').innerHTML = "";

		var varDate = stringToDate(startdate);
		var schedulePeriod = calDateRange(startdate, enddate) + 1;

		document.getElementById('scheduleDiv').innerHTML += '<font size="0.2em">';
		
		/* 여기부터 일요일을 표시 */
		for (var j = 0; j <= schedulePeriod; j++) {
			
			var newDiv = document.createElement('DIV'); 

			newDiv.setAttribute('class', 'boxCalendarParent');
			newDiv.innerHTML += varDate.getDate();
			newDiv.innerHTML += '<input type="hidden" value='+moment(
					varDate).format('MMDD').toString()+'>';

			if (varDate.getDay() == 0) {
				newDiv.setAttribute('style', 'background-color:#d95b5b');
			}

			if (varDate.getDate() == 1) {
				document.getElementById('scheduleDiv').innerHTML += '<br>';
				document.getElementById('scheduleDiv').innerHTML += '<div>'+moment(
						varDate).format('MMMM').toString()+'</div>';

				if (varDate.getDay() != 0) {

					for (var iIns = 0; iIns < Number(varDate.getDay()); iIns++) {
						var blankDiv = document.createElement('DIV'); 
						blankDiv.setAttribute('class', 'boxCalendarParent');
						blankDiv.innerHTML = '';
						document.getElementById('scheduleDiv').appendChild(
								blankDiv);
					}

				}
			}

			if (varDate.getDay() == 0) {
				document.getElementById('scheduleDiv').innerHTML += '<br>';
			}

			if (moment(varDate).format('YYYYMMDD') == moment(todayDate).format(
					'YYYYMMDD')) {
				newDiv.setAttribute('name', 'today');
				document.getElementById('scheduleDiv').innerHTML += '<input type="hidden" id="todayToScroll">';
			}

			var vardateLastDateofThisMonth = new Date(varDate.getYear(),
					varDate.getMonth() + 1, 0);

			//1일에 색을 부여함
			//1주일에 색을 부여함
			var varDateMMDD = moment(varDate).format('YYYYMMDD');

			newDiv.setAttribute('id', 'dropon' + varDateMMDD); // x를 설정
			newDiv.setAttribute('class', 'boxCalendarParent');

			document.getElementById('scheduleDiv').appendChild(newDiv);

			if (varDate.getDate() == vardateLastDateofThisMonth.getDate()) {
				if (varDate.getDay() != 6) {
					for (var iIns = 0; iIns < 7 - (varDate.getDay() + 1); iIns++) {
						var blankDiv = document.createElement('DIV'); 
						blankDiv.setAttribute('class', 'boxCalendarParent');
						blankDiv.innerHTML = '';
						document.getElementById('scheduleDiv').appendChild(
								blankDiv);
					}
				}
			}

			varDate.setDate(varDate.getDate() + 1);
			if (varDate.getDate() == vardateLastDateofThisMonth.getDate()) {
				document.getElementById('scheduleDiv').innerHTML += '</div>';
			}
		}

	}

	todayDateXval = calDateRange(startdate, todayDateToString);

	function scheduleUpdate() {

		var yIns = 0;

		console.log('${planList}');

		<c:forEach items="${planList}" var="planString">

		var pstartdate = '${planString.pstartdate}';
		pstartdate = pstartdate.substring(0, 19);
		pstartdate = pstartdate.replace(" ", "-");
		pstartdate = pstartdate.replace(":", "-");
		pstartdate = pstartdate.replace(":", "-");

		var pstartdateAsDate = stringToDate(pstartdate);
		//date타입으로 변경

		var penddate = '${planString.penddate}';
		penddate = penddate.substring(0, 19);
		penddate = penddate.replace(" ", "-");
		penddate = penddate.replace(":", "-");
		penddate = penddate.replace(":", "-");

		var penddateAsDate = stringToDate(penddate);

		var color = '${planString.color}';
		color = color.replace("\"", "");
		color = color.replace("\"", "");

		var xStartDate = calDateRange(startdate, pstartdate);
		var xLengthIns = calDateRange(pstartdate, penddate);

		var widthVal = (xLengthIns + 1);

		for (var i = 0; i < widthVal; i++) { 
			if (document.getElementById('draggable' + '${planString.pno}'
					+ 'no' + i) != null) {
				$('#draggable' + '${planString.pno}' + 'no' + i).remove();
			}
			//기존 일정을 삭제

			var newDiv = document.createElement('DIV');
			var xIns = xStartDate + i;

			// x를 설정
			newDiv.setAttribute('i', i); // div의 순서와 i를 설정 
			newDiv.setAttribute('pno', '${planString.pno}');
			newDiv.setAttribute('pstartdate', pstartdate);
			newDiv.setAttribute('penddate', penddate);

			newDiv.setAttribute('planName', '${planString.planname}');
			newDiv.setAttribute('PJNo', '${planString.pjno}');
			newDiv.setAttribute('memberIdIns', '${planString.id}');
			newDiv.setAttribute('Priority', '${planString.priority}');
			newDiv.setAttribute('Progress', '${planString.progress}');
			newDiv.setAttribute('color', color);
			newDiv.setAttribute('xStartDate', xStartDate);
			newDiv.setAttribute('xLengthIns', xLengthIns);
			newDiv.setAttribute('onclick', "openPlan('${planString.pno}')");
			newDiv.setAttribute('widthVal', widthVal); 
			newDiv.setAttribute('id', 'draggable' + '${planString.pno}' + 'no'
					+ i);
			newDiv.setAttribute('style', 'width: 100%;' + 'height: 2vw;'
					+ 'border: 0px solid #aaaaaa;' + 'background-color: '
					+ color);
			newDiv.setAttribute('onmouseover', "mouseOver(this)");
			newDiv.setAttribute('onmouseout', "mouseOut(this)");

			var tempDate = pstartdateAsDate;
			tempDate.setDate(pstartdateAsDate.getDate());
			var varDateMMDD = moment(tempDate).format('YYYYMMDD').toString();
			tempDate = pstartdateAsDate;

			var parentID = 'dropon' + varDateMMDD;
			
			if ( moment(todayDate).format('YYYYMMDD') == varDateMMDD) {
				newDiv.setAttribute('name', 'today');				
			}
			
			tempDate.setDate(pstartdateAsDate.getDate() + 1);

			if (document.getElementById(parentID) != null) {
				document.getElementById(parentID).appendChild(newDiv);
			} else {
			}

		}
		
		</c:forEach>

	}

	function openPlan(pno) {
		
		var popupWidth = 600;
		var popupHeight = 500;
		var popupX = (window.screen.width / 2) - (popupWidth / 2);
		var popupY= (window.screen.height /2) - (popupHeight / 2);

		//pno를 가지고 컨트롤러로 이동
		window
				.open("getThePlan?pno=" + pno, "일정내용",
						'width='+popupWidth+'px, height='+popupHeight+'px, toolbar=no, menubar=no, scrollbars=no, resizable=yes left='
						+ popupX + ', top='+ popupY + ', screenX='+ popupX + ', screenY= '+ popupY);
	}

	function mouseOver(divMouseOver) {

		divMouseOver
				.setAttribute(
						"title",
						(divMouseOver.getAttribute("pno") + " / "
								+ divMouseOver.getAttribute("planName") + " : "
								+ divMouseOver.getAttribute("pstartdate")
								+ " ~ " + divMouseOver.getAttribute("penddate")));
	}

	var intervalOn = false;
	var blinkIntervalBoolean = true;
	var blinkInterval = null;
	var getName = null;
	
		function blinking() {
			var blinkingObject = document.getElementsByName('today');

			intervalOn = !intervalOn;

			if (intervalOn) {
				clearInterval(blinkInterval);
				for (var i = 0; i < blinkingObject.length; i++) {
					if (blinkingObject[i].getAttribute('color') != null) {
						$(blinkingObject[i]).css("background-color",
								blinkingObject[i].getAttribute('color'));
					} else {
						$(blinkingObject[i]).css("background-color", "#ffcb5e");
					}
				}
				return;
			}


			blinkInterval = setInterval(
					function() {
						blinkIntervalBoolean = !blinkIntervalBoolean;
						console.log(blinkIntervalBoolean);

						for (var i = 0; i < document.getElementsByName('today').length; i++) {
							if (blinkIntervalBoolean) {
								$(blinkingObject[i]).css("background-color",
										"#ffcb5e");
							} else {
								if (blinkingObject[i].getAttribute('color') != null) {
									$(blinkingObject[i]).css(
											"background-color",
											blinkingObject[i]
													.getAttribute('color'));
								} else {
									$(blinkingObject[i]).css(
											"background-color", "#FFFFFF");
								}
							}
						}
					}, 500);
		}
		
</script>

</head>
<body>

	<div id="scheduleDiv"
		style="white-space: nowrap; overflow: auto; margin: 0px; padding: 0px;"
		align="center"></div>

	<script type="text/javascript">
		console.log(Number('${pjNO}'));

		pageLoad();

		scheduleUpdate();
	</script>


</body>
</html>
