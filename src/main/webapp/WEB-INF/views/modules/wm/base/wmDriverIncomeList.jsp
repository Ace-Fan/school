<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>司机收入表列表</title>
	
	<!-- 标准化通用头部 -->
	<%@ include file="/WEB-INF/views/modules/templet/headExport/templetExport.jsp" %>
	
	<!-- 标准化表格页面CSS -->
	<link rel="stylesheet" href="${ctxStatic}/app/list/templetList.css" />
	
</head>
<body>
	
	<!-- 标准化表单隐藏文本 -->
	<%@ include file="/WEB-INF/views/modules/templet/templetHide.jsp" %>
	
	<!-- 收入类型( 1：运费  2：额外费用  3：保证金  4：推广佣金 -->
	<script type="text/html" id="incomeTypeCheck">
	{{#if (d.incomeType == 4) { }}
		<span style="color:green">推广佣金</span> 
	{{# }else if(d.incomeType == 3){ }}
		<span style="color:green">保证金</span>
	{{# }else if(d.incomeType == 2){ }}
		<span style="color:green">额外费用</span> 
	{{# }else if(d.incomeType == 1){ }}
		<span style="color:green">运费</span> 
	{{# } }}
	</script>
	
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
				<div class="layui-inline layui-form selectDiv-input">
		        	<select id="p_incomeType" lay-filter="incomeType" autocomplete="off">
			          	<option value="">收入类型（全部）</option>
			          	<option value="4">推广佣金</option>
			          	<option value="3">保证金</option>
			          	<option value="2">额外费用</option>
			          	<option value="1">运费</option>
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
			form.on('select(incomeType)', function(data) { if (data.value == '') { reloadTable(); } });						// 监听搜索框下拉框选择为ALL时刷新表单
			form.on('submit(demo)', function(data) { reloadTable(); });														// 监听提交按钮
			$('form').find(':reset').click(function() {	 $("#selectDiv")[0].reset(); layui.form.render(); return false; });	// 下拉框表单内容重置
	
			function reloadTable() {
				var incomeType = $("#p_incomeType").val();
				table.reload('templetTable', {
					url : rootUrl + '/list',
					where : {
						incomeType : incomeType
					}
				});
			}
			table.render({
				// toolbar : '#templetHeaderEx',
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
						field : 'userName',
						title : '司机联系电话',
					},
					{
						align : 'center',
						field : 'userBalance',
						title : '司机余额',
					},
					{
						align : 'center',
						field : 'incomeAmount',
						title : '收入金钱'
					},
					{
						align : 'center',
						field : 'incomeType',
						title : '收入类型',
						templet : "#incomeTypeCheck"
					},
					{
						align : 'center',
						field : 'isEnable',
						title : '是否启用',
						templet : "#isEnableCheck"
					},
					{
						align : 'center',
						field : 'createDate',
						title : '创建时间',
					},
					{
						align : 'center',
						title : '操作',
						toolbar : '#templetDemoDl',
					}
				]]
			});
			
		});
	</script>
</body>
</html>