<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>数据导入配置列表</title>
	
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
	
	<!-- 模板-头部搜索DIV -->
	<div style="margin-left: 1rem;">
		<div class="layui-inline" style="margin-top: 0.5rem;">
			<form id="selectDiv">
				
				<!-- 数据表名  -->
				<div class="layui-inline layui-form selectDiv-input">
					<input type="text" placeholder="请输入数据表名" id="tabName" autocomplete="off" class="layui-input" maxlength="32" >
				</div>
				
				<!-- 检查结果名称  -->
				<div class="layui-inline layui-form selectDiv-input">
					<input type="text" placeholder="请输入数据表编码" id="tableCode" autocomplete="off" class="layui-input" maxlength="32" >
				</div>
				
				<!-- 启用类型 -->
				<div class="layui-inline layui-form selectDiv-input">
		        	<select id="isEnable" lay-filter="isEnable" autocomplete="off">
			          	<option value="">启用状态（全部）</option>
			          	<option value="1">启用</option>
			          	<option value="0">禁用</option>
		          	</select>
			    </div>
				
			    <!-- 引入标准化表单操作页面 -->
				<%@ include file="/WEB-INF/views/modules/templet/list/templetSelectSeacher.jsp" %>
			</form>
		</div>
	</div>
	
	<!-- 标准头部搜索JS -->
	<script type="text/javascript">
		var rootUrl = $("#rootUrl").val();
	
		layui.use([ 'table', 'form' ], function() {
			var table = layui.table, form = layui.form;
	
			form.render();
			form.on('select(p_isEnable)', function(data) { if (data.value == '') { reloadTable(); } });						// 监听搜索框下拉框选择为ALL时刷新表单
			form.on('submit(demo)', function(data) { reloadTable(); });														// 监听提交按钮
			$('form').find(':reset').click(function() {	 $("#selectDiv")[0].reset(); layui.form.render(); return false; });	// 下拉框表单内容重置
	
			function reloadTable() {
				var tabName = $("#tabName").val();			// 执法人员名称
				var tableCode = $("#tableCode").val();		// 执法人员名称
				var isEnable = $("#isEnable").val(); 		// 执法人员电话
	
				table.reload('templetTable', {
					url : rootUrl + '/list',
					where : {
						tabName : tabName,
						tableCode : tableCode,
						isEnable : isEnable
					}
				});
			}
		});
	</script>
	
	<!-- 通用表格容器 -->
	<table id="templetTable" lay-filter="templetTable"></table>
	
	<!-- 模板TableJs -->
	<script>
		var rootUrl =  $("#rootUrl").val();
		
		layui.use('table', function() {
			var table = layui.table;
			
			table.render({
				toolbar : '#templetHeader',
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
						field : 'tabName',
						title : '数据表名称',
						width : 250
					},
					{
						align : 'center',
						field : 'tableCode',
						title : '数据表编码',
						width : 250
					},
					{
						align : 'center',
						field : 'fileName',
						title : 'EXCEL文件名',
						width : 300
					},
					{
						align : 'center',
						field : 'fileUrl',
						title : '文件路径',
						width : 502
					},
					{
						align : 'center',
						field : 'createDate',
						title : '创建时间',
						hide  : true
					},
					{
						align : 'center',
						field : 'isEnable',
						title : '是否启用',
						templet : "#isEnableCheck",
						width : 140
					},
					{
						align : 'center',
						title : '操作',
						width : 200,
						toolbar : '#templetDemo'
					}
				]]
			});
		})
	</script>
	
</body>
</html>