<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page errorPage="/error"%>
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

<!-- 리더가 프로젝트를 만들고나서 볼 수 있는 페이지 -->
<title>${pj.pjtitle}에팀원을 초대하세요! - Sketto!</title>
<script src="resources/jquery-3.3.1.js"></script>

<script type="text/javascript">

	function searchmember() {
		var inputed = $('#searchText').val();
		
		$.ajax({
			url: 'memberlist'
			, type: 'post'
			, dataType: 'json'
			, data: {
				'searchText':inputed
			}
			, success: function(data){
				if((data==null)||(data=='')){
					
					var str= '<h3 style="margin:2% 0 1%">'+inputed+'님을<br>'; 
					str += '스켓토에 초대하세요!<br></h3>';
					str += '<input type="button" style="background-color: #5c948d; border-color: #5c948d;" class="btn btn-primary sendInvite" value="초대" onclick="sendinvitedmail(\''+inputed+'\')">'
					str += '<br>'
					$('#idResult').html(str);
					
				} else {
					
					var str = '<table class="table">';
					$.each(data, function(idx, elem){
						str += '<form>';
						str += '<tr>';
						str += '<td id="'+elem.id+'">'+elem.id+'</td>';
						str += '<td><input type="button" style="background-color: #5c948d; border-color: #5c948d;"  class="btn btn-primary sendInvite" value="초대" onclick="insertintopj(\''+elem.id+'\')"></td>';
						str += '</tr>';
					});
					str +='</table>';
					
					$('#idResult').html(str);
				}
				
			}
			, error: function(err){
				console.log(err);
			}
		});
	}
	
	function sendinvitedmail(email){
		var email = email;
		var pjno = ${pj.pjno};
		console.log(email+'에게 '+pjno+'번 프로젝트로의 초대 실행');
		
		$.ajax({
			url: 'sendinvitedmail'
			, type: 'post'
			, dataType: 'json'
			, data: {
				'id' : email
				, 'pjno' : pjno
			}
			, success: function(data){
				alert(email+'님께 초대 메일이 발송되었습니다.');
				loadinvitedlist(pjno);
			}
			, error: function(err){
				console.log(err);
			}
		});
	}
	
	function insertintopj(email){
		var email = email;
		var pjno = ${pj.pjno };
		if (confirm(email+'님을 프로젝트로 초대합니다.\n계속하시겠습니까?')) {
			$.ajax({
				url: 'insertintopj'
				, type: 'POST'
				, dataType: 'json'
				, data: {
					'id': email
					, 'pjno': pjno
				}
				, success: function(data){
					alert(email+'님을 프로젝트 멤버로 초대했습니다.');
					loadinvitedlist(pjno);
				}
				, error: function(err){
					consol.log(err);
				}
			});
		}
		else{
			alert('초대가 취소되었습니다.');
		}
	}

	function loadinvitedlist(pjno){
		var pjno = ${pj.pjno};
		console.log(pjno);
		
		$.ajax({
			url: 'invitedlist'
			, type: 'post'
			, dataType: 'json'
			, data: {
				'pjno' : pjno
			}	
			, success: function(data){
				console.log(data);
				if((data==null)||(data=='')){
					var str = '';
					
					$('#listUpdate').html(str);
					
				} else {
					var str = '<hr style="margin-top: 15%;">';
						str += '<h3>초대한 리스트</h3>';	
						str += '<table class="table">';
					$.each(data, function(idx, elem){
						str += '<tr>';
						str += '<td id="'+elem.id+'">'+elem.id+'</td>';
						str += '</tr>';
					});
					str +='</table>';
					str += '<hr style="margin-top: 2%; margin-bottom: 15%;">';
				
					$('#listUpdate').html(str);
				}
				
			}
			, error: function(err){
				console.log(err);
			}
		});
	
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

.wholediv {
	text-align: center;
	width: 600px;
	margin: 0% auto;
}

.searchdiv {
	width: 100%;
}

.inviteddiv {
	width: 100%;
}

.godashbutton {
	width: 600px;
	margin: 2% auto;
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

input[type=text] {
	background-color: white;
	background-image: url('resources/img/search1.png');
	background-position: 2px 1px;
	background-repeat: no-repeat;
	background-size: 39px;
	padding-left: 45px;
}
</style>
</head>

<body style="margin: 0%;">
	<div id="topnav">
		<div class="topnav">
			<div class="topnavdiv">
				<a href="./"><img src="resources/img/logo2-white.png"
					style="height: 50px; margin-top: -20px;"></a> <a href="logout">로그아웃</a>
			</div>
		</div>
	</div>

	<h1 style="text-align: center">${pj.pjtitle}</h1>
	<h2 style="text-align: center">함께할 팀원을 초대하세요</h2>

	<div class="wholediv">

		<div class="searchdiv">
			<input type="text" class="form-control form-control-lg"
				id="searchText" name="searchText" placeholder="sketto@sketto.com"
				onkeyup="searchmember()">
			<div id="idResult"></div>
		</div>

		<div class="inviteddiv">
			<div id="listUpdate"></div>
		</div>

	</div>


	<div class="godashbutton"
		style="background-color: #5c948d; border-color: #5c948d;">
		<a href="./"><input type="button" class="btn btn-primary"
			style="text-align: center; width: 100%; padding: 2% 0%; background-color: #5c948d; border-color: #5c948d;"
			value="대시보드로 가기"></a>
	</div>


</body>
</html>
