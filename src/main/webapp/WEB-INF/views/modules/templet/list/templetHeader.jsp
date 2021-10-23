<%@ page contentType="text/html;charset=UTF-8" %>

<!-- 标准化表单头部操作页面 -->
<script type="text/html" id="templetTableHeader">
	<div class="layui-btn-container">
		<button class="layui-btn layui-btn-primary layui-btn-sm" lay-event="add" style="background-color:#5FB878;">
			<i class="layui-icon" style="color:white;">&#xe654;</i><span style="color:white;">新增</span>
		</button>
		<button class="layui-btn layui-btn-primary layui-btn-sm" lay-event="delete" style="background-color:#FF5722;">
			<i class="layui-icon" style="color:white;">&#xe640;</i><span style="color:white;">批量删除</span>
		</button>
	</div>
</script>

<!-- 标准化表单头部操作页面 -->
<script type="text/html" id="templetHeader">
	<div class="layui-btn-container">
		<button class="layui-btn layui-btn-primary layui-btn-sm" lay-event="add" style="background-color:#5FB878;">
			<i class="layui-icon" style="color:white;">&#xe654;</i><span style="color:white;">新增</span>
		</button>
		<button class="layui-btn layui-btn-primary layui-btn-sm" lay-event="copyAdd" style="background-color:#5FB878;">
			<i class="layui-icon" style="color:white;">&#xe654;</i><span style="color:white;">复制新增</span>
		</button>
		<button class="layui-btn layui-btn-primary layui-btn-sm" lay-event="getSync" style="background-color:#01AAED;">
    		<i class="layui-icon" style="color:white;">&#xe63c;</i><span style="color:white;">选定导出</span>
		</button>
		<button class="layui-btn layui-btn-primary layui-btn-sm" lay-event="getSyncAll" style="background-color:#01AAED;">
    		<i class="layui-icon" style="color:white;">&#xe63c;</i><span style="color:white;">导出全部</span>
		</button>
		<button class="layui-btn layui-btn-primary layui-btn-sm" lay-event="delete" style="background-color:#FF5722;">
			<i class="layui-icon" style="color:white;">&#xe640;</i><span style="color:white;">批量删除</span>
		</button>
	</div>
</script>

<!-- 标准化表单头部操作页面 -->
<script type="text/html" id="templetHeaderEx">
	<div class="layui-btn-container">
		<button class="layui-btn layui-btn-primary layui-btn-sm" lay-event="add" style="background-color:#5FB878;">
			<i class="layui-icon" style="color:white;">&#xe654;</i><span style="color:white;">新增</span>
		</button>
		<button class="layui-btn layui-btn-primary layui-btn-sm" lay-event="delete" style="background-color:#FF5722;">
			<i class="layui-icon" style="color:white;">&#xe640;</i><span style="color:white;">批量删除</span>
		</button>
	</div>
</script>

<!-- 标准化表单头部操作页面 -->
<script type="text/html" id="templetHeaderDl">
	<div class="layui-btn-container">
		<button class="layui-btn layui-btn-primary layui-btn-sm" lay-event="delete" style="background-color:#FF5722;">
			<i class="layui-icon" style="color:white;">&#xe640;</i><span style="color:white;">批量删除</span>
		</button>
	</div>
</script>

<!-- 标准化表单头部操作页面 -->
<script type="text/javascript">
	var rootUrl =  $("#rootUrl").val();
	var tableName = $("#tableName").val();
	
	layui.use(['form','layer','table'], function() {
		var layer = layui.layer, form = layui.from, table = layui.table;
		
		// 单击行选中复选框事件
		$(document).on("click",".layui-table-body table.layui-table tbody tr", function () {
		    var index = $(this).attr('data-index');
		    var tableBox = $(this).parents('.layui-table-box');
		    if (tableBox.find(".layui-table-fixed.layui-table-fixed-l").length>0) {
		        tableDiv = tableBox.find(".layui-table-fixed.layui-table-fixed-l");
		    } else {
		        tableDiv = tableBox.find(".layui-table-body.layui-table-main");
		    }
		    var checkCell = tableDiv.find("tr[data-index=" + index + "]").find("td div.laytable-cell-checkbox div.layui-form-checkbox I");
		    if (checkCell.length>0) {
		        checkCell.click();
		    }
		});
		
		$(document).on("click", "td div.laytable-cell-checkbox div.layui-form-checkbox", function (e) {
		    e.stopPropagation();
		});
	
		table.on('toolbar(templetTable)', function(obj) {
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
				case 'add':		// 普通新增
					window.location.href = rootUrl + '/getShow?type=edit';
					break;
					
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
		        					'tableName' : tableName
		        				},
		        				success : function(result) {
		        					var obj = eval('(' + result + ')');
		        					if (obj.code == 1) { // 删除成功
		        						layer.msg("删除成功", { icon : 6 });
		        						table.reload('templetTable', { url : rootUrl + '/list' });
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
					
				case 'getSyncAll':	// 全部导出
					window.location.href = rootUrl + '/export';
					break;
				
				case 'getSync':		// 批量导出
					if(data == ''){ layer.msg('请选中至少一行数据');	return null; }
					for ( var i in data) { id.push(data[i].id); } // 主键数组
					if (id != null) { window.location.href = rootUrl + '/export?ids='+id; }
					break;
					
				case 'copyAdd':	// 复制添加
					
					if(data.length===0){
						layer.msg('请选中一行进行复制添加')
					}else if(data.length>1){
						layer.msg('只能选中一行进行复制添加')
					}else{
						window.location.href= rootUrl + '/getCopyForm?id='+ data[0].id;
					}				
					break;
			};
		});
	});
</script>