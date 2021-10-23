<%@ page contentType="text/html;charset=UTF-8"%>

<!-- 通用表单提交JS -->
<script type="text/javascript">
	layui.use(['layer','form'], function() {
		var layer = layui.layer, form = layui.form;
		
		form.render();
		
		var rootUrl =  $("#rootUrl").val(); // 访问路径
		var tableName = $("#tableName").val(); // 表名
		
		form.on('submit(formDemos)', function(data) {
			
			$(this).attr({"disabled":"disabled"});
			var json = JSON.stringify(data.field);
			
			console.log(json);
			
			$.ajax({
				type : 'POST',
				url  : rootUrl + '/save',
				data : {
					'json'  : json,
					'tableName'	: tableName
				},
				success : function(result) {
					var obj = eval('('+result+')');
					
					console.log(obj);
					
					if(obj.code == 1){	// 新增成功
						layer.msg(obj.msg, { icon: 6 });
						setTimeout(function(){ window.location.href = rootUrl + "/show" }, 1000);
					} else if(obj.code == -1){	// 新增失败
						layer.msg(obj.msg, { icon: 5 });
					} else if(obj.code == 2){	// 修改成功
						layer.msg(obj.msg, { icon: 6 });
						setTimeout(function(){ window.location.href = rootUrl + "/show" }, 1000);
					} else if(obj.code == -2){	// 修改失败
						layer.msg(obj.msg, { icon: 5 });
					} else {
						layer.msg('系统错误请联系管理员', { icon: 2 });
					}
				},
				error : function(data) {
					layer.msg('操作失败', { icon: 6 });
				}
			}); 
			
			return false;
		});
	});
</script>