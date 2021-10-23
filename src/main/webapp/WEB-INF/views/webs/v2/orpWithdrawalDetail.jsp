<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE html>
<html>

<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0" />
	<meta name="keywords" content="" />
	<meta name="description" content="" />
	<link href="${ctxStatic}/webs/css/amazeui.min.css" rel="stylesheet" type="text/css" />

	<link href="${ctxStatic}/webs/css/page.css" rel="stylesheet">
	<link href="${ctxStatic}/webs/css/style.css" rel="stylesheet">
	<title>线上零售本金提现明细</title>
	<script src="${ctxStatic}/webs/js/jquery.min.js"></script>

	<!-- Keith写的 -->
	<style>
		.integral-table li span {
			width: 33%;
		}
	</style>

</head>

<body style="background: #ececec;">

<div class="pet_mian" id="top">

	<div class="am_content am_content_list">
		<div class="pet_kjdt">
			<div class="am_content_kjdt_nr">
				<div>
					<ul class="integral-table">
						<li class="tit">
							<span>申请时间</span>
							<span>金额</span>
							<span>状态</span>
						</li>

						<c:forEach items="${allList}" var="x">
							<li class="for">
								<span>
									<fmt:formatDate value="${x.reqTime}" pattern="yyyy-MM-dd HH:mm:ss"/>
								</span>
								<span style="color:#FF995D;">${x.reqMoney}元</span>
								<span>
									<c:if test="${x.status == 1}">
										已打款
									</c:if>
									<c:if test="${x.status == 2}">
										已拒绝(${x.remittanceRemark})
									</c:if>
								</span>
							</li>
						</c:forEach>
					</ul>
				</div>
			</div>
		</div>
	</div>
</div>
</body>

</html>