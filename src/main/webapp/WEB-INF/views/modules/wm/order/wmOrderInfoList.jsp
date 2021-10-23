<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>基础订单管理列表</title>
	
	<!-- 标准化通用头部 -->
	<%@ include file="/WEB-INF/views/modules/templet/headExport/templetExport.jsp" %>
	
	<!-- 标准化表格页面CSS -->
	<link rel="stylesheet" href="${ctxStatic}/app/list/templetList.css" />
	
</head>
<body>
	
	<!-- 标准化表单隐藏文本 -->
	<%@ include file="/WEB-INF/views/modules/templet/templetHide.jsp" %>
	
	<input type="hidden" value="${ctx}${rootEUrl}" id="rootEUrl">
	<input type="hidden" value="${tableEName}" id="tableEName">
	
	<!-- 切换组件 -->
	<%@ include file="/WEB-INF/views/modules/templet/toggle/templetIsEnable.jsp" %>
	
	<!-- 引入标准化表格头部工具栏页面 -->
	<%@ include file="/WEB-INF/views/modules/templet/list/templetHeader.jsp" %>
	
	<!-- 引入标准化表格操作页面 -->
	<%@ include file="/WEB-INF/views/modules/templet/list/templetDemo.jsp" %>
	
	<!-- 标准化表单操作JS -->
	<script type="text/javascript">
		var rootEUrl =  $("#rootEUrl").val();
		var tableEName = $("#tableEName").val();
		
		layui.use(['form','layer','table'], function() {
			var layer = layui.layer, form = layui.from, table = layui.table;
			
			/*通用*/
			table.on('tool(templetETable)', function(obj) {
				var data = obj.data;
				var layEvent = obj.event;
				var ctx = "${ctx}";
				
				if (layEvent === "edit") { //编辑
					
					window.location.href = rootEUrl + '/getShow?type=edit&id='+data.id;
				
				} else if (layEvent === "del") { //删除
					
					var id = data.id;
					var tableName = $("#tableName").val();
					
					layer.confirm('是否删除选中信息', function(index){
		        		$.ajax({
							type:'post',
							url: '${ctx}/base/group/deleteOne',
							data:
							{
								"tableName" : tableEName,
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
					window.location.href = rootEUrl + '/getShow?type=show&id='+data.id;
				}  
			});
			
			
			table.on('toolbar(templetETable)', function(obj) {
				var checkStatus = table.checkStatus(obj.config.id); //获取选中行状态	
				var data = checkStatus.data;  //获取选中行数据
				var id = [];
				
				var ctx = "${ctx}";
				
				if(data.length > 0){
					for(var i = 0; i < data.length; i++){
						id[i] = data[i].id;
					}
				}
				
				switch (obj.event) {
						
					case 'delete':	// 批量删除
						if(data.length < 1){ 
							layer.msg("请选中至少一行数据",{iocn:2});
			        	} else { 
			        		var idLength = id.length; 
			        		
			        		layer.confirm('是否删除选中信息', function(index) {
			        			$.ajax({
			        				type : 'post',
			        				traditional : true, // 传递数组需要加上，进行序列化
			        				url : ctx + '/base/group/batchDelete',
			        				data : {
			        					'id' : id,
			        					'tableName' : tableEName
			        				},
			        				success : function(result) {
			        					var obj = eval('(' + result + ')');
			        					if (obj.code == 1) { // 删除成功
			        						layer.msg("删除成功", { icon : 6 });
			        						table.reload('templetETable', { url : rootEUrl + '/list' });
			        					} else if (obj.code == -1) { // 删除失败
			        						layer.msg("删除失败", { icon : 5 });
			        					}
			        				},
			        				error : function() {
			        					layer.msg('系统错误请联系管理员!', { icon : 5 });
			        				}
			        			});
			        		});
			        	}
						break;
				};
			});
			
			
		});
	</script>
	
	<!-- 标准化表单操作按钮 -->
	<script type="text/html" id="templetDemoE">
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
	
	<script type="text/html" id="payStatuTmp">
	{{#if (d.payStatu == 1) { }}
    	<span style="color:blue;">待支付</span>
    {{# }else if(d.payStatu == 2){ }}
        <span style="color:green;">成功支付</span>
	{{# }else if(d.payStatu == 3){ }}
        <span style="color:red">支付失败</span> 
    {{# } }}
	</script>
	
	<script type="text/html" id="payEStatuTmp">
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
	<table id="templetETable" lay-filter="templetETable"></table>
	
	<!-- 搜索JS -->
	<script type="text/javascript">
		layui.use([ 'table', 'form' ], function() {
			var table = layui.table, form = layui.form;		// 声明layui的table，form
			var rootUrl = $("#rootUrl").val();				// 访问业务模块路径
			var rootEUrl = $("#rootEUrl").val();			// 访问额外业务模块路径
	
			form.render();																									// 表单刷新（防止下拉框外加载）
			form.on('submit(demo)', function(data) { reloadTable(); });														// 监听提交按钮
			$('form').find(':reset').click(function() {	 $("#selectDiv")[0].reset(); layui.form.render(); return false; });	// 下拉框表单内容重置
	
			function reloadTable() {
				var orderno = $("#orderno").val(); 
	
				table.reload('templetTable', {
					url : rootUrl + '/list',
					where : {
						orderno : orderno
					}
				});
			}
			
			function reloadETable(mainOrderId) {
				table.reload('templetETable', {
					url : rootEUrl + '/list',
					where : {
						mainOrderId : mainOrderId
					}
				});
			}
			
			table.on('rowDouble(templetTable)', function(obj){
				var data = obj.data;
				var mainOrderId = data.id;
				reloadETable(mainOrderId);
			});
			
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
						width : 120
					},
					{
						align : 'center',
						field : 'userName',
						title : '用户',
						width : 120
					},
					{
						align : 'center',
						field : 'carType',
						title : '租车类型',
						width : 120
					},
					{
						align : 'center',
						field : 'carLength',
						title : '租车长度',
						width : 150
					},
					{
						align : 'center',
						field : 'carSpecId',
						title : '车型规格',
						hide  : true,
						width : 120
					},
					{
						align : 'center',
						field : 'startDistance',
						title : '估重',
						width : 100
					},
					{
						align : 'center',
						field : 'ordernos',
						title : '订单号',
						width : 250
					},
					{
						align : 'center',
						field : 'startTime',
						title : '预计出发时间',
						width : 180
					},
					{
						align : 'center',
						field : 'senderShortAddr',
						title : '发货人短地址',
						width : 180
					},
					{
						align : 'center',
						field : 'senderAddr',
						title : '发货人详细地址',
						width : 300
					},
					{
						align : 'center',
						field : 'receiver1ShortAddr',
						title : '收货人短地址1',
						width : 180
					},
					{
						align : 'center',
						field : 'receiver1Addr',
						title : '收货人详细地址1',
						width : 300
					},
					{
						align : 'center',
						field : 'receiver2ShortAddr',
						title : '收货人短地址2',
						width : 180
					},
					{
						align : 'center',
						field : 'receiver2Addr',
						title : '收货人详细地址2',
						width : 300
					},
					{
						align : 'center',
						field : 'receiver3ShortAddr',
						title : '收货人短地址3',
						width : 180
					},
					{
						align : 'center',
						field : 'receiver3Addr',
						title : '收货人详细地址3',
						width : 300
					},
					{
						align : 'center',
						field : 'distance1',
						title : '距离1(km)',
						width : 100
					},
					{
						align : 'center',
						field : 'distance2',
						title : '距离2(km)',
						width : 100
					},
					{
						align : 'center',
						field : 'distance3',
						title : '距离3(km)',
						width : 100
					},
					{
						align : 'center',
						field : 'totalDistance',
						title : '总距离(km)',
						width : 100
					},
					{
						align : 'center',
						field : 'fee',
						title : '支付费用(元)',
						width : 120
					},
					{
						align : 'center',
						field : 'payStatu',
						title : '支付状态',
						width : 100,
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
						fixed : 'right',
						toolbar : '#templetDemo',
					}
				]]
			});
			
			
			table.render({
				toolbar : '#templetHeaderDl',
				elem : '#templetETable',
				url  :  rootEUrl + '/list',
				page : true,
				id 	 : "templetETable",
				cols : [ [
					{
						align : 'center',
						type: 'checkbox',
					},
					{
						align : 'center',
						field : 'id',
						title : '编号',
						width : 120
					},
					{
						align : 'center',
						field : 'returnFee',
						title : '返程费用',
						width : 150
					},
					{
						align : 'center',
						field : 'loadUnloadFee',
						title : '装卸货费用',
						width : 150
					},
					{
						align : 'center',
						field : 'distributeFee',
						title : '分发费用',
						width : 150
					},
					{
						align : 'center',
						field : 'tailPlateFee',
						title : '尾板费用',
						width : 150
					},
					{
						align : 'center',
						field : 'estimateExtraFee',
						title : '预估额外总费用',
						width : 150
					},
					{
						align : 'center',
						field : 'totalExtraFee',
						title : '实际额外总费用',
						width : 165
					},
					{
						align : 'center',
						field : 'payStatu',
						title : '额外费用支付状态',
						width : 200,
						templet : '#payEStatuTmp'
					},
					{
						align : 'center',
						field : 'payTime',
						title : '额外费用支付时间',
						width : 180
					},
					{
						align : 'center',
						title : '操作',
						width : 200,
						toolbar : '#templetDemoE',
					}
				]]
			});
			
		});
	</script>
	
</body>
</html>