<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>额外费用计算配置列表</title>
	
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
	
	<!-- 是否计费 -->
	<script type="text/html" id="isCalcFeeTmp">
	{{#if (d.isCalcFee == 1) { }}
        <span style="color:red">计费</span>
    {{# }else if(d.isCalcFee == 2){ }}
        <span style="color:green">显示</span>  
    {{# } }}
	</script>
	
	<!-- 是否可输入 -->
	<script type="text/html" id="isInputTmp">
	{{#if (d.isInput == 0) { }}
        <span style="color:red">不可输入</span>
    {{# }else if(d.isInput == 1){ }}
        <span style="color:green">可输入</span>  
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
					<select lay-filter="carId" id="carId">
						<option value="">租车类型（全部）</option>
						<c:forEach var="item" items="${wmLeaseCarTypeList}">
							<option value="${item.id}">${item.carName}</option>
						</c:forEach>
					</select>
				</div>
				
				<div class="layui-inline layui-form selectDiv-input">
		        	<select id="p_isEnable" lay-filter="isEnable" autocomplete="off">
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
	
	<!-- 通用表格容器 -->
	<table id="templetTable" lay-filter="templetTable"></table>
	
	<!-- 搜索JS -->
	<script type="text/javascript">
		layui.use([ 'table', 'form' ], function() {
			var table = layui.table, form = layui.form;		// 声明layui的table，form
			var rootUrl = $("#rootUrl").val();				// 访问业务模块路径
	
			form.render();																									// 表单刷新（防止下拉框外加载）
			form.on('select(isEnable)', function(data) { if (data.value == '') { reloadTable(); } });						// 监听搜索框下拉框选择为ALL时刷新表单
			form.on('select(carId)', function(data) { if (data.value == '') { reloadTable(); } });							// 监听搜索框下拉框选择为ALL时刷新表单
			form.on('submit(demo)', function(data) { reloadTable(); });														// 监听提交按钮
			$('form').find(':reset').click(function() {	 $("#selectDiv")[0].reset(); layui.form.render(); return false; });	// 下拉框表单内容重置
	
			function reloadTable() {
				var carId = $("#carId").val(); 
				var isEnable = $("#p_isEnable").val();
	
				table.reload('templetTable', {
					url : rootUrl + '/list',
					where : {
						carId : carId,
						isEnable : isEnable
					}
				});
			}
			
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
						width : 120
					},
					{
						align : 'center',
						field : 'carTypeName',
						title : '租车类型',
						width : 150
					},
					{
						align : 'center',
						field : 'configName',
						title : '配置名称',
						width : 180
					},
					{
						align : 'center',
						field : 'isCalcFee',
						title : '是否计费',
						width : 125,
						templet : '#isCalcFeeTmp'
					},
					{
						align : 'center',
						field : 'isInput',
						title : '是否可输入',
						width : 125,
						templet : '#isInputTmp'
					},
					{
						align : 'center',
						field : 'calFeeBase',
						title : '计费基准',
						width : 150
					},
					{
						align : 'center',
						field : 'calcFeeRatio',
						title : '计费比例',
						width : 150
					},
					{
						align : 'center',
						field : 'price',
						title : '单价（元）',
						width : 150
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
						field : 'orderNo',
						title : '排序号',
						width : 140
					},
					{
						align : 'center',
						title : '操作',
						width : 200,
						toolbar : '#templetDemo',
					}
				]]
			});
			
		});
	</script>
	
</body>
</html>