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
	<title>编码明细</title>
</head>

<body>

<div class="main_container">

	<input type="hidden" name="opentoken" value="${opentoken}">

	<div class="top_content">
		<div class="team_info">
			<div class="am-u-sm-12"><span class="font16 margin_left1 nowrap" style="font-size: 16px;">商品名称:</span><span class="txt_color1 font16 nowrap" id="current_level" style="font-size: 16px;">${goodsName}</span></div>
		</div>
	</div>

	<div class="whitebar">
		<div data-am-widget="tabs" class="am-tabs am-tabs-d2">
			<div class="am-tabs-bd">
				<div data-tab-panel-0 class="am-tab-panel am-active">
					<div class="content_layout">
						<div class="inner_content_layout">
							<ul class="jinhuo-table">
								<c:forEach items="${codesList}" var="x">
									<li class="tit">
									</li>
									<li class="for">
										<span class="nowrap" style="display: block; float: left; text-align: left; width: 25%;padding-bottom: 0px;margin-top:10px;text-align: left;">
											商品编码：${x.codeid}
										</span>
									</li>
									<li class="for">
										<span class="nowrap" style="display: block; float: left; text-align: left; width: 25%;padding-bottom: 0px;margin-top:10px;text-align: left;">
											入库时间：<fmt:formatDate value="${x.outTime}" pattern="yyyy-MM-dd HH:mm:ss"/>
										</span>
									</li>
									<li class="for">
										<span class="nowrap" style="display: block; float: left; text-align: left; width: 25%;padding-bottom: 0px;margin-top:10px;text-align: left;">
											销售时间：<fmt:formatDate value="${x.buyTime}" pattern="yyyy-MM-dd HH:mm:ss"/>
										</span>
									</li>
									<li class="for">
										<span class="nowrap" style="display: block; float: left; text-align: left; width: 25%;padding-bottom: 0px;margin-top:10px;text-align: left;">

											<c:if test="${x.status == 3}">
												当前状态：已入库
											</c:if>
											<c:if test="${x.status == 4}">
												当前状态：已销售
											</c:if>
										</span>
									</li>
									<li class="for">
									</li>
								</c:forEach>

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
