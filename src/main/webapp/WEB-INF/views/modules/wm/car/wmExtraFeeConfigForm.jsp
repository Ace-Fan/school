<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>额外费用计算配置管理</title>
	
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
		        		额外费用计算配置信息查看
		        	</c:when>
					<c:otherwise>
		        		额外费用计算配置信息${wmExtraFeeConfig.id eq null ?'添加':'修改'}
		        	</c:otherwise>
				</c:choose>
		    </legend>
		</fieldset>
	    
	    <!-- 主体内容 -->
	    <form class="layui-form layui-form-pane" action="" style="margin-top: 1em;">
			<div id="dis">
				<input type="hidden" name="id" value="${wmExtraFeeConfig.id}" />
				
				<div class="layui-form-item">
					<div class="layui-col-xs12">
						<label class="layui-form-label">租车类型&nbsp;<span style="color: red;">*</span></label>
						<div class="layui-input-inline">
							<select lay-filter="agreementId" lay-verify="required" id="carId" name="carId" autocomplete="off">
								<option value="">请选择租车类型</option>
								<c:forEach var="item" items="${wmLeaseCarTypeList}">
									<option ${wmExtraFeeConfig.carId eq item.id ? 'selected':'' } value="${item.id}">${item.carName}</option>
								</c:forEach>
							</select>
						</div>
					</div>
				</div>
				
				<div class="layui-form-item">
					<div class="layui-col-xs12">
						<label class="layui-form-label">配置名称&nbsp;<span style="color: red;">*</span></label>
						<div class="layui-input-inline">
							<select lay-filter="configName" lay-verify="required" id="configName" name="configName" autocomplete="off">
								<option value="">请选择配置名称</option>
								<option ${wmExtraFeeConfig.configName eq '返程' ? 'selected':'' } value="返程">返程</option>
								<option ${wmExtraFeeConfig.configName eq '装卸货' ? 'selected':'' } value="装卸货">装卸货</option>
								<option ${wmExtraFeeConfig.configName eq '分发' ? 'selected':'' } value="分发">分发</option>
								<option ${wmExtraFeeConfig.configName eq '尾板' ? 'selected':'' } value="尾板">尾板</option>
								<option ${wmExtraFeeConfig.configName eq '高栏' ? 'selected':'' } value="高栏">高栏</option>
								<option ${wmExtraFeeConfig.configName eq '低栏' ? 'selected':'' } value="低栏">低栏</option>
								<option ${wmExtraFeeConfig.configName eq '平板' ? 'selected':'' } value="平板">平板</option>
								<option ${wmExtraFeeConfig.configName eq '搬运(议价)' ? 'selected':'' } value="搬运(议价)">搬运(议价)</option>
							</select>
						</div>
					</div>
				</div>
				
				<div class="layui-form-item">
					<div class="layui-col-xs12">
						<label class="layui-form-label">是否计费&nbsp;<span style="color: red;">*</span></label>
						<div class="layui-input-inline">
							<input type="radio" name="isCalcFee" ${wmExtraFeeConfig.isCalcFee eq '2'?'':'checked'} value="1" title="计费" /> 
							<input type="radio" name="isCalcFee" ${wmExtraFeeConfig.isCalcFee eq '2'?'checked':''} value="2" title="显示" />
						</div>
					</div>
				</div>
				
				<div class="layui-form-item">
					<div class="layui-col-xs12">
						<label class="layui-form-label">是否可输入&nbsp;<span style="color: red;">*</span></label>
						<div class="layui-input-inline">
							<input type="radio" name="isInput" ${wmExtraFeeConfig.isInput eq '0'?'':'checked'} value="1" title="可输入" /> 
							<input type="radio" name="isInput" ${wmExtraFeeConfig.isInput eq '0'?'checked':''} value="0" title="不可输入" />
						</div>
					</div>
				</div>
				
				<div class="layui-form-item">
					<div class="layui-col-xs12">
						<label class="layui-form-label">计费基准&nbsp;<span style="color: red;">*</span></label>
						<div class="layui-input-inline">
							<select lay-filter="calFeeBase" lay-verify="required" id="calFeeBase" name="calFeeBase" autocomplete="off">
								<option value="">请选择计费标准</option>
								<option ${wmExtraFeeConfig.calFeeBase eq '单程费用' ? 'selected':'' } value="单程费用">单程费用</option>
								<option ${wmExtraFeeConfig.calFeeBase eq '估重重量' ? 'selected':'' } value="估重重量">估重重量</option>
								<option ${wmExtraFeeConfig.calFeeBase eq '无' ? 'selected':'' } value="无">无</option>
							</select>
						</div>
					</div>
				</div>
				
				<div class="layui-form-item">
					<div class="layui-col-xs12">
						<label class="layui-form-label">计费比例&nbsp;<span style="color: red;">*</span></label>
						<div class="layui-input-inline">
							<input type="text" name="calcFeeRatio" lay-verify="required" placeholder="请输入计费比例"  oninput ="value=value.replace(/[^0-9.]/g,'')"
								autocomplete="off" class="layui-input" value="${wmExtraFeeConfig.calcFeeRatio}" maxlength="25">
						</div>
					</div>
				</div>
				
				<div class="layui-form-item">
					<div class="layui-col-xs12">
						<label class="layui-form-label">单价（元）&nbsp;<span style="color: red;">*</span></label>
						<div class="layui-input-inline">
							<input type="text" name="price" lay-verify="required" placeholder="请输入单价（元）"  oninput ="value=value.replace(/[^0-9.]/g,'')"
								autocomplete="off" class="layui-input" value="${wmExtraFeeConfig.price}" maxlength="25">
						</div>
					</div>
				</div>
				
				<c:if test="${wmExtraFeeConfig.id != null }">
					<div class="layui-form-item">
						<div class="layui-col-xs12">
							<label class="layui-form-label">排序号&nbsp;<span style="color: red;">*</span></label>
							<div class="layui-input-inline">
								<input type="text" name="orderNo" lay-verify="required" placeholder="请输入排序号" 
									autocomplete="off" class="layui-input" value="${wmExtraFeeConfig.orderNo}" maxlength="25">
							</div>
						</div>
					</div>
				</c:if>
				
				<div class="layui-form-item">
					<div class="layui-col-xs12">
						<label class="layui-form-label">启用状态&nbsp;<span style="color: red;">*</span></label>
						<div class="layui-input-inline">
							<input type="radio" name="isEnable" ${wmExtraFeeConfig.isEnable eq '0'?'':'checked'} value="1" title="启用" /> 
							<input type="radio" name="isEnable" ${wmExtraFeeConfig.isEnable eq '0'?'checked':''} value="0" title="禁用" />
						</div>
					</div>
				</div>
				
				<div class="layui-form-item">
					<div class="layui-col-xs12">
						<label class="layui-form-label">备注</label>
						<div class="layui-input-inline">
							<textarea placeholder="请输入备注" maxlength="100" name="remark" class="layui-textarea">${wmExtraFeeConfig.remark}</textarea>
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