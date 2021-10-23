<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>协议类型信息管理</title>
	
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
		
	    <fieldset class="layui-elem-field layui-field-title">
		   	<legend>
		        <c:choose>
					<c:when test="${is eq 'show'}">
		        		协议类型信息查看
		        	</c:when>
					<c:otherwise>
		        		协议类型信息${wisAgreementType.id eq null ?'添加':'修改'}
		        	</c:otherwise>
				</c:choose>
		    </legend>
		</fieldset>
		
		<form class="layui-form layui-form-pane" action="" style="margin-top: 1em;">
			<div id="dis">
				<input type="hidden" name="id" value="${wisAgreementType.id}" />
				
				<div class="layui-form-item">
					<div class="layui-col-xs12">
						<label class="layui-form-label">协议类型编码&nbsp;<span style="color: red;">*</span></label>
						<div class="layui-input-inline">
							<input type="text" name="agreementCode" lay-verify="required" placeholder="请输入协议类型编码" 
								autocomplete="off" class="layui-input" value="${wisAgreementType.agreementCode}" maxlength="10">
						</div>
					</div>
				</div>
				
				<div class="layui-form-item">
					<div class="layui-col-xs12">
						<label class="layui-form-label">协议类型名称&nbsp;<span style="color: red;">*</span></label>
						<div class="layui-input-inline">
							<input type="text" name="agreementType" lay-verify="required" placeholder="请输入协议类型名称" 
								autocomplete="off" class="layui-input" value="${wisAgreementType.agreementType}" maxlength="10">
						</div>
					</div>
				</div>
				
				<!-- 启用状态 -->
				<div class="layui-form-item">
					<div class="layui-col-xs12">
						<label class="layui-form-label">启用状态&nbsp;<span style="color: red;">*</span></label>
						<div class="layui-input-inline">
							<input type="radio" name="isEnable" ${wisAgreementType.isEnable eq '0'?'':'checked'} value="1" title="启用" /> 
							<input type="radio" name="isEnable" ${wisAgreementType.isEnable eq '0'?'checked':''} value="0" title="禁用" />
						</div>
					</div>
				</div>
				
				<!-- 备注 -->
				<div class="layui-form-item">
					<div class="layui-col-xs12">
						<label class="layui-form-label">备注</label>
						<div class="layui-input-inline">
							<textarea placeholder="请输入备注" maxlength="100" name="remark" class="layui-textarea">${wisAgreementType.remark}</textarea>
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