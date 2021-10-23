<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>用户操作日志列表</title>
	
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
	
	<script type="text/html" id="operateTypeTmp">
	{{#if (d.operateType == 1) { }}
		<span>推广佣金</span> 
	{{# }else if(d.operateType == 2){ }}
		<span>退款返回</span> 
	{{# }else if(d.operateType == 3){ }}
		<span>提现</span> 
	{{# } }}
	</script>
	
	<!-- 引入标准化表格操作页面 -->
	<%@ include file="/WEB-INF/views/modules/templet/list/templetDemo.jsp" %>
	
	<!-- 模板-头部搜索DIV -->
	<div style="margin-left: 1rem;">
		<div class="layui-inline" style="margin-top: 0.5rem;">
			<form id="selectDiv">
				
				<div class="layui-inline layui-form selectDiv-input">
					<select lay-filter="userId" id="userId" autocomplete="off" lay-search>
						<option value="">请选择联系电话</option>
						<c:forEach var="item" items="${userList}">
							<option value="${item.id}">${item.phone}</option>
						</c:forEach>
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
			form.on('select(userId)', function(data) { if (data.value == '') { reloadTable(); } });							// 监听搜索框下拉框选择为ALL时刷新表单
			form.on('submit(demo)', function(data) { reloadTable(); });														// 监听提交按钮
			$('form').find(':reset').click(function() {	 $("#selectDiv")[0].reset(); layui.form.render(); return false; });	// 下拉框表单内容重置
	
			function reloadTable() {
				var userId = $("#userId").val();
				table.reload('templetTable', {
					url : rootUrl + '/list',
					where : {
						userId : userId
					}
				});
			}
			table.render({
				toolbar : true,
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
						title : '联系电话',
					},
					{
						align : 'center',
						field : 'operateType',
						title : '操作类型',
						templet : "#operateTypeTmp"
					},
					{
						align : 'center',
						field : 'operateAmount',
						title : '操作金额',
					},
					{
						align : 'center',
						field : 'createDate',
						title : '创建时间',
					},
					{
						align : 'center',
						title : '操作',
						toolbar : '#templetDemo',
						hide : true
					}
				]]
			});
			
		});
	</script>
	
</body>
</html>