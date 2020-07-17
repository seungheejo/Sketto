<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page errorPage="error.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css"
	integrity="sha384-9gVQ4dYFwwWSjIDZnLEWnxCjeSWFphJiwGPXr1jddIhOegiu1FwO5qRGvFXOdJZ4"
	crossorigin="anonymous">
<script src="resources/jquery-3.3.1.js"></script>
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
<title>home</title>

<style type="text/css">
a {
	font-style: black;
}

#myVideo {
	position: absolute;
	right: 0;
	bottom: 0;
	min-width: 100%;
	min-height: 100%;
	z-index: 1;
}

.content {
	position: absolute;
	bottom: 0;
	right: 0;
	background: rgba(255, 255, 255, 0.5);
	color: #f1f1f1;
	width: 30%;
	padding: 20px;
	height: 100%;
	z-index: 1000;
}

#myBtn {
	width: 200px;
	font-size: 18px;
	padding: 10px;
	border: none;
	background: #000;
	color: #fff;
	cursor: pointer;
}

#myBtn:hover {
	background: #ddd;
	color: black;
}

input[type=text], input[type=password], input[type=email] {
	width: 100%;
	padding: 12px 20px;
	margin: 8px 0;
	box-sizing: border-box;
}

input[type=submit] {
	background-color: #4c94af;
	border: none;
	color: white;
	padding: 16px 32px;
	text-decoration: none;
	margin: 4px 2px;
	cursor: pointer;
	width: 100%;
}

form {
	text-align: center;
	margin-left: auto;
	margin-right: auto;
	width: 224px;
}

table {
	text-align: center;
}

img.logo {
	width: 200px;
	margin-left: auto;
	margin-right: auto;
	display: block;
}

.logindiv {
	text-align: center;
}

.imghome {
	position: relative;
	top: 760px;
}

img.home {
	width: 100%;
}

.imghome2 {
	position: relative;
}

.wholediv {
	width: 90%;
	padding: 2%;
	text-align: center;
	margin: 2% auto;
	padding-top: 0%;
}

.pjdetailicon {
	margin-left: auto;
	margin-right: auto;
	width: 30%;
	text-align: center;
	border: solid black 1px;
}

.pjitems1 {
	margin-left: auto;
	margin-right: auto;
	width: 50%;
	text-align: center;
	border: solid black 1px;
	padding: 3%;
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

.projecttable {
	position: absolute;
	top: 0;
	right: 0;
	bottom: 0;
	left: 0;
	margin: 10%;
	float: inherit;
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

footer {
	bottom: 0;
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
</style>
<script type="text/javascript">

</script>
</head>

<body>
	<!-- 로그인 했을 경우-->
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

	<!-- 로그인 안했을 경우 -->
	<c:if test="${loginid==null }">
		<!-- 백그라운드 비디오 -->
		<video autoplay muted loop id="myVideo">
			<source src="resources/video/meeting1.mp4" type="video/mp4">
		</video>

		<!-- 로그인 폼 -->
		<div class="content">
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>
			<div class="logindiv">
				<img src="resources/img/logo2.png" class="logo">
				<form id="login" action="logintoSketto" method="post">
					<table>
						<tr>
							<td><input type="email" name="id" id="id"
								placeholder="abc@sketto.com" required /></td>
						</tr>
						<tr>
							<td><input type="password" name="password" id="password"
								required /></td>
						</tr>
						<tr>
							<td>
								<div class="errormsg">${errormsg}</div>
							</td>
						</tr>
						<tr>
							<td colspan="2"><input type="submit" class="form-control"
								style="background-color: #5c948d; border-color: #5c948d;"
								value="Login" /></td>
						</tr>
						<tr>
							<td colspan="2"><a href="joinform" style="color: #5a5a5a;">Join
									Sketto</a></td>
						</tr>
					</table>
				</form>
			</div>
		</div>
		<!-- 로그인 폼 끝 -->

		<!-- 아래 이미지 -->
		<div class="imghome">
			<img src="resources/img/home2-1.png" class="home"><br> <img
				src="resources/img/home2-2.png" class="home"><br> <img
				src="resources/img/home2-3.png" class="home"><br>
		</div>
	</c:if>

	<!-- 로그인 했을 경우-->
	<c:if test="${loginid!=null }">
		<div class="imghome2">
			<!-- 진행중인 프로젝트가 없을 경우 -->
			<div class="wholediv">
				<c:if test="${list==null }">
					<div class="pjitems1">
						<h1>
							새로운 프로젝트를 생성하고<br> 함께할 사람들을 부르세요!
						</h1>
						<a href="goproject"><img src="resources/img/plus1.svg"
							class="icon"></a>
					</div>
				</c:if>

				<!-- 진행중인 프로젝트가 있을 경우 -->
				<c:if test="${list!=null }">
					<c:forEach var="pj" items="${list }">
						<div class="card bg-light mb-3"
							style="width: 30%; margin: 2%; float: left; margin-left: 1em; margin-right: 1em;">
							<div class="card-header">
								<c:if test="${pj.id==loginid }">
									<img class="leadericon" src="resources/img/crown1.svg"
										style="width: 15px;">
											Project Leader
										</c:if>
								<c:if test="${pj.id!=loginid }">Project Member</c:if>
							</div>
							<div class="card-body">
								<h5 class="card-title">
									<a href="project?pjno=${pj.pjno }">${pj.pjtitle }</a>
								</h5>
								<p class="card-text">${pj.startdate }~ ${pj.enddate }</p>
							</div>
						</div>
					</c:forEach>
					
					<!-- 새로운 프로젝트 생성 -->
					<div class="card bg-light mb-3"
						style="width: 30%; margin: 2%; float: left; margin-left: 1em; margin-right: 1em;">
						<div class="card-header">
							<a href="goproject"><img class="plusicon"
								src="resources/img/plus1.svg" style="width: 35px;"></a>
						</div>
						<div class="card-body">
							<p class="card-text">
								새 프로젝트를 생성하고<br>팀원을 초대하세요!
							</p>
						</div>
					</div>
				</c:if>
			</div>
		</div>
	</c:if>
</body>
</html>
