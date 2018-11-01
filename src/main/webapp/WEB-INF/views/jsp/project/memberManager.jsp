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

<title>${pj.pjtitle}에팀원을 초대하세요! - Sketto!</title>
<script src=<c:url value="/resources/arrayList.js"/>></script>
<script src=<c:url value="/resources/jquery-3.3.1.js"/>></script>
<script type="text/javascript">
 $(document).ready(function(){
	
});
 
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
				
				var str= '<h4 style="margin:5% 0 3%;">'+inputed+'님을<br>'; 
				str += '스켓토에 초대하세요!<br></h4>';
				str += '<input type="button" style="background-color: #5c948d; border-color: #5c948d;"  class="btn btn-primary sendInvite" value="초대" onclick="sendinvitedmail(\''+inputed+'\')">'
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

//skettoでない人たちを招待 
function sendinvitedmail(email){
	var email = email;
	var pjno = ${pjno };
	console.log(pjno);
	
	$.ajax({
		url: 'sendinvitedmail'
		, type: 'post'
		, dataType: 'json'
		, data: {
			'id' : email
			, 'pjno' : pjno
		}
		, success: function(msg){
			
			location.reload();
		}
		, error: function(err){
		}
	});
}

//skettoのアカウントがあるメンバーをプロジェクトに招待(insert)
function insertintopj(email){
	var email = email;
	var pjno = ${pjno };
	if (confirm(email+'님을 프로젝트로 초대합니다. \n계속하시겠습니까?')) {
		$.ajax({
			url: 'insertintopj',
			type: 'POST',
			dataType: 'json',
			data: {
				'id': email
				, 'pjno': pjno
			}
			, success: function(data){
				alert(email+'님을 프로젝트 멤버로 초대했습니다.');
				location.reload();
				window.opener.location.reload();
			},
			error: function(err){
				consol.log(err);
			}
		});
	}
	else{
		alert('초대가 취소되었습니다.');
	}
}

</script>
<style type="text/css">
.wholediv {
	width: 500px;
	padding: 10px;
	margin: 10px auto;
	text-align: center;
}

#invitedlisttable {
	padding: 5px;
	margin: 5px auto;
	text-align: center;
}

h4 {
	color: #1f2944;
	font-family: 'Droid Serif';
	border-bottom: 3px solid #d95b5b;
	border-top: 3px solid #d95b5b;
	font-size: 40px;
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

hr {
	border-top: 2px solid rgb(217, 91, 91);
}
</style>
</head>
<body>


	<h4 style="text-align: center;">팀원을 초대하세요</h4>
	<div class="wholediv">

		<div class="searchdiv">

			<input type="text" class="form-control form-control-lg"
				id="searchText" name="searchText" placeholder="sketto@sketto.com"
				onkeyup="searchmember()">
			<!-- 検索結果が出るdiv-->
			<div id="idResult"></div>
			<!-- 検索結果が出るdivエンド -->
		</div>

		<div class="inviteddiv">
			<div id="listUpdate">
				<hr style="margin-top: 15%;">
				<h3>초대 이력</h3>
				<table class="table">
					<c:forEach var="invited" items="${invitedlist }">
						<tr>
							<td>${invited.id }</td>
						</tr>
					</c:forEach>
				</table>
				<hr style="margin-top: 2%; margin-bottom: 15%;">
			</div>

		</div>

		<input type="button"
			style="background-color: #5c948d; border-color: #5c948d;"
			class="btn btn-primary" onclick="window.close();" value="창 닫기">

	</div>

</body>
</html>