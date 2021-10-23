<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>协议内容信息管理</title>
	
	<!-- 标准化通用头部 -->
	<%@ include file="/WEB-INF/views/modules/templet/headExport/templetExport.jsp" %>
	
	<!-- 引入富文本框 -->
	<%@ include file="/WEB-INF/views/modules/templet/templetUeditor.jsp" %>
	
	<style type="text/css">
		/* 设置头部legend CSS样式 */
		.layui-field-title legend {
			margin-left: 35%;
		}
		
		/* 设置单文本框 文本框的宽度 */
		.layui-form-pane #dis .layui-form-item .layui-col-xs11 .layui-input-inline {
			width: 55rem;
		}
		
		.layui-form-pane #dis .layui-form-item .layui-col-xs11 .layui-form-label {
			width: 12%;
		}
		
		.layui-form-pane #dis .layui-form-item .layui-col-xs12 .layui-input-inline {
			width: 78%;
		}
		
		.layui-form-item .layui-col-xs12 .layui-form-label {
			width: 15%;
		}
		
		.layui-main {
			padding: 1rem; 
			margin-left: 1rem; 
			margin-top: -1rem; 
			width: 80%;	
		}
		
		/* 防止下拉框被富文本框遮挡 */
		.layui-form-select dl {
			z-index: 9999999999999999999999;
		}
	</style>
	
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
		        		协议内容信息查看
		        	</c:when>
					<c:otherwise>
		        		协议内容信息${wisAgreementContent.id eq null ?'添加':'修改'}
		        	</c:otherwise>
				</c:choose>
		    </legend>
		</fieldset>
		
		<form class="layui-form layui-form-pane" action="" style="margin-top: 1em;">
			<div id="dis">
				<input type="hidden" name="id" value="${wisAgreementContent.id}" />
				
				<!-- 协议标题 -->
				<div class="layui-form-item">
					<div class="layui-col-xs12">
						<label class="layui-form-label">协议标题&nbsp;<span style="color: red;">*</span></label>
						<div class="layui-input-inline">
							<input type="text" name="agreementTitle" lay-verify="required" id="agreementTitle" placeholder="请输入协议标题" 
								autocomplete="off" class="layui-input" value="${wisAgreementContent.agreementTitle}" maxlength="50">
						</div>
					</div>
				</div>
				
				<!-- 协议版本 -->
				<div class="layui-form-item">
					<div class="layui-col-xs12">
						<label class="layui-form-label">协议版本&nbsp;<span style="color: red;">*</span></label>
						<div class="layui-input-inline">
							<input type="text" name="agreementVersion" lay-verify="required" id="agreementVersion" placeholder="请输入协议版本" 
								autocomplete="off" class="layui-input" value="${wisAgreementContent.agreementVersion}" maxlength="10">
						</div>
					</div>
				</div>
				
				<!-- 协议类型 -->
				<div class="layui-form-item">
					<div class="layui-col-xs12">
						<label class="layui-form-label">协议类型&nbsp;<span style="color: red;">*</span></label>
						<div class="layui-input-inline">
							<select lay-filter="agreementId" lay-verify="required" id="agreementId" name="agreementId" autocomplete="off">
								<option value="">请选择协议类型</option>
								<c:forEach var="item" items="${agreementTypeList}">
									<option ${wisAgreementContent.agreementId eq item.id ? 'selected':'' } value="${item.id}">${item.agreementType}</option>
								</c:forEach>
							</select>
						</div>
					</div>
				</div>
				
				<!-- 第四行 -->
				<div class="layui-form-item">
					<div class="layui-col-xs12">
						<label class="layui-form-label">协议内容</label>
					</div>
				</div>
				<div class="layui-form-item" style="margin-top: -1rem;">
					<div class="layui-col-xs12">
						<textarea rows="20" cols="20" id="editor" name="agreementContent" style="width: 96.3%">
							${wisAgreementContent.agreementContent}
						</textarea>
						<script type="text/javascript" charset="utf-8">
							UE.getEditor('editor');
						</script>
					</div>
				</div>
				
				<!-- 启用状态 -->
				<div class="layui-form-item">
					<div class="layui-col-xs12">
						<label class="layui-form-label">启用状态&nbsp;<span style="color: red;">*</span></label>
						<div class="layui-input-inline">
							<input type="radio" name="isEnable" ${wisAgreementContent.isEnable eq '0'?'':'checked'} value="1" title="启用" /> 
							<input type="radio" name="isEnable" ${wisAgreementContent.isEnable eq '0'?'checked':''} value="0" title="禁用" />
						</div>
					</div>
				</div>
				
				<!-- 备注 -->
				<div class="layui-form-item">
					<div class="layui-col-xs12">
						<label class="layui-form-label">备注</label>
						<div class="layui-input-inline">
							<textarea placeholder="请输入备注" maxlength="100" name="remark" class="layui-textarea">${wisAgreementContent.remark}</textarea>
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