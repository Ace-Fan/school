<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>数据导入配置管理</title>
	
	<!-- 标准化通用头部 -->
	<%@ include file="/WEB-INF/views/modules/templet/headExport/templetExport.jsp" %>
	
	<!-- 标准化表格页面CSS -->
	<link rel="stylesheet" href="${ctxStatic}/app/form/templetOneLine.css" />
	
</head>
<body>

	<!-- 标准化表单隐藏文本 -->
	<%@ include file="/WEB-INF/views/modules/templet/templetHide.jsp" %>
	
	<!-- 主体内容 -->
	<div class="layui-main" style="padding: 1rem; margin-left: 1rem; margin-top: 1rem;">
		<!-- 头部标题内容 -->
	  	<fieldset class="layui-elem-field layui-field-title">
		    <legend>
				<c:choose>
					<c:when test="${is == 'show'}">
		      			数据导入配置信息查看
		         	</c:when>
					<c:otherwise>
						数据导入配置信息${not empty wisDataImportTab.id?'修改':'添加'}
		      		</c:otherwise>
				</c:choose>
			</legend>
		</fieldset>
	    
	    <!-- 主体内容 -->
	    <form class="layui-form layui-form-pane" action="" style="margin-top: 1em;">
			<div id="dis">
				<input type="hidden" name="id" value="${wisDataImportTab.id}" />
				
				<!-- 数据表编码 -->
				<div class="layui-form-item">
					<div class="layui-col-xs11 layui-col-xs-offset1">
						<label class="layui-form-label">数据表编码</label>
						<div class="layui-input-inline">
							<select lay-filter="tableComment" id="tableComment" autocomplete="off" lay-search>
								<option value="">请选择数据表编码</option>
								<c:forEach var="item" items="${genTableList}">
									<option value="${item.tableComment}">${item.tableComment}</option>
								</c:forEach>
							</select>
						
							<input type="hidden" name="tableCode" id="tableCode" placeholder="请输入数据表编码" 
								autocomplete="off" class="layui-input" value="${wisDataImportTab.tableCode}" maxlength="25">
						</div>
					</div>
				</div>
				
				<!-- 数据导入配置名称 -->
				<div class="layui-form-item">
					<div class="layui-col-xs11 layui-col-xs-offset1">
						<label class="layui-form-label">数据表名称&nbsp;<span style="color: red;">*</span></label>
						<div class="layui-input-inline">
							<input type="text" name="tabName" lay-verify="required" id="tabName" placeholder="请输入数据表名称" 
								autocomplete="off" class="layui-input" value="${wisDataImportTab.tabName}" maxlength="25">
						</div>
					</div>
				</div>
				
				<!-- EXCEL文件名 -->
				<div class="layui-form-item">
					<div class="layui-col-xs11 layui-col-xs-offset1">
						<label class="layui-form-label">EXCEL文件名&nbsp;<span style="color: red;">*</span></label>
						<div class="layui-input-inline">
							<input type="text" name="fileName" lay-verify="required" readonly="readonly" id="fileName" placeholder="请上传EXCEL文件" 
								autocomplete="off" class="layui-input" value="${wisDataImportTab.fileName}" maxlength="25">
						</div>
					</div>
				</div>
				
				<!-- 文件路径 -->
				<div class="layui-form-item">
					<div class="layui-col-xs11 layui-col-xs-offset1">
						<label class="layui-form-label">文件上传&nbsp;<span style="color: red;">*</span></label>
						<div class="layui-input-inline">
							<button class="layui-btn layui-btn-primary" id="uploadExcel" type="button" style="background-color:#5FB878;">
								<i class="layui-icon" style="color:white;">&#xe62f;</i><span style="color:white;">上传EXCEL文件</span>
							</button>
						
							<input type="hidden" name="fileUrl" id="fileUrl" autocomplete="off" class="layui-input" value="${wisDataImportTab.fileUrl}">
							<input type="hidden" name="excelHeader" id="excelHeader" autocomplete="off" class="layui-input" value="${wisDataImportTab.excelHeader}">
						</div>
					</div>
				</div>
				
				<!-- 上传进度条，默认为不显示，上传过程中展开；上传完成后回调隐藏 -->
				<div class="layui-form-item">
					<div class="layui-col-xs11 layui-col-xs-offset1" style="width: 64rem;">
						<div id="uploadLoadingDiv" style="display: none;">
							<br/>
							<div class="layui-progress" lay-showpercent="true" lay-filter="demo">
								<div class="layui-progress-bar layui-bg-red" id="layPercent" lay-percent="0%"></div>
							</div>
						</div>
					</div>
				</div>
				
				<!-- 启用状态 -->
				<div class="layui-form-item">
					<div class="layui-col-xs11 layui-col-xs-offset1">
						<label class="layui-form-label">启用状态&nbsp;<span style="color: red;">*</span></label>
						<div class="layui-input-inline">
							<input type="radio" name="isEnable" ${wisDataImportTab.isEnable eq '0'?'':'checked'} value="1" title="启用" /> 
							<input type="radio" name="isEnable" ${wisDataImportTab.isEnable eq '0'?'checked':''} value="0" title="禁用" />
						</div>
					</div>
				</div>
				
				<c:if test="${wisDataImportTab.id != null}">
					<div class="layui-form-item">
						<div class="layui-col-xs11 layui-col-xs-offset1">
							<label class="layui-form-label">EXCEL列头</label>
							<div class="layui-input-inline">
								<textarea placeholder="请上传EXCEL文件" readonly="readonly" class="layui-textarea">${wisDataImportTab.excelHeader}</textarea>
							</div>
						</div>
					</div>
				</c:if>
				
				<!-- 版本描述 -->
				<div class="layui-form-item">
					<div class="layui-col-xs11 layui-col-xs-offset1">
						<label class="layui-form-label">备注</label>
						<div class="layui-input-inline">
							<textarea placeholder="请输入备注" maxlength="100" name="remark" class="layui-textarea">${wisDataImportTab.remark}</textarea>
						</div>
					</div>
				</div>
				
			</div>
			
			<!-- 标准化表单提交按钮 -->
			<%@ include file="/WEB-INF/views/modules/templet/form/templetSubmitButton.jsp" %>
		</form>
	</div>
	
	<!-- 标准化表单提交JS -->
	<script type="text/javascript">
		var rootUrl =  $("#rootUrl").val(); // 访问路径
		var tableName = $("#tableName").val(); // 表名
	
		layui.use(['layer','form'], function() {
			var layer = layui.layer, form = layui.form;
			
			form.render();
			
			form.on('select(tableComment)', function(data) { 
				var tableComment = data.value;
				var tableArr = tableComment.split(":");
				$("#tableCode").val(tableArr[0]);
				$("#tabName").val(tableArr[1]);
			});
			
			form.on('submit(formDemos)', function(data) {
				
				var tableCode = $("#tableCode").val();
				
				if (tableCode == "") {
					
					layer.msg("请选择数据表编码", { icon: 5 });
				
				} else {
					
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
							
							if(obj.code == 1){	// 新增成功
								layer.msg(obj.msg, { icon: 6 });
								setTimeout(function(){window.location.href= rootUrl + "/show"; }, 1000);
							} else if(obj.code == -1){	// 新增失败
								layer.msg(obj.msg, { icon: 5 });
							} else if(obj.code == 2){	// 修改成功
								layer.msg(obj.msg, { icon: 6 });
								var localStoragePage = localStorage.getItem("data-page");  // 获取本地存储page信息
								setTimeout(function(){window.location.href= rootUrl + "/show?localStoragePage="+localStoragePage; }, 1000);
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
					
					
				}
				
				return false;
			});
		});
	</script>
	
	<!-- 导入接口 -->
	<script type="text/javascript">
		var rootUrl =  $("#rootUrl").val();
	
		layui.use(['upload','layer', 'element'], function(){
			var upload = layui.upload , element = layui.element, layer = layui.layer;
			
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
				elem : '#uploadExcel' //绑定元素
				, url : rootUrl + '/upExcel' //上传接口
				, method : "POST"
				, accept : 'file'
				, exts : 'xls|xlsx'
				, xhr : xhrOnProgress
				, progress : function(value) {//上传进度回调 value进度值
					console.log(value);
					element.progress('demo', value + '%')//设置页面进度条
				}
				, choose : function(obj) { // 选择完文件触发事件
					var length = obj.preview.length;
					if (length > 0) {
						layer.msg("EXCEL文件正在上传，上传成功后才可点击保存");
						$(".subMit").attr({ "disabled" : "disabled" });
						$("#uploadLoadingDiv").css('display','inline');
					}
				}
				, done : function(res) {

					if (res.code == 1) {
						setTimeout(function() {
							layer.msg("上传EXCEL文件成功", { icon : 6 });
							console.log(res.data);

							var data = res.data; // 回显信息
							var fileName = data.fileName; // 高度
							var fileUrl = data.fileUrl; // 宽度
							var excelHeader = data.excelHeader;	// 头部JSON数据

							$("#fileName").val(fileName);
							$("#fileUrl").val(fileUrl);
							$("#excelHeader").val(excelHeader);
							$(".subMit").removeAttr("disabled");
							
							// 回调成功后-设置进度条隐藏
							$("#layPercent").attr("lay-percent","0%");
							$("#layPercent").css("width","0%");
							$(".layui-progress-text").text("0%");
							$("#uploadLoadingDiv").css('display','none');
							
						}, 1000);

					} else {
						layer.msg("上传EXCEL文件失败", { icon : 5 });
					}
				}
			});
		});
	</script>

</body>
</html>