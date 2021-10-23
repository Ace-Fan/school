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
	<title>累计收入明细</title>
	<script src="${ctxStatic}/webs/js/jquery.min.js"></script>

	<!-- Keith写的 -->
	<style>
		.integral-table li span {
			width: 33%;
		}
	</style>

</head>

<body>
<div class="pet_mian" id="top">


	<div class="whitebar">
		<div data-am-widget="tabs" class="am-tabs am-tabs-d2">
			<ul class="am-tabs-nav am-cf" >
				<li class="am-active">
					<a href="[data-tab-panel-0]">全部</a>
				</li>
				<li class="">
					<a href="[data-tab-panel-1]">经销收入</a>
				</li>
				<li class="">
					<a href="[data-tab-panel-2]">零售收入</a>
				</li>
			</ul>

			<div class="am-tabs-bd">
				<div data-tab-panel-0 class="am-tab-panel am-active">
					<div class="am_content am_content_list">
						<div class="pet_kjdt">
							<div class="am_content_kjdt_nr">
								<div>
									<ul class="integral-table">
										<li class="tit">
											<%--<span>流水号</span>--%>
											<span>发生时间</span>
											<span>金额</span>
											<span>操作类型</span>
										</li>
										<c:forEach items="${allList}" var="x">
											<li class="for">
												<%--<span>${x.id}</span>--%>
												<span><fmt:formatDate value="${x.times}" pattern="yyyy-MM-dd HH:mm:ss"/></span>
												<span style="color:#FF995D;">${x.amount}元</span>
												<%--<span style="text-align: left;">${x.descs}</span>--%>
												<span>
													<c:if test="${x.type=='1'}">
														经销收入
													</c:if>
													<c:if test="${x.type=='2'}">
														零售收入
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

				<div data-tab-panel-1 class="am-tab-panel ">
					<div class="am_content am_content_list">
						<div class="pet_kjdt">
							<div class="am_content_kjdt_nr">
								<div>
									<ul class="integral-table">
										<li class="tit">
											<%--<span>流水号</span>--%>
											<span>发生时间</span>
											<span>金额</span>
											<span>操作类型</span>
										</li>
										<c:forEach items="${list1}" var="x">
											<li class="for">
												<%--<span>${x.id}</span>--%>
												<span><fmt:formatDate value="${x.times}" pattern="yyyy-MM-dd HH:mm:ss"/></span>
												<span style="color:#FF995D;">${x.amount}元</span>
												<%--<span style="text-align: left;">${x.descs}</span>--%>
												<span>
													<c:if test="${x.type=='1'}">
														经销收入
													</c:if>
													<c:if test="${x.type=='2'}">
														零售收入
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

				<div data-tab-panel-2 class="am-tab-panel ">
					<div class="am_content am_content_list">
						<div class="pet_kjdt">
							<div class="am_content_kjdt_nr">
								<div>
									<ul class="integral-table">
										<li class="tit">
											<%--<span>流水号</span>--%>
											<span>发生时间</span>
											<span>金额</span>
											<span>操作类型</span>
										</li>
										<c:forEach items="${list2}" var="x">
											<li class="for">
												<%--<span>${x.id}</span>--%>
												<span ><fmt:formatDate value="${x.times}" pattern="yyyy-MM-dd HH:mm:ss"/></span>
												<span style="color:#FF995D;">${x.amount}元</span>
												<%--<span style="text-align: left;">${x.descs}</span>--%>
												<span>
													<c:if test="${x.type=='1'}">
														经销收入
													</c:if>
													<c:if test="${x.type=='2'}">
														零售收入
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

			</div>
		</div>
	</div>
</div>

<script>
    //购物数量加减
    $(function() {
        $('.increase').click(function() {
            var self = $(this);
            var current_num = parseInt(self.siblings('input').val());
            current_num += 1;
            self.siblings('input').val(current_num);
            update_item(self.siblings('input').data('item-id'));
        })
        $('.decrease').click(function() {
            var self = $(this);
            var current_num = parseInt(self.siblings('input').val());
            if(current_num > 1) {
                current_num -= 1;
                self.siblings('input').val(current_num);
                update_item(self.siblings('input').data('item-id'));
            }
        })
    })
</script>

<script src="${ctxStatic}/webs/js/jquery.min.js"></script>
<script src="${ctxStatic}/webs/js/amazeui.min.js"></script>
</body>

</html>