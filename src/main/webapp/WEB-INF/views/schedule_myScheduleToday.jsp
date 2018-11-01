<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page errorPage="error"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>schedule_myScheduleToday</title>
<link
	href="//cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/css/bootstrap.css"
	rel="stylesheet" />
<script type="text/javascript"
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>
<script src="http://code.jquery.com/jquery-1.10.1.min.js"></script>
<script src="http://code.jquery.com/jquery-migrate-1.2.1.min.js"></script>

<style>
.boxCalendar {
	display: inline-block;
	width: 100%;
	height: 2.9vh;
	font-size: 2.2vh;
	margin: 0px;
	padding: 0px;
	border: 0px solid #aaaaaa;
}

.boxDiv {
	overflow: visible;
	display: inline-block;
	width: 100%;
	/* height: 2.9vh;
	font-size: 1.2vh; */
	font-size: 5vh;
	margin: 0px;
	padding: 0px;
	border: 0px solid #aaaaaa;
}

.dragClass {
	position: static;
	top: auto;
	left: auto;
	display: inline-block;
	width: 60%;
	height: 100%;
	font-size: 1.2vh;
	border: 0px solid #aaaaaa;
	background-color: coral;
}
</style>

<script src="resources/moment-with-locales.js"></script>
<script type="text/javascript">

	var todayDate = new Date();	
	var todayDateToString = moment(todayDate).format('YYYY-MM-DD-hh-mm-ss');	
	
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
				start_dt[3], start_dt[4], start_dt[5]);
		var to_dt = new Date(end_dt[0], end_dt[1], end_dt[2], end_dt[3],
				end_dt[4], end_dt[5]);

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

		if (varDate.length != 19)
			return null;

		if (varDate.indexOf(FORMAT) < 0)
			return null;

		var var_dt = varDate.split(FORMAT);

		var_dt[1] = (Number(var_dt[1]) - 1) + "";

		var return_dt = new Date(var_dt[0], var_dt[1], var_dt[2], var_dt[3],
				var_dt[4], var_dt[5]);

		return return_dt;
	}

	var oldParentID;
	var newParentID;

	function pageLoad() {

		document.getElementById('scheduleDiv').innerHTML = "";

		var varDate = new Date();
		varDate.setHours(00);
		varDate.setMinutes(00);
		
		console.log(varDate);

		var newDiv = '<DIV class="boxDiv"';
		
		newDiv += ' id="scheduleToday" align="left">';

		newDiv += '</div><br>';	

		document.getElementById('scheduleDiv').innerHTML += newDiv;

		for (var j = 0; j < 48; j++) {
			var newDiv = '<DIV class="boxDiv" ';
			
			if (varDate.getMinutes() == 0) {
				newDiv += 'style="border-top: 2px ';
			} else {
				newDiv += 'style="border-top: 0px ';				
			}

			if (varDate.getHours() >= 12) {
				newDiv += 'solid #1f2944; color:#1f2944;"';
			} else { //00:00~12:00
				newDiv += 'solid #1f2944; color:#1f2944;"';
			}

			var newDivId = "";
			var newDivInnerHTML = "";
			if (varDate.getHours() < '10') {
				newDivId += '0' + varDate.getHours();			
				newDivInnerHTML += '0' + varDate.getHours();			
			} else {				
				newDivId += varDate.getHours();
				newDivInnerHTML += varDate.getHours();
			}
			
			if (varDate.getMinutes().toString() == '0') {
				newDivId += '00';			
				newDivInnerHTML += ':' + '00';			
			} else {				
				newDivId += varDate.getMinutes();
				newDivInnerHTML += ':' + varDate.getMinutes();
			}
			
			if (
					Number(moment(todayDate).format('HH00')) == Number(moment(varDate).format('HHmm'))
					&& Number(moment(todayDate).format('HHmm')) > Number(moment(varDate).format('HH00'))
					&& Number(moment(todayDate).format('HHmm')) < Number(moment(varDate).format('HH30'))) {
				
				newDiv += ' name="today"';
				newDivInnerHTML += '<input type="hidden" id="todayToScroll">';
			}
			
				
			newDiv += ' id="divPlan' + newDivId;
			newDiv += '" >';
			newDiv += newDivInnerHTML;
			newDiv += '</div>';			
			
			varDate.setMinutes(varDate.getMinutes() + 30);
			
			document.getElementById('scheduleDiv').innerHTML += newDiv;
			document.getElementById('scheduleDiv').innerHTML += '<br>';
		}

	}

	function scheduleUpdate() {

		<c:forEach items="${planList}" var="planString">

		console.log('${planString.pstartdate}');

		var pstartdate = '${planString.pstartdate}';
		pstartdate = pstartdate.substring(0, 19);
		pstartdate = pstartdate.replace(" ", "-");
		pstartdate = pstartdate.replace(":", "-");
		pstartdate = pstartdate.replace(":", "-");

		var pstartdateDate = stringToDate(pstartdate);
		
		var penddate = '${planString.penddate}';
		penddate = penddate.substring(0, 19);
		penddate = penddate.replace(" ", "-");
		penddate = penddate.replace(":", "-");
		penddate = penddate.replace(":", "-");

		var penddateDate = stringToDate(penddate);

		todayDateYMD = moment(todayDate).format('YYYYMMDD');
		pstartdateYMD = moment(pstartdateDate).format('YYYYMMDD');
		penddateYMD = moment(penddateDate).format('YYYYMMDD');

		var isThisToday = (todayDateYMD == pstartdateYMD && todayDateYMD == penddateYMD);

		var includeToday = (
				todayDateYMD == pstartdateYMD ||
				todayDateYMD == penddateYMD ||
				(todayDate > pstartdateDate && todayDate < penddateDate));
		
		console.log('today::::::: '+ todayDateYMD);
		console.log('plan Start:: '+ pstartdateYMD);
		console.log('plan Ends::: '+ penddateYMD);
		
		console.log('${planString.planname} is today?? ' + isThisToday);
		console.log('${planString.planname} include today?? ' + includeToday);
		
		var color = '${planString.color}';
		color = color.replace("\"", "");
		color = color.replace("\"", "");
		
		if (includeToday) {
			var newDiv = '<DIV class="boxDiv" ';
			newDiv += 'onclick="openPlan(${planString.pno})" ';
			newDiv += '><font color="'+color+'">■</font> ${planString.planname} : ' + pstartdateYMD + ' ~ ' + penddateYMD;
			newDiv += '</div><br>';
			
			document.getElementById("scheduleToday").innerHTML += newDiv;
		}
		
	if (isThisToday) {
		pstartdateHM = moment(pstartdateDate).format('HHmm');
		penddateHM = moment(penddateDate).format('HHmm');
		
		console.log('::::::: ${planString.planname}'+pstartdateHM+'~'+penddateHM);
		
		var i = pstartdateDate;
		i.setMinutes(0);
		var StartEndcompare = false;
		while (!StartEndcompare) {

			if (i > penddateDate) {
				console.log('true');
				StartEndcompare = true;
			}
			
			var appendTo = 'divPlan' + moment(i).format('HHmm');
			console.log(appendTo);
			
			if (document.getElementById(appendTo) != null) {
				var appendToHTML = "";
				appendToHTML += '<DIV class="boxDiv" onclick=';
				appendToHTML += '"javascript: openPlan(${planString.pno})" ';
				appendToHTML += '><font color="'+color+'">■</font> ${planString.planname}' + ' : ' + pstartdateHM + ' ~ ' + penddateHM;
				appendToHTML += '</div>';
				document.getElementById(appendTo).innerHTML += appendToHTML;
			}
			
			i.setMinutes(i.getMinutes()+30);

		}
		
	}
	
	</c:forEach>
	
}
	
	function openPlan(pno) {
		
		var popupWidth = 600;
		var popupHeight = 500;
		var popupX = (window.screen.width / 2) - (popupWidth / 2);
		var popupY= (window.screen.height / 2) - (popupHeight / 2);
		
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
	var blinkIntervalBoolean = false;
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
						$(blinkingObject[i]).css("background-color", "#FFFFFF"); //#ffcb5e
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
										"#ffcb5e"); //#ffcb5e
							} else {
								if (blinkingObject[i].getAttribute('color') != null) {
									$(blinkingObject[i]).css(
											"background-color",
											blinkingObject[i]
													.getAttribute('color'));
								} else {
									$(blinkingObject[i]).css(
											"background-color", "#FFFFFF");//"#FFFFFF"
								}
							}
						}
					}, 500);
		}

</script>

</head>
<body>

	<div id="scheduleDiv"
		style="white-space: nowrap; overflow: auto; margin: 0px; padding: 0px"
		align="left"></div>

	<script type="text/javascript">
		console.log(Number('${pjNO}'));

		pageLoad();

		scheduleUpdate();
	</script>
</body>
</html>