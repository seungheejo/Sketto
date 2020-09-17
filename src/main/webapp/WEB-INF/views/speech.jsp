<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>sketto! 회의</title>
<link href="resources/css/bootstrapu.css" rel="stylesheet" />
<link
	href='https://fonts.googleapis.com/css?family=Droid+Serif:400,400italic,700,700italic'
	rel='stylesheet' type='text/css'>
<link
	href='https://fonts.googleapis.com/css?family=Ubuntu:300italic,400,400italic,700,700italic'
	rel='stylesheet' type='text/css'>
<style>
* {
	font-family: Verdana, Arial, sans-serif;
	text-align: center;
	margin: 0;
	padding: 0;
}

body {
	
}

a:link {
	color: #000;
	text-decoration: none;
}

a:visited {
	color: #000;
}

a:hover {
	color: #33F;
}

.button {
	background: -webkit-linear-gradient(top, #008dfd 0, #0370ea 100%);
	border: 1px solid #076bd2;
	border-radius: 3px;
	color: #fff;
	display: none;
	font-size: 13px;
	font-weight: bold;
	line-height: 1.3;
	padding: 8px 25px;
	text-align: center;
	text-shadow: 1px 1px 1px #076bd2;
	letter-spacing: normal;
}

.center {
	padding: 2%;
	text-align: center;
}

.final {
	color: #ffcb5e;
	padding-right: 3px;
}

.interim {
	color: #ffcb5e;
}

.info {
	font-size: 14px;
	text-align: center;
	color: #777;
	display: none;
}

.right {
	float: right;
	width: 7%;
}

.sidebyside {
	display: inline-block;
	width: 45%;
	min-height: 40px;
	text-align: left;
	vertical-align: top;
}

#headline {
	padding: 10px;
	width: 100%;
}

#info {
	font-size: 20px;
	text-align: center;
	background-color: #d95b5b;
	color: #fff;
	visibility: hidden;
}

#results {
	margin-bottom: 1%;
	font-size: 30px;
	font-weight: bold;
	border: 1px solid #ddd;
	background-color: #1f2944;
	color: #ffcb5e;
	padding: 4%;
	text-align: left;
	min-height: 50px;
	width: 100%;
}

#start_button {
	border: 0;
	background-color: transparent;
	padding: 0;
}

#leftwin {
	width: 30%;
	heght: 100%;
	text-align: left;
}

#rightwin {
	width: 70%;
	heght: 100%;
}

#messageWindow {
	background-color: #ffcb5e;
	color: #1f2944;
	font-size: x-large;
	width: 100%;
}

input {
	font-size: large;
	text-align: left;
	height: 30px;
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

#inputMessage {
	width: 87%;
	height: 100%;
	border: solid thick;
}

#uploadForm {
	width: 100%;
}

#file {
	width: 60%;
}

#submitFile {
	width: 20%;
}

#wrap {
	width: 100%;
	margin: 0 auto;
	text-align: center;
}

#all {
	padding: 0 0;
	width: 100%;
	text-align: center;
}

#menu {
	float: left;
	width: 20%;
	height: 100%;
	padding: 0 0 0 0;
}

#gaunde {
	float: left;
	width: 56%;
	height: 100%;
	padding: 0 0 0 0;
}

#aside {
	float: right;
	width: 20%;
	height: 100%;
	padding: 0 0 0 0;
	margin-left: 2%;
	margin-right: 2%;
}

.menu {
	height: 40px;
}

.menu_content {
	text-align: center;
}

select {
	width: 200px;
	height: 30px;
	padding-left: 10px;
	font-size: 18px;
	color: #1f2944;
	border: 1px solid #1f2944;
	border-radius: 3px;
}

#library {
	display: inline-block;
	padding: .5em .75em;
	color: #fff;
	font-size: inherit;
	line-height: normal;
	vertical-align: middle;
	background-color: #fdfdfd;
	cursor: pointer;
	border: 1px solid #ebebeb;
	border-bottom-color: #e2e2e2;
	border-radius: .25em;
}

.filebox input[type="file"] {
	position: absolute;
	width: 1px;
	height: 1px;
	padding: 0;
	margin: -1px;
	overflow: hidden;
	clip: rect(0, 0, 0, 0);
	border: 0;
}

.filebox label {
	display: inline-block;
	padding: .5em .75em;
	color: #fff;
	font-size: inherit;
	line-height: normal;
	vertical-align: middle;
	background-color: #fdfdfd;
	cursor: pointer;
	border: 1px solid #ebebeb;
	border-bottom-color: #e2e2e2;
	border-radius: .25em;
}

.filebox .upload-name {
	display: inline-block;
	padding: .5em .75em;
	font-size: inherit;
	font-family: inherit;
	line-height: normal;
	vertical-align: middle;
	background-color: #f5f5f5;
	border: 1px solid #ebebeb;
	border-bottom-color: #e2e2e2;
	border-radius: .25em;
	-webkit-appearance: none;
	-moz-appearance: none;
	appearance: none;
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

.headline {
	text-align: center;
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

	<br>
	<h1 id="headline"
		style="text-align: center; width: 100%; padding: 2%; margin-left: auto; margin-right: auto;">
		Realtime Meeting System</h1>

	<div id="wrap">
		<div id="all">
			<p></p>
			<div id="menu">
				<!-- 프로젝트 리더 -->
				<input type="text" class="menu"
					style="border: none; background-color: #1f2944; color: #fff; margin-top: 2%;"
					value=" * Project Leader" readonly="readonly"><br> <input
					type="text" class="menu_content" id="PL"
					style="border: none; background: transparent;" value="${mt.id }"
					readonly="readonly"> <br>

				<!-- 프로젝트 멤버 -->
				<input type="text" class="menu"
					style="border: none; background-color: #1f2944; color: #fff; margin-top: 2%;"
					value=" * Project Number" readonly="readonly"><br> <input
					type="text" class="menu_content" id="PJNO"
					style="border: none; background: transparent;"
					value="PJNo. ${mt.pjno }" readonly="readonly"> <br>

				<!-- 회의 멤버 -->
				<input type="text" class="menu"
					style="border: none; background-color: #1f2944; color: #fff; margin-top: 2%;"
					value=" * Meeting Number" readonly="readonly"><br> <input
					type="text" class="menu_content" id="meetingNO"
					style="border: none; background: transparent;"
					value="No. ${mt.meetingno }" readonly="readonly"> <br>

				<!-- 회의 타이틀 -->
				<input type="text" class="menu"
					style="border: none; background-color: #1f2944; color: #fff; margin-top: 2%;"
					value=" * Meeting Title" readonly="readonly"><br> <input
					type="text" class="menu_content" id="meetingTitle"
					style="border: none; background: transparent;"
					value="< ${mt.meetingtitle } >"
					placeholder="Please create meeting name." readonly="readonly">
				<br>

				<!-- 채팅 id -->
				<input type="text" class="menu"
					style="border: none; background-color: #1f2944; color: #fff; margin-top: 2%;"
					value=" * User ID" readonly="readonly"><br> <input
					type="text" class="menu_content" id="userid"
					style="border: none; background: transparent;"
					placeholder="Input User ID" value="${loginid }" readonly="readonly">
				<br>
			</div>
			<div id="gaunde">

				<!-- 채팅 참가자 -->
				<input type="text" id="userAll"
					style="text-align: center; border: none; background-color: #1f2944; color: #fff; font-size: x-large; padding: 2%; width: 100%;"
					placeholder="IDs of members" value=" Participants: ${plist }"
					readonly="readonly">

				<div id="chat">
					<!-- 새로운 채팅 부분 -->
					<textarea id="messageWindow" rows="10" cols="15"
						style="text-align: left;" readonly="true"></textarea>
					<br />
					<div id="info">
						<p id="info_start">Click on the microphone icon and begin
							speaking.</p>
						<p id="info_speak_now">Speak now.</p>
						<p id="info_no_speech">
							No speech was detected. You may need to adjust your <a
								href="//support.google.com/chrome/bin/answer.py?hl=en&amp;answer=1407892">
								microphone settings</a>.
						</p>
						<p id="info_no_microphone" style="display: none">
							No microphone was found. Ensure that a microphone is installed
							and that <a
								href="//support.google.com/chrome/bin/answer.py?hl=en&amp;answer=1407892">
								microphone settings</a> are configured correctly.
						</p>
						<p id="info_allow">Click the "Allow" button above to enable
							your microphone.</p>
						<p id="info_denied">Permission to use microphone was denied.</p>
						<p id="info_blocked">Permission to use microphone is blocked.
							To change, go to chrome://settings/contentExceptions#media-stream</p>
						<p id="info_upgrade">
							Web Speech API is not supported by this browser. Upgrade to <a
								href="//www.google.com/chrome">Chrome</a> version 25 or later.
						</p>
						<p id="info_stop">Click on the microphone icon and begin
							speaking.</p>
					</div>

					<!-- 음성인식 결과를 볼 수 있는 부분 -->
					<div id="results">
						<span id="final_span" class="final"></span> <span
							id="interim_span" class="interim"></span>
						<p>
					</div>
				</div>
				<div id="key">
					<input type="text" id="inputMessage"
						style="font-size: x-large; border-color: #1f2944; float: left; width: 79.5%; height: 55px;"
						name="inputMessage" placeholder="  I n p u t    M e s s a g e ." />

					<!-- 텍스트 송신 버튼 -->
					<button id="send"
						style="background-color: #1f2944; float: left; text-align: left; font-size: x-large; width: 13%; height: 55px; margin-right: 0.5%;"
						onclick="send()">Send</button>

					<!-- 음성인식을 시작하는 버튼 -->
					<div class="right">
						<button id="start_button"
							style="box-shadow: inset 0 -0.2352941176rem rgba(0, 0, 0, 0)"
							onclick="startButton(event)">
							<img id="start_img" style="width: inherit; height: 55px;"
								src="resources/img/mic.gif" alt="Start">
						</button>
					</div>
					<!-- 언어 선택 select -->
					<div class="center">
						<div id="div_language">
							<select id="select_language" onchange="updateCountry()"></select>
							&nbsp;&nbsp; <select id="select_dialect"></select>
						</div>
						<br>
					</div>
				</div>





			</div>
			<div id="aside">
				<div id="asidein" style="float: left;">

					<form id="uploadForm" name="uploadForm" action="uploadFile"
						method="post" enctype="multipart/form-data">

						<div class="filebox">
							<input
								style="margin-bottom: 5%; background-color: #fff; width: 100%"
								class="upload-name" value="파일을 선택해 주세요." disabled="disabled">
							<br> <label
								style="width: 100%; background-color: #000000; height: 50px;"
								for="ex_filename">파일 선택</label> <input type="file" name="upload"
								id="ex_filename" class="upload-hidden">
						</div>
						<input type="hidden" name="id" value="${loginid }"> <input
							type="hidden" name="meetingno" value="${mt.meetingno }">
						<br> <input type="button" class="library" id="submitFile"
							style="display: inline-block; padding: .5em .75em; color: #fff; font-size: inherit; line-height: normal; vertical-align: middle; background-color: #fdfdfd; cursor: pointer; border: 1px solid #ebebeb; border-bottom-color: #e2e2e2; border-radius: .25em; width: 100%; height: 50px; text-align: center; background-color: #000000; color: #fff"
							name="submitFile" value="파일 업로드">
					</form>
					<br>

					<button class="library" id="download"
						style="display: inline-block; padding: .5em .75em; color: #fff; font-size: inherit; line-height: normal; vertical-align: middle; background-color: #fdfdfd; cursor: pointer; border: 1px solid #ebebeb; border-bottom-color: #e2e2e2; border-radius: .25em; width: 100%; height: 50px; text-align: center; background-color: #000000; color: #fff"
						onclick="download()">파일다운로드</button>
					<button class="library"
						style="display: inline-block; padding: .5em .75em; color: #fff; font-size: inherit; line-height: normal; vertical-align: middle; background-color: #fdfdfd; cursor: pointer; border: 1px solid #ebebeb; border-bottom-color: #e2e2e2; border-radius: .25em; width: 100%; height: 50px; text-align: center; background-color: #000000; color: #fff">
						<a href="hitherto" style="color: #fff;">지난 회의록 다운로드</a>
					</button>
					<br>

					<button class="library" id="sendAll"
						style="display: inline-block; padding: .5em .75em; color: #fff; font-size: inherit; line-height: normal; vertical-align: middle; background-color: #fdfdfd; cursor: pointer; border: 1px solid #ebebeb; border-bottom-color: #e2e2e2; border-radius: .25em; width: 100%; height: 50px; text-align: center; background-color: #d95b5b; color: #fff">회의종료</button>

					<br>
				</div>

			</div>
		</div>
	</div>


	<!-- 웹 소켓 서버 -->
	<script src="resources/jquery-3.3.1.js"></script>
	<script
		src="http://ajax.aspnetcdn.com/ajax/signalr/jquery.signalr-2.2.1.min.js"></script>


	<script>
		var connection = $.hubConnection('http://demo.dongledongle.com/');
		var chat = connection.createHubProxy('chatHub');

		var sysdate;
		var discussionText;
		var discussionTotal;
		var aDown;
		var projectNO = document.getElementById('PJNO');
		var messageText = document.getElementById('message');
		var projectLeder = document.getElementById('PL');
		var meetingNO = document.getElementById('meetingNO');
		var meetingTitle = document.getElementById('meetingTitle');
		var fileNO = document.getElementById('upload');

		$(document)
				.ready(
						function() {

							$('input[name=message]')
									.keydown(
											function(key) {
												if (key.keyCode == 13) {
													if (final_transcript == '') {
														sysdate = new Date();
														discussionText = "["
																+ sysdate
																		.getFullYear()
																+ '-'
																+ parseInt(sysdate
																		.getMonth() + 1)
																+ '-'
																+ sysdate
																		.getDate()
																+ '-'
																+ sysdate
																		.getHours()
																+ '-'
																+ sysdate
																		.getMinutes()
																+ '-'
																+ sysdate
																		.getSeconds()
																+ "]: "
																+ messageText.value;
														chat.invoke('send', $(
																'#userid')
																.val(),
																discussionText);
														$('#message').val('')
																.focus();
													} else {
														sysdate = new Date();
														discussionText = "["
																+ sysdate
																		.getFullYear()
																+ '-'
																+ parseInt(sysdate
																		.getMonth() + 1)
																+ '-'
																+ sysdate
																		.getDate()
																+ '-'
																+ sysdate
																		.getHours()
																+ '-'
																+ sysdate
																		.getMinutes()
																+ '-'
																+ sysdate
																		.getSeconds()
																+ "]: "
																+ final_transcript;
														chat.invoke('send', $(
																'#userid')
																.val(),
																discussionText);
														$('#message').val('')
																.focus();
													}
													$('#final_span').html('');
													$('#interim_span').html('');
													final_transcript = '';
												}

											});

							$('#submitFile')
									.click(
											function() {
												var formData = new FormData();
												formData
														.append(
																"id",
																$(
																		"input[name=id]")
																		.val());
												formData
														.append(
																"meetingno",
																$(
																		"input[name=meetingno]")
																		.val());
												formData
														.append(
																"upload",
																$("input[name=upload]")[0].files[0]);
												$
														.ajax({
															url : 'uploadFile',
															data : formData,
															processData : false,
															contentType : false,
															type : 'POST',
															success : function(
																	ch) {
																sysdate = new Date();
																alert("파일을 등록하였습니다.\n"
																		+ ch.originalfile);
																discussionText = "${loginname} "
																		+ "["
																		+ sysdate
																				.getFullYear()
																		+ '-'
																		+ parseInt(sysdate
																				.getMonth() + 1)
																		+ '-'
																		+ sysdate
																				.getDate()
																		+ '-'
																		+ sysdate
																				.getHours()
																		+ '-'
																		+ sysdate
																				.getMinutes()
																		+ '-'
																		+ sysdate
																				.getSeconds()
																		+ "](파일등록): "
																		+ ch.originalfile
																		+ "\r\n";
																textarea.value += discussionText;
																webSocket
																		.send(discussionText);
																sendvoice();
																$(
																		'div#downloads')
																		.append(
																				'<a href = downloadFile?filenum='
																						+ ch.filenum
																						+ '>'
																						+ ch.originalfile
																						+ '</a>');
																$('#message')
																		.val('')
																		.focus();
															},
															error : function(
																	error) {
																alert(JSON
																		.stringify(error));
															}
														});
											});

							$('#sendAll').click(function() {
								alert('회의록을 저장합니다.');
								location.href = "saveMeetingText";
							});

							$("#inputMessage").keyup(function(e) {
								if (e.keyCode == 13)
									send();
							});

						});

		function download() {
			window.open("download", "newwin",
					"top=200,left=400,width=400,height=300,resizable=no");
		}

		var textarea = document.getElementById("messageWindow");
		var webSocket = new WebSocket(
				'ws://10.10.12.227:8888/board/broadcasting');
		var inputMessage = document.getElementById('inputMessage');

		webSocket.onerror = function(event) {
			onError(event)
		};

		webSocket.onopen = function(event) {
			onOpen(event)
		};

		webSocket.onmessage = function(event) {
			onMessage(event)
		};

		function onMessage(event) {
			textarea.value += event.data;
			$('#messageWindow').scrollTop(
					$('#messageWindow').prop('scrollHeight'));
		}

		function onOpen(event) {
			textarea.value += "	 		<< ${loginname}님이 회의에 참여하셨습니다. >>\n";
		}

		function onError(event) {
			alert(event.data);
		}

		function send() {
			if (final_transcript == '') {
				sysdate = new Date();
				discussionText = "${loginname} " + "[" + sysdate.getFullYear()
						+ '-' + parseInt(sysdate.getMonth() + 1) + '-'
						+ sysdate.getDate() + '-' + sysdate.getHours() + '-'
						+ sysdate.getMinutes() + '-' + sysdate.getSeconds()
						+ "]: " + inputMessage.value + "\r\n";
				textarea.value += discussionText;
				webSocket.send(discussionText);
				$('#inputmessage').val('');
				$('#inputmessage').focus();
				sendvoice();
			} else {
				sysdate = new Date();
				discussionText = "${loginname} " + "[" + sysdate.getFullYear()
						+ '-' + parseInt(sysdate.getMonth() + 1) + '-'
						+ sysdate.getDate() + '-' + sysdate.getHours() + '-'
						+ sysdate.getMinutes() + '-' + sysdate.getSeconds()
						+ "]: " + final_transcript + "\r\n";
				textarea.value += discussionText;
				webSocket.send(discussionText);
				$('#inputmessage').val('');
				$('#inputmessage').focus();
				sendvoice();
			}
			$('#final_span').html('');
			$('#interim_span').html('');

			final_transcript = '';
			inputMessage.value = "";

		}

		function sendvoice() {

			$.ajax({
				url : 'voice',
				type : 'GET',
				dataType : 'text',
				data : {
					'voice' : discussionText
				},
				success : function(voice) {
				},
				error : function(error) {
					alert('에러발생\n' + JSON.stringify(error));
				}
			});

			$('#messageWindow').scrollTop(
					$('#messageWindow').prop('scrollHeight'));

		}

		function htmlEncode(value) {
			var encodedValue = $('<div />').text(value).html();
			return encodedValue;
		}

		var langs = [
				[ 'Afrikaans', [ 'af-ZA' ] ],
				[ 'Bahasa Indonesia', [ 'id-ID' ] ],
				[ 'Bahasa Melayu', [ 'ms-MY' ] ],
				[ 'Català', [ 'ca-ES' ] ],
				[ 'Čeština', [ 'cs-CZ' ] ],
				[ 'Deutsch', [ 'de-DE' ] ],
				[ 'English', [ 'en-AU', 'Australia' ], [ 'en-CA', 'Canada' ],
						[ 'en-IN', 'India' ], [ 'en-NZ', 'New Zealand' ],
						[ 'en-ZA', 'South Africa' ],
						[ 'en-GB', 'United Kingdom' ],
						[ 'en-US', 'United States' ] ],
				[ 'Español', [ 'es-AR', 'Argentina' ], [ 'es-BO', 'Bolivia' ],
						[ 'es-CL', 'Chile' ], [ 'es-CO', 'Colombia' ],
						[ 'es-CR', 'Costa Rica' ], [ 'es-EC', 'Ecuador' ],
						[ 'es-SV', 'El Salvador' ], [ 'es-ES', 'España' ],
						[ 'es-US', 'Estados Unidos' ],
						[ 'es-GT', 'Guatemala' ], [ 'es-HN', 'Honduras' ],
						[ 'es-MX', 'México' ], [ 'es-NI', 'Nicaragua' ],
						[ 'es-PA', 'Panamá' ], [ 'es-PY', 'Paraguay' ],
						[ 'es-PE', 'Perú' ], [ 'es-PR', 'Puerto Rico' ],
						[ 'es-DO', 'República Dominicana' ],
						[ 'es-UY', 'Uruguay' ], [ 'es-VE', 'Venezuela' ] ],
				[ 'Euskara', [ 'eu-ES' ] ],
				[ 'Français', [ 'fr-FR' ] ],
				[ 'Galego', [ 'gl-ES' ] ],
				[ 'Hrvatski', [ 'hr_HR' ] ],
				[ 'IsiZulu', [ 'zu-ZA' ] ],
				[ 'Íslenska', [ 'is-IS' ] ],
				[ 'Italiano', [ 'it-IT', 'Italia' ], [ 'it-CH', 'Svizzera' ] ],
				[ 'Magyar', [ 'hu-HU' ] ],
				[ 'Nederlands', [ 'nl-NL' ] ],
				[ 'Norsk bokmål', [ 'nb-NO' ] ],
				[ 'Polski', [ 'pl-PL' ] ],
				[ 'Português', [ 'pt-BR', 'Brasil' ], [ 'pt-PT', 'Portugal' ] ],
				[ 'Română', [ 'ro-RO' ] ],
				[ 'Slovenčina', [ 'sk-SK' ] ],
				[ 'Suomi', [ 'fi-FI' ] ],
				[ 'Svenska', [ 'sv-SE' ] ],
				[ 'Türkçe', [ 'tr-TR' ] ],
				[ 'български', [ 'bg-BG' ] ],
				[ 'Pусский', [ 'ru-RU' ] ],
				[ 'Српски', [ 'sr-RS' ] ],
				[ '한국어', [ 'ko-KR' ] ],
				[ '中文', [ 'cmn-Hans-CN', '普通话 (中国大陆)' ],
						[ 'cmn-Hans-HK', '普通话 (香港)' ],
						[ 'cmn-Hant-TW', '中文 (台灣)' ],
						[ 'yue-Hant-HK', '粵語 (香港)' ] ], [ '日本語', [ 'ja-JP' ] ],
				[ 'Lingua latīna', [ 'la' ] ] ];
		for (var i = 0; i < langs.length; i++) {
			select_language.options[i] = new Option(langs[i][0], i);
		}
		select_language.selectedIndex = 6;
		updateCountry();
		select_dialect.selectedIndex = 6;
		showInfo('info_start');

		function updateCountry() {
			for (var i = select_dialect.options.length - 1; i >= 0; i--) {
				select_dialect.remove(i);
			}
			var list = langs[select_language.selectedIndex];
			for (var i = 1; i < list.length; i++) {
				select_dialect.options.add(new Option(list[i][1], list[i][0]));
			}
			select_dialect.style.visibility = list[1].length == 1 ? 'hidden'
					: 'visible';
		}
		var create_email = false;
		var final_transcript = '';
		var recognizing = false;
		var ignore_onend;
		var start_timestamp;

		if (!('webkitSpeechRecognition' in window)) {
			upgrade();
		} else {
			start_button.style.display = 'inline-block';

			var recognition = new webkitSpeechRecognition();
			recognition.continuous = true;
			recognition.interimResults = true;
			recognition.onstart = function() {
				recognizing = true;
				showInfo('info_speak_now');
				start_img.src = 'resources/img/mic-animate.gif';
			};
			recognition.onerror = function(event) {
				if (event.error == 'no-speech') {
					start_img.src = 'resources/img/mic.gif';
					showInfo('info_no_speech');
					ignore_onend = true;
				}
				if (event.error == 'audio-capture') {
					start_img.src = 'resources/img/mic.gif';
					showInfo('info_no_microphone');
					ignore_onend = true;
				}
				if (event.error == 'not-allowed') {
					if (event.timeStamp - start_timestamp < 100) {
						showInfo('info_blocked');
					} else {
						showInfo('info_denied');
					}
					ignore_onend = true;
				}
			};
			recognition.onend = function() {
				recognizing = false;
				if (ignore_onend) {
					return;
				}
				start_img.src = 'resources/img/mic.gif';
				if (!final_transcript) {
					showInfo('info_start');
					return;
				}
				showInfo('info_stop');
				if (window.getSelection) {
					window.getSelection().removeAllRanges();
					var range = document.createRange();
					range.selectNode(document.getElementById('final_span'));
					window.getSelection().addRange(range);
				}
				if (create_email) {
					create_email = false;
					createEmail();
				}
			};
			recognition.onresult = function(event) {
				var interim_transcript = '';
				for (var i = event.resultIndex; i < event.results.length; ++i) {
					if (event.results[i].isFinal) {
						final_transcript += event.results[i][0].transcript;
					} else {
						interim_transcript += event.results[i][0].transcript;
					}
				}
				final_transcript = capitalize(final_transcript);
				final_span.innerHTML = linebreak(final_transcript);
				interim_span.innerHTML = linebreak(interim_transcript);
				if (final_transcript || interim_transcript) {
					showButtons('inline-block');
					showInfo('info_upgrade');

				}
			};
		}

		function upgrade() {
			start_button.style.visibility = 'hidden';
			showInfo('info_upgrade');
		}
		var two_line = /\n\n/g;
		var one_line = /\n/g;
		function linebreak(s) {
			return s.replace(two_line, '<p></p>').replace(one_line, '<br>');
		}
		var first_char = /\S/;
		function capitalize(s) {
			return s.replace(first_char, function(m) {
				return m.toUpperCase();
			});
		}

		function startButton(event) {
			if (recognizing) {
				recognition.stop();
				return;
			}
			final_transcript = '';
			recognition.lang = select_dialect.value;
			recognition.start();
			ignore_onend = false;
			final_span.innerHTML = '';
			interim_span.innerHTML = '';
			start_img.src = 'resources/img/mic-slash.gif';
			showInfo('info_allow');
			showButtons('none');
			start_timestamp = event.timeStamp;
		}

		function showInfo(s) {
			if (s) {
				for (var child = info.firstChild; child; child = child.nextSibling) {
					if (child.style) {
						child.style.display = child.id == s ? 'inline' : 'none';
					}
				}
				info.style.visibility = 'visible';
			} else {
				info.style.visibility = 'hidden';
			}
		}
		var current_style;

		var fileTarget = $('.filebox .upload-hidden');

		fileTarget.on('change',
				function() {
					if (window.FileReader) {
						var filename = $(this)[0].files[0].name;
					} else {
						var filename = $(this).val().split('/').pop().split(
								'\\').pop();
					}

					$(this).siblings('.upload-name').val(filename);
				});
	</script>
</body>
</html>
