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
	<title>经销商中心</title>

	<style>
		.am_center_jifen {
			width: 100px;
		}
		.am_center_income_etc {
			font-size: 14px;
		}
	</style>

</head>

<body>

<div class="pet_mian" id="top">

	<input type="hidden" id="id_opentoken" value="${opentoken}">

	<div class="am_center_list am_content_list1">
		<div class="am_center_background">
			<div class="am_content_kjdt_nr">
				<div class="pet_grzx_ico"><img style="width:auto;height:auto;" src="${headimgurl}" alt=""></div>
				<div style="padding-top:10px;"><span style="padding-left:10px;font-size:16px;color:#fff;font-weight:bold;">${nickname}</span>
					<div style="height:30px;">
						<div class="am-u-sm-6 am_order_producet_price1" style="color:#fff;width: 110px;">${currlevel}</div>
						<div class="am-u-sm-6 am_center_jifen" style="color:#fff;padding-left: 0px;padding-right: 0px;width: 90px;font-size: 14px;margin-top: 10px;">
							<ul style="text-align: left;width: 120px;font-size: 12px;">
								<li>积分:${currIntegral}</li>
								<li style="width: 220px;">红包:￥${currWallet}<span style="margin-left: 2px;font-size: 8px;">${statusWallet}<button data-am-modal="{target:'#help_two', closeViaDimmer: 0, width: 300, height: 200}"  style="background:url(${ctxStatic}/webs/img/helpnew.png);border-style:none;width:12%; height:23px; background-repeat:no-repeat;position: relative;"></button></span></li>
								<li style="width: 200px;"></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div>
		<div class="am_center_grzx">
			<div class="am_center_pet_grzx_nr1">
				<div class="am_center_kjdt_block" style="margin-bottom: 10px;">
					<div class="am-u-sm-6" style="height:90px;">
						<div class="am_incomde_ico"><img style="width: 20px;height: 20px;" src="${ctxStatic}/webs/v2/img/jhyck.png" alt=""></div>
						<div style="width:200px;"><span style="padding-left:10px;font-size:14px;">进货预存款</span>
							<div style="height:30px;width:200px;">
								<div class="am-u-sm-12 am_center_income_etc">￥
									<c:if test="${jhAmount!='null'}">${jhAmount}</c:if>
									<c:if test="${jhAmount=='null'}">0.00</c:if>
								</div>
							</div>
							<div style="height:30px;width:200px;">
								<div class="am-u-sm-12 am_center_income_etc"><span class="hd_tag_tixian" style="border:1px solid red;position: relative;left:0px;top:-1px;font-size: 10px;" onclick="javascript:window.location.href='${pageContext.request.contextPath}/f/webs/usercenter/myJhamountDetail'">明细</span></div>
							</div>
						</div>
					</div>
					<div class="am-u-sm-6" style="height:90px;">
						<div class="am_incomde_ico"><img style="width: 20px;height: 20px;" src="${ctxStatic}/webs/v2/img/xslsbj.png" alt=""></div>
						<div style="width:200px;"><span style="padding-left:10px;font-size:14px;">线上零售本金</span>
							<div style="height:30px;width:200px;">
								<div class="am-u-sm-12 am_center_income_etc">￥${oprAmount}</div>
							</div>
							<div style="height:30px;width:200px;">
								<div class="am-u-sm-12 am_center_income_etc" style="width: 250px;"><span class="hd_tag_tixian" style="border:1px solid red;position: relative;left:0px;margin-right:3px;top:-1px;font-size: 10px;" onclick="">明细</span><span class="hd_tag_tixian" style="border:1px solid red;position: relative;left:0px;top:-1px;font-size: 12px;width: 60px;" onclick="javascript:window.location.href='${pageContext.request.contextPath}/f/webs/usercenter/toOrpChangeOverToJhAmount'">转预存款</span><span class="hd_tag_tixian" style="border:1px solid coral;position: relative;left:0px;top:-1px;font-size: 12px;margin-left: 4px;color: coral;" onclick="javascript:window.location.href='${pageContext.request.contextPath}/f/webs/usercenter/orpWithdrawal'">提现</span></div>
							</div>
						</div>
					</div>
				</div>

				<div class="am_center_kjdt_block" style="margin-bottom: 10px;">
					<div class="am-u-sm-6" style="height:90px;">
						<div style="width:200px;"><span style="padding-left:10px;font-size:14px;">累计收益</span>
							<div style="height:30px;width:200px;">
								<div class="am-u-sm-12 am_center_income_etc">￥${amountSum}</div>
							</div>
							<div style="height:30px;width:200px;">

								<div class="am-u-sm-12 am_center_income_etc"><span class="hd_tag_tixian" style="border:1px solid red;position: relative;left:0px;top:-1px;font-size: 12px;" onclick="javascript:window.location.href='${pageContext.request.contextPath}/f/webs/usercenter/myLjIncomeDetail'">明细</span></div>
							</div>
						</div>
					</div>
					<div class="am-u-sm-6" style="height:90px;">
						<div class="am_incomde_ico"><img style="width: 20px;height: 20px;" src="${ctxStatic}/webs/v2/img/ye.png" alt=""></div>
						<div style="width:200px;"><span style="padding-left:10px;font-size:14px;">余额</span>
							<div style="height:30px;width:200px;">
								<div class="am-u-sm-12 am_center_income_etc">￥${currAmount}</div>
							</div>
							<div style="height:30px;width:200px;">
								<div class="am-u-sm-12 am_center_income_etc" style="width: 250px;"><span class="hd_tag_tixian" style="border:1px solid red;position: relative;left:0px;top:-1px;margin-right:4px;font-size: 12px;" onclick="javascript:window.location.href='${pageContext.request.contextPath}/f/webs/usercenter/myBalanceDetail'">明细</span><span class="hd_tag_tixian" style="border:1px solid red;position: relative;left:0px;top:-1px;font-size: 12px;width: 60px;" onclick="javascript:window.location.href='${pageContext.request.contextPath}/f/webs/usercenter/toKtxChangeOverToJhAmount'">转预存款</span><span class="hd_tag_tixian" style="border:1px solid coral;position: relative;left:0px;top:-1px;font-size: 12px;margin-left: 4px;color: coral;" onclick="javascript:window.location.href='${pageContext.request.contextPath}/f/webs/usercenter/withdrawal'">提现</span></div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- 我的二维码    我的推荐    我的福粉-->
	<div class="am_center_qrcode pet_content_list">
		<div>
			<div class="am_center_grzx">
				<div class="am_center_pet_grzx_nr11 ">
					<%--<div class="am-u-sm-4">
						<div class="am_incomde_ico1"><img src="${ctxStatic}/webs/v2/img/my_zs.png" alt=""></div>
						<div style="text-align: center;">
							<span style="padding-left:0px;font-size:12px;white-space: nowrap;">我的证书</span>
						</div>
					</div>--%>
					<div class="am-u-sm-4" onclick="javascript:window.location.href='${pageContext.request.contextPath}/f/webs/usercenter/myQrcode'">
						<div class="am_incomde_ico1"><img src="${ctxStatic}/webs/img/qrcode.png" alt=""></div>
						<div style="text-align: center;">
							<span style="padding-left:0px;font-size:12px;white-space: nowrap;">我的二维码</span>
						</div>
					</div>
					<div class="am-u-sm-4" onclick="javascript:window.location.href='${pageContext.request.contextPath}/f/webs/usercenter/toStockGoods'">
						<div class="am_incomde_ico1"><img src="${ctxStatic}/webs/v2/img/my_jinhuo.png" alt=""></div>
						<div style="text-align: center;">
							<span style="padding-left:0px;font-size:12px;white-space: nowrap;">我要进货</span>
						</div>
					</div>
					<div class="am-u-sm-4" onclick="javascript:window.location.href='${pageContext.request.contextPath}/f/webs/usercenter/myStock'">
						<div class="am_incomde_ico1"><img src="${ctxStatic}/webs/v2/img/my_kucun.png" alt=""></div>
						<div style="text-align: center;">
							<span style="padding-left:0px;font-size:12px;white-space: nowrap;">我的库存</span>
						</div>
					</div>
				</div>
			</div>
			<div class="am_center_grzx">
				<div class="am_center_pet_grzx_nr11 " onclick="">
					<div class="am-u-sm-4" onclick="javascript:window.location.href='${pageContext.request.contextPath}/f/webs/usercenter/myJhOrder'">
						<div class="am_incomde_ico1"><img src="${ctxStatic}/webs/v2/img/my_order.png" alt=""></div>
						<div style="text-align: center;">
							<span style="padding-left:0px;font-size:12px;white-space: nowrap;">我的订单</span>
						</div>
					</div>
					<div class="am-u-sm-4" onclick="javascript:window.location.href='${pageContext.request.contextPath}/f/webs/usercenter/myTeam'">
						<div class="am_incomde_ico1"><img src="${ctxStatic}/webs/v2/img/my_team.png" alt=""></div>
						<div style="text-align: center;">
							<span style="padding-left:0px;font-size:12px;white-space: nowrap;">我的团队</span>
						</div>
					</div>
					<div class="am-u-sm-4" onclick="javascript:window.location.href='${pageContext.request.contextPath}/f/webs/usercenter/myTuijian'">
						<div class="am_incomde_ico1"><img src="${ctxStatic}/webs/v2/img/my_recommend.png" alt=""></div>
						<div style="text-align: center;">
							<span style="padding-left:0px;font-size:12px;white-space: nowrap;">我的分享</span>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

</div>



<!--温馨提示  -->
<div class="am-modal am-modal-no-btn" tabindex="-1" id="help_one">
	<div class="am-modal-dialog" style="border-radius: 10px;">
		<div class="am_content_kjdt_block">
			<div class="am-modal-hd">温馨提示
				<a href="javascript: void(0)" class="am-close am-close-spin" data-am-modal-close>&times;</a>
			</div>
		</div>
		<div class="am-modal-bd"  style="text-align:left;margin-top: -40px;">
			<%--1.下单7天后方可提现。<br />
			2.余额大于200时才能提现。--%>
			因国家退换货规定，需在订单生成7天后才可提现，且可提现账户余额不低于200元。
		</div>
	</div>
</div>

<div class="am-modal am-modal-no-btn" tabindex="-1" id="help_two">
	<div class="am-modal-dialog" style="border-radius: 10px;">
		<div class="am_content_kjdt_block">
			<div class="am-modal-hd">温馨提示
				<a href="javascript: void(0)" class="am-close am-close-spin" data-am-modal-close>&times;</a>
			</div>
		</div>
		<div class="am-modal-bd" style="text-align:left;;margin-top: -40px;">
			<%--1.发展到第三个VIP时所返还的金额。</br>
			2.7天后将自动返还。--%>
			恭喜您获得299元红包，因国家退换货规定，299元将在订单生成7天后以微信红包的方式给到您，请注意查收。
		</div>
	</div>
</div>

<div class="am-modal am-modal-no-btn" tabindex="-1" id="product_wuliu_info">
	<div class="am-modal-dialog" style="border-radius: 10px;">
		<div class="am_content_kjdt_block">
			<div class="am-modal-hd">温馨提示
				<a href="javascript: void(0)" class="am-close am-close-spin" data-am-modal-close>&times;</a>
			</div>
		</div>
		<div class="am-modal-bd" style="text-align:left;">
			1.快递公司：${mySp.expressName} </br>
			2.快递号：${mySp.expressId}
		</div>
	</div>
</div>

<div class="am-modal am-modal-no-btn" tabindex="-1" id="zengpin_wuliu_info">
	<div class="am-modal-dialog" style="border-radius: 10px;">
		<div class="am_content_kjdt_block">
			<div class="am-modal-hd">温馨提示
				<a href="javascript: void(0)" class="am-close am-close-spin" data-am-modal-close>&times;</a>
			</div>
		</div>
		<div class="am-modal-bd" style="text-align:left;">
			1.快递公司：${myZp.expressName} </br>
			2.快递号：${myZp.expressId}
		</div>
	</div>
</div>



<script src="${ctxStatic}/webs/js/jquery.min.js"></script>
<script src="${ctxStatic}/webs/js/amazeui.min.js"></script>
<script>
    $(function() {
        // 动态计算新闻列表文字样式
        auto_resize();
        $(window).resize(function() {
            auto_resize();
        });
        $('. img').load(function() {
            auto_resize();
        });

        $('.am-list > li:last-child').css('border', 'none');

        function auto_resize() {
            $('.pet_list_one_nr').height($('.pet_list_one_img').height());

        }
        $('.pet_nav_gengduo').on('click', function() {
            $('.pet_more_list').addClass('pet_more_list_show');
        });
        $('.pet_more_close').on('click', function() {
            $('.pet_more_list').removeClass('pet_more_list_show');
        });
    });

    var flag1 = 0;
    function spReceiv() {
        if (confirm("确认商品收货吗？")) {
			if (flag1 == 0) {
				flag1 = 1;
				var url = "${pageContext.request.contextPath}/f/webs/usercenter/spReceiv";
				var para = {
					"opentoken" : $("#id_opentoken").val()
				};
				$.post(url, para, function (r) {
					flag1 = 0;
					var code = r.code;
                    alert(r.msg);
					if (0 == code) {
                        location.reload();
                    }
				});
			}
		}
    }

    var flag2 = 0;
    function zpReceiv() {
        if (confirm("确认商品收货吗？")) {
            if (flag2 == 0) {
                flag2 = 1;
                var url = "${pageContext.request.contextPath}/f/webs/usercenter/zpReceiv";
                var para = {
                    "opentoken" : $("#id_opentoken").val()
                };
                $.post(url, para, function (r) {
                    flag2 = 0;
                    var code = r.code;
                    alert(r.msg);
                    if (0 == code) {
                        location.reload();
                    }
                });
            }
        }
    }
</script>
</body>

</html>