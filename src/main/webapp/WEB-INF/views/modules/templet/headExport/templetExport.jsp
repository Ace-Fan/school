<%@ page contentType="text/html;charset=UTF-8"%>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="${ctxStatic}/layui/css/layui.css" />
<link rel="stylesheet" href="${ctxStatic}/mechunion/css/common.css" />
<script src="${ctxStatic}/layui/layui.js"></script>
<script src="${ctxStatic}/jquery/jquery-1.9.1.js"></script>

<!-- 全局默认设置 -->
<script type="text/javascript">
	$(function() {
		if ('${is}' == "show") {//查看时全局禁用	
			$("#dis").css("pointer-events", "none");
		}
	});
	
	function rtShowList(rootUrl) {
		window.location.href= rootUrl + "/show";
	}
</script>