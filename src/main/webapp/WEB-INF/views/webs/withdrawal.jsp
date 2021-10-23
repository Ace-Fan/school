<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>

<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>提交申请</title>
    <meta name="description" content="">
    <meta name="keywords" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
    <meta name="renderer" content="webkit">
    <meta http-equiv="Cache-Control" content="no-siteapp" />
    <link href="${ctxStatic}/webs/css/amazeui.min.css" rel="stylesheet" type="text/css" />

    <link href="${ctxStatic}/webs/css/style.css" rel="stylesheet" type="text/css" />

</head>
<body>
<div style="height: 49px;"></div>
<div style="text-align: center;">
        <span class="txtmargin">银行</span><input type="text" name="bankname" placeholder="请输入银行名称" value="${wa.bankname}" class="login-password"><br/>
        <span class="txtmargin">姓名</span><input type="text" name="receiver" placeholder="请输入收款人姓名" value="${wa.receiver}" class="login-password"><br/>
        <span class="txtmargin">电话</span><input type="text" maxlength="20" name="phone" placeholder="请输入手机号码" value="${wa.phone}" class="login-password"><br/>
        <span class="txtmargin">卡号</span><input type="text " name="bankno" placeholder="请输入银行卡号" value="${wa.bankno}" class="login-password"><br/>
        <span class="txtmargin">金额</span><input type="text" name="reqMoney" placeholder="请输入提现金额" class="login-password"><br/>

        <span style="float:left;left:30px;margin-left:20px;">当前可提现总额</span><span style="float:left;color:#000;font-weight: bold;">

        <c:if test="${currWithdrawalAmount == 'null'}">0</c:if>
        <c:if test="${currWithdrawalAmount != 'null'}">${currWithdrawalAmount}</c:if>
        元</span><input type="button" onclick="javascript:window.location.href='${pageContext.request.contextPath}/f/webs/usercenter/withdrawalDetail'" class="yzm-hq1" style="position: relative;width:100px;float:right;right:5%;" value="提现记录" />
    <input type="hidden" class="login-btn" id="id_opentoken"  value="${opentoken}">
    <input type="button" class="login-btn" onclick="doSubmit();" value="提交申请">
</div>
</body>


<script src="${ctxStatic}/webs/js/jquery.min.js"></script>
<script src="${ctxStatic}/webs/js/amazeui.min.js"></script>
<script>
    var flag1 = 0;
    function doSubmit() {
        var bankname = $("input[name='bankname']").val();
        if ('' == bankname) {
            alert("请填写银行名称");
            return;
        }
        var receiver = $("input[name='receiver']").val();
        if ('' == receiver) {
            alert("请填写款人");
            return;
        }
        var bankno = $("input[name='bankno']").val();
        if ('' == bankno) {
            alert("请填写银行卡号");
            return;
        }
        var reqMoney = $("input[name='reqMoney']").val();
        if ('' == reqMoney) {
            alert("请输入提现金额");
            return;
        }
        var currWithdrawalAmount = ${currWithdrawalAmount};
        if (reqMoney > currWithdrawalAmount) {
            alert("提现金额不得大于当前可提现总额");
            return;
        }
        /*if (reqMoney > (currWithdrawalAmount - 200)) {
            alert("账户须预留200元");
            return;
        }*/
        /*if (reqMoney % 100 != 0) {
            alert("提现金额必须为100的整数倍");
            return;
        }*/
        if (reqMoney < 50) {
            alert("提现金额必须大于50元");
            return;
        }
        if (confirm("确认发起提现吗？")) {
            if (flag1 == 0) {
                flag1 = 1;
                var url = "${pageContext.request.contextPath}/f/webs/usercenter/reqWithdrawal";
                var para = {
                    "opentoken" : $("#id_opentoken").val(),
                    "bankname" : bankname,
                    "receiver" : receiver,
                    "bankno" : bankno,
                    "reqMoney" : reqMoney,
                    "phone" : $("input[name='phone']").val()
                };
                $.post(url, para, function (r) {
                    flag1 = 0;
                    var code = r.code;
                    alert(r.msg);
                    if (0 == code) {
                        window.location.href='${pageContext.request.contextPath}/f/webs/usercenter/index';
                    }
                });
            }
        }
    }

</script>

</html>