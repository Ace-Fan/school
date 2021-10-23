<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>保存评分类型信息管理</title>
	
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
		        		评分类型信息查看
		        	</c:when>
					<c:otherwise>
		        		评分类型信息${scGradeType.id eq null ?'添加':'修改'}
		        	</c:otherwise>
				</c:choose>
			</legend>
		</fieldset>
	    
	    <!-- 主体内容 -->
	    <form class="layui-form layui-form-pane" action="" style="margin-top: 1em;">
			<div id="dis">
				<input type="hidden" name="id" value="${scGradeType.id}" />
				
				<div class="layui-form-item">
					<div class="layui-col-xs12">
					<label class="layui-form-label">评分类型编码&nbsp;<span style="color: red;">*</span></label>
						<div class="layui-input-inline">
							<input type="text" name="code" lay-verify="required" placeholder="请输入评分类型编码" 
								autocomplete="off" class="layui-input" value="${scGradeType.code}" maxlength="10">
						</div>
					</div>
				</div>
				<div class="layui-form-item">
					<div class="layui-col-xs12">
						<label class="layui-form-label">评分类型名称&nbsp;<span style="color: red;">*</span></label>
						<div class="layui-input-inline">
							<input type="text" name="name" lay-verify="required" placeholder="请输入评分类型名称" 
								autocomplete="off" class="layui-input" value="${scGradeType.name}" maxlength="10">
						</div>
					</div>
				</div>
				<!-- 启用状态 -->
				<div class="layui-form-item">
					<div class="layui-col-xs12">
						<label class="layui-form-label">启用状态&nbsp;<span style="color: red;">*</span></label>
						<div class="layui-input-inline">
							<input type="radio" name="isEnable" ${scGradeType.isEnable eq '0'?'':'checked'} value="1" title="启用" /> 
							<input type="radio" name="isEnable" ${scGradeType.isEnable eq '0'?'checked':''} value="0" title="禁用" />
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