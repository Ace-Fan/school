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
	<link rel="stylesheet" href="${ctxStatic}/webs/css/LArea.css">
	<title>收货地址</title>
</head>

<body style="background: #ececec;">

<div class="pet_mian" id="top">
	<form id="from1" action="${pageContext.request.contextPath}/f/webs/usercenter/saveAddressStock" method="post">
		<div class="am_content1 am_content_list1">
			<div class="pet_kjdt">
				<div class="am_order_address_nr">
					<div >
						<div class="am_index_product_left">
							<div class="am_index_product am_order_add_address">
								<input type="hidden" name="dsgoId" value="${dsgoId}"/>
								<input type="hidden" name="opentoken" value="${opentoken}"/>
								<div>收件人：   <input type="text" name="receiver" class="am_order_add_address_input" maxlength="30" style="width: 70%;" value="${disUserAddress.receiver}" required/></div>
								<div>手机号：   <input type="number" name="mobile" id="phone" onblur="check_telphone();" class="am_order_add_address_input" maxlength="11" style="width: 70%;" value="${disUserAddress.mobile}" required/></div>
								<div>省市区：   <input type="text" name="addr1"  readonly="" id="province" name="province" class="am_order_add_address_input" maxlength="100" value="${disUserAddress.addr1}" required/></div>
								<input id="value1" type="hidden" value="20,234,504"/>
								<%--<div>详细地址：   <input type="text" name="addr2"  class="am_order_add_detail_address_input" style="width: 60%;" maxlength="50" value="${disUserAddress.addr2}" required/></div>--%>
								<div>详细地址：   <textarea name="addr2" required maxlength="50" style="width: 100%;height: 120px;border: solid #10A0EA 1px;">${disUserAddress.addr2}</textarea></div>
							</div>
						</div>
					</div>

				</div>
			</div>
		</div>

		<div class="pet_kjdt">
			<div class="am_content_kjdt_nr">
				<figure data-am-widget="figure" class="am am-figure am-figure-default">
					<div style="height:50px;">
						<div class="am-u-sm-12 am_content_online_pay am_content_flex" onclick="doSubmit();">确   定</div>
						<%--<button type="submit" value="确定" class="am-u-sm-12 am_content_online_pay am_content_flex">确&nbsp;&nbsp;&nbsp;定</button>--%>
					</div>
				</figure>
			</div>
		</div>
	</form>
</div>


<button type="button" style="display: none;" class="am-btn am-btn-primary" id="alert_button1" data-am-modal="{target: '#my-alert1'}"></button>
<button type="button" style="display: none;" class="am-btn am-btn-primary" id="alert_button2" data-am-modal="{target: '#my-alert2'}"></button>
<div class="am-modal am-modal-alert" tabindex="-1" id="my-alert1">
	<div class="am-modal-dialog">
		<div class="am-modal-hd">温馨提示</div>
		<div class="am-modal-bd">
			手机号码输入不合法!
		</div>
		<div class="am-modal-footer">
			<span class="am-modal-btn">确定</span>
		</div>
	</div>
</div>

<div class="am-modal am-modal-alert" tabindex="-1" id="my-alert2">
	<div class="am-modal-dialog">
		<div class="am-modal-hd">温馨提示</div>
		<div class="am-modal-bd">
			手机号码长度不合法!
		</div>
		<div class="am-modal-footer">
			<span class="am-modal-btn">确定</span>
		</div>
	</div>
</div>

<script src="${ctxStatic}/webs/js/LAreaData1.js"></script>
<script src="${ctxStatic}/webs/js/LAreaData2.js"></script>
<script src="${ctxStatic}/webs/js/LArea.js"></script>
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

    var area1 = new LArea();
    area1.init({
        'trigger': '#province', //触发选择控件的文本框，同时选择完毕后name属性输出到该位置
        'valueTo': '#value1', //选择完毕后id属性输出到该位置
        'keys': {
            id: 'id',
            name: 'name'
        }, //绑定数据源相关字段 id对应valueTo的value属性输出 name对应trigger的value属性输出
        'type': 1, //数据源类型
        'data': LAreaData //数据源
    });
    area1.value = [1, 13, 3]; //控制初始位置，注意：该方法并不会影响到input的value
    var area2 = new LArea();
    area2.init({
        'trigger': '#demo2',
        'valueTo': '#value2',
        'keys': {
            id: 'value',
            name: 'text'
        },
        'type': 2,
        'data': [provs_data, citys_data, dists_data]
    });

    function checkPhone() {
        var phone = $("#phone").val();

        if(phone.length < 11) {

            return 1;
        }
        if(!(/^1(3|4|5|7|8)\d{9}$/.test(phone))) {
            return 2;

        }

    }

    function check_telphone() {
        var r = checkPhone();

        if(r == 1) {
            $('#alert_button2').click();
        } else if(r == 2) {
            $('#alert_button1').click();
        }

    }

    var flag1 = 0;
    function doSubmit() {
		var receiver = $("input[name='receiver']").val();
		if ('' == receiver) {
		    alert("请填写收件人");
		    return;
        }
		var mobile = $("input[name='mobile']").val();
		if ('' == mobile) {
		    alert("请填写手机号");
		    return;
        }
		var addr1 = $("input[name='addr1']").val();
		if ('' == addr1) {
		    alert("请选择省市区");
		    return;
        }
		var addr2 = $("input[name='addr2']").val();
		if ('' == addr1) {
		    alert("请填写详细地址");
		    return;
        }
		$("#from1").submit();
    }
</script>
</body>

</html>