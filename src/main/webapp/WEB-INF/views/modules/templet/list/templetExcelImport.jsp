<%@ page contentType="text/html;charset=UTF-8" %>

<script type="text/javascript">
	var rootUrl =  $("#rootUrl").val();
	var tableName = $("#tableName").val();

	layui.use(['upload','layer', 'element'], function(){
		var upload = layui.upload , element = layui.element, layer = layui.layer;
		
		//通用监听函数
		var xhrOnProgress = function(fun) {
			xhrOnProgress.onprogress = fun;
			return function() {
				var xhr = $.ajaxSettings.xhr();
				if (typeof xhrOnProgress.onprogress !== 'function')
					return xhr;
				if (xhrOnProgress.onprogress && xhr.upload) {
					xhr.upload.onprogress = xhrOnProgress.onprogress;
				}
				return xhr;
			}
		}
		
		console.log(tableName);
		
		var uploadInst = upload.render({
    		elem: '#uploadExcel' //绑定元素
    	    ,url: rootUrl + '/excelFileLead' //上传接口
    	    ,method : "POST"
   	    	,accept: 'file'
   	        ,exts: 'xls|xlsx'
  	        	,xhr : xhrOnProgress
  	        	, progress : function(value) {//上传进度回调 value进度值
				element.progress('demo', value + '%')//设置页面进度条
			}
			, choose : function(obj) { // 选择完文件触发事件
				layer.msg("数据正在导入，请等待...");
			}
    	   	,done: function(res){
    	   		//上传完毕回调
    	   		console.log(res);
    	   		
    	   		if (res.code == "-1") {
    	   			layer.msg(res.msg, { icon: 5 });
    	   		} else if (res.code == "-2") {
    	   			layer.msg(res.msg, { icon: 5 });
    	   		} else if (res.code == "-3") {
    	   			layer.msg(res.msg, { icon: 5 });
    	   		} else if (res.code == "-4") {
    	   			layer.msg(res.msg, { icon: 5 });
    	   		} else if (res.code == "-5") {
    	   			layer.msg(res.msg, { icon: 5 });
    	   		} else if (res.code == "1") {
    	   			console.log(111);
    	   			layer.msg(res.msg, { icon: 6 });
    	   			setTimeout(function(){ window.location.href = rootUrl + "/show" }, 1000);
    	   		}
    	   		
	    	 }
		}); 
	});
</script>