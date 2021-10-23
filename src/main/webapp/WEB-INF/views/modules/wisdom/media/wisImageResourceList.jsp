<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>

	<title>图片资源管理管理</title>
	
	<!-- 标准化通用头部 -->
	<%@ include file="/WEB-INF/views/modules/templet/headExport/templetExport.jsp" %>
	
	<!-- 标准化表格页面CSS -->
	<link rel="stylesheet" href="${ctxStatic}/app/list/templetList.css" />
	
</head>
<body>
	
	<!-- 标准化表单隐藏文本 -->
	<%@ include file="/WEB-INF/views/modules/templet/templetHide.jsp" %>
	
	<!-- 图片预览 -->
	<script type="text/html" id="imgUrlTmp">
		{{#if (d.imgUrl != null) { }}
			<img src="${imgServerPath}{{d.imgUrl}}" onclick="showTempletImage('${imgServerPath}{{d.imgUrl}}');" style="width:3rem; height:3rem;">
		{{# } }}
	</script>
	
	<!-- 切换组件 -->
	<%@ include file="/WEB-INF/views/modules/templet/toggle/templetIsEnable.jsp" %>
	
	<!-- 引入标准化图片弹窗 -->
	<%@ include file="/WEB-INF/views/modules/templet/showTempletImage.jsp" %>
	
	<!-- 引入标准化表格头部工具栏页面 -->
	<%@ include file="/WEB-INF/views/modules/templet/list/templetHeader.jsp" %>
	
	<!-- 引入标准化表格操作页面 -->
	<%@ include file="/WEB-INF/views/modules/templet/list/templetDemo.jsp" %>
	
	<!-- 模板-头部搜索DIV -->
	<div style="margin-left: 1rem;">
		<div class="layui-inline" style="margin-top: 0.5rem;">
			<form id="selectDiv">
				<div class="layui-inline layui-form selectDiv-input">
					<input type="text" placeholder="请输入图片名称" id="imgName" autocomplete="off" class="layui-input" maxlength="10" >
				</div>
				
				<%@ include file="/WEB-INF/views/modules/templet/list/templetSelectSeacher.jsp" %>
			</form>
		</div>
	</div>
	
	<!-- 图片资源搜索JS -->
	<script type="text/javascript">
		layui.use([ 'table', 'form' ], function() {
			var table = layui.table, form = layui.form;		// 声明layui的table，form
			var rootUrl = $("#rootUrl").val();				// 访问业务模块路径
	
			form.render();																									// 表单刷新（防止下拉框外加载）
			form.on('submit(demo)', function(data) { reloadTable(); });														// 监听提交按钮
			$('form').find(':reset').click(function() {	 $("#selectDiv")[0].reset(); layui.form.render(); return false; });	// 下拉框表单内容重置
			
			function reloadTable() {
				var imgName = $("#imgName").val();			// 图片名称
	
				table.reload('templetTable', {
					url : rootUrl + '/list',
					where : {
						imgName : imgName
					}
				});
			}
		});
	</script>
	
	<!-- 通用表格容器 -->
	<table id="templetTable" lay-filter="templetTable" />
	
	<!-- 表格JS -->
	<script>
		var rootUrl =  $("#rootUrl").val();
		
		layui.use('table', function() {
			var table = layui.table;
			
			table.render({
				toolbar : '#templetTableHeader',
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
						width : 100
					},
					{
						align : 'center',
						field : 'imgName',
						title : '图片名称',
					},
					{
						align : 'center',
						title : '图片预览',
						templet : "#imgUrlTmp",
					},
					{
						align : 'center',
						field : 'typeName',
						title : '图片所属类别',
					},
					{
						align : 'center',
						field : 'imgWidth',
						title : '图片宽度',
					},
					{
						align : 'center',
						field : 'imgHeight',
						title : '图片高度',
					},
					{
						align : 'center',
						field : 'imgFormat',
						title : '图片格式',
					},
					{
						align : 'center',
						field : 'isEnable',
						title : '是否启用',
						width : 120,
						templet : "#isEnableCheck"
					},
					{
						align : 'center',
						field : 'createDate',
						title : '创建时间',
						width : 180,
					},
					{
						align : 'center',
						field : 'updateDate',
						title : '更新时间',
						width : 180,
						hide  : true
					},
					{
						align : 'center',
						title : '操作',
						width : 200,
						toolbar : '#templetDemo',
					}
				]]
			});
		})
	</script>
	
</body>
</html>