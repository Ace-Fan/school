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
	<title>订单</title>
</head>

<body>

<input type="hidden" id="id_opentoken" value="${opentoken}">
<input type="hidden" id="id_dsgoId" value="${disStockGoodsOrder.id}">
<input type="hidden" id="id_disUserAddressId" value="${disUserAddress.id}">

<div class="main_container">
	<c:if test="${disUserAddress == null}">
		<div class="am_content">
			<div class="pet_add_address">
				<div class="am_address_layout">
					<div class="am_content_user">
						<div class="am_index_product_left">
							<div class="am_content_flex" onclick="javascript:window.location.href='${pageContext.request.contextPath}/f/webs/usercenter/addressStock?dsgoId=${disStockGoodsOrder.id}';">
								<h3 class="txt_black">+添加收件地址</h3>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</c:if>
	<c:if test="${disUserAddress != null}">
		<div class="am_content am_content_list">
			<div class="pet_kjdt">
				<div class="am_content_kjdt_nr"  onclick="javascript:window.location.href='${pageContext.request.contextPath}/f/webs/usercenter/addressStock?dsgoId=${disStockGoodsOrder.id}';">
					<div >
						<div style="height:30px;">
							<div class="am-u-sm-2 am_order_producet_price1" style="padding-left:0px;">${disUserAddress.receiver}</div>
							<div class="am-u-sm-2 am_order_producet_amount1" style="padding-left:0px;width: 150px;">${disUserAddress.mobile}</div>
							<div class="am-u-sm-8"></div>
						</div>
						<div class="am-u-sm-12 am_order_address_finish" >
							${disUserAddress.addr1}${disUserAddress.addr2}
						</div>
					</div>
				</div>
			</div>
		</div>
	</c:if>

	<div class="am_content1">
		<c:forEach items="${goodsList}" var="x">
			<div class="pet_kjdt">
				<div class="am_content_kjdt_nr">
					<div class="am_center_kjdt_block">
						<div class="am_order_producet_img"><img src="${x.imgFirst}" alt="" class="product_img"></div>
						<div><span class="good_name">${x.goodsName}</span>
							<div  class="height30">
								<div class="am-u-sm-6 am_order_producet_price1">
									￥${x.price}
								</div>
								<div class="am-u-sm-6 am_order_producet_amount1">X${x.num}</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</c:forEach>
	</div>

	<div class="am_content1">
		<div class="pet_kjdt">
			<div class="am_content_kjdt_nr">

				<div class="am_content_user1">
					<div class="am_index_product_left">
						<div class="am_index_product am_order_text_amount">
							备注： <input type="text" name="remark" id="id_orderRemark" class="am_order_remark" style="width: 80%;" maxlength="50"/>
						</div>
					</div>
				</div>

			</div>
		</div>

	</div>

	<div class="am_content1 am_content_list1">
		<div class="pet_kjdt">
			<div class="am_content_kjdt_nr">

				<div class="am_content_user1">
					<div class="am-u-sm-7 am_order_text_amount">
						共${disStockGoodsOrder.buyCount}件
					</div>
					<div class="am-u-sm-5 am_order_text_count">合计：${disStockGoodsOrder.ordersAmount}</div>
				</div>

			</div>
		</div>
		<div class="am_div_space">

		</div>
		<div class="am_immediate_buy">
			<div class="am-u-sm-8 am_content_online_count am_content_flex">合计：${disStockGoodsOrder.ordersAmount}</div>
			<div class="am-u-sm-4 am_content_online_pay am_content_flex" onclick="doPay();">确认支付</div>
		</div>
	</div>

</div>

<jsp:include page="../common/modal.jsp"></jsp:include>

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

    var flag = 0;
    function doPay() {
        if (flag == 0) {
            flag = 1;
			var dsgoId = $("#id_dsgoId").val();
			if ('' == dsgoId) {
                $("#id_my-alert_msg").text("订单信息有误，请重新下单");
                $('#my-alert').modal();
				flag = 0;
				return;
			}
			var disUserAddressId = $("#id_disUserAddressId").val();
			if ('' == disUserAddressId) {
                $("#id_my-alert_msg").text("请填写收货信息");
                $('#my-alert').modal();
				flag = 0;
				return;
			}
            $("#id_my-confirm_text").text("确定通过进货款支付吗？");
            $('#my-confirm').modal({
                relatedTarget: this,
                onConfirm: function(options) {
                    var para = {
                        "opentoken" : $("#id_opentoken").val(),
                        "dsgoId" : dsgoId,
                        "disUserAddressId" : disUserAddressId,
                        "orderRemark" : $("#id_orderRemark").val()
                    };
                    var url = "${pageContext.request.contextPath}/f/webs/usercenter/stockPay";
                    $.post(url, para, function (r) {
                        flag = 0;
                        var code = r.code;
                        $("#id_my-alert_msg").text(r.msg);
                        $('#my-alert').modal();
                        if (0 == code) {
                            $('#my-alert').on('close.modal.amui', function(){
                                window.location.href = '${pageContext.request.contextPath}/f/webs/usercenter/index';
                            });
                        } else {
                            return;
						}
                    });
                },
                // closeOnConfirm: false,
                onCancel: function() {
                    flag = 0;
                }
            });
		}
    }
</script>
</body>

</html>