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
	<title>我的分享</title>
</head>

<body style="background: #ececec;">

<div class="pet_mian" id="top">
	<div class="am_content am_content_list">
		<div class="pet_kjdt" style="text-align:left;">
			<div class="am_content_kjdt_nr" style="text-align:left;">
				<div class="am_content_user">
					<div class="am_index_product_left">
						<div class="am_index_product am_content_flex">
							<h3 style="color:#000;">分享人数:${fn:length(list)}人</h3></div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="am_content1 am_content_list1">
		<div class="pet_kjdt">
		<c:forEach items="${list}" var="x">
			<div class="am_fufen_center_kjdt_block">
				<div class="am_content_kjdt_nr">
					<div class="am_fufen_pet_grzx_ico"><img src="${x.headimgurl}" alt=""></div>
						<div style="height:30px;">
							<div class="am-u-sm-12 am_fufen_recommend">${x.name}(${x.level})</div>
						</div>
					</div>
				</div>
		</c:forEach>
		</div>
	</div>
</div>

</body>

</html>

