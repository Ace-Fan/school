<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>版本信息管理</title>
	
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
					<c:when test="${is == 'show'}">
		      			版本信息查看
		         	</c:when>
					<c:otherwise>
						版本信息${not empty wisAppVer.id?'修改':'添加'}
		      		</c:otherwise>
				</c:choose>
			</legend>
		</fieldset>
	    
	    <!-- 主体内容 -->
	    <form class="layui-form layui-form-pane" action="" style="margin-top: 1em;">
			<div id="dis">
				<input type="hidden" name="id" value="${wisAppVer.id}" />
				
				<div class="layui-form-item">
					<div class="layui-col-xs12">
						<label class="layui-form-label">应用名称&nbsp;<span style="color: red;">*</span></label>
						<div class="layui-input-inline">
							<input type="text" name="appName" lay-verify="required" id="appName" placeholder="请输入应用名称" 
								autocomplete="off" class="layui-input" value="${wisAppVer.appName}" maxlength="10">
						</div>
					</div>
				</div>
				
				<!-- 应用类型 -->
				<div class="layui-form-item">
					<div class="layui-col-xs12">
						<label class="layui-form-label">应用类型&nbsp;<span style="color: red;">*</span></label>
						<div class="layui-input-inline">
							<input type="radio" name="appType" ${wisAppVer.appType == 'ios'?'':'checked'} value="Android" title="Android" /> 
							<input type="radio" name="appType" ${wisAppVer.appType == 'ios'?'checked':''} value="ios" title="ios" />
						</div>
					</div>
				</div>
				
				<!-- 版本号 -->
				<div class="layui-form-item">
					<div class="layui-col-xs12">
						<label class="layui-form-label">版本号&nbsp;<span style="color: red;">*</span></label>
						<div class="layui-input-inline">
							<input type="text" name="appVer" lay-verify="required" id="appVer" placeholder="请输入版本号" 
								autocomplete="off" class="layui-input" value="${wisAppVer.appVer}" maxlength="10">
						</div>
					</div>
				</div>
				
				<!-- 文件名称 -->
				<div class="layui-form-item">
					<div class="layui-col-xs12">
						<label class="layui-form-label">文件名称&nbsp;<span style="color: red;">*</span></label>
						<div class="layui-input-inline">
							<input type="text" name="fileName" lay-verify="required" id="fileName" placeholder="请上传apk文件" 
								autocomplete="off" class="layui-input" value="${wisAppVer.fileName}" maxlength="10">
						</div>
					</div>
				</div>
				
				<!-- 文件路径 -->
				<div class="layui-form-item">
					<div class="layui-col-xs12">
						<label class="layui-form-label">文件上传&nbsp;<span style="color: red;">*</span></label>
						<div class="layui-input-inline">
							<button class="layui-btn layui-btn-primary" id="uploadApk" type="button" style="background-color:#5FB878;">
								<i class="layui-icon" style="color:white;">&#xe62f;</i><span style="color:white;">上传文件</span>
							</button>
						
							<input type="hidden" name="fileUrl" id="fileUrl" autocomplete="off" class="layui-input" value="${wisAppVer.fileUrl}" maxlength="10">
						</div>
					</div>
				</div>
				
				<!-- 启用状态 -->
				<div class="layui-form-item">
					<div class="layui-col-xs12">
						<label class="layui-form-label">启用状态&nbsp;<span style="color: red;">*</span></label>
						<div class="layui-input-inline">
							<input type="radio" name="isEnable" ${wisAppVer.isEnable eq '0'?'':'checked'} value="1" title="启用" /> 
							<input type="radio" name="isEnable" ${wisAppVer.isEnable eq '0'?'checked':''} value="0" title="禁用" />
						</div>
					</div>
				</div>
				
				<!-- 版本描述 -->
				<div class="layui-form-item">
					<div class="layui-col-xs12">
						<label class="layui-form-label">版本描述</label>
						<div class="layui-input-inline">
							<textarea placeholder="请输入版本描述" maxlength="100" name="appDesc" class="layui-textarea">${wisAppVer.appDesc}</textarea>
						</div>
					</div>
				</div>
				
			</div>
			
			<!-- 标准化表单提交按钮 -->
			<%@ include file="/WEB-INF/views/modules/templet/form/templetSubmitButton.jsp" %>
		</form>
	</div>
	
	<!-- 标准化表单提交JS -->
	<%@ include file="/WEB-INF/views/modules/templet/form/templetSubmit.jsp" %>
	
	<!-- 导入接口 -->
	<script type="text/javascript">
		var rootUrl =  $("#rootUrl").val();
	
		layui.use(['upload','layer', 'element'], function(){
			var upload = layui.upload , element = layui.element, layer = layui.layer;
			
			//通用监听函数
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
				elem : '#uploadApk' //绑定元素
				, url : rootUrl + '/upApk' //上传接口
				, method : "POST"
				, accept : 'file'
				, exts : 'apk'
				, xhr : xhrOnProgress
				, progress : function(value) {//上传进度回调 value进度值
					element.progress('demo', value + '%')//设置页面进度条
				}
				, choose : function(obj) { // 选择完文件触发事件
					var length = obj.preview.length;
					if (length > 0) {
						layer.msg("文件正在上传，请等待......");
					}
				}
				, done : function(res) {

					if (res.code == 10005) {
						setTimeout(function() {
							layer.msg("上传文件成功", { icon : 6 });
							console.log(res.data);

							var data = res.data; // 回显信息
							var fileName = data.fileName; // 文件名称
							var fileUrl = data.fileUrl; // 文件路径

							$("#fileName").val(fileName);
							$("#fileUrl").val(fileUrl);
							
						}, 1000);

					} else {
						layer.msg("上传文件失败", { icon : 5 });
					}
				}
			});
		});
	</script>

</body>
</html>