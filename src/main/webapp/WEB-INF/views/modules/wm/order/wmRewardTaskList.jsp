<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>悬赏任务管理列表</title>
	
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
	
	<script type="text/html" id="payStatuTmp">
	{{#if (d.payStatu == 1) { }}
    	<span style="color:blue;">待支付</span>
    {{# }else if(d.payStatu == 2){ }}
        <span style="color:green;">成功支付</span>
	{{# }else if(d.payStatu == 3){ }}
        <span style="color:red">支付失败</span> 
    {{# } }}
	</script>
	
	<!-- 模板-头部搜索DIV -->
	<div style="margin-left: 1rem;">
		<div class="layui-inline" style="margin-top: 0.5rem;">
			<form id="selectDiv">
				
				<div class="layui-inline layui-form selectDiv-input">
					<input type="text" placeholder="请输入订单号" id="orderno" autocomplete="off" class="layui-input" maxlength="11" >
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
				var orderno = $("#orderno").val(); 
	
				table.reload('templetTable', {
					url : rootUrl + '/list',
					where : {
						ordernos : orderno
					}
				});
			}
			
			table.render({
				toolbar : '#templetHeaderDl',
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
						field : 'userName',
						title : '用户',
						width : 150
					},
					{
						align : 'center',
						field : 'taskDesc',
						title : '任务描述',
						width : 150
					},
					{
						align : 'center',
						field : 'startTime',
						title : '预计出发时间',
						width : 180
					},
					{
						align : 'center',
						field : 'taskShortAddr',
						title : '任务执行短地址',
						width : 200
					},
					{
						align : 'center',
						field : 'taskAddr',
						title : '任务执行详细地址',
						width : 300
					},
					{
						align : 'center',
						field : 'relation',
						title : '联系人',
						width : 150
					},
					{
						align : 'center',
						field : 'relationTel',
						title : '联系电话',
						width : 150,
						hide  : true
					},
					{
						align : 'center',
						field : 'ordernos',
						title : '订单号',
						width : 240
					},
					{
						align : 'center',
						field : 'fee',
						title : '悬赏金额(元)',
						width : 145
					},
					{
						align : 'center',
						field : 'payStatu',
						title : '支付状态',
						width : 120,
						templet : '#payStatuTmp'
					},
					{
						align : 'center',
						field : 'payTime',
						title : '支付时间',
						width : 180
					},
					{
						align : 'center',
						field : 'isEnable',
						title : '是否启用',
						width : 150,
						templet : "#isEnableCheck",
						hide  : true
					},
					{
						align : 'center',
						field : 'createDate',
						title : '创建时间',
						hide  : true,
						width : 180,
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