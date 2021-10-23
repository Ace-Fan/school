<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>

	<title>行政区划编码管理</title>
	
	<!-- 标准化通用头部 -->
	<%@ include file="/WEB-INF/views/modules/templet/headExport/templetExport.jsp" %>
	
	<link rel="stylesheet" href="${ctxStatic}/layui-selectThree/layui/css/layui.css">
	
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
				<div class="layui-form">
					<div class="layui-form-item" id="area-picker">
						<div class="layui-input-inline">
			                <select id="province" class="province-selector" data-value="请选择省" lay-filter="province-1">
			                    <option value="">请选择省</option>
			                </select>
			            </div>
			            <div class="layui-input-inline">
			                <select id="city" class="city-selector" data-value="请选择市" lay-filter="city-1">
			                    <option value="">请选择市</option>
			                </select>
			            </div>
			            <div class="layui-input-inline">
			                <select id="county" class="county-selector" data-value="请选择区" lay-filter="county-1">
			                    <option value="">请选择区</option>
			                </select>
			            </div>
			            
			            <!-- 标准化表单头部操作页面 -->
						<button class="layui-btn selectDiv-btn" type="button" lay-submit="" lay-filter="demo" style="background-color:#018bed;">
							<i class="layui-icon" style="color:white;">&#xe615;</i><span style="color:white;">搜索</span>
						</button>
			            
					</div>
				</div>
				
			</form>
		</div>
	</div>
	
	<!-- 标准头部搜索JS -->
	<script type="text/javascript">
		var rootUrl = $("#rootUrl").val();
	
		layui.use([ 'table', 'form' ], function() {
			var table = layui.table, form = layui.form;
	
			form.render();
			
			// 监听提交按钮
			form.on('submit(demo)', function(data) {
				reloadTable();
			});
			
			// 重置按钮
			$('form').find(':reset').click(function() {	 
				$("#selectDiv")[0].reset();  
				layui.form.render();
				reloadTable();
				return false; 
			});	
			
	
			function reloadTable() {
				var province = $("#province").val();
				var city = $("#city").val();
				var county = $("#county").val();
				
				if (province != '请选择省') {
					table.reload('templetTable', {
						url : rootUrl + '/list',
						where : {
							city : city,
							county : county
						}
					});
				} else {
					table.reload('templetTable', {
						url : rootUrl + '/list',
						where : {
							city : '',
							county : ''
						}
					});
				}													// 监听提交按钮
			}
			
		});
	</script>
	
	<!-- 通用表格容器 -->
	<table id="templetTable" lay-filter="templetTable" />
	
	<!-- 模板TableJs -->
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
						field : 'code',
						title : '行政区划编码',
						width : 160
					},
					{
						align : 'center',
						field : 'name',
						title : '行政区划名称',
						width : 260
					}, 
					{
						align : 'center',
	                    field : 'currLevel',
	                    title : '当前级别',
	                    width : 100
	                }, 
	                {
	                	align : 'center',
	                    field : 'statisticsCode',
	                    title : '统计编码',
	                    width : 160
	                }, 
	                {
	                	align : 'center',
	                    field : 'spellFull',
	                    title : '拼音全码',
	                    width : 295
	                }, 
	                {
	                	align : 'center',
	                    field : 'spellShort',
	                    title : '拼音简码',
	                    width : 150
	                },
	                {
	                	align : 'center',
	                    field : 'shortCode',
	                    title : '助记码',
	                    width : 120
	                }, 
	                {
	                	align : 'center',
	                    field : 'parentCode',
	                    title : '父级编码',
	                    width : 120
	                }, 
					{
						align : 'center',
						field : 'isEnable',
						title : '是否启用',
						templet : "#isEnableCheck",
						width : 120
					},
					{
						align : 'center',
						field : 'createDate',
						title : '创建时间',
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
	
	<!-- 三级联动 -->
	<%@ include file="/WEB-INF/views/modules/templet/form/templetThreeArea.jsp" %>
	
</body>
</html>