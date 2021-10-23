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
	<title>经销商申请</title>

</head>

<body style="background: #ececec;">
    <div class="pet_content_main" style="height: 600px;">
        <form id="id_form" class="am-form" method="post" data-am-validator >

            <input type="hidden" name="tjOpenid" value="${tjOpenid}">
            <input type="hidden" name="opentoken" value="${opentoken}">

            <fieldset>
                <legend>经销商申请</legend>

                <div class="am-form-group">
                    <div class="am-form-group am-form-icon">
                        <i class="am-icon-user"></i>
                        <input type="text" name="name" maxlength="20" class="am-form-field" placeholder="姓名" value="${disDealersReq.name}" required>
                    </div>
                </div>

                <div class="am-form-group">
                    <div class="am-form-group am-form-icon">
                        <i class="am-icon-mobile"></i>
                        <input type="text" name="mobile" maxlength="20" class="am-form-field" placeholder="手机" value="${disDealersReq.mobile}" required>
                    </div>
                </div>

                <div class="am-form-group">
                    <div class="am-form-group am-form-icon">
                        <i class="am-icon-credit-card"></i>
                        <input type="text" name="idcard" class="am-form-field" maxlength="18" placeholder="身份证" value="${disDealersReq.idcard}" required>
                    </div>
                </div>

                <div class="am-form-group">
                    <div class="am-form-group am-form-icon">
                        <i class="am-icon-weixin"></i>
                        <input type="text" name="wechatno" class="am-form-field" maxlength="20" placeholder="微信号(选填)" value="${disDealersReq.wechatno}" >
                    </div>
                </div>


                <div class="am-form-group">
                    <div class="am-form-group am-form-icon">
                        <select id="doc-select-1" name="regLevel" required>
                            <option value="">请选择注册等级</option>
                            <c:forEach items="${allowDealersRegLevel}" var="x">
                                <option value="${x}">${x}</option>
                            </c:forEach>
                        </select>
                    </div>
                </div>

                <div class="am-form-group">
                    <div class="am-form-group am-form-icon">
                        <i class="am-icon-user-secret"></i>
                        <input type="text" name="tjNickname" class="am-form-field" placeholder="推荐人" readonly="readonly" value="${tjNickname}" required>
                    </div>
                </div>

            </fieldset>
        </form>
        <button class="am-btn am-btn-secondary" onclick="return save();" style="margin-top:10px;width:100%;margin-bottom: 20px;">提   交</button>
    </div>
</body>


<jsp:include page="common/modal.jsp"></jsp:include>


<script src="${ctxStatic}/webs/js/jquery-1.7.1.min.js"></script>
<script src="${ctxStatic}/webs/js/jquery.form.js"></script>
<script src="${ctxStatic}/webs/js/amazeui.min.js"></script>

<script type="text/javascript">
    var isSub = false;
    var save = function() {
        if (
            $("input[name='name']").val() == '' ||
            $("input[name='mobile']").val() == '' ||
            $("select[name='regLevel']").val() == '' ||
            $("input[name='idcard']").val() == ''
        ) {
            // alert("必填信息不能为空");
            $("#id_my-alert_msg").text("必填信息不能为空");
            $('#my-alert').modal();
            isSub = false;
            return false;
        }
        if (!isSub) {
            $("#id_my-confirm_text").text("确定注册为经销商吗？");
            $('#my-confirm').modal({
                relatedTarget: this,
                onConfirm: function(options) {
                    isSub = true;
                    $("#id_form").submit();
                },
                // closeOnConfirm: false,
                onCancel: function() {
                }
            });
        }
    }

    $("#id_form").submit(function () {

        var options = {
            target: '#LoginMessage',
            url: '${pageContext.request.contextPath}/f/webs/goods/doDealersReg',
            type: 'POST',
            dataType: 'json',
            success: function (r) {
                isSub = false;
                $("#id_my-alert_msg").text(r.msg);
                $('#my-alert').modal();
                if(r.code === 0){
                    $('#my-alert').on('close.modal.amui', function(){
                        window.location.href = '${pageContext.request.contextPath}/f/webs/usercenter/index';
                    });
                }
            }
        };
        $('#id_form').ajaxSubmit(options);
        return false;
    });
</script>

</html>