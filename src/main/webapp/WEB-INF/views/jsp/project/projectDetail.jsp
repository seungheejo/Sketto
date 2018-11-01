<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page errorPage="error.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>${pj.pjtitle }- Sketto!</title>
<script type="text/javascript">

</script>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css"
	integrity="sha384-9gVQ4dYFwwWSjIDZnLEWnxCjeSWFphJiwGPXr1jddIhOegiu1FwO5qRGvFXOdJZ4"
	crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
	integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
	crossorigin="anonymous"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"
	integrity="sha384-cs/chFZiN24E4KMATLdqdvsezGxaGsi4hLGOzlXwp5UZB1LY//20VyM2taTB4QvJ"
	crossorigin="anonymous"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"
	integrity="sha384-uefMccjFJAIv6A+rW+L4AHf99KvxDjWSu1z9VI8SKNVmz4sk7buKt/6v9KI65qnm"
	crossorigin="anonymous"></script>
<link
	href='https://fonts.googleapis.com/css?family=Droid+Serif:400,400italic,700,700italic'
	rel='stylesheet' type='text/css'>
<link
	href='https://fonts.googleapis.com/css?family=Ubuntu:300italic,400,400italic,700,700italic'
	rel='stylesheet' type='text/css'>
<style type="text/css">
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

.notleader {
	width: 60%;
	margin-left: auto;
	margin-right: auto;
	padding: 2%;
	padding-left: 3%;
	text-align: center;
}

.wholediv {
	width: 90%;
	margin-left: auto;
	margin-right: auto;
	padding: 2%;
	padding-left: 3%;
	text-align: center;
}

.pjdetailicon {
	margin-left: auto;
	margin-right: auto;
	width: 200px;
	text-align: center;
}

h1 {
	color: #1f2944;
	font-family: 'Droid Serif';
	border-bottom: 3px solid #d95b5b;
	border-top: 3px solid #d95b5b;
	font-size: 42px;
	font-weight: 400;
	line-height: 60px;
	margin: 1% auto 45px;
	max-width: 600px;
	padding: 45px 0;
	text-align: center;
}

p {
	color: #fff;
	font-family: 'Ubuntu';
	font-size: 20px;
	font-weight: 300;
	line-height: 36px;
	margin: 0 auto 36px;
	max-width: 400px;
}
</style>
</head>

<body style="margin: 0px;">
	<div id="topnav">
		<div class="topnav">
			<div class="topnavdiv">
				<a href="./"><img src="resources/img/logo2-white.png"
					style="height: 50px; margin-top: -20px;"></a> <a href="logout">로그아웃</a>
			</div>
		</div>
	</div>

	<br>

	<h1 style="text-align: center;">
		<c:if test="${loginid==pj.id }">
			<img src="resources/img/crown1.svg" style="width: 44px;">
		</c:if>
		${pj.pjtitle }
	</h1>

	<c:if test="${loginid==pj.id }">
		<div class="wholediv">

			<div class="card" class="card bg-light mb-3"
				style="width: 30%; margin: 2%; float: left; margin-left: 1em; margin-right: 1em;">
				<a href="meetingForm"><img class="card-img-top pjdetailicon"
					src="resources/img/chat2.png" alt="회의 시작하기"></a>
				<div class="card-body">
					<h5 class="card-title">
						<a href="meetingForm">채팅방</a>
					</h5>
				</div>
			</div>

			<div class="card" class="card bg-light mb-3"
				style="width: 30%; margin: 2%; float: left; margin-left: 1em; margin-right: 1em;">
				<a href="goplan?pjno=${pj.pjno }"><img
					class="card-img-top pjdetailicon" src="resources/img/plan1.png"
					alt="일정 확인"></a>
				<div class="card-body">
					<h5 class="card-title">
						<a href="goplan?pjno=${pj.pjno }">일정 관리</a>
					</h5>
				</div>
			</div>


			<div class="card" class="card bg-light mb-3"
				style="width: 30%; margin: 2%; float: left; margin-left: 1em; margin-right: 1em;">
				<a href="gopjmanage?pjno=${pj.pjno }"><img
					class="card-img-top pjdetailicon" src="resources/img/project1.png"
					alt="프로젝트 관리"></a>
				<div class="card-body">
					<h5 class="card-title">
						<a href="gopjmanage?pjno=${pj.pjno }">프로젝트 관리</a>
					</h5>
				</div>
			</div>
		</div>
	</c:if>

	<c:if test="${loginid!=pj.id }">
		<div class="notleader">

			<div class="card" class="card bg-light mb-3"
				style="width: 380px; margin: 2%; float: left; margin-left: 1em; margin-right: 1em;">
				<a href="meetingForm"><img class="card-img-top pjdetailicon"
					src="resources/img/chat2.png" alt="회의 시작하기"></a>
				<div class="card-body">
					<h5 class="card-title">
						<a href="meetingForm">채팅방</a>
					</h5>
				</div>
			</div>

			<div class="card" class="card bg-light mb-3"
				style="width: 380px; margin: 2%; float: left; margin-left: 1em; margin-right: 1em;">
				<a href="goplan?pjno=${pj.pjno }"><img
					class="card-img-top pjdetailicon" src="resources/img/plan1.png"
					alt="일정 확인"></a>
				<div class="card-body">
					<h5 class="card-title">
						<a href="goplan">일정 관리</a>
					</h5>
				</div>
			</div>

		</div>
	</c:if>

</body>