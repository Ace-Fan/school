<%@ page import="org.apache.commons.lang3.StringUtils" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0" />
	<meta name="keywords" content="" />
	<meta name="description" content="" />
	<link href="${ctxStatic}/webs/v2/css/amazeui.min.css" rel="stylesheet" type="text/css" />
	<link href="${ctxStatic}/webs/v2/css/pagenew.css" rel="stylesheet" type="text/css" />
	<title>商品</title>

	<style>
		html, body {
			background: #fff;
		}
	</style>

</head>

<body>

<div class="main_container">
	<div class="content_layout">

		<c:forEach items="${allowAll}" var="x">

			<c:set value="${x.imgs}" var="imgs" scope="request"/>
			<%
				String imgs = (String) request.getAttribute("imgs");
				String src = null;
				if (StringUtils.isNotBlank(imgs)) {
					String[] split = imgs.split("\\|");
					if (null != split && split.length > 0) {
						src = split[1];
						%>
							<div class="margin_bott">
								<img src="<%=src%>" alt="" class="img_wh padding_top" onclick="javascript:window.location.href='${pageContext.request.contextPath}/f/webs/goods/index?type=info&goodsId=${x.id}'" />
							</div>
						<%
					}
				}
			%>

		</c:forEach>

		<div style="height:100px;background: #fff;">

		</div>

		<%--<div class="goods_bott_container" style="" onclick="javascript:window.location.href='${pageContext.request.contextPath}/f/webs/goods/dealersReg?qrcodeKey=${qrcodeKey}'">
			<img src="${ctxStatic}/webs/jingxiaoshangzhuce.jpg" style="width: 100%;"/>
		</div>--%>
		<%--<div class="goods_bott_container" onclick="javascript:window.location.href='${pageContext.request.contextPath}/f/webs/goods/dealersReg?qrcodeKey=${qrcodeKey}'">
			<span class="font30 txt_fff">经销商注册</span>
		</div>--%>
	</div>

</div>


<script src="${ctxStatic}/webs/v2/js/jquery.min.js "></script>
<script src="${ctxStatic}/webs/v2/js/amazeui.min.js "></script>
</body>

</html>