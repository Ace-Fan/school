<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>计费价格管理管理</title>
	
	<!-- 标准化通用头部 -->
	<%@ include file="/WEB-INF/views/modules/templet/headExport/templetExport.jsp" %>
	
	<!-- 标准化表格页面CSS -->
	<style type="text/css">
		/* 设置头部legend CSS样式 */
		.layui-field-title legend {
			margin-left: 35%;
		}
		
		.layui-form-pane #dis .layui-form-item .layui-col-xs12 .layui-input-inline {
			width: 78%;
		}
		
		.layui-form-item .layui-col-xs12 .layui-form-label {
			width: 15%;
		}
		
		.layui-form-pane #dis .layui-form-item .layui-col-xs6 .layui-input-inline {
			width: 56%;
		}
		
		.layui-form-item .layui-col-xs6 .layui-form-label {
			width: 30%;
		}
		
		.layui-main {
			padding: 1rem; 
			margin-left: 1rem; 
			margin-top: -1rem; 
			width: 80%;	
		}
	</style>
	
	
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
		        		计费价格查看
		        	</c:when>
					<c:otherwise>
		        		计费价格${wmChargePrice.id eq null ?'添加':'修改'}
		        	</c:otherwise>
				</c:choose>
		    </legend>
		</fieldset>
	    
	    <!-- 主体内容 -->
	    <form class="layui-form layui-form-pane" action="" style="margin-top: 1em;">
			<div id="dis">
				<input type="hidden" name="id" value="${wmChargePrice.id}" />
				
				<div class="layui-form-item">
					<div class="layui-col-xs12">
						<label class="layui-form-label">车型名称&nbsp;<span style="color: red;">*</span></label>
						<div class="layui-input-inline">
							<select lay-filter="carId" lay-verify="required" id="carId" name="carId" autocomplete="off">
								<option value="">请选择车型名称</option>
								<c:forEach var="item" items="${wmCarTypeList}">
									<option ${wmChargePrice.carId eq item.id ? 'selected':'' } value="${item.id}">${item.carName}</option>
								</c:forEach>
							</select>
						</div>
					</div>
				</div>
				
				<div class="layui-form-item">
					<div class="layui-col-xs6">
						<label class="layui-form-label">起步价格（元）&nbsp;<span style="color: red;">*</span></label>
						<div class="layui-input-inline">
							<input type="text" name="startPrice" lay-verify="required" placeholder="请输入起步价格（元）" oninput="value=value.replace(/[^\d]/g,'')"
								autocomplete="off" class="layui-input" value="${wmChargePrice.startPrice}" maxlength="25">
						</div>
					</div>
					
					<div class="layui-col-xs6">
						<label class="layui-form-label">起步里程（公里）&nbsp;<span style="color: red;">*</span></label>
						<div class="layui-input-inline">
							<input type="text" name="startDistance" lay-verify="required" placeholder="请输入起步里程（公里）"  oninput="value=value.replace(/[^\d]/g,'')"
								autocomplete="off" class="layui-input" value="${wmChargePrice.startDistance}" maxlength="25">
						</div>
					</div>
				</div>
				
				<div class="layui-form-item">
					<div class="layui-col-xs6">
						<label class="layui-form-label">超里程费（元/公里）&nbsp;<span style="color: red;">*</span></label>
						<div class="layui-input-inline">
							<input type="text" name="overDistanceFee" lay-verify="required" placeholder="请输入超里程费（元/公里）"  oninput="value=value.replace(/[^\d]/g,'')"
								autocomplete="off" class="layui-input" value="${wmChargePrice.overDistanceFee}" maxlength="25">
						</div>
					</div>
				
					<div class="layui-col-xs6">
						<label class="layui-form-label">免费等候时间（分钟）&nbsp;<span style="color: red;">*</span></label>
						<div class="layui-input-inline">
							<input type="text" name="freeWaitTime" lay-verify="required" placeholder="请输入免费等候时间（分钟）"  oninput="value=value.replace(/[^\d]/g,'')"
								autocomplete="off" class="layui-input" value="${wmChargePrice.freeWaitTime}" maxlength="25">
						</div>
					</div>
				</div>
				
				<div class="layui-form-item">
					<div class="layui-col-xs6">
						<label class="layui-form-label">超时等候费（元/分钟）&nbsp;<span style="color: red;">*</span></label>
						<div class="layui-input-inline">
							<input type="text" name="overWaitFee" lay-verify="required" placeholder="请输入超时等候费（元/分钟）"  oninput ="value=value.replace(/[^0-9.]/g,'')"
								autocomplete="off" class="layui-input" value="${wmChargePrice.overWaitFee}" maxlength="25">
						</div>
					</div>
				
					<div class="layui-col-xs6">
						<label class="layui-form-label">搬运</label>
						<div class="layui-input-inline">
							<input type="text" name="carry" placeholder="请输入搬运" 
								autocomplete="off" class="layui-input" value="${wmChargePrice.carry}" maxlength="25">
						</div>
					</div>
				</div>
				
				<div class="layui-form-item">
					<div class="layui-col-xs6">
						<label class="layui-form-label">返程</label>
						<div class="layui-input-inline">
							<input type="text" name="backTrack" placeholder="请输入返程" 
								autocomplete="off" class="layui-input" value="${wmChargePrice.backTrack}" maxlength="25">
						</div>
					</div>
					
					<div class="layui-col-xs6">
						<label class="layui-form-label">返程费用比例</label>
						<div class="layui-input-inline">
							<input type="text" name="backTrackPercent" placeholder="请输入返程费用比例" oninput="value=value.replace(/[^0-9.]/g,'')"
								autocomplete="off" class="layui-input" value="${wmChargePrice.backTrackPercent}" maxlength="5">
						</div>
					</div>
				</div>
				
				<div class="layui-form-item">
					<div class="layui-col-xs12">
						<label class="layui-form-label">回单</label>
						<div class="layui-input-inline">
							<input type="text" name="receipt" placeholder="请输入回单" 
								autocomplete="off" class="layui-input" value="${wmChargePrice.receipt}" maxlength="25">
						</div>
					</div>
				</div>
				
				<div class="layui-form-item">
					<div class="layui-col-xs6">
						<label class="layui-form-label">尾板（元）</label>
						<div class="layui-input-inline">
							<input type="text" name="tailPlate" placeholder="请输入尾板（元）" 
								autocomplete="off" class="layui-input" value="${wmChargePrice.tailPlate}" maxlength="25">
						</div>
					</div>
					
					<div class="layui-col-xs6">
						<label class="layui-form-label">尾板加收金额</label>
						<div class="layui-input-inline">
							<input type="text" name="tailPlateFee" placeholder="请输入尾板加收金额"  oninput="value=value.replace(/[^\d]/g,'')"
								autocomplete="off" class="layui-input" value="${wmChargePrice.tailPlateFee}" maxlength="25">
						</div>
					</div>
				</div>
				
				<div class="layui-form-item">
					<div class="layui-col-xs12">
						<label class="layui-form-label">平板车</label>
						<div class="layui-input-inline">
							<input type="text" name="flatcar" placeholder="请输入平板车" 
								autocomplete="off" class="layui-input" value="${wmChargePrice.flatcar}" maxlength="25">
						</div>
					</div>
				</div>
				
				<div class="layui-form-item">
					<div class="layui-col-xs12">
						<label class="layui-form-label">货箱开顶</label>
						<div class="layui-input-inline">
							<input type="text" name="openTopBox" placeholder="请输入货箱开顶" 
								autocomplete="off" class="layui-input" value="${wmChargePrice.openTopBox}" maxlength="25">
						</div>
					</div>
				</div>
				
				<div class="layui-form-item">
					<div class="layui-col-xs12">
						<label class="layui-form-label">启用状态&nbsp;<span style="color: red;">*</span></label>
						<div class="layui-input-inline">
							<input type="radio" name="isEnable" ${wmChargePrice.isEnable eq '0'?'':'checked'} value="1" title="启用" /> 
							<input type="radio" name="isEnable" ${wmChargePrice.isEnable eq '0'?'checked':''} value="0" title="禁用" />
						</div>
					</div>
				</div>
				
				<div class="layui-form-item">
					<div class="layui-col-xs12">
						<label class="layui-form-label">备注</label>
						<div class="layui-input-inline">
							<textarea placeholder="请输入备注" maxlength="100" name="remark" class="layui-textarea">${wmChargePrice.remark}</textarea>
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