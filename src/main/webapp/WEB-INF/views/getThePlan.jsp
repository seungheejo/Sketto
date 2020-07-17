<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<html>
<head>
<link
	href="//cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/css/bootstrap.css"
	rel="stylesheet" />
<script type="text/javascript"
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>
<script src="http://code.jquery.com/jquery-1.10.1.min.js"></script>
<script src="http://code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
<script src="resources/moment-with-locales.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>getThePlan</title>

<style type="text/css">
* {
	font-family: Verdana, Arial, sans-serif;
	margin: 0;
	padding: 0;
}

body {
	background-color: #F6F6F6;
	font-size: large;
}

.slidecontainer {
	width: 100%;
}

.slider {
	-webkit-appearance: none;
	appearance: none;
	width: 100%;
	height: 25px;
	background: #d3d3d3;
	outline: none;
	opacity: 0.7;
	-webkit-transition: .2s;
	transition: opacity .2s;
}

.slider:hover {
	opacity: 1;
}

.slider::-webkit-slider-thumb {
	-webkit-appearance: none;
	appearance: none;
	width: 25px;
	height: 25px;
	background: #4CAF50;
	cursor: pointer;
}

.slider::-moz-range-thumb {
	width: 25px;
	height: 25px;
	background: #4CAF50;
	cursor: pointer;
}

.menu {
	height: 40px;
	width: 20%;
	text-align: center;
}

select {
	text-align-last: right;
	padding-right: 50%;
	direction: rtl;
}

.Bar {
	height: 6vh;
	border: none;
	margin: 0px;
	padding: 0px;
	overflow: hidden;
}

#divEmptyBar {
	width: 90%;
	background-color: #1f2944;
	border: none;
}

#divProgressBar {
	width: 0px;
	background-color: #ffcb5e;
	border: none;
}
</style>

<script type="text/javascript">
	$(document).ready(function() {

		console.log('${plan.pno}');

		var getId = '${plan.id}'; 
		console.log('${plan.id}');

		var getCheckBoxId = "";

		for (var i = 1; i <= 5; i++) {
			getCheckBoxId = $('#' + i).val(); 
			console.log(getCheckBoxId);

			if (!(getId.includes(getCheckBoxId))) {

				$("input:checkbox[id=" + i + "]").prop('checked', false);
			}
		}
		
		onClickCounting();
	});

	function countMember() {

		var planmemberArray = [];
		var planmemberByName = document.getElementsByName("planmember");

		for (var i = 0; i < planmemberByName.length; i++) {

			var checkedBoolean = planmemberByName.item(i).getAttribute("checked");
			var checkedValue = planmemberByName.item(i).value;
			
			console.log(checkedBoolean+'...'+checkedValue);
			
			if (checkedBoolean == "checked") {
				planmemberArray.push(planmemberByName.item(i).value);
			}
			
		}

		console.log(planmemberArray);
		
	}
	
	function updatePlan() {
		
		var pno = document.getElementById("pno").value;
		var planname = document.getElementById("planname").value;
		var pjno = document.getElementById("pjno").value;
		var priority = $("#priority").val();
		var progress = document.getElementById("progress").value;
		var format = 'YYYY-MM-DDThh:mm';
		var pstartdate = moment($('#pstartdate').val(), format, 'ko').format(
				'YYYY-MM-DD-HH-mm-ss');
		var penddate = moment($('#penddate').val(), format, 'ko').format(
				'YYYY-MM-DD-HH-mm-ss');

				var planmemberArray = [];
				var planmemberByName = document.getElementsByName("planmember");

				for (var i = 0; i < planmemberByName.length; i++) {

					var checkedBoolean = planmemberByName.item(i).getAttribute("checked");
					var checkedValue = planmemberByName.item(i).value;
					
					console.log(checkedBoolean+'...'+checkedValue);
					
					if (checkedBoolean == "checked") {
						planmemberArray.push(planmemberByName.item(i).value);
					}
					
				}

		var color = "#" + document.getElementById("color").value;

		var planInsJSON = {
			"pno" : pno,
			"planname" : planname,
			"pstartdate" : pstartdate,
			"penddate" : penddate,
			"pjno" : pjno,
			"id" : planmemberArray,
			"priority" : priority,
			"progress" : progress,
			"color" : color
		};

		$.ajax({
			url : 'updatePlan',
			type : 'GET',
			dataType : 'text', 
			data : {
				'jsonString' : JSON.stringify(planInsJSON)
			},
			success : function(voice) {
				
				insertCheckBox();
				
				fnClose();
			
			},
			error : function(error) {
			}
		});

	}

	function deletePlan() {

		var pno = document.getElementById("pno").value;

		$.ajax({
			url : 'deletePlan',
			type : 'GET',
			dataType : 'text', 
			data : {
				"pno" : pno
			},
			success : function(voice) {
				fnClose(); 
			},
			error : function(error) {
			}
		});

	}

	function fnClose() {
		
		console.log('event successed. closing window.');
		
		window.close();
	}

	function deletePlan() {

		var pno = document.getElementById("pno").value;

		console.log(pno);
		$.ajax({
			url : 'deletePlan',
			type : 'GET',
			dataType : 'text', 
			data : {
				"pno" : pno
			},
			success : function(voice) {
				fnClose();
			},
			error : function(error) {
			}
		});

	}

	function fnClose() {
		
		window.opener.location.reload();
		window.close();
		
	}

	function onClickCounting() {

		var checkboxInput = document.getElementsByName("checkBoxName");
		var checkboxCount = 0;
		for (var i = 0; i < checkboxInput.length; i++) {
			if (checkboxInput[i].type == "checkbox" && checkboxInput[i].checked == true) {
				checkboxCount++;
			}
		}

		var widthControl = Number($("#divEmptyBar").css("width").replace("px",""))
						* (checkboxCount / checkboxInput.length);
		
		$("#divProgressBar").css("width", widthControl);
		document.getElementById("divProgressBar").innerHTML = '<b style="color:#fff">';
		document.getElementById("divProgressBar").innerHTML += Number((checkboxCount / checkboxInput.length) * 100 - (checkboxCount / checkboxInput.length) * 100%1);
		document.getElementById("divProgressBar").innerHTML += '%</b>';
	}

	function insertCheckBox() {

		var checkboxcheckbox = document.getElementsByName("checkBoxName"); 
		var checkboxText = document.getElementsByName("checkBoxText"); 

		var checkBoxPno = document.getElementById("checkBoxPno").value;
		var checkBoxPjno = document.getElementById("checkBoxPjno").value;

		var checkboxList = [];

		var checkboxTextLength = Number(checkboxText.length);

		for (var i = 0; i < checkboxTextLength ; i++) {
			var checked = 0;
			var checkBoxCno = 0;	
			
			if (checkboxText[i].getAttribute("checkBoxCno") != null) {
				var idIns = checkboxText[i].id.toString();
				console.log(idIns);
				checkBoxCno = document.getElementById(idIns).getAttribute("checkBoxCno");
			}

			if (checkboxcheckbox[i].checked) {
				checked = 1;
			} else {
				checked = 0;
			}

				var checkboxJSON = {
					"cno" : checkBoxCno,
					"pno" : checkBoxPno,
					"pjno" : checkBoxPjno,
					"text" : checkboxText[i].value,
					"checked" : checked
				};
				console.log(checkboxJSON.cno+'/ '+checkboxJSON.text+' / '+checkboxJSON.checked);
				checkboxList.push(checkboxJSON); 

			
			if ( i == checkboxTextLength-1) {			
				console.log(checkboxList);
				
				$.ajax({
					url : 'insertCheckBox',
					type : 'GET',
					dataType : 'json', 
					data : {
						'jsonString' : JSON.stringify(checkboxList)
					},
					success : function() {
						fnClose();
					},
					error : function(error) {
					}
				});
			
				return;
			}
		}

	}

	//동적으로 체크박스를 생성
	var idx = 0;
	function add() {

		$("#dynamicUL")
				.append('<input type="checkbox" onclick="onClickCounting()" name="checkBoxName" style="width: 30px; height: 30px; position: static;"/>');
		$("#dynamicUL").append(
				' <input type="text" name="checkBoxText" style="width: 90%; position: static;"/><br>');

		idx++;
		
		onClickCounting();
	}
</script>

</head>
<body>
	<br>
	<div style="position: relative; padding: 5%; align: left; width: 90%;">
		<form id="updateForm" action='javascript: updatePlan()'>

			<div align="center" style="width: 90%;">
				<p>
					<input type="text" class="menu"
						style="width: 40%; border: none; background-color: #1f2944; color: #fff;"
						value="Progress" readonly="readonly">
				</p>
				<div id="divEmptyBar" align="left" class="Bar">
					<div id="divProgressBar" class="Bar"></div>
				</div>
				<br>
			</div>

			<input id="pno" name="pno" type="hidden" value=""> <input
				id="pjno" name="pjno" type="hidden" value=""> <input
				id="progress" name="progress" type="hidden"
				value="${plan.progress }">
			<p>
				<input type="text" class="menu"
					style="width: 20%; border: none; background-color: #1f2944; color: #fff;"
					value="일정이름" readonly="readonly"> <input id="planname"
					name="planname" type="text" value="${plan.planname }"
					style="width: 70%; border: none;" />
			</p>
			<p>
				<input type="text" class="menu"
					style="width: 20%; border: none; background-color: #1f2944; color: #fff;"
					value="시작 날짜" readonly="readonly"> <input id="pstartdate"
					name="pstartdate" type="datetime-local" value=""
					style="width: 70%; border: none;" />

			</p>
			<p>
				<input type="text" class="menu"
					style="width: 20%; border: none; background-color: #1f2944; color: #fff;"
					value="마감 날짜" readonly="readonly"> <input id="penddate"
					name="penddate" type="datetime-local" value=""
					style="width: 70%; border: none;" />
			</p>
			<script type="text/javascript">
				var planPNO = '${plan.pno}';
				planPNO.replace("\"", "");
				planPNO.replace("\"", "");
				document.getElementById('pno').value = planPNO;
			
				var planPJNO = '${plan.pjno}';
				planPJNO.replace("\"", "");
				planPJNO.replace("\"", "");
				document.getElementById('pjno').value = planPJNO;
			
				var format = 'YYYY-MM-DD-hh-mm-ss';
				var pstartdate = moment('${plan.pstartdate}', format, 'ko')
						.format('YYYY-MM-DDThh:mm');
				var penddate = moment('${plan.penddate}', format, 'ko').format(
						'YYYY-MM-DDThh:mm');
				document.getElementById('pstartdate').value = pstartdate;
				document.getElementById('penddate').value = penddate;
			</script>


			<p>
				<input type="text" class="menu"
					style="width: 20%; border: none; background-color: #1f2944; color: #fff;"
					value="담당 팀원" readonly="readonly"> <input
					id="selectedMember" name="selectedMember" type="text"
					style="width: 70%; border: none;" />
			<div id="planMemberSelectList" style="width: 100%"></div>
			<c:forEach items="${memberList }" var="member">
				<script type="text/javascript">
												
												var input = '<a href="javascript: planMemberSelect(planmember${member.name })"><input type="button" class="menu" ';
												input += 'color: #fff; font-size: large; padding: 3px" ';
												input += 'id="planmember${member.name }" name="planmember" value="${member.name }" ';
												input += 'readonly="readonly" ';
												</script>

				<c:if test="${!fn:contains(plan.id, member.name)}">
					<script type="text/javascript">
												input += 'style="border: none; background-color: #ffcb5e;" ';
												input += 'checked="unchecked"></a>';
</script>
				</c:if>
				<c:if test="${fn:contains(plan.id, member.name)}">
					<script type="text/javascript">
												input += 'style="border: none; background-color: #d95b5b;" ';
												input += 'checked="checked"></a>';
</script>
				</c:if>

				<script type="text/javascript">							
												document.getElementById("planMemberSelectList").innerHTML += input + ' ';
												</script>
			</c:forEach>


			<script type="text/javascript">
	function planMemberSelect(ObjIns) {
		
		console.log(ObjIns);
		console.log(ObjIns.id);
		var planMember = document.getElementById(ObjIns.id);
		console.log(planMember.getAttribute("checked"));
		if (planMember.getAttribute("checked") == "checked") {
			planMember.setAttribute("checked","unchecked");
			planMember.style.backgroundColor = '#ffcb5e';
		} else {
			planMember.setAttribute("checked","checked");
			planMember.style.backgroundColor = '#d95b5b';			
		}  
		
		countMember();
		
	}
</script>

			<script src="resources/jscolor.js"></script>
			<p>
				<input type="text" class="menu"
					style="width: 20%; border: none; background-color: #1f2944; color: #fff;"
					value="색상" readonly="readonly"> <input class="jscolor"
					id="color" name="color" value="${plan.color }"
					style="width: 70%; border: none;" />
			</p>

			<p>
				<input type="text" class="menu"
					style="width: 20%; border: none; background-color: #1f2944; color: #fff;"
					value="중요도" readonly="readonly"> <input id="priority"
					type="number" name="priority"
					style="width: 35%; text-align: center; border: none; background-color: #1f2944; color: #fff;"
					value="${plan.priority }" step="1" min="0" max="10">
			</p>
		</form>

		<form id="checkBoxForm" action='javascript: insertCheckBox()'
			onsubmit="return false;">
			<p>
				<input id="checkBoxPno" name="checkBoxPno" type="hidden"
					value="${plan.pno }"> <input id="checkBoxPjno"
					name="checkBoxPjno" type="hidden" value="${plan.pjno }"> <input
					type="text" class="menu"
					style="width: 20%; border: none; background-color: #1f2944; color: #fff;"
					value="진행도" readonly="readonly"> <input type="text"
					class="menu"
					style="width: 34%; border: none; background-color: #5c948d; color: #fff;"
					onclick="add()" value="추가" readonly="readonly"> <input
					type="submit" class="menu"
					style="width: 34%; border: none; background-color: #5c948d; color: #fff;"
					onclick="document.getElementById('checkBoxForm').submit()"
					value="저장 및 나가기" readonly="readonly">
			</p>
			<div id="dynamicUL" align="left" style="width: 90%">

				<!-- 데이터베이스에 체크박스 텍스트가 있으면 가져옴 -->
				<c:forEach items="${checkboxList }" var="i" varStatus="status">

					<script type="text/javascript">
						console.log("${checkboxList}");
					</script>

					<c:if test="${i.checked == 0 }">
						<input type="checkbox" onclick="onClickCounting()"
							id="checkbox${status.index}" name="checkBoxName"
							style="width: 30px; height: 30px; position: static;">
					</c:if>
					<c:if test="${i.checked == 1 }">
						<input type="checkbox" onclick="onClickCounting()"
							id="checkbox${status.index}" name="checkBoxName"
							style="width: 30px; height: 30px; position: static;"
							checked="checked">
					</c:if>
					<input type="text" id="checkBoxText${status.index}"
						name="checkBoxText" value="${checkboxListText[status.index]}"
						style="width: 90%; position: static;" checkBoxCno="${i.cno }">
					<br>

				</c:forEach>
			</div>

		</form>

		<br> <br>
		<div style="width: 90%" align="center">
			<form action='javascript: deletePlan()'>
				<input type="button"
					style="border: none; width: 40%; height: 40px; background-color: #ffcb5e; color: #fff;"
					onclick="document.getElementById('updateForm').submit();"
					value="업데이트"> <input id="pno" name="pno" type="hidden"
					value="${plan.pno }"> <input type="submit"
					style="border: none; width: 40%; height: 38px; background-color: #d95b5b; color: #fff;"
					value="삭제">
			</form>
		</div>
	</div>
</body>
</html>
