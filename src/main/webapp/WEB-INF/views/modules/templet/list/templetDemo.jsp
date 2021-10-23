<%@ page contentType="text/html;charset=UTF-8" %>

<!-- 标准化表单操作按钮 -->
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

<!-- 标准化表单操作按钮 -->
<script type="text/html" id="templetDemoShow">
    <div class="layui-btn-container">
		<a class="layui-btn layui-btn-xs" lay-event="show">
			<i class="layui-icon" style="color:white;">&#xe615;</i><span style="color:white;">查看</span>
		</a>
    </div>
</script>

<script type="text/html" id="templetDemoDl">
    <div class="layui-btn-container">
		<a class="layui-btn layui-btn-xs" lay-event="show">
			<i class="layui-icon" style="color:white;">&#xe615;</i><span style="color:white;">查看</span>
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
						url: '${ctx}/base/group/deleteOne',
						data:
						{
							"tableName" : tableName,
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