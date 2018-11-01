<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>File download</title>
<link
	href='https://fonts.googleapis.com/css?family=Droid+Serif:400,400italic,700,700italic'
	rel='stylesheet' type='text/css'>
<link
	href='https://fonts.googleapis.com/css?family=Ubuntu:300italic,400,400italic,700,700italic'
	rel='stylesheet' type='text/css'>
<link href="resources/css/bootstrapu.css" rel="stylesheet" />
<style type="text/css">
* {
	font-family: Verdana, Arial, sans-serif;
	text-align: center;
	margin: 0;
	padding: 0;
	font-size: large;
}

body {
	line-height: 3rem;
}

a {
	
}

a:link {
	color: #5c948d;
	text-decoration: underline;
}

a:visited {
	color: #fff;
}

a:active {
	
}

a:hover {
	color: #33F;
}

#headline {
	padding: 10px;
	width: 70%;
	font-size: xx-large;
	margin-bottom: 5%;
}

body {
	width: 100%;
	height: 300;
	text-align: center;
}

table {
	margin-left: auto;
	margin-right: auto;
	float: inherit;
	margin-top: 0;
	text-align: center;
	width: 80%;
	border-collapse: collapse;
	table-layout: fixed;
}

table, th, td {
	border: solid thick;
	border-color: #1f2944;
	height: 40px;
}

.downloads {
	text-align: center;
	width: 600px
}

.menu {
	height: 40px;
	padding: 0 0 0 0;
	font-size: x-large;
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
</style>
</head>
<body>
	<br>
	<h1 id="headline" style="margin-left: auto; margin-right: auto;">
		DOWNLOADS</h1>

	<!-- 添付ファイルがある場合はファイルをダウンロードできるリンクを提供する -->
	<c:if test="${dlist != null}">
		<div id="downloads">
			<table>
				<c:forEach items="${dlist}" var="down">
					<tr>
						<td height="auto" style="word-break: break-all;"><a
							style="vertical-align: middle;"
							href="downloadFile?filenum=${down.filenum}">${down.originalfile}</a></td>
					</tr>
				</c:forEach>
			</table>
		</div>
	</c:if>
	<br>
	<br>
	<br>
	<br>
</body>
</html>