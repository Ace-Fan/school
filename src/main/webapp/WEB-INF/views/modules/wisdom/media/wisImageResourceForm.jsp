<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>图片资源信息管理</title>
	
	<!-- 标准化通用头部 -->
	<%@ include file="/WEB-INF/views/modules/templet/headExport/templetExport.jsp" %>
	
	<!-- 图片上传插件 -->
	<script src="${ctxStatic}/imgerUpload/jquery.min.js"></script>
	<script src="${ctxStatic}/imgerUpload/jQuery.upload.min.js"></script>
	<link rel="stylesheet" href="${ctxStatic}/imgerUpload/upload.css">
	
	<style type="text/css">
		.layui-field-title legend {
			margin-left: 30rem;
		}
		
		.layui-form-pane #dis .layui-form-item .layui-col-xs6 .layui-input-inline {
			width: 20rem;
		}
		
		.layui-form-pane #dis .layui-form-item .layui-col-xs6 .layui-form-label {
			width: 12rem;
		}
		
		.layui-form-pane #dis .layui-form-item .layui-col-xs12 .layui-form-label {
			width: 12rem;
		}
		
		.layui-form-pane #dis .layui-form-item .layui-col-xs12 .layui-input-inline {
			width: 55.6rem;
		}
	</style>
	
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
	<div class="layui-main" style="padding: 1rem; margin-left: 1rem; margin-top: 1rem;">
		
		<!-- 头部标题内容 -->
	  	<fieldset class="layui-elem-field layui-field-title">
		    <legend>
				<c:choose>
					<c:when test="${is == 'show'}">
		      			图片资源信息查看
		         	</c:when>
					<c:otherwise>
						图片资源信息${not empty wisImageResource.id?'修改':'添加'}
		      		</c:otherwise>
				</c:choose>
			</legend>
		</fieldset>
		
		<form class="layui-form layui-form-pane" action="" style="margin-top: 1em;">
			<div id="dis">
				<input type="hidden" name="id" value="${wisImageResource.id}" />
				
				<!-- 图片名称、图片所属类别 -->
				<div class="layui-form-item">
					<div class="layui-col-xs6">
						<label class="layui-form-label">图片名称&nbsp;<span style="color: red;">*</span></label>
						<div class="layui-input-inline">
							<input type="text" name="imgName" lay-verify="required" id="imgName" placeholder="请输入图片名称" 
								autocomplete="off" class="layui-input" value="${wisImageResource.imgName}" maxlength="50">
						</div>
					</div>
					
					<div class="layui-col-xs6">
						<label class="layui-form-label">图片所属类别&nbsp;<span style="color: red;">*</span></label>
						<div class="layui-input-inline">
							<select lay-verify="required" name="typeId" lay-filter="typeIdFilter" id="typeId">
								<option value="">请选择图片所属类别</option>
								<c:forEach items="${wisImageTypeList}" var="item">
									<option class="typeId" value="${item.typeCode}" ${item.typeCode eq wisImageResource.typeId ? 'selected' : '' }>${item.typeName}</option>
								</c:forEach>
							</select>
						</div>
					</div>
				</div>
				
				<!-- 图片限定宽度、图片限定高度 -->
				<div class="layui-form-item">
					<div class="layui-col-xs6">
						<label class="layui-form-label"> 图片限定宽度   &nbsp;<span style="color: red;">*</span> </label>
						<div class="layui-input-inline">
							<input type="text" name="imgLimitWidth" id="imgLimitWidth" readonly="readonly" value="${wisImageResource.imgLimitWidth}" 
								lay-verify="required" placeholder="请上传图片" autocomplete="off" class="layui-input">
						</div>
					</div>
					
					<div class="layui-col-xs6">
						<label class="layui-form-label"> 图片限定高度  &nbsp;<span style="color: red;">*</span> </label>
						<div class="layui-input-inline">
							<input type="text" name="imgLimitHeight" id="imgLimitHeight" readonly="readonly" value="${wisImageResource.imgLimitHeight}"
								lay-verify="required" placeholder="请上传图片" autocomplete="off" class="layui-input">
						</div>
					</div>
				</div>
				
				<!-- 图片限定格式、当前图片宽度 -->
				<div class="layui-form-item">
					
					<div class="layui-col-xs6">
						<label class="layui-form-label"> 图片限定格式  &nbsp;<span style="color: red;">*</span>  </label>
						<div class="layui-input-inline">
							<input type="text" name="imgLimitFormat" id="imgLimitFormat" readonly="readonly" value="${wisImageResource.imgLimitFormat}" 
								lay-verify="required" placeholder="请上传图片" autocomplete="off" class="layui-input">
						</div>
					</div>
					
					<div class="layui-col-xs6">
						<label class="layui-form-label"> 当前图片宽度 &nbsp;<span style="color: red;">*</span> </label>
						<div class="layui-input-inline">
							<input type="text" name="imgWidth" id="imgWidth" lay-verify="required" value="${wisImageResource.imgWidth}" 
								placeholder="请输入当前图片宽度" autocomplete="off" oninput="value=value.replace(/[^\d]/g,'')" class="layui-input" maxlength="5">
						</div>
					</div>
					
				</div>
				
				<!-- 当前图片宽度、当前图片格式 -->
				<div class="layui-form-item">
					
					<div class="layui-col-xs6">
						<label class="layui-form-label"> 当前图片高度  &nbsp;<span style="color: red;">*</span> </label>
						<div class="layui-input-inline">
							<input type="text" name="imgHeight" id="imgHeight" lay-verify="required" value="${wisImageResource.imgHeight}" 
								placeholder="请输入当前图片高度" oninput="value=value.replace(/[^\d]/g,'')" autocomplete="off" class="layui-input" maxlength="5">
						</div>
					</div>
					
					<div class="layui-col-xs6">
						<label class="layui-form-label"> 当前图片格式 &nbsp;<span style="color: red;">*</span></label>
						<div class="layui-input-inline">
							<input type="text" name="imgFormat" id="imgFormat" lay-verify="required" value="${wisImageResource.imgFormat}" 
								placeholder="请输入图片格式" autocomplete="off" class="layui-input" maxlength="5">
						</div>
					</div>
				</div>
				
				<div class="layui-form-item">
					<div class="layui-col-xs6">
						<label class="layui-form-label">是否启用&nbsp;<span style="color: red;">*</span></label>
						<div class="layui-input-block">
							<input type="radio" ${wisImageResource.isEnable eq '0'?'':'checked'} name="isEnable" value="1" title="启用" /> 
							<input type="radio" ${wisImageResource.isEnable eq '0'?'checked':''} name="isEnable" value="0" title="禁用" />
						</div>
					</div>
					
					
					<div class="layui-col-xs6">
						<label class="layui-form-label">上传图片&nbsp;<span style="color: red;">*</span></label>
					
						<div class="layui-inline">
							<div class="caseS">
								<c:if test="${wisImageResource.imgUrl != null}">
									<c:if test="${wisImageResource.imgUrl != ''}">
										<div class="upload" action='${interfacePath}' data-value='${imgServerPath}${wisImageResource.imgUrl}' 
											id='imgPath' data-num='1' data-type='png,jpg,jpeg'>
											<input type="hidden" id="valOne" size="100" name="imgUrl" value="${wisImageResource.imgUrl}" />
										</div>		
									</c:if>
									<c:if test="${wisImageResource.imgUrl == ''}">
										<div class="upload" action='${interfacePath}' data-value='' 
											id='imgPath' data-num='1' data-type='png,jpg,jpeg'>
											<input type="hidden" id="valOne" size="100" name="imgUrl" value="${wisImageResource.imgUrl}" />
										</div>		
									</c:if>
								</c:if>
								<c:if test="${wisImageResource.imgUrl == null}">
									<div class="upload" action='${interfacePath}' data-value='' id='imgPath' data-num='1' data-type='png,jpg,jpeg'>
										<input type="hidden" id="valOne" size="100" name="imgUrl" value="${wisImageResource.imgUrl}" />
									</div>
								</c:if>
							</div>	
						</div>
					
					</div>
				</div>
				
				<div class="layui-form-item">
					<div class="layui-col-xs12">
						<label class="layui-form-label">当前图片描述</label>
						<div class="layui-input-inline">
							<input type="text" name="imgDesc" value="${wisImageResource.imgDesc}" placeholder="请输入图片描述"
								autocomplete="off" class="layui-input" maxlength="100">
						</div>
					</div>
				</div>
				
				<div class="layui-form-item">
					<div class="layui-col-xs12">
						<label class="layui-form-label">备注</label>
						<div class="layui-input-inline">
							<input type="text" name="remark" value="${wisImageResource.remark}" placeholder="请输入备注"
								autocomplete="off" class="layui-input" maxlength="100">
						</div>
					</div>
				</div>
				
				<div class="layui-form-item">
					<div class="layui-col-xs12">
						<label class="layui-form-label">图片跳转URL</label>
						<div class="layui-input-inline">
							<textarea name="goUrl" maxlength="200" style="width: 55.7rem;" autocomplete="off" 
								placeholder="请输入图片跳转URL" class="layui-textarea">${wisImageResource.goUrl}</textarea>
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