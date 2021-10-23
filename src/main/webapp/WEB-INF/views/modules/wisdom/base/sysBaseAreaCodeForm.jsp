<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>行政区划编码管理</title>
	
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
		<!-- 引入行政区划表单头部信息 -->
	    <fieldset class="layui-elem-field layui-field-title">
		   	<legend>
		        <c:choose>
					<c:when test="${is eq 'show'}">
		        		行政区划信息查看
		        	</c:when>
					<c:otherwise>
		        		行政区划信息类型${sysBaseAreaCode.id eq null ?'添加':'修改'}
		        	</c:otherwise>
				</c:choose>
		    </legend>
		</fieldset>
	
		<!-- 表单内容 -->
		<form class="layui-form layui-form-pane" action="" style="margin-top: 1rem;">
			<div id="dis">
				<input type="hidden" name="id" value="${sysBaseAreaCode.id}">
		
				<div class="layui-form-item">
					<div class="layui-col-xs12">
						<label class="layui-form-label">编码&nbsp;<span style="color: red;">*</span></label>
						<div class="layui-input-inline">
							<input type="text" name="code" lay-verify="required" id="code" placeholder="请输入行政区划编码"
								autocomplete="off" class="layui-input" value="${sysBaseAreaCode.code}" maxlength="10">
						</div>
					</div>
				</div>
				
				<div class="layui-form-item">
					<div class="layui-col-xs12">
						<label class="layui-form-label">名称&nbsp;<span style="color: red;">*</span></label>
						<div class="layui-input-inline">
							<input type="text" name="name" lay-verify="required" id="name" placeholder="请输入行政区划名称"
								autocomplete="off" class="layui-input" value="${sysBaseAreaCode.name}" maxlength="10">
						</div>
					</div>
				</div>
				
				<div class="layui-form-item">
					<div class="layui-col-xs12">
						<label class="layui-form-label">当前级别&nbsp;<span style="color: red;">*</span></label>
						<div class="layui-input-inline">
							<input type="text" name="currLevel" lay-verify="required|number" id="currLevel" placeholder="请输入行政区划当前级别"
								autocomplete="off" class="layui-input" value="${sysBaseAreaCode.currLevel}" maxlength="10">
						</div>
					</div>
				</div>
				
				<div class="layui-form-item">
					<div class="layui-col-xs12">
						<label class="layui-form-label">统计编码&nbsp;<span style="color: red;">*</span></label>
						<div class="layui-input-inline">
							<input type="text" name="statisticsCode" lay-verify="required" id="statisticsCode" placeholder="请输入行政区划统计编码"
								autocomplete="off" class="layui-input" value="${sysBaseAreaCode.statisticsCode}" maxlength="10">
						</div>
					</div>
				</div>
				
				<div class="layui-form-item">
					<div class="layui-col-xs12">
						<label class="layui-form-label">拼音全码&nbsp;<span style="color: red;">*</span></label>
						<div class="layui-input-inline">
							<input type="text" name="spellFull" lay-verify="required" id="spellFull" placeholder="请输入行政区划拼音全码"
								autocomplete="off" class="layui-input" value="${sysBaseAreaCode.spellFull}" maxlength="10">
						</div>
					</div>
				</div>
				
				<div class="layui-form-item">
					<div class="layui-col-xs12">
						<label class="layui-form-label">拼音简码&nbsp;<span style="color: red;">*</span></label>
						<div class="layui-input-inline">
							<input type="text" name="spellShort" lay-verify="required" id="spellShort" placeholder="请输入行政区划拼音简码"
								autocomplete="off" class="layui-input" value="${sysBaseAreaCode.spellShort}" maxlength="10">
						</div>
					</div>
				</div>
				
				<div class="layui-form-item">
					<div class="layui-col-xs12">
						<label class="layui-form-label">助记码&nbsp;<span style="color: red;">*</span></label>
						<div class="layui-input-inline">
							<input type="text" name="shortCode" lay-verify="required" id="shortCode" placeholder="请输入行政区划助记码"
								autocomplete="off" class="layui-input" value="${sysBaseAreaCode.shortCode}" maxlength="10">
						</div>
					</div>
				</div>
				
				<div class="layui-form-item">
					<div class="layui-col-xs12">
						<label class="layui-form-label">父级编码&nbsp;<span style="color: red;">*</span></label>
						<div class="layui-input-inline">
							<input type="text" name="parentCode" lay-verify="required|number" id="parentCode" placeholder="请输入行政区划父级编码"
								autocomplete="off" class="layui-input" value="${sysBaseAreaCode.parentCode}" maxlength="10">
						</div>
					</div>
				</div>
		
				<div class="layui-form-item">
					<div class="layui-col-xs12">
						<label class="layui-form-label">是否启用&nbsp;<span style="color:red;">*</span></label>
						<div class="layui-input-block">
							<input type="radio" name="isEnable" ${sysBaseAreaCode.isEnable eq '0'?'':'checked'}  value="1" title="启用"  />
							<input type="radio" name="isEnable" ${sysBaseAreaCode.isEnable eq '0'?'checked':''} value="0" title="禁用" />
						</div>
					</div>
				</div>
		
				<div class="layui-form-item">
					<div class="layui-col-xs12">
						<label class="layui-form-label">备注</label>
		
						<div class="layui-input-inline">
							<textarea name="remark" maxlength="100" id="remark" placeholder="请输入备注" class="layui-textarea">${sysBaseAreaCode.remark}</textarea>
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