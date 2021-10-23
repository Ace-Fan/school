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
	<title>我的二维码</title>
</head>

<body>


	<div class="am_center_list am_content_list1">
		<div class="am_center_background">
			<div class="am_content_kjdt_nr">
				<div class="pet_grzx_ico"><img src="${headimgurl}" alt=""></div>
				<div style="padding-top:10px;"><span style="padding-left:10px;font-size:16px;color:#fff;font-weight:bold;">${nickname}</span>
					<div style="height:30px;">
						<%--<div class="am-u-sm-12 am_order_producet_price1" style="color:#fff;width:40%;">推广人数:${usercount}人</div>--%>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- 我的二维码    我的推荐    我的福粉-->
	<div class="am_center_qrcode1 pet_content_list">
		<div>
			<div class="am_center_grzx">
				<div class="am_center_pet_grzx_nr11 ">
					<div class="am-u-sm-12">
						<div style="text-align:center;margin-left: -30px;" ><img src="${imgData}" alt=""></div>
						<div style="text-align: center;">
							<span style="padding-left:10px;font-size:16px;">${msg}</span>
						</div>
					</div>


				</div>
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
	</script>
</body>
</html>
