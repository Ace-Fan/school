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

	<script src="http://res.wx.qq.com/open/js/jweixin-1.2.0.js"></script>
	<script src="${ctxStatic}/webs/js/jquery.min.js"></script>
	<title>商品入库</title>
</head>

<body >

<input id="openid" type="hidden" value="${openid}" />
<input id="appId" type="hidden" value="${appId}" />
<input id="timestamp" type="hidden" value="${timestamp}" />
<input id="noncestr" type="hidden" value="${nonceStr}" />
<input id="signature" type="hidden" value="${signature}" />

<div style="width:100%;text-align:center;margin-top:100px;">
	<input id="id_securityCode_input" type="hidden">
	<div id="scanQRCode" style="background-color:green;height:200px;width:200px;border-radius:100px;line-height:200px;color:#fff;margin:0 auto">
		<b>入 库</b>
	</div>
	<div style="text-align:center;">
		<div id="id_code"></div>
		<div id="id_msg"></div>
	</div>
</div>

</body>
<script type="text/javascript">
    $(function() {
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
    $("#scanQRCode").click(function() {
        wx.scanQRCode({
            // 默认为0，扫描结果由微信处理，1则直接返回扫描结果
            needResult : 1,
            desc : 'scanQRCode desc',
            success : function(res) {
                //扫码后获取结果参数赋值给Input
                var codes = res.resultStr;
				$("#id_securityCode_input").val(codes);
				$("#id_code").text(codes.split("#")[0]);
				var postUrl = "${pageContext.request.contextPath}/f/webs/goodsCode/inData";
				var para = {
                    codes : codes,
					openid : $("#openid").val()
				}
				$.post(postUrl, para, function (r) {
                    $("#id_msg").text(r.msg);
                });

            }
        });
    });
</script>

</html>