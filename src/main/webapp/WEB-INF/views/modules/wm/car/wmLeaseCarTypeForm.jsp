<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>租车类型管理管理</title>
	
	<!-- 标准化通用头部 -->
	<%@ include file="/WEB-INF/views/modules/templet/headExport/templetExport.jsp" %>
	
	<!-- 图片上传插件 -->
	<script src="${ctxStatic}/imgerUpload/jquery.min.js"></script>
	<script src="${ctxStatic}/imgerUpload/jQuery.upload.min.js"></script>
	<link rel="stylesheet" href="${ctxStatic}/imgerUpload/upload.css">
	
	<!-- 标准化表格页面CSS -->
	<link rel="stylesheet" href="${ctxStatic}/app/form/templetOneLine.css" />
	
</head>
<body>
	
	<script type="text/javascript">
		$(function() {
			// 上传图片初始化
			$("#imgPath").upload(function(_this, data) {
				
			});
		});
	</script>
	
	<!-- 标准化表单隐藏文本 -->
	<%@ include file="/WEB-INF/views/modules/templet/templetHide.jsp" %>
	
	<!-- 主体内容 -->
	<div class="layui-main">
		<!-- 头部标题内容 -->
	  	<fieldset class="layui-elem-field layui-field-title">
		    <legend>
		        <c:choose>
					<c:when test="${is eq 'show'}">
		        		租车类型信息查看
		        	</c:when>
					<c:otherwise>
		        		租车类型信息${wmLeaseCarType.id eq null ?'添加':'修改'}
		        	</c:otherwise>
				</c:choose>
		    </legend>
		</fieldset>
	    
	    <!-- 主体内容 -->
	    <form class="layui-form layui-form-pane" action="" style="margin-top: 1em;">
			<div id="dis">
				<input type="hidden" name="id" value="${wmLeaseCarType.id}" />
				
				<div class="layui-form-item">
					<div class="layui-col-xs12">
						<label class="layui-form-label">租车类型编码&nbsp;<span style="color: red;">*</span></label>
						<div class="layui-input-inline">
							<input type="text" name="carCode" lay-verify="required" placeholder="请输入租车类型编码" 
								autocomplete="off" class="layui-input" value="${wmLeaseCarType.carCode}" maxlength="10">
						</div>
					</div>
				</div>
				
				<div class="layui-form-item">
					<div class="layui-col-xs12">
						<label class="layui-form-label">租车类型名称&nbsp;<span style="color: red;">*</span></label>
						<div class="layui-input-inline">
							<input type="text" name="carName" lay-verify="required" placeholder="请输入租车类型名称" 
								autocomplete="off" class="layui-input" value="${wmLeaseCarType.carName}" maxlength="25">
						</div>
					</div>
				</div>
				
				<c:if test="${wmLeaseCarType.id != null }">
					<div class="layui-form-item">
						<div class="layui-col-xs12">
							<label class="layui-form-label">租车类型排序号&nbsp;<span style="color: red;">*</span></label>
							<div class="layui-input-inline">
								<input type="text" name="orderNo" lay-verify="required" placeholder="请输入租车类型排序号" 
									autocomplete="off" class="layui-input" value="${wmLeaseCarType.orderNo}" maxlength="25">
							</div>
						</div>
					</div>
				</c:if>
				
				<div class="layui-form-item">
					<div class="layui-col-xs12">
						<label class="layui-form-label">启用状态&nbsp;<span style="color: red;">*</span></label>
						<div class="layui-input-inline">
							<input type="radio" name="isEnable" ${wmLeaseCarType.isEnable eq '0'?'':'checked'} value="1" title="启用" /> 
							<input type="radio" name="isEnable" ${wmLeaseCarType.isEnable eq '0'?'checked':''} value="0" title="禁用" />
						</div>
					</div>
				</div>
				
				<!-- 图片格式 -->
				<div class="layui-form-item">
					<div class="layui-col-xs12">
						<label class="layui-form-label">上传图片&nbsp;<span style="color: red;">*</span></label>
						
						<div class="layui-inline">
							<div class="caseS">
								<c:if test="${wmLeaseCarType.carImg != null}">
									<c:if test="${wmLeaseCarType.carImg != ''}">
										<div class="upload" action='${interfacePath}' data-value='${imgServerPath}${wmLeaseCarType.carImg}' 
											id='imgPath' data-num='1' data-type='png,jpg,jpeg'>
											<input type="hidden" id="valOne" size="100" name="carImg" value="${wmLeaseCarType.carImg}" />
										</div>		
									</c:if>
									<c:if test="${wmLeaseCarType.carImg == ''}">
										<div class="upload" action='${interfacePath}' data-value='' 
											id='imgPath' data-num='1' data-type='png,jpg,jpeg'>
											<input type="hidden" id="valOne" size="100" name="carImg" value="${wmLeaseCarType.carImg}" />
										</div>		
									</c:if>
								</c:if>
								<c:if test="${wmLeaseCarType.carImg == null}">
									<div class="upload" action='${interfacePath}' data-value='' id='imgPath' data-num='1' data-type='png,jpg,jpeg'>
										<input type="hidden" id="valOne" size="100" name="carImg" value="${wmLeaseCarType.carImg}" />
									</div>
								</c:if>
							</div>	
						</div>
					</div>
				</div>
				
				<!-- 备注 -->
				<div class="layui-form-item">
					<div class="layui-col-xs12">
						<label class="layui-form-label">备注</label>
						<div class="layui-input-inline">
							<textarea placeholder="请输入备注" maxlength="100" name="remark" class="layui-textarea">${wmLeaseCarType.remark}</textarea>
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

</body>
</html>