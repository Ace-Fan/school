<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>用户信息列表</title>
	
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
	<script type="text/html" id="headerImgTmp">
		{{#if (d.headerImg != null && d.headerImg != '') { }}
			{{#if (d.headerImg.indexOf('http')!=-1) { }}
				<img src="{{d.headerImg}}" onclick="showTempletImage('{{d.headerImg}}');" style="width: 3rem; height: 3rem;">
			{{# } else { }}
				<img src="${imgServerPath}{{d.headerImg}}" onclick="showTempletImage('${imgServerPath}{{d.headerImg}}');" style="width: 3rem; height: 2rem;">
			{{# } }}
		{{# } }}
	</script>
	
	<!-- 图片预览 -->
	<script type="text/html" id="shareQrcodeImgTmp">
		{{#if (d.shareQrcodeImg != null && d.shareQrcodeImg != '') { }}
			<img src="${imgServerPath}{{d.shareQrcodeImg}}" onclick="showTempletImage('${imgServerPath}{{d.shareQrcodeImg}}');" style="width: 3rem; height: 2rem;">
		{{# } }}
	</script>
	
	<!-- 模板-头部搜索DIV -->
	<div style="margin-left: 1rem;">
		<div class="layui-inline" style="margin-top: 0.5rem;">
			<form id="selectDiv">
				
				<div class="layui-inline layui-form selectDiv-input">
					<input type="text" placeholder="请输入联系电话" id="phone" autocomplete="off" class="layui-input" maxlength="25" >
				</div>
				
				<div class="layui-inline layui-form selectDiv-input">
					<input type="text" placeholder="请输入推荐人" id="pphone" autocomplete="off" class="layui-input" maxlength="25" >
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
			form.on('submit(demo)', function(data) { reloadTable(); });														// 监听提交按钮
			$('form').find(':reset').click(function() {	 $("#selectDiv")[0].reset(); layui.form.render(); return false; });	// 下拉框表单内容重置
	
			function reloadTable() {
				var phone = $("#phone").val(); 
				var pphone = $("#pphone").val(); 
				var isEnable = $("#p_isEnable").val();
	
				table.reload('templetTable', {
					url : rootUrl + '/list',
					where : {
						phone : phone,
						pphone : pphone,
						isEnable : isEnable
					}
				});
			}
			
			
			table.render({
				toolbar : '#templetHeaderDl',
				// toolbar : true,
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
						width : 105
					},
					{
						align : 'center',
						field : 'name',
						title : '姓名',
						hide  : true,
						width : 120
					},
					{
						align : 'center',
						field : 'phone',
						title : '联系电话',
						width : 150
					},
					{
						align : 'center',
						field : 'idNum',
						title : '身份证号码',
						hide  : true,
						width : 200
					},
					{
						align : 'center',
						field : 'loginName',
						title : '登录账户',
						width : 120
					},
					{
						align : 'center',
						field : 'pphone',
						title : '推荐人',
						width : 120
					},
					{
						align : 'center',
						field : 'headerImg',
						title : '头像',
						width : 130,
						templet : "#headerImgTmp"
					},
					{
						align : 'center',
						field : 'province',
						title : '所在省',
						width : 120
					},
					{
						align : 'center',
						field : 'city',
						title : '所在市',
						width : 120
					},
					{
						align : 'center',
						field : 'country',
						title : '所在区县',
						width : 120,
					},
					{
						align : 'center',
						field : 'openid',
						title : '微信openid',
						width : 300
					},
					{
						align : 'center',
						field : 'shareQrcodeImg',
						title : '分享链接',
						templet : "#shareQrcodeImgTmp",
						width : 150
					},
					
					{
						align : 'center',
						field : 'address',
						title : '所在地址',
						hide : true,
						width : 200
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
						fixed : 'right',
						toolbar : '#templetDemo',
					}
				]]
			});
			
		});
	</script>
	
</body>
</html>