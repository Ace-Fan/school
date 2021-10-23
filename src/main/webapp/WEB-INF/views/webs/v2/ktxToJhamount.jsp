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
	<title>可提现金额转预存款</title>
</head>
<body>

<div class="main_container">
	<div class="content_layout">
		<div class="h20"></div>
		<form class="am-form am-form-horizontal" id="id_form">

			<input type="hidden" name="opentoken" value="${opentoken}">
			<input type="hidden" name="dealersId" value="${dealersId}">

			<div class="am-form-group">
				<h4 class="padding0 bottom0 margl6">可转金额：<span id="max_balance" class="font17">￥${allowTixianAmount}</span></h4>
			</div>

			<div class="am-form-group">
				<label for="changeOver_num" class="am-u-sm-3 am-form-label padding0">转入预存款金额:</label>
				<div class="am-u-sm-9">
					<input type="text" id="changeOver_num" name="changeOver_num" placeholder="转入预存款金额" maxlength="8" required>
				</div>
			</div>

			<div class="am-form-group">
				<div class="am-u-sm-9 am-u-sm-offset-3">
					<button type="button" id="chongzhi_btn" class="am-btn am-btn-primary bottom10">立即转入</button>
				</div>
			</div>
		</form>
	</div>
</div>

<jsp:include page="../common/modal.jsp"></jsp:include>

<script src="${ctxStatic}/webs/v2/js/jquery.min.js "></script>
<script src="${ctxStatic}/webs/js/jquery-1.7.1.min.js"></script>
<script src="${ctxStatic}/webs/js/jquery.form.js"></script>
<script src="${ctxStatic}/webs/v2/js/amazeui.min.js "></script>
<script>
    $("#changeOver_num").keyup(function() {
        $(this).val($(this).val().replace(/[^0-9]/g, ''));
    }).bind("paste", function() {
        $(this).val($(this).val().replace(/[^0-9]/g, ''));
    }).css("ime-mode", "disabled");

    $("#chongzhi_btn").click(function() {

        var max_balance = $('#max_balance').text().substring(1);
        var changeOver_num = $('#changeOver_num').val();

        if(changeOver_num == "") {
            $("#id_my-alert_msg").text("转入预存款金额必填");
            $('#my-alert').modal();
            return;
        }
        if(parseInt(changeOver_num) <= 0) {
            $("#id_my-alert_msg").text("转入预存款金额必须大于0");
            $('#my-alert').modal();
            return;
        }

        if(parseInt(changeOver_num) > parseInt(max_balance)) {
            $("#id_my-alert_msg").text("转入预存款金额不能大于可提现余额");
            $('#my-alert').modal();
            return;
        } else {
            $("#id_my-confirm_text").text("确定要为转入到预存款吗？");
            $('#my-confirm').modal({
                relatedTarget: this,
                onConfirm: function(options) {
                    $("#id_form").submit();
                },
                // closeOnConfirm: false,
                onCancel: function() {
                }
            });

        }
    });


    $("#id_form").submit(function () {
        $("#chongzhi_btn").attr("disabled", "disabled");
        var options = {
            target: '#LoginMessage',
            url: '${pageContext.request.contextPath}/f/webs/usercenter/doKtxChangeOverToJhAmount',
            type: 'POST',
            dataType: 'json',
            success: function (r) {
                $("#chongzhi_btn").attr("disabled", "");
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
</body>

</html>
