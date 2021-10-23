<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>用户信息管理</title>
	
	<!-- 标准引入 -->
	<%@ include file="/WEB-INF/views/modules/templet/headExport/templetExport.jsp" %>
	
	<!-- 通用图片上传引入 -->
	<%@ include file="/WEB-INF/views/modules/templet/headExport/templetUploadExport.jsp" %>
	
	<!-- 三级联动引入 -->
	<link rel="stylesheet" href="${ctxStatic}/layui-selectThree/layui/css/layui.css">
	
	<!-- 标准化表格页面CSS -->
	<link rel="stylesheet" href="${ctxStatic}/app/form/templetForLine.css" />
	
</head>

<body>
	
	<!-- 标准化表单隐藏文本 -->
	<%@ include file="/WEB-INF/views/modules/templet/templetHide.jsp" %>
	
	<!-- 标准图片上传 -->
	<%@ include file="/WEB-INF/views/modules/templet/templetUpload.jsp" %>
	
	<!-- 主体内容 -->
	<div class="layui-main" style="margin-left: 1rem;">
		<!-- 头部标题内容 -->
  		<fieldset class="layui-elem-field layui-field-title">
		    <legend>
		        <c:choose>
					<c:when test="${is eq 'show'}">
		        		用户信息查看
		        	</c:when>
					<c:otherwise>
		        		用户信息${wmUserInfo.id eq null ?'添加':'修改'}
		        	</c:otherwise>
				</c:choose>
		    </legend>
		</fieldset>
	    
	    <!-- 主体内容 -->
	    <form class="layui-form layui-form-pane" action="" style="margin-top: 1em;">
			<div id="dis">
				<input type="hidden" name="id" value="${wmUserInfo.id}" />
				
				<div class="layui-form-item">
				
					<div class="layui-col-xs3">
						<label class="layui-form-label">联系电话&nbsp;<span style="color: red;">*</span></label>
						<div class="layui-input-inline">
							<input type="text" name="phone" lay-verify="required|phone" placeholder="请输入联系电话" readonly="readonly"
								autocomplete="off" class="layui-input" value="${wmUserInfo.phone}" maxlength="13">
						</div>
					</div>
					
					<div class="layui-col-xs3">
						<label class="layui-form-label">登录账户&nbsp;<span style="color: red;">*</span></label>
						<div class="layui-input-inline">
							<input type="text" name="loginName" lay-verify="required" placeholder="请输入登录账户" readonly="readonly"
								autocomplete="off" class="layui-input" value="${wmUserInfo.loginName}" maxlength="25">
						</div>
					</div>
				
					<div class="layui-col-xs3">
						<label class="layui-form-label">昵称&nbsp;<span style="color: red;">*</span></label>
						<div class="layui-input-inline">
							<input type="text" name="nickname" lay-verify="required" placeholder="请输入昵称"
								autocomplete="off" class="layui-input" value="${wmUserInfo.nickname}" maxlength="13">
						</div>
					</div>
					
					<div class="layui-col-xs3">
						<label class="layui-form-label" >是否启用&nbsp;<span style="color: red;">*</span></label>
						<div class="layui-input-inline" >
							<input type="radio" name="isEnable" ${wmUserInfo.isEnable eq '0'?'':'checked'} value="1" title="启用" /> 
							<input type="radio" name="isEnable" ${wmUserInfo.isEnable eq '0'?'checked':''} value="0" title="禁用" />
						</div>
					</div>
				
				</div>
				
				<div class="layui-form-item" id="area-picker">
				
					<div class="layui-col-xs3">
						
						<label class="layui-form-label">所在省&nbsp;<span style="color: red;">*</span></label>
			            <div class="layui-input-inline">
			            	<c:if test="${wmUserInfo.province == null }">
			            		<select name="province" class="province-selector" data-value="请选择省" lay-filter="province-1" lay-verify="required">
				                    <option value="">请选择省</option>
				                </select>
			            	</c:if>
			            	<c:if test="${wmUserInfo.province != null }">
			            		<select name="province" class="province-selector" data-value="${wmDriverInfo.province}" lay-filter="province-1" lay-verify="required">
				                    <option value="">请选择省</option>
				                </select>
			            	</c:if>
			            </div>
						
					</div>
					
					<div class="layui-col-xs3">
					
						<label class="layui-form-label" >所在市&nbsp;<span style="color: red;">*</span></label>
			            <div class="layui-input-inline" >
			            	<c:if test="${wmUserInfo.city == null }">
			            		<select name="city" class="city-selector" data-value="请选择市" lay-filter="city-1" lay-verify="required">
				                    <option value="">请选择市</option>
				                </select>
			            	</c:if>
			            	<c:if test="${wmUserInfo.city != null }">
			            		<select name="city" class="city-selector" data-value="${wmUserInfo.city}" lay-filter="city-1" lay-verify="required">
				                    <option value="">请选择市</option>
				                </select>
			            	</c:if>
			            </div>
					
					</div>
					
					<div class="layui-col-xs3">
					
						<label class="layui-form-label" >所在区&nbsp;<span style="color: red;">*</span></label>
			            <div class="layui-input-inline" >
			               	<c:if test="${wmUserInfo.country == null }">
			            		<select name="country" class="county-selector" data-value="请选择区" lay-filter="county-1">
				                    <option value="">请选择区</option>
				                </select>
			            	</c:if>
			            	<c:if test="${wmUserInfo.country != null }">
			            		<select name="country" class="county-selector" data-value="${wmUserInfo.country}" lay-filter="county-1">
				                    <option value="">请选择区</option>
				                </select>
			            	</c:if>
			            </div>
					
					</div>
					
					<div class="layui-col-xs3">
						
						<label class="layui-form-label">推荐人</label>
						<div class="layui-input-inline">
							<input type="text" name="pid" readonly="readonly" placeholder="请输入推荐人"  class="layui-input" maxlength="200" value="${wmUserInfo.pphone}">
						</div>
					
					</div>
				
		            
		            
				</div>
				
				<div class="layui-form-item">
				
					<div class="layui-col-xs6">
					
						<label class="layui-form-label" style="padding-left: 0rem;">微信OPENID</label>
						<div class="layui-input-inline">
							<input type="text" name="openid" readonly="readonly" placeholder="请输入微信OPENID" class="layui-input" maxlength="200" value="${wmUserInfo.openid}">
						</div>
						
					</div>
				
				
					<div class="layui-col-xs6">
						
						<label class="layui-form-label" style="padding-left: 0rem; width: 22%;">推荐人OPENID</label>
						<div class="layui-input-inline" style="width: 76%;">
							<input type="text" name="popenid" placeholder="请输入推荐人OPENID" readonly="readonly"
								class="layui-input" maxlength="200" value="${wmUserInfo.popenid}">
						</div>
					
					</div>
				
					
				</div>
				
				<div class="layui-form-item">
					<div class="layui-col-xs12">
						<label class="layui-form-label">备注</label>
						<div class="layui-input-inline">
							<textarea name="remark" placeholder="请输入备注" class="layui-textarea" maxlength="100">${wmUserInfo.remark}</textarea>
						</div>
					</div>
				</div>
				
				
				<div class="layui-form-item">
					
					<div class="layui-col-xs3">
					
						<label class="layui-form-label">头像&nbsp;<span style="color: red;">*</span></label>
						<div class="layui-input-inline">
							<div class="case">
								<c:if test="${wmUserInfo.headerImg != null}">
									<c:if test="${wmUserInfo.headerImg != ''}">
										<c:if test="${wmUserInfo.headerImg.indexOf('http')!=-1}">
											<div class="upload" action='${interfacePath}' data-value='${wmUserInfo.headerImg}' 
												id='imgerUploadId' data-num='1' data-type='png,jpg,jpeg' style="margin-left: 0rem; width: 97%;">
												<input type="hidden" id="valOne" size="100" name="headerImg" value="${wmUserInfo.headerImg}"/>
											</div>
										</c:if>
										
										<c:if test="${wmUserInfo.headerImg.indexOf('http')==-1}">
											<div class="upload" action='${interfacePath}' data-value='${imgServerPath}${wmUserInfo.headerImg}' 
												id='imgerUploadId' data-num='1' data-type='png,jpg,jpeg' style="margin-left: 0rem; width: 97%;">
												<input type="hidden" id="valOne" size="100" name="headerImg" value="${wmUserInfo.headerImg}"/>
											</div>
										</c:if>
									</c:if>
									
									<c:if test="${wmUserInfo.headerImg == ''}">
										<div class="upload" action='${interfacePath}' data-value=''
											id='imgerUploadId' data-num='1' data-type='png,jpg,jpeg' style="margin-left: 0rem; width: 97%;">
											<input type="hidden" id="valOne9" size="100" name="headerImg" value="${wmDriverInfo.headerImg}"/>
										</div>
									</c:if>
								</c:if>
								
								<c:if test="${wmUserInfo.headerImg == null}">
									<div class="upload" action='${interfacePath}' data-value='' id='imgerUploadId' data-num='1' data-type='png,jpg,jpeg' 
										style="margin-left: 0rem; width: 97%;">
										<input type="hidden" id="valOne" size="100" name="headerImg" value=""/>
									</div>
								</c:if>
							</div>
						
						</div>
					
					</div>
					
				</div>
				
			</div>
			
			<!-- 标准化表单提交按钮 -->
			<%@ include file="/WEB-INF/views/modules/templet/form/templetSubmitButton.jsp" %>
		</form>
	</div>
	
	<!-- 通用三级联动信息 -->
	<%@ include file="/WEB-INF/views/modules/templet/form/templetThreeArea.jsp" %>
	
	<!-- 标准化表单提交JS -->
	<%@ include file="/WEB-INF/views/modules/templet/form/templetSubMitDict.jsp" %>
</body>
</html>