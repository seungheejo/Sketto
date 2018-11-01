<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>meeting form</title>
<link
	href='https://fonts.googleapis.com/css?family=Droid+Serif:400,400italic,700,700italic'
	rel='stylesheet' type='text/css'>
<link
	href='https://fonts.googleapis.com/css?family=Ubuntu:300italic,400,400italic,700,700italic'
	rel='stylesheet' type='text/css'>
<link href="resources/css/bootstrapu.css" rel="stylesheet" />
<link
	href="//cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/css/bootstrap.css"
	rel="stylesheet" />
<script type="text/javascript"
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>
<script src="http://code.jquery.com/jquery-1.10.1.min.js"></script>
<script src="http://code.jquery.com/jquery-migrate-1.2.1.min.js"></script>

<style type="text/css">
body {
	background-color: #f6f6f6;
}

a {
	text-decoration: none;
	color: black;
	font-size: x-large;
}

.wholediv {
	margin: 2% auto;
	padding-top: 5%;
	padding-bottom: 5%;
	padding-left: 7%;
	padding-right: 7%;
	width: 95%;
	height: 200%;
	text-align: center;
	border: solid 3px black;
}

.pjitems1 {
	margin-left: auto;
	margin-right: auto;
	width: 50%;
	text-align: center;
	border: solid black 1px;
}

.pjitems2 {
	position: relative;
	width: 30%;
	margin: 1%;
	text-align: center;
	display: inline-block;
}

.pjitems2:before {
	content: "";
	display: block;
	padding-top: 100%;
}

.pjitems2inner {
	position: absolute;
	top: 0;
	right: 0;
	bottom: 0;
	left: 0;
	border: solid black 1px;
}

.icon {
	width: 50%;
	background: rgba(0, 0, 0, 0.2);
	margin-left: auto;
	margin-right: auto;
}

.leader {
	z-index: 3;
	position: absolute;
}

.projecttable {
	position: absolute;
	top: 0;
	right: 0;
	bottom: 0;
	left: 0;
	margin: 10%;
	float: inherit;
}

.dday {
	width: 23%;
	height: 22%;
	background-color: red;
	z-index: 3;
	border-radius: 50%;
	float: right;
	position: relative;
	margin: 4% 2%;
}

p.ddaytext {
	color: white;
	font-weight: bold;
	font-size: 243%;
	position: inherit;
	margin-top: 1%;
	margin-bottom: 1%;
}

table {
	margin: 1%;
	margin-bottom: auto;
	margin-top: auto;
	margin-left: auto;
	margin-right: auto;
	width: 100%;
	height: 100%;
}

@media ( max-width :767px) {
	.wholediv {
		width: 98%;
		margin: 10% auto;
		padding: 5%;
		text-align: center;
		border: solid 1px black;
	}
	.pjitems1 {
		margin-left: auto;
		margin-right: auto;
		width: 99%;
		text-align: center;
		border: solid black 1px;
	}
	.pjitems2 {
		position: relative;
		width: 99%;
		margin: 1%;
		text-align: center;
		display: inline-block;
	}
	.pjitems2:before {
		content: "";
		display: block;
		padding-top: 100%;
	}
	.pjitems2inner {
		position: absolute;
		top: 0;
		right: 0;
		bottom: 0;
		left: 0;
		border: solid black 1px;
		padding: 10%
	}
	.icon {
		width: 50%;
		background: rgba(0, 0, 0, 0.2);
		margin-left: auto;
		margin-right: auto;
	}
	.leader {
		z-index: 3;
		position: absolute;
	}
	table {
		margin: 1%;
		margin-bottom: auto;
		margin-top: auto;
		margin-left: auto;
		margin-right: auto;
		width: 100%;
		height: 100%;
	}
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

th {
	width: 49.6%;
}

td {
	text-align: left;
	width: 49.6%;
}

h1 {
	font-family: "Graphik", Helvetica, Arial, sans-serif;
	font-weight: 1000;
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

.menu {
	width: 100%;
	text-align: center;
	font-size: large;
}

h1 {
	color: #1f2944;
	font-family: 'Droid Serif';
	border-bottom: 3px solid #d95b5b;
	border-top: 3px solid #d95b5b;
	font-size: 42px;
	font-weight: 400;
	line-height: 60px;
	margin: 0 auto 45px;
	max-width: 600px;
	padding: 45px 0;
	text-align: center;
}
</style>
<script>
function inputSysdate(){
	   
    var date = new Date();

    var year  = date.getFullYear();
    var month = date.getMonth() + 1; 
    var day   = date.getDate();
    var hours  = date.getHours();
    var minutes   = date.getMinutes();
    var seconds   = date.getSeconds();

    if (("" + month).length == 1) { month = "0" + month; }
    if (("" + day).length   == 1) { day   = "0" + day;   }
    if (("" + minutes).length   == 1) { minutes   = "0" + minutes;   }
    if (("" + seconds).length   == 1) { seconds   = "0" + seconds;   }
   
    var sysdateToSql = "" + month + "/" + day + "/" + year + " " + hours + ":" + minutes + ":" + seconds;
	if (hours >= 13 && hours <= 23) {
		hours = ""+parseInt(hours - 12);
		sysdateToSql = "" + month + "/" + day + "/" + year + " " + hours + ":" + minutes + ":" + seconds+" PM";
	}
	
	document.getElementById('meetingdateText').setAttribute("value", sysdateToSql);
}

function formCheck() {
	var meetingtitle = document.getElementById('meetingtitle');
	var pjno = document.getElementById('pjno').value;
	
	if (meetingtitle.value.length < 5) {
		alert("5글자 이상 회의록 이름을 입력하세요.");
		meetingtitle.focus();
		meetingtitle.select();
		return false;
	}
	
	return true;
}

function submitMeeting(){	
	if (formCheck() == false) {
		return false;
	}
	inputSysdate();
	var meetingForm1 = document.createElement("form");
	document.body.appendChild(meetingForm1);
	meetingForm1.setAttribute("charset", "UTF-8");
	meetingForm1.setAttribute("method", "Post"); 
	meetingForm1.setAttribute("action", "makemeeting"); 
	
	var format = 'MM/DD/YYYY, hh:mm:ss a';
	var md = document.getElementById("meetingdateText").value;
	
	if (md.charAt(md.indexOf('M')-1) == "P") {
		var mdHour = md.split('/')[2].split(':')[0].split(' ')[1];
		var mdBeforeHour = md.split(' ')[0];
		var mdMinute = md.split('/')[2].split(':')[1];
		var mdAfterMinute = md.split('/')[2].split(':')[2];
		
		if (mdHour >= 1 && mdHour <= 11) {
			mdHour = Number(mdHour) + 12 + '';
		}
		md = mdBeforeHour.concat(" ", mdHour, ":", mdMinute, ":" , mdAfterMinute);
	}	
	 
	document.getElementById('meetingdate').setAttribute(
			"value",
			moment(md, format, 'ko').format('YYYY-MM-DD-HH-mm-ss'));
	
	var id1 =  document.createElement("input");
	var pjno1 = document.createElement("input");
	var meetingtitle1 = document.createElement("input");
	var meetingdate1 = document.createElement("input");
	
	id1.setAttribute("type", "hidden");
    id1.setAttribute("name", "id");
    id1.setAttribute("value", document.getElementById('id').value);
    
    pjno1.setAttribute("type", "hidden");
    pjno1.setAttribute("name", "pjno");
    pjno1.setAttribute("value", document.getElementById('pjno').value);
    
    meetingtitle1.setAttribute("type", "hidden");
    meetingtitle1.setAttribute("name", "meetingtitle");
    meetingtitle1.setAttribute("value", document.getElementById('meetingtitle').value);
    
    meetingdate1.setAttribute("type", "hidden");
    meetingdate1.setAttribute("name", "meetingdate");
    meetingdate1.setAttribute("value", document.getElementById('meetingdate').value);
	
 	
	console.log('>>>>>>>>>>>>>>>>>' + document.getElementById('makeMeeting').action);
	console.log('>>>>>>>>>>>>>>>>>' + $('#meetingdate').val());
	
	meetingForm1.appendChild(id1);
	meetingForm1.appendChild(pjno1);
	meetingForm1.appendChild(meetingtitle1);
	meetingForm1.appendChild(meetingdate1);
	
	meetingForm1.submit();
}

//会議アラームのチェックのために
$(document).ready(function(){
	setInterval(function(){
		$.ajax({
			url: 'alarm30101',
			success: function(msg){
				if (msg.indexOf('남았습니다') != -1) {
					alert(msg);	
				}
			}
		});
		
	} , 20000);
});

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


	<div class="wholediv">
		<c:if test="${loginid == pj.id }">
			<form id="makeMeeting" action="javascript: submitMeeting()"
				method="post">
				<input id="errormsg" type="hidden" value="${errormsg }">
				<h1
					style="font-size: xx-large; margin-left: auto; margin-right: auto;"
					id="headline">Create Meeting Room</h1>
				<br>
				<table style="width: 70%;">
					<tr>
						<th></th>
						<td><input type="hidden" id="id" name="id"
							style="width: 49%;" value="${loginid }"> <input
							type="hidden" id="pjno" name="pjno" style="width: 49%;"
							value="${pj.pjno }"></td>
					</tr>
					<tr>
						<th><input type="text" class="menu"
							style="border: none; height: 40px; background-color: #1f2944; color: #fff;"
							value="회의 제목" readonly="readonly"></th>
						<td><input type="text" id="meetingtitle" name="meetingtitle"
							style="width: 100%; height: 40px; font-size: large;" value=""
							placeholder="  회의명을 입력해 주세요.	"></td>
					</tr>
					<tr>
						<th></th>
						<td><c:if test="${errormsg != null}">${errormsg }</c:if></td>
					</tr>
					<tr>
						<th><input type="text" class="menu"
							style="border: none; margin-top: 1%; height: 40px; background-color: #1f2944; color: #fff;"
							value="회의 시작일" readonly="readonly"></th>
						<td>
							<div style="position: relative">
								<input type="text" id="meetingdateText" name="meetingdateText"
									style="width: 100%; margin-top: 1%; height: 40px; font-size: large;"
									placeholder="  기본: 현재 시각">
								<script type="text/javascript"
									src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.1/js/bootstrap.min.js"></script>
								<script
									src="//cdnjs.cloudflare.com/ajax/libs/moment.js/2.9.0/moment-with-locales.js"></script>
								<script
									src="//cdn.rawgit.com/Eonasdan/bootstrap-datetimepicker/e8bddc60e73c1ec2475f827be36e1957af72e2ea/src/js/bootstrap-datetimepicker.js"></script>
								<script>
						$('#meetingdateText').datetimepicker();
					</script>

								<input type="hidden" id="meetingdate" name="meetingdate">
							</div>
						</td>
					</tr>
					<tr>
						<th><input type="submit" value="C R E A T E"
							style="border-color: #ffcb5e; border: 3; background-color: #5c948d; font-size: x-large; color: #fff; width: 100%; height: 50px; margin-top: 2%;" /></th>
						<th class="white center"><input type="reset"
							value="R E S E T"
							style="border-color: #ffcb5e; background-color: #d95b5b; font-size: x-large; color: #fff; width: 100%; height: 50px; margin-top: 2%;" />
						</th>
					</tr>
				</table>
			</form>
			<br>
			<br>
			<br>

		</c:if>

		<br>
		<table style="width: 70%;" border="3">
			<c:if test="${pjmlist != null }">
				<h1
					style="font-size: xx-large; margin-left: auto; margin-right: auto;"
					id="headline">Select Meeting Room</h1>
				<br>
				<thead>
					<tr>
						<th
							style="width: 50%; height: 40px; font-size: large; text-align: center; background-color: #1f2944; color: #fff;">회의
							제목</th>
						<th
							style="width: 50%; height: 40px; font-size: large; text-align: center; background-color: #1f2944; color: #fff;">회의
							시작일</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${pjmlist }" var="pjm">
						<tr>
							<th style="text-align: center;"><a
								href="speech?meetingno=${pjm.meetingno }">${pjm.meetingtitle }</a>
							</th>
							<th style="text-align: center;">${pjm.meetingdate }</th>
						</tr>
					</c:forEach>
				</tbody>
			</c:if>
		</table>
	</div>
</body>
</html>