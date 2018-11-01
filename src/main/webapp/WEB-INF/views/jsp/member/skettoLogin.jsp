<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Sketto! Login</title>
<script src="resources/jquery-3.3.1.js"></script>
<script type="text/javascript" src="resources/member.js"></script>
<style type="text/css">
video#bgVideo {
	position: absolute; // Play the video in full screen mode top : 0px;
	left: 0px;
	min-width: 100%;
	min-height: 100%;
	z-index: -1;
	//
	Put
	the
	video
	behind
	all
	other
	elements
}

@media only screen and (max-width: 768px) {
	video {
		display: none;
	}
	body {
		background-image: url("resources/img/meeting1.png");
	}
}

.centerdiv {
	margin: 8% auto;
	margin-left: 30%;
	float: left;
	background-color: rgba(255, 255, 255, 0.5);
	padding: 3%;
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
	margin-top: 7%;
	width: 60%;
}
</style>
</head>
<body>
	<div class="centerdiv">
		<img src="resources/img/logo2.png"
			style="width: 400px; height: 150px; text-align: center;">
		<form id="login" action="logintoSketto" method="post">
			<table>
				<tr>
					<td><input type="email" name="id" id="id"
						placeholder="abc@sketto.com" /></td>
				</tr>
				<tr>
					<td><input type="password" name="password" id="password" /></td>
				</tr>
				<tr>
					<td></td>
					<td>
						<div class="errorMsg">${errorMsg}</div>
					</td>
				</tr>
				<tr>
					<td colspan="2"><input type="submit" value="Login" /></td>

				</tr>
				<tr>
					<td colspan="2"><a href="joinform" style="color: #5a5a5a;">Join
							Sketto</a></td>
				</tr>
			</table>
		</form>

	</div>


	<video id="bgVideo" autoplay loop poster="resources/img/meeting1.png">
		<source src="resources/video/meeting1.mp4" type="video/mp4">
	</video>

</body>
</html>