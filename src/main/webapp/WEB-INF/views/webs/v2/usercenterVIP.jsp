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
	<title>个人中心</title>

	<style>

		.am_center_jifen {
			width: 100px;
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
						<div class="am-u-sm-6 am_order_producet_price1" style="color:#fff;width: 40%;">${currlevel}</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- 累计输入    余额    可提现金额         我的礼品金-->
	<div>
		<div class="am_center_grzx">
			<div class="" style="width: 100%;padding: 0px ;overflow: hidden;">
				<div class="" style="width: 100%;overflow: hidden;">

					<div class="am-u-sm-6">
						<div class="am_incomde_ico"><img style="width: 20px;height: 20px;" src="${ctxStatic}/webs/img/gift_fee.png" alt=""></div>
						<div style="width:200px;"><span style="padding-left:10px;font-size:12px;">我的红包<button data-am-modal="{target:'#help_two', closeViaDimmer: 0, width: 300, height: 200}"  style="background:url(${ctxStatic}/webs/img/helpnew.png);border-style:none;width:12%; height:23px; background-repeat:no-repeat;position: relative;left:3px;top:-3px;"></button></span>
							<div style="height:30px;">
								<div class="am-u-sm-12 am_center_income_etc" style="width:150px;margin-left: 10px;">￥${currWallet}<span style="margin-left:3px;font-size:10px;font-weight:normal;">${statusWallet}</span></div>
							</div>
						</div>
					</div>

					<div class="am-u-sm-6" >
						<div class="am_incomde_ico"><img style="width: 20px;height: 20px;" src="${ctxStatic}/webs/img/income.png" alt=""></div>
						<div style="width:200px;"><span style="padding-left:10px;font-size:12px;">我的积分</span>
							<div style="height:30px;width:200px;">
								<div class="am-u-sm-12 am_center_income_etc" style="width:150px;margin-left: 20px;">${currIntegral}</div>
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
					<div class="am-u-sm-6" onclick="javascript:window.location.href='${pageContext.request.contextPath}/f/webs/usercenter/myQrcode'">
						<div class="am_incomde_ico1"><img src="${ctxStatic}/webs/img/qrcode.png" alt=""></div>
						<div style="text-align: center;">
							<span style="padding-left:0px;font-size:12px;white-space: nowrap;">我的二维码</span>
						</div>
					</div>
					<%--<div class="am-u-sm-1">
						<img src="${ctxStatic}/webs/img/line.png" alt="" />
					</div>--%>
					<div class="am-u-sm-6" onclick="javascript:window.location.href='${pageContext.request.contextPath}/f/webs/usercenter/myTuijian'">
						<div class="am_incomde_ico1"><img src="${ctxStatic}/webs/img/recommend.png" alt=""></div>
						<div style="text-align: center;">
							<span style="padding-left:0px;font-size:12px;white-space: nowrap;">我的分享</span>
						</div>
					</div>
					<%--<div class="am-u-sm-1">
						<img src="${ctxStatic}/webs/img/line.png" alt="" />
					</div>--%>
				</div>
			</div>
		</div>
	</div>


	<!--我的商品 -->
	<c:if test="${hasSp}">
	<div class="am_center_qrcode pet_content_list">
		<div>
			<div class="am_center_grzx">
				<div class="am_center_grzx_nr" >
					<div class="am_center_content_kjdt_block1">
						<div class="am_center_product_left" >
							<div class="am_index_product" style="position:relative;left:-30px;">
								<h3>我的商品</h3>
							</div>
						</div>
					</div>
					<div class="am-u-sm-4">
						<div class="am_center_buy_product" style="width:250px;text-align:left;">
							<span style="padding-left:0px;font-size:16px;">${mySp.goodsName}</span>
						</div>
					</div>

					<div class="am-u-sm-4">
						<div class="am_center_buy_product" >
							<span style="padding-left:10px;font-size:16px;">X${mySp.buyCount}</span>
						</div>
					</div>

					<div class="am-u-sm-4">
						<div class="am_center_buy_product">
							<span style="padding-left:10px;font-size:16px;">￥${mySp.ordersAmount}</span>
						</div>
					</div>

					<div style="text-align:right;">
						<button  class="am_confirm_wuliu" style="background-color:#fff;margin:0;padding:0;border:none;" data-am-modal="{target: '#product_wuliu_info', closeViaDimmer: 0, width: 300, height: 200}"><span class="am_confirm_wuliu" >物流信息</span></button>
						<c:if test="${mySp.status == 1}">
							<button  class="am_center_after_receive" style="background-color:#fff;margin:0;padding:0;border:none;"><span class="am_center_after_receive">待发货</span></button>
						</c:if>
						<c:if test="${mySp.status == 2}">
							<button  class="am_center_after_receive" style="background-color:#fff;margin:0;padding:0;border:none;" onclick="spReceiv()"><span class="am_confirm_receive" >确认收货</span></button>
						</c:if>
						<c:if test="${mySp.status == 3}">
							<button  class="am_center_after_receive" style="background-color:#fff;margin:0;padding:0;border:none;"><span class="am_center_after_receive">已收货</span></button>
						</c:if>
					</div>
				</div>
			</div>
		</div>
	</div>
	</c:if>


	<c:if test="${hasZp}">
	<!--我的赠品 -->
	<div class="am_center_qrcode pet_content_list">
		<div>
			<div class="am_center_grzx">
				<div class="am_center_grzx_nr">
					<div class="am_center_content_kjdt_block1">

						<div class="am_center_product_left">
							<div class="am_index_product" style="position:relative;left:-30px;">
								<h3>我的赠品</h3>
							</div>
						</div>

					</div>
					<div class="am-u-sm-4">
						<div class="am_center_buy_product" style="width:250px;text-align:left;">
							<span style="padding-left:0px;font-size:16px;">${myZp.name}</span>
						</div>
					</div>

					<div class="am-u-sm-4">
						<div class="am_center_buy_product">
							<span style="padding-left:10px;font-size:16px;">X${myZp.count}</span>
						</div>
					</div>

					<div class="am-u-sm-4">
						<div class="am_center_buy_product">
							<span style="padding-left:10px;font-size:16px;"></span>
						</div>
					</div>

					<div style="text-align:right;">
						<button  class="am_confirm_wuliu" style="background-color:#fff;margin:0;padding:0;border:none;" data-am-modal="{target: '#zengpin_wuliu_info', closeViaDimmer: 0, width: 300, height: 200}"><span class="am_confirm_wuliu" >物流信息</span></button>
						<c:if test="${myZp.status == 0}">
							<button  class="am_confirm_receive" style="background-color:#fff;margin:0;padding:0;border:none;"><span class="am_center_after_receive" >待发货</span></button>
						</c:if>
						<c:if test="${myZp.status == 2}">
							<button  class="am_confirm_receive" style="background-color:#fff;margin:0;padding:0;border:none;" onclick="zpReceiv()"><span class="am_confirm_receive" >确认收货</span></button>
						</c:if>
						<c:if test="${myZp.status == 3}">
							<button  class="am_confirm_receive" style="background-color:#fff;margin:0;padding:0;border:none;"><span class="am_center_after_receive" >已收货</span></button>
						</c:if>
					</div>
				</div>
			</div>
		</div>
	</div>
	</c:if>


	<!--我的 福礼-->
	<div class="am_center_qrcode pet_content_list" >
		<div >
			<div class="am_center_grzx">
				<div class="am_center_grzx_nr" >

					<div class="am_center_content_kjdt_block1">
						<div class="am_center_product_left">
							<div class="am_index_product" style="position:relative;left:-30px;">
								<h3>我的福礼</h3>
							</div>
						</div>
					</div>
					<div  style="font-size:12px;">
						<div>
							<div class="am-u-sm-12" style="margin-top: 10px;">
								<div><div style="width: 100%;">分享福礼1：</div><span>获得一条价值599元高能腰管家一条！</span>
									<c:choose>
										<c:when test="${level >= 1}">
											<span style="float: right;">已获得</span>
										</c:when>
										<c:otherwise>
											<span style="float: right;color: #00A6C7">未获得</span>
										</c:otherwise>
									</c:choose>
								</div>
							</div>
						</div>
						<div>
							<div class="am-u-sm-12" style="margin-top: 10px;">
								<div><div style="width: 100%;">分享福礼2：</div><span>获得汇爱幸福里商城1000元代金积分！</span>
									<c:choose>
										<c:when test="${level >= 2}">
											<span style="float: right;">已获得</span>
										</c:when>
										<c:otherwise>
											<span style="float: right;color: #00A6C7">未获得</span>
										</c:otherwise>
									</c:choose>
								</div>
							</div>
						</div>
						<div>
							<div class="am-u-sm-12" style="margin-top: 10px;">
								<div><div style="width: 100%;">分享福礼3：</div><span>获得299元微信红包！</span>
									<c:choose>
										<c:when test="${level >= 3}">
											<span style="float: right;">已获得</span>
										</c:when>
										<c:otherwise>
											<span style="float: right;color: #00A6C7">未获得</span>
										</c:otherwise>
									</c:choose>
								</div>
							</div>
						</div>
						<div>
							<div class="am-u-sm-12" style="margin-top: 10px;margin-bottom: 10px;">
								<div><div style="width: 100%;">分享福礼4：</div><span>恭喜您晋升汇爱幸福里钻石创客经销商！</span>
									<c:choose>
										<c:when test="${level >= 4}">
											<span style="float: right;">已获得</span>
										</c:when>
										<c:otherwise>
											<span style="float: right;color: #00A6C7">未获得</span>
										</c:otherwise>
									</c:choose>
								</div>
							</div>
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