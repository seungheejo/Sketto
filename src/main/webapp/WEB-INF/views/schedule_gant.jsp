<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page errorPage="error"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>schedule_gant</title>
<link href="resources/css/bootstrapu.css" rel="stylesheet" />
<script type="text/javascript"
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>
<script src="http://code.jquery.com/jquery-1.10.1.min.js"></script>
<script src="http://code.jquery.com/jquery-migrate-1.2.1.min.js"></script>

<style>
div {
	font-size: 5vw;
}

.boxCalendar {
	display: inline-block;
	width: 5vw;
	height: 5vw;
	margin: 0px;
	padding: 0px;
	border: 0px solid #aaaaaa;
	font-size: 1px;
}

.boxDiv {
	position: relative;
	overflow: hidden;
	display: inline-block;
	width: 5vw;
	height: 5vw;
	margin: 0px;
	padding: 0px;
	border: 0px solid #aaaaaa;
	border-top: 2px solid #ffcb5e;
	font-size: 2vw;
}

.dragClass {
	position: static;
	top: auto;
	left: auto;
	display: inline-block;
	width: 100%;
	height: 100%;
	border: 0px solid #aaaaaa;
	background-color: coral;
	font-size: 1px;
}
</style>

<script src="resources/moment-with-locales.js"></script>
<script type="text/javascript">
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
	var todayDateToString = moment(todayDate).format('YYYY-MM-DD-hh-mm-ss');	
	
	var todayDateXval = null; 
	
	var scheduleVariety = 5;
	<c:forEach items="${planList}" var="planString">
	scheduleVariety = scheduleVariety+1;
	</c:forEach>

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
		} else if (from_dt < to_dt) {
			return parseInt((to_dt.getTime() - from_dt.getTime())
					/ (1000 * 60 * 60 * 24));
		} else {
			return 1;
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

	function allowDrop(ev) {
		ev.preventDefault();
	}

	var oldParentID;
	var newParentID;

	function drag(ev) {
		
		//dragTextにidを入れる
		ev.dataTransfer.setData("dragText", ev.target.id);
		var divId = ev.dataTransfer.getData("dragText");
		
		//divIdを利用してxとyを持って来る
		var originalX = document.getElementById(divId).getAttribute('x');
		var originalY = document.getElementById(divId).getAttribute('y');

		oldParentID = 'dropon' + originalX + originalY;

	} 

	function drop(ev) {
		
		if (confirm("해당 일정을 변경하시겠습니까?")) {
			
			ev.preventDefault();

			var divId = ev.dataTransfer.getData("dragText");
			var originalX = document.getElementById(divId).getAttribute('x');
			var originalY = document.getElementById(divId).getAttribute('y');
			var originalI = document.getElementById(divId).getAttribute('i');
			var originalWidthVal = document.getElementById(divId).getAttribute(
					'widthVal');

			var newX = Number(document.getElementById(ev.target.id)
					.getAttribute('x'));
			var newY = Number(document.getElementById(ev.target.id)
					.getAttribute('y')); 
			
			newParentID = 'dropon' + newX + newY;

			var Xdifference = (Number(originalX) - Number(newX));

			console.log('Number(originalX) (' + Number(originalX)
					+ ') - Number(newX)(' + Number(newX) + ') = Xdifference('
					+ Xdifference + ')');

			var Ydifference = (Number(originalY) - Number(newY));

			console.log('Number(originalY) (' + Number(originalY)
					+ ') - Number(newY)(' + Number(newY) + ') = Ydifference('
					+ Ydifference + ')');

			var idForm = document.getElementById(divId).getAttribute('id');
			idForm = idForm.slice(0, idForm.lastIndexOf("o") + 1);
			
			var pstartdate = document.getElementById(idForm + 0).getAttribute(
					'pstartdate');
			var penddate = document.getElementById(idForm + 0).getAttribute(
					'penddate');
			var xStartDate = Number(document.getElementById(idForm + 0)
					.getAttribute('xStartDate'));
			var xLengthIns = Number(document.getElementById(idForm + 0)
					.getAttribute('xLengthIns')); 

			var booleanChangingOnlyEndDate = false;

			if (divId == (idForm + Number(originalWidthVal - 1))) {

				if (Number(newX) > Number(xStartDate)
						&& Number(newX) < Number(xStartDate + xLengthIns)) {
					
					if (confirm('기간 조절이 이뤄집니다 : 기간 축소')) {
						booleanChangingOnlyEndDate = true;
				
					} else {
						booleanChangingOnlyEndDate = false;
						return;
						
					}
				}

				else if (Number(newX) > Number(xStartDate + xLengthIns)) {
			
					if (confirm('기간 조절이 이뤄집니다 : 기간 연장')) {
						booleanChangingOnlyEndDate = true;
					} else {
						booleanChangingOnlyEndDate = false;
						return;
					}
				}
			}

			var IntoX;
			var IntoY; 

			for (var j = 0; j < originalWidthVal; j++) {
				
				IntoX = Number(document.getElementById(idForm + j)
						.getAttribute('x'))
						- Xdifference;
				IntoY = Number(document.getElementById(idForm + j)
						.getAttribute('y'))
						- Ydifference;
			
				if (document.getElementById(divId) == document
						.getElementById(idForm + j)
						|| booleanChangingOnlyEndDate) {
					IntoX = Number(document.getElementById(idForm + j)
							.getAttribute('x'));

					IntoY = Number(document.getElementById(idForm + j)
							.getAttribute('y'));
				}

				document.getElementById(idForm + j).setAttribute('x', IntoX);
				document.getElementById(idForm + j).setAttribute('y', IntoY);

				newParentID = 'dropon' + IntoX + IntoY;
				
				if (document.getElementById(newParentID) != null) {
					document.getElementById(newParentID).appendChild(
							document.getElementById(idForm + j));
				}
				
				var dateChangeIns = Xdifference;
				var startdateToDate = stringToDate(pstartdate);
				var enddateToDate = stringToDate(penddate);

				if (booleanChangingOnlyEndDate) {
					startdateToDate.setDate(stringToDate(pstartdate).getDate());
				} else {
					startdateToDate.setDate(startdateToDate.getDate()
							- dateChangeIns);
				}
				enddateToDate.setDate(enddateToDate.getDate() - dateChangeIns);

				if (startdateToDate > enddateToDate) {
					concole.log('startdateToDate(' + startdateToDate
							+ ') > enddateToDate(' + enddateToDate + ')');

					var temp = startdateToDate;
					startdateToDate = enddateToDate;
					enddateToDate = temp;
				}

				var startdateEdittedString = moment(startdateToDate).format(
						'YYYY-MM-DD-hh-mm-ss');
				
				document.getElementById(idForm + j).setAttribute('pstartdate',
						startdateEdittedString);

				//varDateで変更された差(varDate.getDate() - dateChange)を適用
				var enddateEdittedString = moment(enddateToDate).format(
						'YYYY-MM-DD-hh-mm-ss');

				document.getElementById(idForm + j).setAttribute('penddate',
						enddateEdittedString);

			}
			
			var insPNO = document.getElementById(idForm + 0).getAttribute('pno');
			insPNO = insPNO.replace("\"", "");
			insPNO = insPNO.replace("\"", "");

			var planNameIns = document.getElementById(idForm + 0).getAttribute(
					'planName').toString().replace("\"", "");
			planNameIns = planNameIns.replace("\"", "");

			var idListIns = JSON.parse(document.getElementById(idForm + 0)
					.getAttribute('memberIdIns')).toString();


			console.log("insPNO ::::::::::::::" + insPNO);
			console.log("planName ::::::::::::::"
					+ document.getElementById(idForm + 0).getAttribute(
							'planName'));
			console.log("planName ::::::::::::::" + planNameIns);
			console.log("memberIdIns ::::::::::::::"
					+ document.getElementById(idForm + 0).getAttribute(
							'memberIdIns'));
			console.log("memberIdIns ::::::::::::::" + idListIns);

			var planInsJSON = {
				"PNO" : insPNO,
				"planName" : planNameIns,
				"pStartDate" : document.getElementById(idForm + 0)
						.getAttribute('pstartdate'),
				"pEndDate" : document.getElementById(idForm + 0).getAttribute(
						'penddate'),
				"PJNo" : document.getElementById(idForm + 0).getAttribute(
						'PJNo'),
				"id" : idListIns,
				"Priority" : document.getElementById(idForm + 0).getAttribute(
						'Priority'),
				"Progress" : document.getElementById(idForm + 0).getAttribute(
						'Progress'),
				"color" : document.getElementById(idForm + 0).getAttribute(
						'color')
			};
			
			pageLoad();

			$
					.ajax({
						url : 'updateJ',
						type : 'GET',
						dataType : 'text',
						data : {
							'jsonString' : JSON.stringify(planInsJSON)
						},
						success : function() {
							parent.scheduleIframe.src = parent.scheduleIframe.src;
						},
						error : function(error) {
							alert('에러발생\n' + JSON.stringify(error));
						}
					});

		}

	}

	function pageLoad() {
		document.getElementById('scheduleDiv').innerHTML = "";

		var varDate = stringToDate(startdate);
		console.log(varDate);
		var schedulePeriod = calDateRange(startdate, enddate);

		for (var j = 0; j < schedulePeriod; j++) {
			var newDiv = document.createElement('DIV'); 

			newDiv.setAttribute('class', 'boxDiv');

			if (varDate.getDay() == 0) {
				newDiv.setAttribute('style', 'background-color:#d95b5b');
			}

			if (varDate.getDate() == 1) {
				newDiv.setAttribute('style', 'background-color:#1f2944; color:#fff; border-left: 1px solid #5c948d;');
				newDiv.innerHTML += moment(varDate).format('MMMM') + '<br>';
			} else {
				newDiv.innerHTML += '<br>';
			}

			if (moment(varDate).format('YYYYMMDD') ==
				moment(todayDate).format('YYYYMMDD')) {
				newDiv.setAttribute('name', 'today');
				newDiv.innerHTML += ' <input type="hidden" id="todayToScroll">';
			}
			
			newDiv.innerHTML += varDate.getDate();
			varDate.setDate(varDate.getDate() + 1);

			document.getElementById('scheduleDiv').appendChild(newDiv);
		}

		document.getElementById('scheduleDiv').innerHTML += '<br>';


		for (var i = 0; i < scheduleVariety; i++) {
			var varDateEach = stringToDate(startdate);
			for (var j = 0; j < schedulePeriod; j++) {
				var newDiv = document.createElement('DIV'); 

				newDiv.setAttribute('x', j);
				newDiv.setAttribute('y', i); 
				newDiv.setAttribute('id', 'dropon' + j + i); 
				newDiv.setAttribute('class', 'boxDiv');
				newDiv.setAttribute('ondrop', 'drop(event)');
				newDiv.setAttribute('ondragover', 'allowDrop(event)');
				document.getElementById('scheduleDiv').appendChild(newDiv);

			}
			document.getElementById('scheduleDiv').innerHTML += '<br>';
		}

	}

	todayDateXval = calDateRange(startdate, todayDateToString);
	
	function scheduleUpdate() {

		var yIns = 0;

		console.log('${planList}');

		<c:forEach items="${planList}" var="planString">

		console.log('${planString.pstartdate}');

		var pstartdate = '${planString.pstartdate}';
		pstartdate = pstartdate.substring(0, 19);
		pstartdate = pstartdate.replace(" ", "-");
		pstartdate = pstartdate.replace(":", "-");
		pstartdate = pstartdate.replace(":", "-");

		var penddate = '${planString.penddate}';
		penddate = penddate.substring(0, 19);
		penddate = penddate.replace(" ", "-");
		penddate = penddate.replace(":", "-");
		penddate = penddate.replace(":", "-");

		console.log(pstartdate);
		console.log('${planString.color}');

		var color = '${planString.color}';
		color = color.replace("\"", "");
		color = color.replace("\"", "");

		var xStartDate = calDateRange(startdate, pstartdate);
		var xLengthIns = calDateRange(pstartdate, penddate);

		var widthVal = xLengthIns + 1;

		for (var i = 0; i < widthVal; i++) { 
			if (document.getElementById('draggable' + '${planString.pno}'
					+ 'no' + i) != null) {
				$('#draggable' + '${planString.pno}' + 'no' + i).remove();
				console.log('::::::::::::::::::::::::제거')
			}
			var newDiv = document.createElement('DIV'); 
			var xIns = xStartDate + i;
			
			newDiv.setAttribute('x', xIns); 
			newDiv.setAttribute('y', yIns); 
			newDiv.setAttribute('i', i); 
			newDiv.setAttribute('pno', '${planString.pno}');
			newDiv.setAttribute('pstartdate', pstartdate);
			newDiv.setAttribute('penddate', penddate);
		
			if (xIns == todayDateXval) {
				newDiv.setAttribute('name','today');
			}
			
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
			newDiv.setAttribute('style', 'width: 100%;' + 'height: 100%;'
					+ 'border: 0px solid #aaaaaa;' + 'background-color: '
					+ color);
			newDiv.setAttribute('draggable', 'true');
			newDiv.setAttribute('ondragstart', 'drag(event)');
			newDiv.setAttribute('onmouseover',"mouseOver(this)");
			newDiv.setAttribute('onmouseout',"mouseOut(this)");

			var parentID = 'dropon' + xIns + yIns;

			console.log(':::::::::::::::::::::appending');

			if (document.getElementById(parentID) != null) {
				document.getElementById(parentID).appendChild(newDiv);
			}

		}

		yIns++;

		</c:forEach>
	}

	function openPlan(pno) {
		
		var popupWidth = 600;
		var popupHeight = 500;
		var popupX = (window.screen.width / 2) - (popupWidth / 2);
		var popupY= (window.screen.height /2) - (popupHeight / 2);

		window
				.open("getThePlan?pno=" + pno, "일정내용",
						'width='+popupWidth+'px, height='+popupHeight+'px, toolbar=no, menubar=no, scrollbars=no, resizable=yes left='
						+ popupX + ', top='+ popupY + ', screenX='+ popupX + ', screenY= '+ popupY);
	}
	
	function mouseOver(divMouseOver) {
		console.log(divMouseOver);
	}

	function mouseOut(divMouseOver) {
		console.log(divMouseOver);
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
		style="white-space: nowrap; overflow: auto; margin: 0px; padding: 0px"
		align="center"></div>

	<script type="text/javascript">
		console.log(Number('${pjNO}'));

		pageLoad();
		
		scheduleUpdate();
		
	</script>
</html>