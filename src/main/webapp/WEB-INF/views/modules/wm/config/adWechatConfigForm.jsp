<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>微信公众号配置管理管理</title>
	
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
		        		用户信息查看
		        	</c:when>
					<c:otherwise>
		        		用户信息${adWechatConfig.id eq null ?'添加':'修改'}
		        	</c:otherwise>
				</c:choose>
		    </legend>
		</fieldset>
	    
	    <!-- 主体内容 -->
	    <form class="layui-form layui-form-pane" action="" style="margin-top: 1em;">
			<div id="dis">
				<input type="hidden" name="id" value="${adWechatConfig.id}" />
				
				<div class="layui-form-item">
					<div class="layui-col-xs12">
						<label class="layui-form-label">名称&nbsp;<span style="color: red;">*</span></label>
						<div class="layui-input-inline">
							<input type="text" name="name" lay-verify="required" placeholder="请输入(公众号/小程序)名称"
								autocomplete="off" class="layui-input" value="${adWechatConfig.name}" maxlength="100">
						</div>
					</div>
				</div>
				
				<div class="layui-form-item">
					<div class="layui-col-xs12">
						<label class="layui-form-label">appId&nbsp;<span style="color: red;">*</span></label>
						<div class="layui-input-inline">
							<input type="text" name="appId" lay-verify="required" placeholder="请输入appId"
								autocomplete="off" class="layui-input" value="${adWechatConfig.appId}" maxlength="100">
						</div>
					</div>
				</div>
				
				<div class="layui-form-item">
					<div class="layui-col-xs12">
						<label class="layui-form-label">appsecret&nbsp;<span style="color: red;">*</span></label>
						<div class="layui-input-inline">
							<input type="text" name="secret" lay-verify="required" placeholder="请输入appsecret"
								autocomplete="off" class="layui-input" value="${adWechatConfig.secret}" maxlength="100">
						</div>
					</div>
				</div>
				
				<div class="layui-form-item">
					<div class="layui-col-xs12">
						<label class="layui-form-label">微信号</label>
						<div class="layui-input-inline">
							<input type="text" name="wechatid" placeholder="请输入微信号"
								autocomplete="off" class="layui-input" value="${adWechatConfig.wechatid}" maxlength="100">
						</div>
					</div>
				</div>
				
				<div class="layui-form-item">
					<div class="layui-col-xs12">
						<label class="layui-form-label">jsapiTicket</label>
						<div class="layui-input-inline">
							<input type="text" name="jsapiTicket" placeholder="请输入jsapiTicket"
								autocomplete="off" class="layui-input" value="${adWechatConfig.jsapiTicket}" maxlength="100">
						</div>
					</div>
				</div>
				
				<div class="layui-form-item">
					<div class="layui-col-xs12">
						<label class="layui-form-label">微信支付商户号&nbsp;<span style="color: red;">*</span></label>
						<div class="layui-input-inline">
							<input type="text" name="mchId" lay-verify="required" placeholder="请输入微信支付商户号"
								autocomplete="off" class="layui-input" value="${adWechatConfig.mchId}" maxlength="100">
						</div>
					</div>
				</div>
				
				<div class="layui-form-item">
					<div class="layui-col-xs12">
						<label class="layui-form-label">微信支付apiKey&nbsp;<span style="color: red;">*</span></label>
						<div class="layui-input-inline">
							<input type="text" name="apikey" lay-verify="required" placeholder="请输入微信支付apiKey"
								autocomplete="off" class="layui-input" value="${adWechatConfig.apikey}" maxlength="100">
						</div>
					</div>
				</div>
				
				<div class="layui-form-item">
					<div class="layui-col-xs12">
						<label class="layui-form-label">启用状态&nbsp;<span style="color: red;">*</span></label>
						<div class="layui-input-inline">
							<input type="radio" name="isEnable" ${adWechatConfig.isEnable eq '0'?'':'checked'} value="1" title="启用" /> 
							<input type="radio" name="isEnable" ${adWechatConfig.isEnable eq '0'?'checked':''} value="0" title="禁用" />
						</div>
					</div>
				</div>
				
				
				<div class="layui-form-item">
					<div class="layui-col-xs12">
						<label class="layui-form-label">accessToken</label>
						<div class="layui-input-inline">
							<textarea maxlength="1000" name="accessToken" class="layui-textarea">${adWechatConfig.accessToken}</textarea>
						</div>
					</div>
				</div>
				
				<div class="layui-form-item">
					<div class="layui-col-xs12">
						<label class="layui-form-label">token更新时间</label>
						<div class="layui-input-inline">
							<input type="text" autocomplete="off" class="layui-input" id="tokenUpdateTime"
								readonly="readonly" value='<fmt:formatDate value="${adWechatConfig.tokenUpdateTime}" type="date"/>'>
						</div>
					</div>
				</div>
				
				<div class="layui-form-item">
					<div class="layui-col-xs12">
						<label class="layui-form-label">备注</label>
						<div class="layui-input-inline">
							<textarea placeholder="请输入备注" maxlength="100" name="remark" class="layui-textarea">${adWechatConfig.remark}</textarea>
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