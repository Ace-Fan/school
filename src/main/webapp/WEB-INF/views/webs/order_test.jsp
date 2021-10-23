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
	<title>确认订单T</title>
</head>

<body style="background: #ececec;">

<div class="pet_mian" id="top" >

	<input type="hidden" id="id_opentoken" value="${opentoken}">
	<input type="hidden" id="id_disGoodsId" value="${disGoods.id}">
	<input type="hidden" id="id_disUserAddressId" value="${disUserAddress.id}">
	<c:if test="${disUserAddress == null}">
		<div class="am_content am_content_list">
			<div class="pet_kjdt">
				<div class="am_content_kjdt_nr">
					<div class="am_content_user">
						<div class="am_index_product_left">
							<div class="am_index_product am_content_flex" onclick="javascript:window.location.href='${pageContext.request.contextPath}/f/webs/goods/address?goodsId=${disGoods.id}';" style="color:#000;">
									<h3>+添加收件地址</h3>
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
				<div class="am_content_kjdt_nr"  onclick="javascript:window.location.href='${pageContext.request.contextPath}/f/webs/goods/address?goodsId=${disGoods.id}';">
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



	<div class="am_content1 am_content_list1">
		<div class="pet_kjdt">
			<div class="am_content_kjdt_nr">
				<div class="am_order_producet_img"><img src="${imgFirst}" alt=""></div>
				<div ><span style="padding-left:10px;font-size:16px;font-weight:bold;">${disGoods.name}</span>
					<div style="height:30px;">
						<div class="am-u-sm-6 am_order_producet_price1">￥${disGoods.price}</div>
						<div class="am-u-sm-6 am_order_producet_amount1">X1</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div class="am_content1 am_content_list1">
		<div class="pet_kjdt">
			<div class="am_content_kjdt_nr">

				<div class="am_content_user1">
					<div class="am_index_product_left">
						<div class="am_index_product am_order_text_amount">
							备注：   <input type="text" name="remark" id="id_orderRemark" class="am_order_remark" maxlength="50" style="width: 80%;"/>
						</div>
					</div>
				</div>

			</div>
		</div>

		<div class="am_content1 am_content_list1">
			<div class="pet_kjdt">
				<div class="am_content_kjdt_nr">

					<div class="am_content_user1">
						<div class="am-form-group">
							<label class="am-radio-inline">
								<input type="radio"  value="0" name="nahuoType" checked onclick="doGongsi()"> 公司发货
							</label>
							<label class="am-radio-inline">
								<input type="radio" value="1" name="nahuoType" onclick="doXianchang()"> 现场拿货
							</label>
							<label class="am-radio-inline">
							<input type="hidden" id="id_hidden_goodscodeid" value="">
							<div id="id_div_goodscodeid">
							</div>
							</label>
						</div>
					</div>

				</div>
			</div>
		</div>


		<div class="am_content1 am_content_list1">
			<div class="pet_kjdt">
				<div class="am_content_kjdt_nr">

					<div class="am_content_user1">
						<div class="am-u-sm-6 am_order_text_amount">
							共1件
						</div>
						<div class="am-u-sm-6 am_order_text_count">合计：￥${disGoods.price}</div>
					</div>

				</div>
			</div>

			<div style="height:50px;max-width:620px;width:100%;position:fixed;bottom:0px;background-color:#3d3d3d;">
				<div class="am-u-sm-8 am_content_online_count am_content_flex" style="color: #fff;">合计：￥${disGoods.price}</div>
				<div class="am-u-sm-4 am_content_online_pay am_content_flex" onclick="doPay();">在线支付</div>
			</div>

		</div>
	</div>
</div>

<jsp:include page="common/modal.jsp"></jsp:include>

<input id="appId" type="hidden" value="${appId}" />
<input id="timestamp" type="hidden" value="${timestamp}" />
<input id="noncestr" type="hidden" value="${nonceStr}" />
<input id="signature" type="hidden" value="${signature}" />

<script src="http://res.wx.qq.com/open/js/jweixin-1.2.0.js"></script>
<script src="${ctxStatic}/webs/js/jquery.min.js"></script>
<script src="${ctxStatic}/webs/js/amazeui.min.js"></script>
<script>
    $(function() {

        // 动态计算新闻列表文字样式
        auto_resize();
        $(window).resize(function() {
            auto_resize();
        });
        $('.am-list-thumb img').load(function() {
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

        var appId = $("#appId").val();//appId
        var timestamp = $("#timestamp").val();//时间戳
        var nonceStr = $("#noncestr").val();//随机串
        var signature = $("#signature").val();//签名
        wx.config({
            debug : false, // 开启调试模式,调用的所有api的返回值会在客户端alert出来，若要查看传入的参数，可以在pc端打开，参数信息会通过log打出，仅在pc端时才会打印。
            appId : appId, // 必填，公众号的唯一标识
            timestamp : timestamp, // 必填，生成签名的时间戳
            nonceStr : nonceStr, // 必填，生成签名的随机串
            signature : signature,// 必填，签名，见附录1
            jsApiList : [ 'scanQRCode' ]
            // 必填，需要使用的JS接口列表，所有JS接口列表见附录2
        });

    });

    function doXianchang() {
		wx.scanQRCode({
			// 默认为0，扫描结果由微信处理，1则直接返回扫描结果
			needResult : 1,
			desc : 'scanQRCode desc',
			success : function(res) {
				//扫码后获取结果参数赋值给Input
				var codes = res.resultStr;
				var code = codes.split("#")[0];
                var para = {
                    codes : codes,
                    goodsId : $("#id_disGoodsId").val()
                }
                var url = "${pageContext.request.contextPath}/f/webs/goodsCode/buyCheck";
                $.post(url, para, function (r) {
                    if (r.code == 0) {
                        $("#id_div_goodscodeid").html(code);
                        $("#id_hidden_goodscodeid").val(code);
					} else {
                        $("#id_my-alert_msg").text(r.msg);
                        $('#my-alert').modal();
					}
                });
			}
		});

    }
    function doGongsi() {
        $("#id_div_goodscodeid").html("");
        $("#id_hidden_goodscodeid").val("");
    }

    var flag = 0;
    function doPay() {
        if (flag == 0) {
            flag = 1;
            var url = "${pageContext.request.contextPath}/f/webs/goods/h5PayNow";
            var disGoodsId = $("#id_disGoodsId").val();
            if ('' == disGoodsId) {
                $("#id_my-alert_msg").text("请选择商品");
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
            var nahuoType = $("input[name='nahuoType']:checked").val();
            if ('' == nahuoType) {
                $("#id_my-alert_msg").text("请选择拿货方式");
                $('#my-alert').modal();
                flag = 0;
                return;
            }
            var nahuoTypeText = "";
            var codeid = "";
            if (1 == nahuoType) {
                codeid = $("#id_hidden_goodscodeid").val();
                if ('' == codeid) {
                    $("#id_my-alert_msg").text("此时现场拿货，请点击现场拿货并扫描商品二维码");
                    $('#my-alert').modal();
                    flag = 0;
                    return;
                }
             	nahuoTypeText = '现场拿货';
            } else if (0 == nahuoType) {
                nahuoTypeText = '公司发货';
            }
            var para = {
                "opentoken" : $("#id_opentoken").val(),
                "disGoodsId" : disGoodsId,
                "disUserAddressId" : disUserAddressId,
                "orderRemark" : $("#id_orderRemark").val(),
                "nahuoType" : nahuoType,
                "codeid" : codeid
            };
            $("#id_my-confirm_text").text("当前拿货方式为"+nahuoTypeText+",确定支付吗？");
            $('#my-confirm').modal({
                relatedTarget: this,
                onConfirm: function(options) {
                    $.post(url, para, function (r) {
                        flag = 1;
                        var code = r.code;
                        if (0 != code) {
                            $("#id_my-alert_msg").text(r.msg);
                            $('#my-alert').modal();
                            flag = 0;
                            return;
                        }
                        /*$.post("/f/webs/goods/testPayNotify", para, function (r2) {
                            alert(r2);
                        });*/


                        var jsonData = r.data;
                        WeixinJSBridge.invoke(
                            'getBrandWCPayRequest', {
                                "appId": jsonData.appId, //公众号名称，由商户传入
                                "timeStamp": jsonData.timeStamp, //时间戳，自 1970 年以来的秒数
                                "nonceStr": jsonData.nonceStr, //随机串
                                "package": jsonData.package,
                                "signType": jsonData.signType, //微信签名方式：
                                "paySign": jsonData.paySign //微信签名
                            },
                            // 使用以上方式判断前端返回,微信团队郑重提示： res.err_msg 将在用户支付成功后返回ok，但并不保证它绝对可靠。
                            function (res) {
                                if (res.err_msg == "get_brand_wcpay_request:cancel") {
                                    alert("取消支付");
                                    //window.location.href = "${pageContext.request.contextPath}/v1/app/qr/showPayResult/"+jsonData.orderNo+" ? status = cancel";
                                }
                                else if (res.err_msg == "get_brand_wcpay_request:ok") {
                                    alert("支付完成，请返回公众号中个人中心查看");
//                            WeixinJSBridge.call('closeWindow');
                                    window.location.href = "${pageContext.request.contextPath}/f/webs/usercenter/index";
                                }
                                else {
                                    alert(res.err_code + res.err_desc + res.err_msg);
                                }
                            }
                        );

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