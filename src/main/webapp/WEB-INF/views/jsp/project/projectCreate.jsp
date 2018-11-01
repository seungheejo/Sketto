<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page errorPage="error"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
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
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Create New Project - Sketto!</title>
<link href="resources/css/bootstrapu.css" rel="stylesheet" />
<script src=<c:url value="resources/jquery-3.3.1.js"/>></script>
<script type="text/javascript">

		
	</script>
<style type="text/css">
.pjcreate {
	margin: 2% auto;
	width: 70%;
}

.createtable {
	margin: auto;
	text-align: center;
	padding: 2% 5% 5% 5%;
	width: 600px;
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

td {
	padding: 0% 10% 5% 10%;
}

td.inputtitle {
	width: 300px;
}

td.text {
	width: 100px;
	padding-right: 1%;
	text-align: left;
}

td.inputdate {
	width: 200px;
	padding-left: 1%;
	text-align: right;
}

input[type=date] {
	width: 90%;
}

input[type=text] {
	width: 100%;
}

.title {
	width: 600px;
	margin: 1% auto;
}
</style>
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

	<div class="title">
		<h1 style="text-align: center;">새 프로젝트 생성</h1>
	</div>
	<div id="pjcreate" class="pjcreate">
		<form action="createpj" method="post">
			<input type="hidden" id="id" name="id" value="${member.id }">
			<table class="createtable">
				<tr>
					<td colspan="2" class="inputtitle"><input type="text"
						class="form-control form-control-lg" id="pjtitle" name="pjtitle"
						placeholder="프로젝트명"></td>
				</tr>
				<tr>
					<td class="text">시작일</td>
					<td class="inputdate" style="padding-right: 0px;"><input
						type="date" class="form-control form-control-lg" id="startdate"
						name="startdate" value="${today }"></td>
				</tr>
				<tr>
					<td class="text">마감일</td>
					<td class="inputdate" style="padding-right: 0px;"><input
						type="date" class="form-control form-control-lg" id="enddate"
						name="enddate"></td>
				</tr>
				<tr>
					<td colspan="2"><input type="reset" value="다시 입력"
						class="btn btn-primary btn-lg"
						style="margin-right: 3%; background-color: #5c948d; border-color: #5c948d;">
						<input type="submit" value="프로젝트 생성"
						class="btn btn-primary btn-lg"
						style="margin-left: 3%; background-color: #5c948d; border-color: #5c948d;">
					</td>
				</tr>
				<tr>
					<td></td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>