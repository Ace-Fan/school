<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>车型规格管理管理</title>
	
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
		        		车厢规格信息查看
		        	</c:when>
					<c:otherwise>
		        		车厢规格信息${wmLeaseCarSpec.id eq null ?'添加':'修改'}
		        	</c:otherwise>
				</c:choose>
		    </legend>
		</fieldset>
	    
	    <!-- 主体内容 -->
	    <form class="layui-form layui-form-pane" action="" style="margin-top: 1em;">
			<div id="dis">
				<input type="hidden" name="id" value="${wmLeaseCarSpec.id}" />
				
				<div class="layui-form-item">
					<div class="layui-col-xs12">
						<label class="layui-form-label">车厢类型&nbsp;<span style="color: red;">*</span></label>
						<div class="layui-input-inline">
							<select lay-filter="agreementId" lay-verify="required" id="carId" name="carId" autocomplete="off">
								<option value="">请选择车厢类型</option>
								<c:forEach var="item" items="${wmLeaseCarTypeList}">
									<option ${wmLeaseCarSpec.carId eq item.id ? 'selected':'' } value="${item.id}">${item.carName}</option>
								</c:forEach>
							</select>
						</div>
					</div>
				</div>
				
				
				<div class="layui-form-item">
					<div class="layui-col-xs12">
						<label class="layui-form-label">货厢长&nbsp;<span style="color: red;">*</span></label>
						<div class="layui-input-inline">
							<input type="text" name="carLength" lay-verify="required" placeholder="请输入货厢长" 
								autocomplete="off" class="layui-input" value="${wmLeaseCarSpec.carLength}" maxlength="25">
						</div>
					</div>
				</div>
				
				<c:if test="${wmLeaseCarSpec.id != null }">
					<div class="layui-form-item">
						<div class="layui-col-xs12">
							<label class="layui-form-label">排序号&nbsp;<span style="color: red;">*</span></label>
							<div class="layui-input-inline">
								<input type="text" name="orderNo" lay-verify="required" placeholder="请输入排序号" 
									autocomplete="off" class="layui-input" value="${wmLeaseCarSpec.orderNo}" maxlength="25">
							</div>
						</div>
					</div>
				</c:if>
				
				<div class="layui-form-item">
					<div class="layui-col-xs12">
						<label class="layui-form-label">启用状态&nbsp;<span style="color: red;">*</span></label>
						<div class="layui-input-inline">
							<input type="radio" name="isEnable" ${wmLeaseCarSpec.isEnable eq '0'?'':'checked'} value="1" title="启用" /> 
							<input type="radio" name="isEnable" ${wmLeaseCarSpec.isEnable eq '0'?'checked':''} value="0" title="禁用" />
						</div>
					</div>
				</div>
				
				<div class="layui-form-item">
					<div class="layui-col-xs12">
						<label class="layui-form-label">备注</label>
						<div class="layui-input-inline">
							<textarea placeholder="请输入备注" maxlength="100" name="remark" class="layui-textarea">${wmLeaseCarSpec.remark}</textarea>
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