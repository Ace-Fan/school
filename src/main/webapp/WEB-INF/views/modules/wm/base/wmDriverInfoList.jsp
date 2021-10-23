<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>司机信息管理列表</title>
	
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
	
	<!-- 所属品牌（ 0:自营品牌 1:第三方品牌 ) -->
	<script type="text/html" id="authStatusTmp">
	{{#if (d.authStatus == 3) { }}
		<span style="color:red">未认证</span> 
	{{# }else if(d.authStatus == 1){ }}
		<span style="color:green">认证中</span> 
	{{# }else if(d.authStatus == 2){ }}
		<span style="color:blue">已认证</span>   
	{{# } }}
	</script>
	
	<!-- 引入标准化图片弹窗 -->
	<%@ include file="/WEB-INF/views/modules/templet/showTempletImage.jsp" %>
	
	<!-- 引入标准化表格头部工具栏页面 -->
	<%@ include file="/WEB-INF/views/modules/templet/list/templetHeader.jsp" %>
	
	<!-- 引入标准化表格操作页面 -->
	<%@ include file="/WEB-INF/views/modules/templet/list/templetDemo.jsp" %>
	
	<!-- 模板-头部搜索DIV -->
	<div style="margin-left: 1rem;">
		<div class="layui-inline" style="margin-top: 0.5rem;">
			<form id="selectDiv">
				
				<div class="layui-inline layui-form selectDiv-input">
					<input type="text" placeholder="请输入司机真实姓名" id="trueName" autocomplete="off" class="layui-input" maxlength="10" >
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
				var trueName = $("#trueName").val(); 
				var isEnable = $("#p_isEnable").val();
	
				table.reload('templetTable', {
					url : rootUrl + '/list',
					where : {
						trueName : trueName,
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
						field : 'trueName',
						title : '司机真实姓名',
						width : 120
					},
					{
						align : 'center',
						field : 'nickName',
						title : '司机昵称',
						width : 120
					},
					{
						align : 'center',
						field : 'phone',
						title : '联系电话',
						width : 120
					},
					{
						align : 'center',
						field : 'openid',
						title : 'openid',
						width : 120
					},
					{
						align : 'center',
						field : 'loginName',
						title : '登录账户',
						width : 150,
						hide  : true
					},
					{
						align : 'center',
						field : 'province',
						title : '所在省',
						width : 140
					},
					{
						align : 'center',
						field : 'city',
						title : '所在市',
						width : 140
					},
					{
						align : 'center',
						field : 'country',
						title : '所在区县',
						width : 140
					},
					{
						align : 'center',
						field : 'authStatus',
						title : '认证状态',
						templet : "#authStatusTmp",
						width : 145,
					},
					{
						align : 'center',
						field : 'isEnable',
						title : '是否启用',
						width : 120,
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