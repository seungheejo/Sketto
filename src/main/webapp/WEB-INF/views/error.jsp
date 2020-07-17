<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page isErrorPage="true"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Error! Please Try again - Sketto!</title>

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
	margin-top: 1%;
}

.errorimg {
	width: 300px;
	margin: 0 auto;
}
</style>
</head>

<body style="margin: 0">
	<!-- 메뉴 -->
	<div id="topnav">
		<div class="topnav">
			<div class="topnavdiv">
				<a href="./"><img src="resources/img/logo2-white.png"
					style="height: 50px; margin-top: -20px;"></a> <a href="logout">로그아웃</a>
				<a href="goplan">일정</a>
			</div>
		</div>
	</div>
	<!-- 메뉴 끝 -->

	<!-- 에러 페이지 내용 -->
	<h1 style="text-align: center;">에러입니다.</h1>
	<div class="errorimg">
		<img src="./resources/img/error1.png" style="width: 100%;">
	</div>
	<h2 style="text-align: center;">잠시후 다시 시도해주세요</h2>
	<h2 style="text-align: center;">계속해서 같은 오류 발생시 문의 부탁드립니다.</h2>
	<!-- 에러 페이지 내용 끝 -->

</body>
</html>
