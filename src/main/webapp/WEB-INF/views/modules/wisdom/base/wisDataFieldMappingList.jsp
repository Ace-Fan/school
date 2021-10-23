<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>导入字段映射配置列表</title>
	
	<!-- 标准化通用头部 -->
	<%@ include file="/WEB-INF/views/modules/templet/headExport/templetExport.jsp" %>
	
	<!-- 标准化表格页面CSS -->
	<link rel="stylesheet" href="${ctxStatic}/app/list/templetList.css" />
	
</head>
<body>
	
	<!-- 标准化表单隐藏文本 -->
	<%@ include file="/WEB-INF/views/modules/templet/templetHide.jsp" %>
	
	<!-- 引入标准化表格头部工具栏页面 -->
	<%@ include file="/WEB-INF/views/modules/templet/list/templetHeader.jsp" %>
	
	<!-- 引入标准化表格操作页面 -->
	<%@ include file="/WEB-INF/views/modules/templet/list/templetDemo.jsp" %>
	
	<!-- 启用状态切换 -->
	<script type="text/html" id="isImportDemo">
		{{#if (d.isImport == 1) { }}
			<span>需导入</span>
    	{{# }else if(d.isImport == 0){ }}
			<span>无需导入</span>
   	 	{{# } }}
	</script>
	
	<!-- 启用状态切换 -->
	<script type="text/html" id="isNullableDemo">
		{{#if (d.isNullable == "yes") { }}
			<span style="color:green;">可为空</span>
    	{{# }else if(d.isNullable == "no"){ }}
			<span style="color:red;">不可为空</span>
   	 	{{# } }}
	</script>
	
	<!-- 模板-头部搜索DIV -->
	<div style="margin-left: 1rem;">
		<div class="layui-inline" style="margin-top: 0.5rem;">
			<form id="selectDiv">
				
				<!-- 建议反馈编号  -->
				<div class="layui-inline layui-form selectDiv-input">
					<select lay-filter="tabName" id="tabName" autocomplete="off" lay-search>
						<option value="">请选择数据表名称</option>
						<c:forEach var="item" items="${tabList}">
							<option value="${item.tableVal}">${item.tabName}</option>
						</c:forEach>
					</select>
				</div>
				
				<!-- 重置按钮 -->
			    <button type="reset" class="layui-btn selectDiv-btn" style="background-color:#ff8100;">
					<i class="layui-icon" style="color:white;">&#xe60a;</i><span style="color:white;">重置</span>
				</button>
			</form>
		</div>
	</div>
	
	<!-- 通用表格容器 -->
	<table id="templetTable" lay-filter="templetTable"></table>
	
	<!-- 模板TableJs -->
	<script>
		var rootUrl =  $("#rootUrl").val();
		
		layui.use(['table','layer','form'], function() {
			var table = layui.table, layer = layui.layer, form = layui.form;
			var fileData = [];						// 声明表格数据信息
			
			function renderTable(fileData) {
				// 默认初始化
				table.render({
					toolbar : '#templetHeaderEx',
					elem : '#templetTable',
					// url  :  rootUrl + '/list',
					data : fileData,
					page : true,
					id 	 : "templetTable",
					cols : [ [
						{
							align : 'center',
							type: 'checkbox',
						},
						{
							align : 'center',
							// field : 'id',
							type  : 'numbers',
							title : '序号',
							width : 85
						},
						{
							align : 'center',
							field : 'fieldName',
							title : '字段名称',
							width : 150
						},
						{
							align : 'center',
							field : 'fieldComment',
							title : '字段说明',
							width : 200
						},
						{
							align : 'center',
							field : 'fieldType',
							title : '字段类型',
							width : 140
						},
						{
							align : 'center',
							field : 'isNullable',
							title : '可为空',
							templet : "#isNullableDemo",
							width : 80
						},
						{
							align : 'center',
							field : 'isImport',
							title : '需导入',
							templet : "#isImportDemo",
							width : 80
						},
						{
							align : 'center',
							field : 'columnDefault',
							title : '默认值',
							width : 90
						},
						{
							align : 'center',
							field : 'excelColumnName',
							title : 'excel列名',
							width : 130
						},
						{
							align : 'center',
							field : 'excelColumnNo',
							title : 'excel列序',
							width : 100
						},
						{
							align : 'center',
							field : 'dataTabName',
							title : '所属数据表',
							width : 180
						},
						{
							align : 'center',
							field : 'createDate',
							title : '创建时间',
							width : 200
							// hide  : true
						},
						{
							align : 'center',
							title : '操作',
							width : 200,
							toolbar : '#templetDemo',
						}
					]]
				});
			}
			
			$('form').find(':reset').click(function() {
				$("#selectDiv")[0].reset();
				layui.form.render();
				
				var fileData = [];
				renderTable(fileData)
			});
			
			form.on('select(tabName)', function(data){
				
				if (data.value != '') {
					var data = data.value;					// 封装表数据
					var id = data.split(",")[0];			// 选定主表主键
					var tableCode = data.split(",")[1];		// 选定主表英文名
					
					console.log(id);
				
					$.ajax({
						type : 'POST',
						url  : '${ctx}/wisdom/base/wisDataFieldMapping/getList',
						data : { 'id' : id },
						success : function(result) {
							var obj = eval('('+result+')');
							fileData = obj.data;
							renderTable(fileData);
						}
					});
					
				} else {
					fileData = [];
					renderTable(fileData);
				}
				
			});
			
			renderTable(fileData);
			
		})
	</script>
	
</body>
</html>