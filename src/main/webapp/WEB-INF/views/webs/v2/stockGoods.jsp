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
	<script src="${ctxStatic}/webs/v2/js/calculate.js"></script>
	<title>我要进货</title>
</head>

<body>

<div class="main_container">
	<!--顶部信息-->
	<div class="top_content">
		<div class="team_info">
			<div class="am-u-sm-6"><span class="font14 margin_left1 nowrap">当前级别:</span><span class="txt_color1 font14 nowrap" id="current_level">${currlevel}</span></div>
			<div class="am-u-sm-6"><span class="font14 margin_left1 nowrap">进货款余额:</span><span class="txt_color1 font14 nowrap" id="balance_amount">￥${jhAmount}</span></div>
		</div>
	</div>

	<input type="hidden" name="opentoken" value="${opentoken}">

	<!--团队列表-->
	<div class="whitebar">
		<div data-am-widget="tabs" class="am-tabs am-tabs-d2">
			<div class="am-tabs-bd">
				<div data-tab-panel-0 class="am-tab-panel am-active">
					<div class="content_layout">
						<div class="inner_content_layout">
							<ul class="jinhuo-table">
								<li class="tit">
									<span class="font12">商品名称</span>
									<span class="font12">单价</span>
									<span class="font12">数量</span>
									<span class="font12">金额</span>
								</li>
								<c:forEach items="${goodsList}" var="x">
									<li class="for">
										<span class="nowrap">${x.name}</span>
										<span class="nowrap_auto">
												<c:if test="${currlevel == '钻石创客'}">${x.zuanshiPrice}</c:if>
												<c:if test="${currlevel == '董事创客'}">${x.dongshiPrice}</c:if>
												<c:if test="${currlevel == '社区合伙人'}">${x.shequPrice}</c:if>
												<c:if test="${currlevel == '城市合伙人'}">${x.chengshiPrice}</c:if>
												<%--${x.price}--%>
										</span>
										<span class="nowrap_auto">
													<div class="d-amount">
													   <div class="d-stock">
															<a class="decrease">－</a>
															<input id="num1"  class="text_box" name="goodsNum" data-id="${x.id}" type="text"   maxlength="4" value="0">
															<a class="increase">＋</a>
														</div>
													</div>
												</span>
										<span class="row_result">0.00</span>

									</li>
								</c:forEach>
								<li class="for">
									<div class="flex_lay">
										<div class="am-u-sm-5">
											<h4><span class="goumai_amount">数量：</span><span id="totalCount">0</span></h4>
										</div>
										<div class="am-u-sm-7">
											<h4><span class="goumai_amount">合计：</span><span id="total">￥0.00</span></h4>
										</div>
									</div>
								</li>
							</ul>
						</div>
					</div>
				</div>
			</div>

		</div>
	</div>
	<!--顶部信息-->
	<div class="top_content">
		<div class="team_info">
			<div class="am-u-sm-8 padding0"><span class="font14">当前级别最低进货数量：</span><span class="font14" id="level_amount">${stockGoods_min_count}</span><span class="font14">个</span></div>
			<%--<div class="am-u-sm-5 padding0"><span class="font16">最低进货款项</span><br/><span class="font16" id="level_total">￥${stockGoods_min_amount}</span></div>--%>
			<div class="am-u-sm-4"><button type="button" id="goumai_btn" class="am-btn am-btn-primary bottom10 goumai_btn"><span class="font14">立即进货</span></button></div>
		</div>
	</div>
</div>

<jsp:include page="../common/modal.jsp"></jsp:include>

<script src="${ctxStatic}/webs/v2/js/jquery.min.js "></script>
<script src="${ctxStatic}/webs/v2/js/amazeui.min.js "></script>
<script>
    //购物数量加减
    $(function() {
        $(":text").keyup(function() {
            var self = $(this);
            var current_num = Math.abs(self.val());

            self.val(parseInt(current_num));

            var cur_price = Math.abs(self.parent().parent().parent().prev().text());
            var amount = self.parent().parent().parent().next().text();

            var totalpri = cal_money(current_num, cur_price, 2);
            self.parent().parent().parent().next().text(totalpri);

            var num1 = 0;
            var amount = 0.00;

            $("input[type=text]").each(function(index, domEle) {
                num1 += parseInt(domEle.value);
            });

            $(".row_result").each(function(index, domEle) {
                amount = add_reserve_dot2(parseFloat(domEle.innerText), amount, 2);
            });

            $('#totalCount').text(num1);
            $('#total').text("￥" + amount);

        })

        $('.increase').click(function() {
            var self = $(this);
            var current_num = parseInt(Math.abs(self.siblings('input').val()));
            if(current_num < 9999) {
                current_num += 1;
                self.siblings('input').val(current_num);
                current_num = parseInt(self.siblings('input').val());

                var cur_price = Math.abs(self.parent().parent().parent().prev().text());
                var amount = self.parent().parent().parent().next().text();
                var totalpri = cal_money(current_num, cur_price, 2);
                self.parent().parent().parent().next().text(totalpri);

                var num1 = 0;
                var amount = 0.00;

                $("input[type=text]").each(function(index, domEle) {
                    num1 += parseInt(domEle.value);
                });

                $(".row_result").each(function(index, domEle) {
                    amount = add_reserve_dot2(parseFloat(domEle.innerText), amount, 2);
                });

                $('#totalCount').text(num1);
                $('#total').text("￥" + amount);
            }

        })

        $('.decrease').click(function() {
            var self = $(this);
            var current_num = parseInt(self.siblings('input').val());
            if(current_num >= 1) {
                current_num -= 1;
                self.siblings('input').val(current_num);
                current_num = parseInt(Math.abs(self.siblings('input').val()));

                var cur_price = Math.abs(self.parent().parent().parent().prev().text());
                var amount = self.parent().parent().parent().next().text();
                var totalpri = cal_money(current_num, cur_price, 2);
                self.parent().parent().parent().next().text(totalpri);

                var num1 = 0;
                var amount = 0.00;

                $("input[type=text]").each(function(index, domEle) {
                    num1 += parseInt(domEle.value);
                });

                $(".row_result").each(function(index, domEle) {
                    amount = add_reserve_dot2(parseFloat(domEle.innerText), amount, 2);
                });

                $('#totalCount').text(num1);
                $('#total').text("￥" + amount);
            }
        })
    })

    $(":text").keyup(function() {
        $(this).val($(this).val().replace(/[^0-9]/g, ''));
        var self = $(this);
        var num = parseInt(self.val());
        if(num < 0 || isNaN(num)) {
            self.val("0");
        }

    }).bind("paste", function() {
        $(this).val($(this).val().replace(/[^0-9]/g, ''));
    }).css("ime-mode", "disabled");

    $("#goumai_btn").click(function() {

        var curr_balance = $("#balance_amount").text().substring(1);

        var actual_amount = $("#totalCount").text();

        var actual_money = $("#total").text().substring(1);

        var level_amount = $("#level_amount").text();
        /*var level_total = $("#level_total").text().substring(1);*/

        if(parseInt(actual_amount) < parseInt(level_amount)) {
            $("#id_my-alert_msg").text("当前级别数量未达标，请重新确定数量！");
            $('#my-alert').modal();
            return;
        }

        /*if(parseInt(actual_money) < parseInt(level_total)) {
            $("#id_my-alert_msg").text("当前级别进货款未达标，请重新确定进货款！");
            $('#my-alert').modal();
            return;
        }*/


        if(parseFloat(actual_money) > parseFloat(curr_balance)) {
            $("#id_my-alert_msg").text("当前进货款已经超过进货余额，请重新确定此次进货款！");
            $('#my-alert').modal();
            return;
        }

        var opentoken = $("input[name='opentoken']").val();

        var postStr="{";
        postStr += '"opentoken":"'+opentoken+'",';
        postStr += '"data":[';
        //{"id":"1","num":"1"},{"id":"1","num":"1"}}";
        $("input[type=text]").each(function(index, domEle) {
            var str="";
            var good_num = parseInt(domEle.value);
            var self = $(this);
            var good_id = self.attr("data-id");
            str='{"id":"'+good_id+'","num":'+good_num+'},';
            postStr += str;

        });
        var postStr = postStr.substr(0,postStr.length-1);
        postStr += "]";
        postStr+="}";

        $.post("${pageContext.request.contextPath}/f/webs/usercenter/doStockGoods", {"jsonStr":postStr}, function (r) {
			if (r != 0) {
			    window.location.href = "${pageContext.request.contextPath}/f/webs/usercenter/toStockGoodsOrder?dsgoId="+r.data;
			} else {
                $("#id_my-alert_msg").text(r.msg);
                $('#my-alert').modal();
			}
        });

    });
</script>
</body>

</html>
