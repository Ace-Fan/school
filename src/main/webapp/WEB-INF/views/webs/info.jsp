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

<body >

<div  style="width:100%;text-align:center;position: absolute;">
	<div style="text-align:center;padding:10px 10px;width:90%;position:relative;left:30px;top:175px;color:red;font-weight: bold;">${info}</div>
	<div style="float:left;position:relative;left:30px;top:180px;"><img src="${ctxStatic}/webs/img/prompt2.png" style="width:294px;heigth:294px;"/></div>

</div>

</body>

</html>