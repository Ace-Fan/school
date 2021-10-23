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
	<script src="${ctxStatic}/webs/v2/js/calculate.js"></script>
	<title>我的库存</title>
</head>

<body>

<div class="main_container">

	<input type="hidden" name="opentoken" value="${opentoken}">

	<div class="whitebar">
		<div data-am-widget="tabs" class="am-tabs am-tabs-d2">
			<div class="am-tabs-bd">
				<div data-tab-panel-0 class="am-tab-panel am-active">
					<div class="content_layout">
						<div class="inner_content_layout">
							<ul class="jinhuo-table">
								<li class="tit">
									<span class="font12" style="display: block; float: left; text-align: left; width: 30%;padding-bottom: 0px;margin-top:10px;text-align: center;">商品名称</span>
									<span class="font12" style="display: block; float: left; text-align: left; width: 30%;padding-bottom: 0px;margin-top:10px;text-align: center;">库存数量</span>
									<span class="font12" style="display: block; float: left; text-align: left; width: 40%;padding-bottom: 0px;margin-top:10px;text-align: center;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
								</li>
								<c:forEach items="${goodsList}" var="x">
									<li class="for">
										<span class="nowrap" style="display: block; float: left; text-align: left; width: 30%;padding-bottom: 0px;margin-top:10px;text-align: center;">${x.name}</span>
										<span class="nowrap" style="display: block; float: left; text-align: left; width: 30%;padding-bottom: 0px;margin-top:10px;text-align: center;">
											${x.num}
										</span>
										<span class="nowrap" style="display: block; float: left; text-align: left; width: 40%;padding-bottom: 0px;margin-top:10px;text-align: center;">
											<div style="border: 1px #16D1C6 solid;width: 70px;display:block;border-radius: 3px;color: #16D1C6;" onclick="javascript:window.location.href='${pageContext.request.contextPath}/f/webs/usercenter/myStockCodeDetail?goodsId=${x.id}'">编码明细</div>
										</span>
									</li>
								</c:forEach>
								<li class="for">
									<div class="flex_lay">
									</div>
								</li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<jsp:include page="../common/modal.jsp"></jsp:include>

<script src="${ctxStatic}/webs/v2/js/jquery.min.js "></script>
<script src="${ctxStatic}/webs/v2/js/amazeui.min.js "></script>
<script>
</script>
</body>

</html>
