<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>租车类型管理管理</title>
	
	<!-- 标准化通用头部 -->
	<%@ include file="/WEB-INF/views/modules/templet/headExport/templetExport.jsp" %>
	
	<!-- 标准化表格页面CSS -->
	<link rel="stylesheet" href="${ctxStatic}/app/form/templetOneLine.css" />
	
</head>
<body>

	<!-- 标准化表单隐藏文本 -->
	<%@ include file="/WEB-INF/views/modules/templet/templetHide.jsp" %>
	
	<!-- 主体内容 -->
	<div class="layui-main">
		<!-- 头部标题内容 -->
	  	<fieldset class="layui-elem-field layui-field-title">
		    <legend>
		        <c:choose>
					<c:when test="${is eq 'show'}">
		        		车型信息查看
		        	</c:when>
					<c:otherwise>
		        		车型信息${wmCarType.id eq null ?'添加':'修改'}
		        	</c:otherwise>
				</c:choose>
		    </legend>
		</fieldset>
	    
	    <!-- 主体内容 -->
	    <form class="layui-form layui-form-pane" action="" style="margin-top: 1em;">
			<div id="dis">
				<input type="hidden" name="id" value="${wmCarType.id}" />
				
				<div class="layui-form-item">
					<div class="layui-col-xs12">
						<label class="layui-form-label">车型编码&nbsp;<span style="color: red;">*</span></label>
						<div class="layui-input-inline">
							<input type="text" name="carCode" lay-verify="required" placeholder="请输入车型编码" 
								autocomplete="off" class="layui-input" value="${wmCarType.carCode}" maxlength="10">
						</div>
					</div>
				</div>
				
				<div class="layui-form-item">
					<div class="layui-col-xs12">
						<label class="layui-form-label">车型名称&nbsp;<span style="color: red;">*</span></label>
						<div class="layui-input-inline">
							<input type="text" name="carName" lay-verify="required" placeholder="请输入车型名称" 
								autocomplete="off" class="layui-input" value="${wmCarType.carName}" maxlength="25">
						</div>
					</div>
				</div>
				
				<div class="layui-form-item">
					<div class="layui-col-xs12">
						<label class="layui-form-label">载重</label>
						<div class="layui-input-inline">
							<input type="text" name="loadWeight" placeholder="请输入载重（吨）" oninput ="value=value.replace(/[^0-9.]/g,'')"
								autocomplete="off" class="layui-input" value="${wmCarType.loadWeight}" maxlength="25">
						</div>
					</div>
				</div>
				
				<div class="layui-form-item">
					<div class="layui-col-xs12">
						<label class="layui-form-label">长度</label>
						<div class="layui-input-inline">
							<input type="text" name="length" id="length" placeholder="请输入长度（米）" oninput ="value=value.replace(/[^0-9.]/g,'')"
								autocomplete="off" class="layui-input" value="${wmCarType.length}" maxlength="25">
						</div>
					</div>
				</div>
				
				<div class="layui-form-item">
					<div class="layui-col-xs12">
						<label class="layui-form-label">宽度</label>
						<div class="layui-input-inline">
							<input type="text" name="width" id="width" placeholder="请输入宽度（米）" oninput ="value=value.replace(/[^0-9.]/g,'')"
								autocomplete="off" class="layui-input" value="${wmCarType.width}" maxlength="25">
						</div>
					</div>
				</div>
				
				<div class="layui-form-item">
					<div class="layui-col-xs12">
						<label class="layui-form-label">高度</label>
						<div class="layui-input-inline">
							<input type="text" name="height" id="height" placeholder="请输入高度（米）" oninput ="value=value.replace(/[^0-9.]/g,'')"
								autocomplete="off" class="layui-input" value="${wmCarType.height}" maxlength="25">
						</div>
					</div>
				</div>
				
				<div class="layui-form-item">
					<div class="layui-col-xs12">
						<label class="layui-form-label">长宽高</label>
						<div class="layui-input-inline">
							<input type="text" name="lwh" id="lwh" placeholder="请输入长宽高（米）" readonly="readonly"
								autocomplete="off" class="layui-input" value="${wmCarType.lwh}" maxlength="25">
						</div>
					</div>
				</div>
				
				<div class="layui-form-item">
					<div class="layui-col-xs12">
						<label class="layui-form-label">容积</label>
						<div class="layui-input-inline">
							<input type="text" name="volume" id="volume" placeholder="请输入容积（方）" oninput ="value=value.replace(/[^0-9.]/g,'')"
								autocomplete="off" class="layui-input" value="${wmCarType.volume}" maxlength="25">
						</div>
					</div>
				</div>
				
				<div class="layui-form-item">
					<div class="layui-col-xs12">
						<label class="layui-form-label">启用状态&nbsp;<span style="color: red;">*</span></label>
						<div class="layui-input-inline">
							<input type="radio" name="isEnable" ${wmCarType.isEnable eq '0'?'':'checked'} value="1" title="启用" /> 
							<input type="radio" name="isEnable" ${wmCarType.isEnable eq '0'?'checked':''} value="0" title="禁用" />
						</div>
					</div>
				</div>
				
				<div class="layui-form-item">
					<div class="layui-col-xs12">
						<c:choose>
							<c:when test="${wmCarType.id == null}">
								<label class="layui-form-label">图片预览</label>
								<div class="layui-input-inline">
									<button class="layui-btn layui-btn-primary" id="uploadImage" type="button" style="background-color:#5FB878;">
										<i class="layui-icon" style="color:white;">&#xe62f;</i><span style="color:white;">上传图片</span>
									</button>
								
									<img style="width: 10rem; height: 10rem; display: none;" id="upImage">
								
									<input type="hidden" name="img" id="img" placeholder="请上传图片" 
										autocomplete="off" class="layui-input" value="${wmCarType.img}" maxlength="10">
								</div>
							</c:when>
							<c:otherwise>
								<label class="layui-form-label">图片预览</label>
								<div class="layui-input-inline">
									<button class="layui-btn layui-btn-primary" id="uploadImage" type="button" style="background-color:#5FB878; margin-top: -7.8rem;">
										<i class="layui-icon" style="color:white;">&#xe62f;</i><span style="color:white;">上传图片</span>
									</button>
								
									<img style="width: 10rem; height: 10rem;" id="upImage" src="${wmCarType.img}">
								
									<input type="hidden" name="img" id="img" placeholder="请上传图片" 
										autocomplete="off" class="layui-input" value="${wmCarType.img}" maxlength="10">
								</div>
							</c:otherwise>
						</c:choose>
					</div>
				</div>
				
				<!-- 备注 -->
				<div class="layui-form-item">
					<div class="layui-col-xs12">
						<label class="layui-form-label">备注</label>
						<div class="layui-input-inline">
							<textarea placeholder="请输入备注" maxlength="100" name="remark" class="layui-textarea">${wmCarType.remark}</textarea>
						</div>
					</div>
				</div>
				
			</div>
			
			<!-- 标准化表单提交按钮 -->
			<%@ include file="/WEB-INF/views/modules/templet/form/templetSubmitButton.jsp" %>
		</form>
	</div>
	
	<!-- 标准化表单提交JS -->
	<%@ include file="/WEB-INF/views/modules/templet/form/templetSubMitDict.jsp" %>
	
	<script type="text/javascript">
		$('#length').on('input propertychange',function(){
			var length = $("#length").val();
			var width = $("#width").val();
			var height = $("#height").val();
			
			if (length == '') {
				$("#lwh").val("");
			} else if (width == '') {
				$("#lwh").val("");
			} else if (height == '') {
				$("#lwh").val("");
			} else {
				$("#lwh").val(length+"*"+width+"*"+height);
			}
			
		});
		
		$('#width').on('input propertychange',function(){
			var length = $("#length").val();
			var width = $("#width").val();
			var height = $("#height").val();
			
			if (length == '') {
				$("#lwh").val("");
			} else if (width == '') {
				$("#lwh").val("");
			} else if (height == '') {
				$("#lwh").val("");
			} else {
				$("#lwh").val(length+"*"+width+"*"+height);
			}
		});
		
		$('#height').on('input propertychange',function(){
			var length = $("#length").val();
			var width = $("#width").val();
			var height = $("#height").val();
			
			if (length == '') {
				$("#lwh").val("");
			} else if (width == '') {
				$("#lwh").val("");
			} else if (height == '') {
				$("#lwh").val("");
			} else {
				$("#lwh").val(length+"*"+width+"*"+height);
			}
		});
	</script>
	
	<!-- 导入接口 -->
	<script type="text/javascript">
		var rootUrl =  $("#rootUrl").val();
	
		layui.use(['upload','layer'], function(){
			var upload = layui.upload , layer = layui.layer;
	    	   
			//创建监听函数
			var xhrOnProgress = function(fun) {
				xhrOnProgress.onprogress = fun; //绑定监听
				//使用闭包实现监听绑
				return function() {
					//通过$.ajaxSettings.xhr();获得XMLHttpRequest对象
					var xhr = $.ajaxSettings.xhr();
					//判断监听函数是否为函数
					if (typeof xhrOnProgress.onprogress !== 'function')
						return xhr;
					//如果有监听函数并且xhr对象支持绑定时就把监听函数绑定上去
					if (xhrOnProgress.onprogress && xhr.upload) {
						xhr.upload.onprogress = xhrOnProgress.onprogress;
					}
					return xhr;
				}
			}
			
	    	//执行实例
	    	var uploadInst = upload.render({
	    		elem: '#uploadImage' //绑定元素
	    	    ,url: rootUrl + '/upImage' //上传接口
	    	    ,method : "POST"
	   	    	,accept: 'file'
	   	        ,exts: 'bmg|jpg|jpeg|png|gif'
   	        	, xhr : xhrOnProgress
   	        	, progress : function(value) {//上传进度回调 value进度值
					// element.progress('demo', value + '%')//设置页面进度条
				}
	    	   	,done: function(res){
					if (res.code == 1) {
						layer.msg("上传图片成功", { icon: 6 });
						console.log(res.data);
						
						var data = res.data;				// 回显信息
						var img = data.img;			// 图片路径
						$("#img").val(img);
						
						// 设置样式
						$("#upImage").css('display','inline');
						$("#upImage").attr("src",img);
						$("#uploadImage").css("margin-top", "-7.8rem");
						
					} else {
						layer.msg("图片上传失败", { icon: 5 });
					}
	    	 	}
			});
		});
	</script>

</body>
</html>