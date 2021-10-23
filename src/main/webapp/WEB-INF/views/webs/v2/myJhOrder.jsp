<%@ page import="org.apache.commons.lang3.StringUtils" %>
<%@ page import="com.alibaba.fastjson.JSONObject" %>
<%@ page import="com.alibaba.fastjson.JSONArray" %>
<%@ page import="com.thinkgem.jeesite.modules.adopens.service.dis.DisGoodsService" %>
<%@ page import="com.thinkgem.jeesite.modules.adopens.entity.dis.DisGoods" %>
<%@ page import="java.math.BigDecimal" %>
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
		<title>我的订单</title>
	</head>

<body>

<div class="main_container">
	<%
		BigDecimal sumAmounts = new BigDecimal("0");
		int sumNums = 0;
	%>
	<c:forEach items="${list}" var="x">
		<div class="am_content1">
			<div class="pet_kjdt">
				<div class="am_content_kjdt_nr">
					<div class="am_center_kjdt_block">
						<div style="margin-left:-10px;">
							<div class="am-u-sm-12" style="white-space: nowrap;"><span style="font-size: 14px;">订单编号：</span><span style="font-size: 14px;">${x.orderNo} </span></div>
							<div class="am-u-sm-12" style="white-space: nowrap;"><span style="font-size: 14px;">订单日期：</span><span style="font-size: 14px;"><fmt:formatDate value="${x.payTime}" pattern="yyyy年MM月dd日"/> </span></div>
						</div>
						<div class="my_order_line"></div>
						<div data-tab-panel-1 class="am-tab-panel ">
							<div class="content_layout">
								<div class="order_content_layout">
									<ul class="integral-table">
										<li class="tit" style="margin-left:-10px;padding-right: 0px;margin-right: 0px;">
											<span class="font12" style="margin-left:0px;">商品名称</span>
											<span class="font12" style="margin-left:30px;">单价</span>
											<span class="font12" style="margin-left:0px;">数量</span>
											<span class="font12" style="margin-left:-10px;">金额</span>
										</li>
										<c:set var="jsonStr" value="${x.goodsStr}" scope="request"/>
										<c:set var="disGoodsService" value="${disGoodsService}" scope="request"/>
										<c:set var="levels" value="${x.levels}" scope="request"/>
										<%
											String jsonStr = (String) request.getAttribute("jsonStr");
											String levels = (String) request.getAttribute("levels");
											DisGoodsService disGoodsService = (DisGoodsService) request.getAttribute("disGoodsService");
											if (StringUtils.isNotBlank(jsonStr)) {
												JSONObject jsonObject = JSONObject.parseObject(jsonStr);
												if (null != jsonObject) {
													JSONArray data = jsonObject.getJSONArray("data");
													if (null != data) {
													    for (int i=0;i<data.size();i++) {
															JSONObject obj = data.getJSONObject(i);
															if (null != obj) {
																DisGoods disGoods = disGoodsService.get(obj.getString("id"));
																if (null != disGoods) {
																    disGoods.setNum(obj.getInteger("num"));
																    String showPrice = "";
																    BigDecimal showAmount = new BigDecimal("0");
																    if (levels.equals("钻石创客"))
																		showPrice = disGoods.getZuanshiPrice();
																	else if (levels.equals("董事创客"))
																		showPrice = disGoods.getDongshiPrice();
																	else if (levels.equals("社区合伙人"))
																		showPrice = disGoods.getShequPrice();
																	else if (levels.equals("城市合伙人"))
																		    showPrice = disGoods.getChengshiPrice();
																	else if (levels.equals("平台合伙人"))
																		    showPrice = disGoods.getPingtaiPrice();
																	showAmount = new BigDecimal(showPrice).multiply(new BigDecimal(disGoods.getNum()));
																	sumAmounts = sumAmounts.add(showAmount);
																	sumNums += disGoods.getNum();
																%>
																	<li class="for" style="margin-left:-10px;padding-right: 0px;margin-right: 0px;">
																		<span class="nowrap" style="text-align: left;"><%=disGoods.getName()%></span>
																		<span class="nowrap_auto" style="margin-left:40px;"><%=showPrice%></span>
																		<span class="nowrap_auto" style="margin-left:-10px;"><%=disGoods.getNum()%></span>
																		<span class="nowrap_auto" style="margin-left:-5px;margin-right: 0px;padding-right: 0px;width:80px;"><%=String.format("%.2f ",showAmount.floatValue())%></span>
																	</li>
																<%}
															}
														}
													}
												}
											}
										%>
										<div class="my_order_line"></div>
										<div style="display: flex;margin-left:-10px;">
											<div class="am-u-sm-6">
												<span class="font21">共计：${x.buyCount}件</span><br />
												<span class="font21">合计:<span>￥${x.ordersAmount}</span></span>
											</div>
											<div class="am-u-sm-6">
												<%--<button class="am_confirm_wuliu1" style="background-color:#fff;margin:0;padding:0;border:none;" data-am-modal="{target: '#zengpin_wuliu_info', closeViaDimmer: 0, width: 300, height: 200}"><span class="am_confirm_wuliu1">物流信息</span></button><br />
												<button class="am_confirm_receive1" style="background-color:#fff;margin:0;padding:0;border:none;"><span class="am_confirm_receive1">确认收货</span></button>--%>
											</div>
										</div>
									</ul>
								</div>
							</div>

						</div>
					</div>
				</div>
			</div>
		</div>
	</c:forEach>


	<div class="am_div_space">
	</div>
	<div class="order_count">
		<div class="am-u-sm-6 order_total_amounts order_content_flex" style="margin-left:-10px;">进货总数量：<span class="font20"><%=sumNums%></span></div>
		<div class="am-u-sm-6 order_total_money order_content_flex" style="margin-left:-10px;width:72%;">进货总金额：<span class="font20">￥<%=String.format("%.2f ",sumAmounts.floatValue())%></span></div>
	</div>
</div>
</div>

<script src="${ctxStatic}/webs/v2/js/jquery.min.js "></script>
<script src="${ctxStatic}/webs/v2/js/amazeui.min.js "></script>
<script>
    //样式控制
    var count = 0;
    $(".am_center_kjdt_block").each(function(index, domEle) {
        count++;
    });

    $(".am_center_kjdt_block").each(function(index, domEle) {
        if(index + 1 < count) {
            var self = $(this);
            self.css("border-bottom", "2px solid #f0f0f0");

        }
    });

    //添加地址
    $("#add_address").click(function() {
        location.href = "add_address.html";
    });
</script>
</body>

</html>