<%@ page contentType="text/html;charset=UTF-8"%>

<!-- 切换组件 -->
<script type="text/html" id="isDefaultCheck">
    {{#if (d.isDefault == 1) { }}
        <input type="checkbox" checked="" name="open" lay-skin="switch" lay-filter="isDefaultSwitch" switch_default_id="{{d.id}}" lay-text="是|否">
    {{# }else if(d.isDefault == 0){ }}
      	<input type="checkbox" name="open" lay-skin="switch" lay-filter="isDefaultSwitch" switch_default_id="{{d.id}}" lay-text="是|否">
    {{# } }}
</script>

<!-- 切换组件JS -->
<script type="text/javascript">
	layui.use(['table','form','layer'], function() {
		var table = layui.table, form = layui.form, layer = layui.layer;
		
		var rootUrl = $("#rootUrl").val();
		var tableName = $("#tableName").val(); // 表名
		var colunms = "is_default";	// 指定字段
		var ctx = "${ctx}";
		
		function switchTemp(ctx, tableName, id, colunms, value) {
			$.ajax({
				type : 'post',
				// 传递数组需要加上，进行序列化
				traditional : true,
				url : rootUrl + '/toggleTableColumns',
				async : false,// 同步提交。不设置则默认异步，异步的话，最后执行ajax
				data : {
					'colunms' : colunms,
					'tableName' : tableName,
					'id' : id,
					value : value
				},
				success : function(result) {
					var obj = eval('(' + result + ')');
				}
			});
			return false;
		}
		
		//监听指定开关-切换为禁用
	  	form.on('switch(isDefaultSwitch)', function(data){
	  		var checked = data.elem.checked;	//开关是否开启，true或者false
	        var switch_default_id = data.elem.attributes['switch_default_id'].nodeValue;	//获取所需属性值 -- 主键ID
	        var value = "0"; 					// 默认修改内容为 0
	        
	        if (checked == false) {				// 禁用
	        	var switchFlag =  switchTemp(ctx, tableName, switch_default_id, colunms, value);
	        	if (switchFlag == false) { layer.msg('取消默认成功', { icon: 6}); }
	        } else if (checked == true) {		// 启用
	        	value = "1";					// 启用调整修改内容
				var switchFlag =  switchTemp(ctx, tableName, switch_default_id, colunms, value);
	        	if (switchFlag == false) { layer.msg('设置默认成功', { icon: 6}); }
	        }
	  	});
	});
</script>