<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>建议反馈管理列表</title>
	
	<!-- 标准化通用头部 -->
	<%@ include file="/WEB-INF/views/modules/templet/headExport/templetExport.jsp" %>
	
	<!-- 标准化表格页面CSS -->
	<link rel="stylesheet" href="${ctxStatic}/app/list/templetList.css" />
	
</head>
<body>
	
	<!-- 标准化表单隐藏文本 -->
	<%@ include file="/WEB-INF/views/modules/templet/templetHide.jsp" %>
	
	<!-- 引入标准化图片弹窗 -->
	<%@ include file="/WEB-INF/views/modules/templet/showTempletImage.jsp" %>
	
	<!-- 切换组件 -->
	<%@ include file="/WEB-INF/views/modules/templet/toggle/templetIsEnable.jsp" %>
	
	<!-- 图片预览 -->
	<script type="text/html" id="imgPathTmp">
		{{#if (d.imgPath != null && d.imgPath != '') { }}
			{{#for (var i = 0; i < d.imgPath.split(',').length; i++) { }}
				<img src="${imgServerPath}{{d.imgPath.split(',')[i]}}" onclick="showTempletImage('${imgServerPath}{{d.imgPath.split(',')[i]}}');" 
					style="width:3rem;">
			{{# } }}
   	 	{{# } }}
	</script>
	
	<!-- 引入标准化表格头部工具栏页面 -->
	<%@ include file="/WEB-INF/views/modules/templet/list/templetHeader.jsp" %>
	
	<!-- 引入标准化表格操作页面 -->
	<%@ include file="/WEB-INF/views/modules/templet/list/templetDemo.jsp" %>
	
	<!-- 模板-头部搜索DIV -->
	<div style="margin-left: 1rem;">
		<div class="layui-inline" style="margin-top: 0.5rem;">
			<form id="selectDiv">
				
				<div class="layui-inline layui-form selectDiv-input">
					<input type="text" placeholder="请输入订单号" id="orderId" autocomplete="off" class="layui-input" maxlength="11" >
				</div>
				
			    <!-- 引入标准化表单操作页面 -->
				<%@ include file="/WEB-INF/views/modules/templet/list/templetSelectSeacher.jsp" %>
			</form>
		</div>
	</div>
	
	<!-- 通用表格容器 -->
	<table id="templetTable" lay-filter="templetTable"></table>
	
	<!-- 搜索JS -->
	<script type="text/javascript">
		layui.use([ 'table', 'form' ], function() {
			var table = layui.table, form = layui.form;		// 声明layui的table，form
			var rootUrl = $("#rootUrl").val();				// 访问业务模块路径
	
			form.render();																									// 表单刷新（防止下拉框外加载）
			form.on('submit(demo)', function(data) { reloadTable(); });														// 监听提交按钮
			$('form').find(':reset').click(function() {	 $("#selectDiv")[0].reset(); layui.form.render(); return false; });	// 下拉框表单内容重置
	
			function reloadTable() {
				var orderId = $("#orderId").val(); 
	
				table.reload('templetTable', {
					url : rootUrl + '/list',
					where : {
						orderId : orderId
					}
				});
			}
			
			table.render({
				/* toolbar : '#templetTableHeader', */
				toolbar : true,
				elem : '#templetTable',
				url  :  rootUrl + '/list',
				page : true,
				id 	 : "templetTable",
				cols : [ [
					{
						align : 'center',
						type: 'checkbox',
					},
					{
						align : 'center',
						field : 'id',
						title : '编号',
						width : 120
					},
					{
						align : 'center',
						field : 'orderId',
						title : '订单号',
						width : 250
					},
					{
						align : 'center',
						field : 'content',
						title : '建议反馈内容',
						width : 750
					},
					{
						align : 'center',
						field : 'imgPath',
						title : '图片预览',
						templet : '#imgPathTmp',
						width : 525
					},
					{
						align : 'center',
						title : '操作',
						width : 200,
						hide : true,
						toolbar : '#templetDemo',
					}
				]]
			});
			
		});
	</script>
	
</body>
</html>