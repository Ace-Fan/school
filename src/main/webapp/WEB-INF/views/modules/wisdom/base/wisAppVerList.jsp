<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>版本信息列表</title>
	
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
	
	<script type="text/html" id="fileUrlTmp">
	{{#if (d.fileUrl != null) { }}
		{{#if (d.fileUrl.length > 60) { }}
			<a href="#" title="{{d.fileUrl}}">{{d.fileUrl.substring(0,60)}}...</a>
		{{# } else { }}
			<a href="#" title="{{d.fileUrl}}">{{d.fileUrl}}</a>
		{{# } }}
    {{# } }}
	</script>
	
	<!-- 模板-头部搜索DIV -->
	<div style="margin-left: 1rem;">
		<div class="layui-inline" style="margin-top: 0.5rem;">
			<form id="selectDiv">
				
				<!-- 应用名称  -->
				<div class="layui-inline layui-form selectDiv-input">
					<input type="text" placeholder="请输入应用名称" id="appName" autocomplete="off" class="layui-input" maxlength="32" >
				</div>
				
				<!-- 应用名称  -->
				<div class="layui-inline layui-form selectDiv-input">
					<input type="text" placeholder="请输入版本号" id="appVer" autocomplete="off" class="layui-input" maxlength="32" >
				</div>
				
				<!-- 应用名称  -->
				<div class="layui-inline layui-form selectDiv-input">
					<input type="text" placeholder="请输入文件名称" id="fileName" autocomplete="off" class="layui-input" maxlength="32" >
				</div>
				
				<!-- 启用类型 -->
				<div class="layui-inline layui-form selectDiv-input">
		        	<select id="isEnable" lay-filter="isEnable" autocomplete="off">
			          	<option value="">请选择启用类型</option>
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
			
			/* 监听计量单位选择为启动状态的请选择XX时刷新表单 */
			form.on('select(isEnable)', function(data) {
				var isEnable = $("#isEnable").val();

				if (isEnable == '') {
					reloadTable();
				}
			});
			
			// 监听提交按钮
			form.on('submit(demo)', function(data) {
				reloadTable();
			});
	
			// 监听重置按钮
			$('form').find(':reset').click(function() {
				$("#selectDiv")[0].reset();
				layui.form.render();
				return false;
			});
	
			function reloadTable() {
				var appName = $("#appName").val();			// app名称
				var isEnable = $("#isEnable").val(); 		// 启用状态
				var appVer = $("#appVer").val(); 			// app版本
				var fileName = $("#fileName").val(); 		// 文件名称
	
				table.reload('templetTable', {
					url : rootUrl + '/list',
					where : {
						appName : appName,
						appVer  : appVer,
						fileName : fileName,
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
						field : 'appName',
						title : '应用名称',
						width : 200
					},
					{
						align : 'center',
						field : 'appType',
						title : '应用类型',
						width : 150
					},
					{
						align : 'center',
						field : 'appVer',
						title : '版本号',
						width : 150
					},
					{
						align : 'center',
						field : 'fileName',
						title : '文件名称',
						width : 320
					},
					{
						align : 'center',
						field : 'fileUrl',
						title : '文件路径',
						templet : '#fileUrlTmp',
						width : 480
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
						field : 'createDate',
						title : '创建时间',
						width : 180,
						hide  : true
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
	
	<!-- EXCEL导入JS -->
	<%@ include file="/WEB-INF/views/modules/templet/list/templetExcelImport.jsp" %>
	
</body>
</html>