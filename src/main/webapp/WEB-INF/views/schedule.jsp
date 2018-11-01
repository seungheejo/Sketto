<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page errorPage="error"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>schedule</title>
<link href="resources/css/bootstrapu.css" rel="stylesheet" />
<script type="text/javascript"
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>
<script src="resources/jquery-3.3.1.js"></script>

<style>
div {
	font-size: large;
}

.boxCalendar {
	display: inline-block;
	width: 22px;
	height: 22px;
	margin: 0px;
	padding: 0px;
	border: 0px solid #aaaaaa;
}

.boxDiv {
	position: relative;
	overflow: hidden;
	display: inline-block;
	width: 22px;
	height: 22px;
	margin: 0px;
	padding: 0px;
	border: 0px solid #aaaaaa;
}

.dragClass {
	position: static;
	top: auto;
	left: auto;
	display: inline-block;
	width: 20px;
	height: 20px;
	border: 0px solid #aaaaaa;
	background-color: coral;
}

.topnav {
	background-color: #1f2944;
	overflow: hidden;
}

.topnav a {
	float: left;
	color: #fff;
	text-align: center;
	padding: 14px 16px;
	text-decoration: none;
	font-size: 17px;
	margin-top: 15px;
}

.topnav a:hover {
	background-color: #ddd;
	color: black;
}

.topnav a.active {
	background-color: #5c948d;
	color: white;
}

.card text-center {
	width: 18rem;
	FLOAT: LEFT;
}

.dropdown {
	position: relative;
	display: inline-block;
}

.dropdown-content {
	display: none;
	position: absolute;
	background-color: #f1f1f1;
	min-width: 160px;
	box-shadow: 0px 8px 16px 0px rgba(0, 0, 0, 0.2);
	z-index: 1;
}

.dropdown-content a {
	color: black;
	padding: 12px 16px;
	text-decoration: none;
	display: block;
}

.dropdown-content a:hover {
	background-color: #ddd
}

.dropdown:hover .dropdown-content {
	display: block;
}

.dropdown:hover .dropbtn {
	background-color: #3e8e41;
}
</style>

<script src="resources/moment-with-locales.js"></script>
<script type="text/javascript">
	window.onload = function() {
		window.ActionDeterminator = function() {
		};
	};

	var startdate = "2018-04-01-00-00-00";
	var enddate = "2018-06-30-00-00-00";
	var todayDate = new Date();
	var todayDateToString = moment(todayDate).format('YYYY-MM-DD-HH-mm-ss');

	var todayDateXval = null;

	var scheduleVariety = 10;

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

	function createPlan() {
		var planName = document.getElementById("planNameIns").value;

		var format = 'YYYY-MM-DDThh:mm:ss.ms';
		var pstartdate = moment($('#pStartDateIns').val(), format, 'ko')
				.format('YYYY-MM-DD-HH-mm-ss');//format
		var penddate = moment($('#pEndDateIns').val(), format, 'ko').format(
				'YYYY-MM-DD-HH-mm-ss');//format

		console.log(pstartdate + '::::::::::::::');
		var priorityIns = document.getElementById("priority").value;

		var planmemberArray = [];
		var planmemberByName = document.getElementsByName("planmember");

		for (var i = 0; i < planmemberByName.length; i++) {

			var checkedBoolean = planmemberByName.item(i).getAttribute(
					"checked");
			var checkedValue = planmemberByName.item(i).value;

			if (checkedBoolean == "checked") {
				planmemberArray.push(planmemberByName.item(i).value);
			}

		}

		console.log(planmemberArray);

		var color = "#" + document.getElementById("colorIns").value;

		var planInsJSON = {
			"PNO" : 0,
			"planName" : planName,
			"pStartDate" : pstartdate,
			"pEndDate" : penddate,
			"PJNo" : Number('${pjno}'),
			"id" : planmemberArray,
			"Priority" : priorityIns,
			"Progress" : 0,
			"color" : color
		};

		console.log(planInsJSON);

		$
				.ajax({
					url : 'insertJ',
					type : 'GET',
					dataType : 'text',
					data : {
						'jsonString' : JSON.stringify(planInsJSON)
					},
					success : function() {
						document.getElementById('scheduleIframe').contentDocument.location
								.reload(true);
						document.getElementById('addPlanForm').reset();
						document.getElementById('colorIns').setAttribute(
								'style', 'FFFFFF');
					},
					error : function(error) {
						document.getElementById('scheduleIframe').contentDocument.location
								.reload(true);
						document.getElementById('addPlanForm').reset();
						document.getElementById('colorIns').setAttribute(
								'style', 'FFFFFF');
					}
				});

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

	function goToGant() {
		document.getElementById('scheduleIframe').setAttribute('src',
				'goplanGant?pjno=${pjno}');
	}
	function goToGantById() {
		document.getElementById('scheduleIframe').setAttribute(
				'src',
				'goplanGantById?pjno=' + '${pjno}' + '&loginname='
						+ '${loginname}');
	}
	function goToGantByPriority() {
		document.getElementById('scheduleIframe').setAttribute('src',
				'goplanGantByPriority?pjno=${pjno}');
	}
	function goToCalendar() {
		document.getElementById('scheduleIframe').setAttribute('height', '40%');
		document.getElementById('scheduleIframe').setAttribute('src',
				'goplanCalendar?pjno=${pjno}');
	}
	function goToPersonal() {
		document.getElementById('scheduleIframe').setAttribute('src',
				'myScheduleToday?pjno=${pjno}');
	}

	function resizeIframe(obj) {
		if (document.getElementById('scheduleIframe').getAttribute('src')
				.includes("Gant")) {
			obj.style.height = obj.contentWindow.document.body.scrollHeight
					+ 'px';
		} else if (document.getElementById('scheduleIframe')
				.getAttribute('src').includes("Calendar")) {
			obj.style.height = 50 + 'vh';
		} else {
			obj.style.height = 50 + 'vh';
			obj.style.width = 40 + 'vw';
		}

	}
</script>

<script type="text/javascript">
	var intervalOn = false;
	var blinkIntervalBoolean = false;
	var blinkInterval = null;
	var getName = null;

	function blinking() {
		document.getElementById('scheduleIframe').contentWindow.blinking();
	}
</script>

</head>
<body>
	<c:if test="${loginid!=null }">
		<div id="topnav">
			<div class="topnav">
				<div class="topnavdiv">
					<a href="./"><img src="resources/img/logo2-white.png"
						style="height: 50px; margin-top: -20px;"></a> <a href="logout">로그아웃</a>
				</div>
			</div>
		</div>
	</c:if>

	<br>


	<div align="center">
		<div style="width: 80%;">
			<div align="right">
				<button id="dropbtn" type="button" class="btn btn-default btn-lg"
					style="width: 4vw; min-width: 130px; height: 7%; color: coral; background-color: coral;"
					onclick="javascript: blinking()">
					.<img src="resources/iconBulb.png" height="20vh">.
				</button>
				<div class="dropdown">
					<button id="dropbtn" type="button" class="btn btn-default btn-lg"
						style="width: 12vw; min-width: 130px; height: 7%; background-color: #5c948d"
						onclick="goToGant()">간트차트</button>
					<div class="dropdown-content">
						<a href="Javascript: goToGant()">날짜순 (기본)</a> <a
							href="Javascript: goToGantByPriority()">중요도순</a> <a
							href="Javascript: goToGantById()">내 일정</a>
					</div>
				</div>

				<button type="button" class="btn btn-default btn-lg"
					style="width: 12vw; min-width: 130px; height: 7%; background-color: #5c948d"
					onclick="goToCalendar()">달력형</button>
				<button type="button" class="btn btn-default btn-lg"
					style="width: 12vw; min-width: 130px; height: 7%; background-color: #5c948d"
					onclick="goToPersonal()">투데이</button>
			</div>

			<div align="center" style="width: 100%">
				<section class='bb-slice' id='faq' style="width: 100%;">
				<div align="center" class='bb-container bb-container-variant-small'
					style="width: 75%">
					<h1 class='bb-section-title'>Schedule Managing</h1>

					<div align="center" class='bb-accordion' style="width: 100%;">
						<span class='bb-accordion-title'
							style="width: 100%; height: 100%; align: center; margin: 10px; padding: 10px; font-size: medium;">일정추가</span>
						<div class='bb-accordion-content'>
							<!-- 日程を入れる -->
							<div
								style="position: relative; padding: 0px; margin: 0px; text-align: left; font-size: medium;">
								<form action='javascript: addPlanGraph()' id="addPlanForm">
									<br>
									<p>
										<input type="text" class="menu"
											style="border: none; background-color: #1f2944; color: #fff; font-size: medium; width: 48%;"
											value="일정이름" readonly="readonly"> <input
											id="planNameIns" type="text"
											style="font-size: medium; width: 48%;" autocomplete="off" />
									</p>
									<p>
										<input type="text" class="menu"
											style="border: none; background-color: #1f2944; color: #fff; font-size: medium; width: 48%;"
											value="시작 날짜" readonly="readonly"> <input
											id="pStartDateIns" type="datetime-local"
											style="font-size: medium; width: 48%;" />
									</p>
									<p>
										<input type="text" class="menu"
											style="border: none; background-color: #1f2944; color: #fff; font-size: medium; width: 48%;"
											value="마감 날짜" readonly="readonly"> <input
											id="pEndDateIns" type="datetime-local"
											style="font-size: medium; width: 48%;" />
									</p>

									<script type="text/javascript" src="resources/bootstrap.min.js"></script>
									<script src="resources/moment-with-locales.js"></script>
									<script src="resources/bootstrap-datetimepicker.js"></script>

									<p>
										<input type="text" class="menu"
											style="border: none; background-color: #1f2944; color: #fff; font-size: medium; width: 48%;"
											value="담당 팀원" readonly="readonly">
									<div id="planMemberSelectList" align="center"></div>

									<div>
										<c:if test="${memberList !=pj.id }">
											<c:forEach items="${memberList }" var="member">
												<script type="text/javascript">
													var input = '<a href="javascript:planMemberSelect(planmember${member.name })"><input type="button" class="menu"';
												input += 'style="border: none; background-color: #ffcb5e;';
												input += 'color: #fff; font-size: large; padding: 3px"';
												input += 'id="planmember${member.name }" name="planmember" value="${member.name }"';
												input += 'readonly="readonly" ';
												input += 'checked="unchecked"></a>';

													document
															.getElementById("planMemberSelectList").innerHTML += input
															+ ' ';
												</script>
											</c:forEach>
										</c:if>
										<script type="text/javascript">
											function planMemberSelect(ObjIns) {

												console.log(ObjIns);
												console.log(ObjIns.id);
												var planMember = document
														.getElementById(ObjIns.id);
												console
														.log(planMember
																.getAttribute("checked"));
												if (planMember
														.getAttribute("checked") == "checked") {
													planMember.setAttribute(
															"checked",
															"unchecked");
													planMember.style.backgroundColor = '#ffcb5e';
												} else {
													planMember.setAttribute(
															"checked",
															"checked");
													planMember.style.backgroundColor = '#d95b5b';
												}
												var planmemberArray = [];
												var planmemberByName = document
														.getElementsByName("planmember");

												for (var i = 0; i < planmemberByName.length; i++) {

													var checkedBoolean = planmemberByName
															.item(i)
															.getAttribute(
																	"checked");
													var checkedValue = planmemberByName
															.item(i).value;

													console.log(checkedBoolean
															+ '...'
															+ checkedValue);

													if (checkedBoolean == "checked") {
														planmemberArray
																.push(planmemberByName
																		.item(i).value);
													}

												}

												console.log(planmemberArray);

											}
										</script>

										<c:if test="${memberList ==pj.id }">
											<input type="text" class="menu"
												style="border: none; background-color: #d95b5b; color: #fff; font-size: medium; width: 48%;"
												value="팀원이 없습니다. 팀원을 초대하세요" readonly="readonly">
										</c:if>
									</div>

									<script src="resources/jscolor.js"></script>
									<p>
										<input type="text" class="menu"
											style="border: none; background-color: #1f2944; color: #fff; font-size: medium; width: 48%;"
											value="색깔" readonly="readonly"> <input
											class="jscolor" id="colorIns"
											style="font-size: medium; width: 48%;" />
									</p>
									<!-- 優先度 -->
									<div>
										<input type="text" class="menu"
											style="border: none; background-color: #1f2944; color: #fff; font-size: medium; width: 48%;"
											value="중요도" readonly="readonly"> <input id="priority"
											autocomplete="off" type="number" name="priority" class="menu"
											style="text-align: center; border: none; background-color: #1f2944; color: #fff; height: 2.5em;"
											step="1" min="0" max="10">

									</div>
									<br>
									<div align="center">
										<button type="submit" class="btn btn-lg"
											style="width: 15%; background-color: #1f2944 font-size: medium;">확인</button>
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
				</section>
			</div>
		</div>

		<div style="width: 100%;" align="center">
			<iframe id="scheduleIframe" src="goplanCalendar?pjno=${pjno }"
				style="width: 80%; white-space: nowrap; overflow: hidden; margin: 0px; padding: 0px; border: 2px solid black"
				align="top" onload="resizeIframe(this)" /></iframe>

		</div>
		<!-- メニュー、日程追加含む -->


		<script type="text/javascript">
			function addPlanGraph() {
				createPlan();
				scheduleUpdate();
			}
		</script>
</body>

<script src="resources/css/bb-043d654a.js"></script>
<script>
	(function(i, s, o, g, r, a, m) {
		i['GoogleAnalyticsObject'] = r;
		i[r] = i[r] || function() {
			(i[r].q = i[r].q || []).push(arguments)
		}, i[r].l = 1 * new Date();
		a = s.createElement(o), m = s.getElementsByTagName(o)[0];
		a.async = 1;
		a.src = g;
		m.parentNode.insertBefore(a, m)
	})(window, document, 'script',
			'https://www.google-analytics.com/analytics.js', 'ga');

	ga('create', 'UA-68685304-3', 'auto');
	ga('send', 'pageview');
</script>

</html>