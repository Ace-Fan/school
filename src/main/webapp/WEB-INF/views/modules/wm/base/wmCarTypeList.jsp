<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>租车类型管理列表</title>
	
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
	
	<!-- 引入标准化图片弹窗 -->
	<%@ include file="/WEB-INF/views/modules/templet/showTempletImage.jsp" %>
	
	<!-- 引入标准化表格头部工具栏页面 -->
	<%@ include file="/WEB-INF/views/modules/templet/list/templetHeader.jsp" %>
	
	<!-- 引入标准化表格操作页面 -->
	<%@ include file="/WEB-INF/views/modules/templet/list/templetDemo.jsp" %>
	
	<!-- 图片预览 -->
	<script type="text/html" id="imgTmp">
		{{#if (d.img != null && d.img != '') { }}
			<img src="{{d.img}}" onclick="showTempletImage('{{d.img}}');" style="width:3rem; height:3rem;">
		{{# } }}
	</script>
	
	<!-- 模板-头部搜索DIV -->
	<div style="margin-left: 1rem;">
		<div class="layui-inline" style="margin-top: 0.5rem;">
			<form id="selectDiv">
				
				<div class="layui-inline layui-form selectDiv-input">
					<input type="text" placeholder="请输入车型编码" id="carCode" autocomplete="off" class="layui-input" maxlength="10" >
				</div>
				
				<div class="layui-inline layui-form selectDiv-input">
					<input type="text" placeholder="请输入车型名称" id="carName" autocomplete="off" class="layui-input" maxlength="11" >
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
				var carCode = $("#carCode").val(); 
				var carName = $("#carName").val(); 
				var isEnable = $("#p_isEnable").val();
	
				table.reload('templetTable', {
					url : rootUrl + '/list',
					where : {
						carCode : carCode,
						carName : carName,
						isEnable : isEnable
					}
				});
			}
		});
	</script>
	
	<!-- 通用表格容器 -->
	<table id="templetTable" lay-filter="templetTable"></table>
	
	<!-- 表格JS -->
	<script>
		var rootUrl =  $("#rootUrl").val();
		
		layui.use('table', function() {
			var table = layui.table;
			
			table.render({
				toolbar : '#templetHeaderEx',
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
						width : 90
					},
					{
						align : 'center',
						field : 'carCode',
						title : '车型编码',
						width : 90
					},
					{
						align : 'center',
						field : 'carName',
						title : '车型名称',
						width : 120
					},
					{
						align : 'center',
						field : 'loadWeight',
						title : '载重（吨）',
						width : 100
					},
					{
						align : 'center',
						field : 'length',
						title : '长度（米）',
						width : 100
					},
					{
						align : 'center',
						field : 'width',
						title : '宽度（米）',
						width : 100
					},
					{
						align : 'center',
						field : 'height',
						title : '高度（米）',
						width : 100
					},
					{
						align : 'center',
						field : 'lwh',
						title : '长宽高（米）',
						width : 120
					},
					{
						align : 'center',
						field : 'volume',
						title : '容积（方）',
						width : 100
					},
					{
						align : 'center',
						field : 'img',
						title : '图片预览',
						width : 183,
						templet : "#imgTmp"
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
						field : 'orderNo',
						width : 150,
						title : '排序号',
						hide  : true
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