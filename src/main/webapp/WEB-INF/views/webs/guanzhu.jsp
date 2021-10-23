<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>

<!DOCTYPE html>
<html>

<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0" />
	<meta name="keywords" content="" />
	<meta name="description" content="" />
	<link rel="stylesheet" href="${ctxStatic}/webs/css/amazeui.min.css">
	<link rel="stylesheet" href="${ctxStatic}/webs/css/page.css">
	<title>幸福里-温馨提示</title>
</head>

<body>

<div  style="width:100%;background-color: #16D1C6;text-align:center;position: absolute;">
	<div style="text-align:left;padding:10px 10px;width:90%;position:relative;left:30px;top:175px;">${msg}</div>

	<img src="${ctxStatic}/webs/img/prompt1.jpg" style="width:100%;"/>
	<img src="${ctxStatic}/webs/qrcode.jpg" style="width:254px;heigth:254px;float:left;position: absolute;left:55px;top:240px;"/></div>

</div>


</body>

</html>