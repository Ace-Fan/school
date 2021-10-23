<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>收货地址信息管理</title>
	
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
		        		收货地址信息查看
		        	</c:when>
					<c:otherwise>
		        		收货地址信息${wisReceiveAddress.id eq null ?'添加':'修改'}
		        	</c:otherwise>
				</c:choose>
		    </legend>
		</fieldset>
		
		<form class="layui-form layui-form-pane" action="" style="margin-top: 1em;">
			<div id="dis">
				<input type="hidden" name="id" value="${wisReceiveAddress.id}" />
				
				<div class="layui-form-item">
					<div class="layui-col-xs12">
						<label class="layui-form-label">用户ID&nbsp;<span style="color: red;">*</span></label>
						<div class="layui-input-inline">
							<input type="text" name="userId" lay-verify="required" placeholder="请输入用户ID" 
								autocomplete="off" class="layui-input" value="${wisReceiveAddress.userId}" maxlength="10">
						</div>
					</div>
				</div>
				
				<div class="layui-form-item">
					<div class="layui-col-xs12">
						<label class="layui-form-label">收货人&nbsp;<span style="color: red;">*</span></label>
						<div class="layui-input-inline">
							<input type="text" name="name" lay-verify="required" placeholder="请输入收货人姓名" 
								autocomplete="off" class="layui-input" value="${wisReceiveAddress.name}" maxlength="10">
						</div>
					</div>
				</div>
				
				<div class="layui-form-item">
					<div class="layui-col-xs12">
						<label class="layui-form-label">手机号码&nbsp;<span style="color: red;">*</span></label>
						<div class="layui-input-inline">
							<input type="text" name="phone" lay-verify="required|phone" placeholder="请输入收货人手机号码" 
								autocomplete="off" class="layui-input" value="${wisReceiveAddress.phone}" maxlength="11">
						</div>
					</div>
				</div>
				
				<!-- 是否默认 -->
				<div class="layui-form-item">
					<div class="layui-col-xs12">
						<label class="layui-form-label">设置默认地址&nbsp;<span style="color: red;">*</span></label>
						<div class="layui-input-inline">
							<input type="radio" name="isDefault" ${wisReceiveAddress.isDefault eq '0'?'':'checked'} value="1" title="是" />
							<input type="radio" name="isDefault" ${wisReceiveAddress.isDefault eq '0'?'checked':''} value="0" title="否" />
						</div>
					</div>
				</div>
				
				<!-- 地区 -->
				<div class="layui-form-item">
					<div class="layui-col-xs12">
						<label class="layui-form-label">所在地区&nbsp;<span style="color:red;">*</span></label>
						
						<div class="layui-input-inline">
							<input type="text" name="city" autocomplete="off" id="city" class="layui-input" value="${wisReceiveAddress.city}"
								lay-verify="required" maxlength="20" placeholder="请输入所在地区">
						</div>
					</div>
				</div>
				
				<!-- 详细地址 -->
				<div class="layui-form-item">
					<div class="layui-col-xs12">
						<label class="layui-form-label">详细地址&nbsp;<span style="color: red;">*</span></label>
						<div class="layui-input-inline">
							<input type="text" name="detail" lay-verify="required" placeholder="请输入详细地址（街道、楼牌号等）" autocomplete="off"
								class="layui-input" value="${wisReceiveAddress.detail}" maxlength="50">
						</div>
					</div>
				</div>
				
				<!-- 城市code -->
				<%-- <div class="layui-form-item">
					<div class="layui-col-xs12">
						<label class="layui-form-label">城市Code&nbsp;<span style="color: red;">*</span></label>
						<div class="layui-input-inline">
							<input type="text" name="cityCode" lay-verify="required" placeholder="请输入城市Code" autocomplete="off"
								class="layui-input" id="cityCode" value="${wisReceiveAddress.cityCode}" maxlength="100">
						</div>
					</div>
				</div> --%>
				
				<!-- 邮编 -->
				<div class="layui-form-item">
					<div class="layui-col-xs12">
						<label class="layui-form-label">邮编</label>
						<div class="layui-input-inline">
							<input type="text" name="postcode" placeholder="请输入邮编" autocomplete="off" class="layui-input" 
								value="${wisReceiveAddress.postcode}" maxlength="6">
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
	
</body>
</html>