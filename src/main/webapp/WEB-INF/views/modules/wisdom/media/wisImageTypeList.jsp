<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>图片资源分类管理管理</title>
	
	<!-- 标准化通用头部 -->
	<%@ include file="/WEB-INF/views/modules/templet/headExport/templetExport.jsp" %>
	
	<!-- 标准化表格页面CSS -->
	<link rel="stylesheet" href="${ctxStatic}/app/list/templetList.css" />
	
</head>
<body>

	<!-- 标准化表单隐藏文本 -->
	<%@ include file="/WEB-INF/views/modules/templet/templetHide.jsp" %>
	
	<!-- 切换组件 -->
	<%@ include file="/WEB-INF/views/modules/templet/toggle/templetIsEnable.jsp" %>
	
	<!-- 引入标准化表格头部工具栏页面 -->
	<%@ include file="/WEB-INF/views/modules/templet/list/templetHeader.jsp" %>
	
	<!-- 引入标准化表格操作页面 -->
	<%@ include file="/WEB-INF/views/modules/templet/list/templetDemo.jsp" %>
	
	<!-- 搜索DIV -->
	<div style="margin-left: 1rem;">
		<div class="layui-inline" style="margin-top: 0.5rem;">
			<form id="selectDiv">
				<div class="layui-inline layui-form selectDiv-input">
					<input type="text" placeholder="请输入分类编码" id="typeCode" autocomplete="off" class="layui-input" maxlength="10" >
				</div>
				
				<div class="layui-inline layui-form selectDiv-input">
					<input type="text" placeholder="请输入分类名称" id="typeName" autocomplete="off" class="layui-input" maxlength="11" >
				</div>
				
				<div class="layui-inline layui-form selectDiv-input">
					<input type="text" placeholder="请输入图片资源宽度" id="imgWidth" autocomplete="off" class="layui-input" maxlength="11" >
				</div>
				
				<div class="layui-inline layui-form selectDiv-input">
					<input type="text" placeholder="请输入图片资源高度" id="imgHeight" autocomplete="off" class="layui-input" maxlength="11" >
				</div>
				
				<div class="layui-inline layui-form selectDiv-input">
					<input type="text" placeholder="请输入图片资源格式" id="imgFormat" autocomplete="off" class="layui-input" maxlength="11" >
				</div>
				
				<div class="layui-inline layui-form selectDiv-input">
		        	<select id="p_isEnable" lay-filter="isEnable" autocomplete="off">
			          	<option value="">启用状态（全部）</option>
			          	<option value="1">启用</option>
			          	<option value="0">禁用</option>
		          	</select>
			    </div>
				
				<%@ include file="/WEB-INF/views/modules/templet/list/templetSelectSeacher.jsp" %>
			</form>
		</div>
	</div>
	
	<!-- 搜索JS -->
	<script type="text/javascript">
		layui.use([ 'table', 'form' ], function() {
			var table = layui.table, form = layui.form;		// 声明layui的table，form
			var rootUrl = $("#rootUrl").val();				// 访问业务模块路径
	
			form.render();																									// 表单刷新（防止下拉框外加载）
			form.on('select(isEnable)', function(data) { if (data.value == '') { reloadTable(); } });						// 监听搜索框下拉框选择为ALL时刷新表单
			form.on('submit(demo)', function(data) { reloadTable(); });														// 监听提交按钮
			$('form').find(':reset').click(function() {	 $("#selectDiv")[0].reset(); layui.form.render(); return false; });	// 下拉框表单内容重置
	
			function reloadTable() {
				var typeCode = $("#typeCode").val(); 
				var typeName = $("#typeName").val(); 
				var imgWidth = $("#imgWidth").val();
				var imgHeight = $("#imgHeight").val();
				var imgFormat = $("#imgFormat").val();
				var isEnable = $("#p_isEnable").val();
	
				table.reload('templetTable', {
					url : rootUrl + '/list',
					where : {
						typeCode : typeCode,
						typeName : typeName,
						imgWidth : imgWidth,
						imgHeight : imgHeight, 
						imgFormat : imgFormat,
						isEnable : isEnable
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
					},
					{
						align : 'center',
						field : 'typeCode',
						title : '分类编码',
					},
					{
						align : 'center',
						field : 'typeName',
						title : '分类名称',
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
						width : 150,
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