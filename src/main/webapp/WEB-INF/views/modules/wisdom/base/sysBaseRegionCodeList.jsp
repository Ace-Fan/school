<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>

	<title>行政区划经纬度管理</title>
	
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
	
	<!-- 所属级别 -->
	<script type="text/html" id="levelTypeDome">
	{{#if (d.levelType == 0) { }}
		<span>国家</span>
	{{# }else if(d.levelType == 1){ }}
		<span>省(直辖市)</span>  
	{{# }else if(d.levelType == 2){ }}
        <span>市 </span> 
	{{# }else if(d.levelType == 3){ }}
        <span>区(县) </span>
	{{# }else if(d.levelType == 4){ }}
        <span>街道</span>
	{{# } }}
	</script>
	
	<!-- 模板-头部搜索DIV -->
	<div style="margin-left: 1rem;">
		<div class="layui-inline" style="margin-top: 0.5rem;">
			<form id="selectDiv">
				
				<div class="layui-inline layui-form selectDiv-input">
					<input type="text" placeholder="请输入行政区划编码" id="cityCode" autocomplete="off" class="layui-input" maxlength="32" >
				</div>
				
				<div class="layui-inline layui-form selectDiv-input">
					<input type="text" placeholder="请输入行政区划全称" id="name" autocomplete="off" class="layui-input" maxlength="32" >
				</div>
				
				<div class="layui-inline layui-form selectDiv-input">
					<input type="text" placeholder="请输入行政区划简称" id="shortName" autocomplete="off" class="layui-input" maxlength="32" >
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
				var cityCode = $("#cityCode").val();			// 编码
				var name = $("#name").val();					// 编码
				var shortName = $("#shortName").val();			// 编码
	
				table.reload('templetTable', {
					url : rootUrl + '/list',
					where : {
						cityCode : cityCode,
						name : name,
						shortName : shortName
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
						field : 'cityCode',
						title : '行政区划编码',
						width : 125
					},
					{
						align : 'center',
						field : 'name',
						title : '行政区划全称',
						width : 150
					}, 
					{
						align : 'center',
						field : 'mergerName',
						title : '省市区全称聚合',
						width : 260
	                }, 
	                {
	                	align : 'center',
	    				field : 'shortName',
	    				title : '行政区划简称',
	    				width : 120
	                }, 
	                {
	                	align : 'center',
	    				field : 'levelType',
	    				title : '所属级别',
	    				templet : '#levelTypeDome',
	    				width : 120
	                }, 
	                {
	                	align : 'center',
	    				field : 'namePinyin',
	    				title : '行政区划全拼',
	    				width : 230
	                },
	                {
	                	align : 'center',
	    				field : 'nameJianpin',
	    				title : '行政区划简拼',
	    				width : 120
	                }, 
	                {
	                	align : 'center',
	    				field : 'center',
	    				title : '城市中心点',
	    				width : 120
	                }, 
	                {
	                	align : 'center',
	    				field : 'longitude',
	    				title : '经度',
	    				width : 120
	                }, 
	                {
	                	align : 'center',
	    				field : 'latitude',
	    				title : '纬度',
	    				width : 120
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