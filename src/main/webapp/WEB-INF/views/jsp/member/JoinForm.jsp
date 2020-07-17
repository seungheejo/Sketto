<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page errorPage="/error"%>
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

<title>Join Sketto!</title>
<script type="text/javascript" src="resources/member.js"></script>
<script src="resources/jquery-3.3.1.js"></script>
<script type="text/javascript">
	//유효성 체크
	function formcheck() {

		var id = document.getElementById('id');
		var pw = document.getElementById("pw");
		var name = document.getElementById('name');

		if (id.value == '' || id.value.indexOf(".") == -1
				|| id.value.indexOf("@") == -1) {
			alert("ID로는 이메일 주소를 입력해 주세요.");
			id.focus();
			return false;
		} else if (pw.value.length < 4) {
			alert("비밀번호는 4자리 이상을 입력해 주세요.");
			pw.focus();
			return false;
		} else if (name.value.length < 2) {
			alert("이름은 2자리 이상을 입력해 주세요.");
			return false;
		}

		alert('Sketto 가입을 축하드립니다!\n가입하신 아이디로 다시 로그인 부탁드립니다.');
		return true;
	}

	function idcheck() {
		$.ajax({
			url : 'idcheck',
			type : 'GET',
			data : {
				'id' : document.getElementById('id').value
			},
			success : function(msg) {
				alert(msg);
			}
		});
	}
</script>

<style type="text/css">
#myVideo {
	position: fixed;
	right: 0;
	bottom: 0;
	min-width: 100%;
	min-height: 100%;
}

.content {
	position: fixed;
	bottom: 0;
	top: 0;
	background: rgba(0, 0, 0, 0);
	color: #f1f1f1;
	width: 100%;
	padding: 20px;
}

.joindiv {
	margin: 5% auto;
	margin-left: 35%;
	float: left;
	background-color: rgba(255, 255, 255, 0.5);
	padding: 3%;
}

form {
	text-align: center;
	margin-left: auto;
	margin-right: auto;
	margin-top: 7%;
	width: 294px;
}

input[type=text] {
	background-color: white;
	background-image: url('resources/img/person1.png');
	background-position: 2px 1px;
	background-repeat: no-repeat;
	background-size: 44px;
	padding-left: 55px;
	width: 100%;
}

input[type=email] {
	background-color: white;
	background-image: url('resources/img/email1.png');
	background-position: 2px 1px;
	background-repeat: no-repeat;
	background-size: 44px;
	padding-left: 55px;
	width: 100%;
}

input[type=password] {
	background-color: white;
	background-image: url('resources/img/padlock1.png');
	background-position: 2px 1px;
	background-repeat: no-repeat;
	background-size: 44px;
	padding-left: 55px;
	width: 100%;
}
</style>
</head>

<body>
	<!-- 백그라운드 비디오 -->
	<video autoplay muted loop id="myVideo">
		<source src="resources/video/skettotest1.mp4" type="video/mp4">
	</video>

	<!-- 멤버 등록 폼 -->
	<div class="content">
		<div class="joindiv">
			<img src="resources/img/logo2.png"
				style="width: 400px; height: 150px; text-align: center;">
			<form id="join" action="joinmember" method="post"
				onsubmit="return formcheck();">
				<table>
					<tr>
						<td colspan="2"><input type="email" id="id" name="id"
							placeholder="id" class="form-control form-control-lg"
							style="margin-bottom: -23px;" required="required"><br>
							<input type="button" class="btn btn-primary"
							style="background-color: #5c948d; border-color: #5c948d; width: 100%;"
							value="ID 중복확인" onclick="idcheck();"></td>
					</tr>
					<tr>
						<td colspan="2"><input type="password" id="pw" name="pw"
							placeholder="pw" class="form-control form-control-lg"
							required="required"><br></td>
					</tr>
					<tr>
						<td colspan="2"><input type="text" id="name" name="name"
							placeholder="name" class="form-control form-control-lg"
							required="required"><br></td>
					</tr>
					<tr>
						<td colspan="2"><input type="submit" class="btn btn-primary"
							style="background-color: #5c948d; border-color: #5c948d; width: 100%;"
							value="join"></td>
					</tr>
				</table>
			</form>
		</div>
	</div>
	<!-- 멤버 등록 폼 끝 -->

</body>
</html>
