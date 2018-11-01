<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page errorPage="/error"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>${pj.pjtitle }-Sketto!</title>
<script src="resources/jquery-3.3.1.js"></script>
<script type="text/javascript">
function membermanager() {
	window.open("membermanager","newwin","top=200,left=400,width=800,height=600,resizable=no");

}

function deletepj() {
	var deletepj = confirm("지금까지의 모든 노력이 물거품이 됩니다.\n진행시 모든 자료는 삭제되며 복구할 수 없습니다.\n진행하시겠습니까?");
	if(deletepj==true) {
		return true;
	}
		return false;
}

function deletePjmem(){
	var deletepjmem = confirm("\n해당 멤버를 제명하시겠습니까?");	
	if(deletepjmem==true) {
		return true;
	}
		return false;
}

</script>
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
	margin: 1% auto 45px;
	max-width: 600px;
	padding: 45px 0;
	text-align: center;
}

.wholearea {
	width: 100%;
}

.projectmanage {
	display: inline-block;
	width: 49%;
	float: left;
	border-right: solid #dedede 1px;
	margin-top: 10px;
}

.membermanage {
	display: inline-block;
	width: 49%;
	float: right;
	margin-top: 10px;
}

.pjmanage {
	margin: 2% auto;
	width: 70%;
}

.managetable {
	margin: auto;
	text-align: center;
	padding: 2% 5% 5% 5%;
	width: 600px;
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
	background-color: white;
	background-image: url('resources/img/project2.png');
	background-position: 2px 1px;
	background-repeat: no-repeat;
	background-size: 44px;
	padding-left: 50px;
	width: 100%;
}

.title {
	width: 600px;
	margin: 1% auto;
}
</style>
</head>
<body>
	<div id="topnav">
		<div class="topnav">
			<div class="topnavdiv">
				<a href="./"><img src="resources/img/logo2-white.png"
					style="height: 50px; margin-top: -20px;"></a> <a href="logout">로그아웃</a>
			</div>
		</div>
	</div>

	<div class="wholearea">

		<div class="projectmanage">
			<h1 style="text-align: center;">프로젝트 관리</h1>


			<div id="pjmanage" class="pjmanage">
				<form name="updateform" action="updatepj" method="post">
					<table class="managetable">
						<tr>
							<td colspan="2"><input type="hidden" id="pjno" name="pjno"
								value="${pj.pjno }"> <input type="text"
								class="form-control form-control-lg" id="pjtitle" name="pjtitle"
								placeholder="${pj.pjtitle }" value="${pj.pjtitle }"></td>
						</tr>
						<tr>
							<td class="text">시작일</td>
							<td class="inputdate" style="padding-right: 0px;"><input
								type="date" class="form-control form-control-lg" id="startdate"
								name="startdate" value="${pj.startdate }"></td>
						</tr>
						<tr>
							<td class="text">마감일</td>
							<td class="inputdate" style="padding-right: 0px;"><input
								type="date" class="form-control form-control-lg" id="enddate"
								name="enddate" value="${pj.enddate }"></td>
						</tr>
						<tr>
							<td colspan="2"><input type="reset" value="다시 입력"
								class="btn btn-primary btn-lg"
								style="margin-right: 3%; background-color: #5c948d; border-color: #5c948d;">
								<input type="submit" value="수정" class="btn btn-primary btn-lg"
								style="margin-left: 3%; background-color: #5c948d; border-color: #5c948d;">
							</td>
						</tr>
					</table>
				</form>
				<div>
					<form action="deletepj" onsubmit="return deletepj()" method="post">
						<input type="hidden" value="${pj.pjno }"> <input
							type="submit" value="프로젝트 삭제"
							class="btn btn-outline-danger btn-sm" style="margin-left: 3%">
					</form>
				</div>
			</div>
		</div>


		<div class="membermanage">
			<h1 style="text-align: center;">멤버 관리</h1>
			<div>
				<c:if test="${pjmemlist == null }">
					새로운 멤버를 초대하세요
				</c:if>
				<c:if test="${pjmemlist != null }">
					<table class="createtable table">
						<thead>
							<tr>
								<th colspan="3">${pj.pjtitle }의멤버리스트</th>
							</tr>
						</thead>
						<tbody>
							<!-- リーダーの場合 -->
							<c:forEach items="${pjmemlist}" var="pjm">
								<c:if test="${pjm.id==loginid }">
									<tr>
										<td><b>${pjm.name }</b></td>
										<td><b>${pjm.id }</b></td>
										<td><img src="resources/img/crown1.svg" width="30px"
											style="margin-left: 1%;"></td>
									</tr>
								</c:if>
							</c:forEach>
							<!-- リーダーじゃない場合 -->
							<c:forEach items="${pjmemlist}" var="pjm">
								<c:if test="${pjm.id!=loginid }">
									<tr>
										<td>${pjm.name }</td>
										<td>${pjm.id }</td>
										<td>
											<form action="deletePjmem" onsubmit="return deletePjmem()"
												method="post">
												<input type="hidden" id="pjno" name="pjno"
													value="${pj.pjno }"> <input type="hidden" id="id"
													name="id" value="${pjm.id }"> <input type="submit"
													style="background-color: #5c948d; border-color: #5c948d;"
													class="btn btn-primary" value="제명">
											</form>
										</td>
									</tr>
								</c:if>
							</c:forEach>
						</tbody>
					</table>
				</c:if>
			</div>
			<div style="margin: 0 auto 0 28%; width: 300px;">
				<input type="button"
					style="background-color: #5c948d; border-color: #5c948d;"
					style="background-color: #5c948d; border-color: #5c948d;"
					class="btn btn-primary btn-lg" value="더 많은 멤버를 Sketto!로 초대하기"
					onclick="membermanager()">
			</div>
		</div>

	</div>

</body>
</html>