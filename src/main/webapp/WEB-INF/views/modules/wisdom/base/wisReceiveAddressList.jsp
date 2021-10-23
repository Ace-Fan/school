<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>

	<title>收货地址信息管理</title>
	
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
	
	<!-- 切换组件 -->
	<%@ include file="/WEB-INF/views/modules/templet/toggle/templetIsDefault.jsp" %>
	
	<!-- 引入标准化表格操作页面 -->
	<script type="text/html" id="templetDemo">
    <div class="layui-btn-container">
		<a class="layui-btn layui-btn-xs" lay-event="show">
			<i class="layui-icon" style="color:white;">&#xe615;</i><span style="color:white;">查看</span>
		</a>
        <a class="layui-btn layui-btn-normal layui-btn-xs" lay-event="edit">
			<i class="layui-icon layui-icon-edit"></i><span style="color:white;">修改</span>
		</a>
		<a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">
			<i class="layui-icon layui-icon-delete"></i><span style="color:white;">删除</span>
		</a>
    </div>
	</script>
	
	<!-- 标准化表单操作JS -->
	<script type="text/javascript">
		var rootUrl =  $("#rootUrl").val();
		var tableName = $("#tableName").val();
		
		layui.use(['form','layer','table'], function() {
			var layer = layui.layer, form = layui.from, table = layui.table;
			
			/*通用*/
			table.on('tool(templetTable)', function(obj) {
				var data = obj.data;
				var layEvent = obj.event;
				var ctx = "${ctx}";
				
				if (layEvent === "edit") { //编辑
					
					window.location.href = rootUrl + '/getShow?type=edit&id='+data.id;
				
				} else if (layEvent === "del") { //删除
					
					var id = data.id;
					var tableName = $("#tableName").val();
					
					layer.confirm('是否删除选中信息', function(index){
		        		$.ajax({
							type:'post',
							url: rootUrl + '/delete',
							data:
							{
								"id" : id
							},
							success:function(result){
								
								var obj = eval('('+result+')');
								
								if(obj.code == 1){
									layer.msg("删除成功", { icon: 6 });
									setTimeout(function(){ window.location.href = rootUrl + "/show"; }, 1000);
								} else if (obj.code == -1 ){
									layer.msg("删除失败", { icon: 5 });
									setTimeout(function(){ window.location.href = rootUrl + "/show"; }, 1000);
								} else {
									layer.alert('系统错误请联系管理员', { icon: 2 });
								}
							}
						})
			        });
					
				}  else if(layEvent === "show"){	//查看
					window.location.href = rootUrl + '/getShow?type=show&id='+data.id;
				}  
			});
		});
	</script>
	
	<!-- 模板-头部搜索DIV -->
	<div style="margin-left: 1rem;">
		<div class="layui-inline" style="margin-top: 0.5rem;">
			<form id="selectDiv">
				
				<div class="layui-inline layui-form selectDiv-input">
					<input type="text" placeholder="请输入用户名称" id="name" autocomplete="off" class="layui-input" maxlength="32" >
				</div>
					
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
			form.on('submit(demo)', function(data) { reloadTable(); });															// 监听提交按钮
			$('form').find(':reset').click(function() {	 $("#selectDiv")[0].reset();  layui.form.render();  return false; });	// 下拉框表单内容重置
	
			function reloadTable() {
				var name = $("#name").val();			// 编码
	
				table.reload('templetTable', {
					url : rootUrl + '/list',
					where : {
						name : name
					}
				});
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
						field : 'userId',
						title : '用户编号',
						width : 100
					},
					{
						align : 'center',
						field : 'name',
						title : '用户名称',
					},
					{
						align : 'center',
						field : 'phone',
						title : '手机号码',
					},
					{
						align : 'center',
						field : 'city',
						title : '地区',
					},
					{
						align : 'center',
						field : 'detail',
						title : '详细地址',
					},
					{
						align : 'center',
						field : 'postcode',
						title : '邮编',
					},
					{
						align : 'center',
						field : 'isDefault',
						title : '是否默认',
						templet : '#isDefaultCheck'
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