<%@ page contentType="text/html;charset=UTF-8"%>

<!-- 通用表单提交JS -->
<script type="text/javascript">
	
	var rootUrl =  $("#rootUrl").val(); // 访问路径
	var tableName = $("#tableName").val(); // 表名

	layui.use(['layer','form'], function() {
		var layer = layui.layer, form = layui.form;
		
		form.render();
		
		form.on('submit(formDemos)', function(data) {
			
			var json = JSON.stringify(data.field);
			$(this).attr({"disabled":"disabled"});
			
			$.ajax({
				type : 'POST',
				url  : rootUrl + '/save',
				data : {
					'json'  : json
				},
				success : function(result) {
					var obj = eval('('+result+')');
					
					console.log(obj);
					
					if(obj.code == 10001){	// 新增成功
						layer.msg(obj.msg, { icon: 6 });
						setTimeout(function(){window.location.href= rootUrl + "/show"; }, 1000);
					} else if(obj.code == 40001){	// 新增失败
						layer.msg(obj.msg, { icon: 5 });
					} else if(obj.code == 10002){	// 修改成功
						layer.msg(obj.msg, { icon: 6 });
						var localStoragePage = localStorage.getItem("data-page");  // 获取本地存储page信息
						setTimeout(function(){window.location.href= rootUrl + "/show?localStoragePage="+localStoragePage; }, 1000);
					} else if(obj.code == 40002){	// 修改失败
						layer.msg(obj.msg, { icon: 5 });
					
					} else if (obj.code == 40003) {
						layer.msg(obj.msg, {icon:5});
					} else if (obj.code == 40004) {
						layer.msg(obj.msg, {icon:5});
					} else if (obj.code == 40005) {
						layer.msg(obj.msg, {icon:5});
					} else if (obj.code == 40006) {
						layer.msg(obj.msg, {icon:5});
					} else if (obj.code == 40007) {
						layer.msg(obj.msg, {icon:5});
					} else if (obj.code == 40008) {
						layer.msg(obj.msg, {icon:5});
					} else {
						layer.msg('系统错误请联系管理员', { icon: 2 });
					}
				},
				error : function(data) {
					layer.msg('操作失败', { icon: 6 });
				}
			});  
				
			$(this).removeAttr("disabled");
			return false;
		});
	});
</script>