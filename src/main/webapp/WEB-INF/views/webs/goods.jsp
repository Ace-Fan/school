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
	<title>商品详情</title>
</head>

<body>

<div class="pet_mian" id="top">
	<%--<div data-am-widget="slider" class="am-slider am-slider-a1" data-am-slider='{"directionNav":false}'>
		<ul class="am-slides">
			<c:forEach items="${imgArr}" var="x">
				<c:if test="${x != ''}">
					<li>
						<img src="${x}">
					</li>
				</c:if>
			</c:forEach>
		</ul>
	</div>

	<div class="am_content am_content_list">
		<div class="pet_kjdt">
			<div class="am_content_kjdt_nr">
				<div class="am_content_user">

					<div class="am_index_product_left">
						<div class="am_index_product_price">
							<h3>￥${disGoods.price}</h3></div>
						<div class="am_index_product">
							<h3>${disGoods.name}</h3></div>
					</div>
				</div>
			</div>
		</div>
	</div>--%>

	<div class="am_content1 am_content_list1">
		<div class="pet_kjdt">
			<div class="am_content_kjdt_nr">
				<div class="am_content_kjdt_block">
					<div class="am_content_user1">
						<div class="am_index_product_left">
							<div class="am_index_product">
								<h3>商品详情</h3></div>
						</div>
					</div>
				</div>

				<%--<figure data-am-widget="figure" class="am am-figure am-figure-default" style="margin-bottom: 50px;">--%>
				<div style="width: 100%;height:4000px;text-align: center;">
					<%--<img src="${ctxStatic}/webs/img/detail.jpg" alt="商品详情" />--%>
					<%--${infos}--%>
					<img src="${disGoods.infosimg}" style="width: 100%;height: 100%;" alt="商品详情" />
				</div>
				<div style="height: 50px;">

				</div>
				<%--</figure>--%>

			</div>
		</div>
		<div style="height:50px;max-width:620px;width:100%;position:fixed;bottom:0px;background-color:#3d3d3d;">
			<div class="am-u-sm-8 am_content_online_count am_content_flex"  style="color: #fff;">合计：￥${disGoods.price}</div>
			<div class="am-u-sm-4 am_content_online_pay am_content_flex" onclick="javascript:window.location.href='${pageContext.request.contextPath}/f/webs/goods/order?goodsId=${disGoods.id}'">立即购买</div>
				<%--<div class="am-u-sm-6 am_content_online_count am_content_flex"  style="color: #fff;">合计：￥${disGoods.price}</div>
				<div class="am-u-sm-3 am_content_online_pay am_content_flex" onclick="javascript:window.location.href='${pageContext.request.contextPath}/f/webs/goods/order'" style="font-size:14px;">立即购买</div>
				<div class="am-u-sm-3 am_content_online_pay am_content_flex" style="border-left: solid 2px #fff;font-size:14px;" onclick="javascript:window.location.href='${pageContext.request.contextPath}/f/webs/goods/dealersReg?qrcodeKey=${qrcodeKey}'">经销商注册</div>--%>

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
        /*$('. img').load(function() {
            auto_resize();
        });
*/
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