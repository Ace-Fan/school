<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>计费标准管理</title>
	
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
		        		计费标准信息查看
		        	</c:when>
					<c:otherwise>
		        		计费标准信息${wmLeasePriceStandard.id eq null ?'添加':'修改'}
		        	</c:otherwise>
				</c:choose>
		    </legend>
		</fieldset>
	    
	    <!-- 主体内容 -->
	    <form class="layui-form layui-form-pane" action="" style="margin-top: 1em;">
			<div id="dis">
				<input type="hidden" name="id" value="${wmLeasePriceStandard.id}" />
				<input type="hidden" name="carSpecId" id="carSpecId" value="${wmLeasePriceStandard.carSpecId}" />
				
				<c:if test="${wmLeasePriceStandard.id == null }">
					<div class="layui-form-item">
						<div class="layui-col-xs12">
							<label class="layui-form-label">车厢规格&nbsp;<span style="color: red;">*</span></label>
							<div class="layui-input-inline">
								<select lay-filter="carSpecId" lay-verify="required" autocomplete="off">
									<option value="">请选择车厢规格</option>
									<c:forEach var="item" items="${wmLeaseCarSpecList}">
										<option value="${item.id}-${item.carTypeName}-${item.carLength}">${item.id}-${item.carTypeName}-${item.carLength}</option>
									</c:forEach>
								</select>
							</div>
						</div>
					</div>
				</c:if>
				
				<c:if test="${wmLeasePriceStandard.id != null }">
					<div class="layui-form-item">
						<div class="layui-col-xs12">
							<label class="layui-form-label">新车厢规格</label>
							<div class="layui-input-inline">
								<select lay-filter="carSpecId" autocomplete="off">
									<option value="">请选择新车厢规格</option>
									<c:forEach var="item" items="${wmLeaseCarSpecList}">
										<option value="${item.id}-${item.carTypeName}-${item.carLength}">${item.id}-${item.carTypeName}-${item.carLength}</option>
									</c:forEach>
								</select>
							</div>
						</div>
					</div>
				</c:if>
				
				<div class="layui-form-item">
					<div class="layui-col-xs12">
						<label class="layui-form-label">车厢类型&nbsp;<span style="color: red;">*</span></label>
						<div class="layui-input-inline">
							<input type="text" lay-verify="required" placeholder="请选择车厢规格" readonly="readonly" id="carName"
								autocomplete="off" class="layui-input" value="${wmLeasePriceStandard.carName}" maxlength="25">
						</div>
					</div>
				</div>
				
				<div class="layui-form-item">
					<div class="layui-col-xs12">
						<label class="layui-form-label">车厢长度&nbsp;<span style="color: red;">*</span></label>
						<div class="layui-input-inline">
							<input type="text" id="carLength" lay-verify="required" placeholder="请选择车厢长度" readonly="readonly"
								autocomplete="off" class="layui-input" value="${wmLeasePriceStandard.carLength}" maxlength="25">
						</div>
					</div>
				</div>
				
				<div class="layui-form-item">
					<div class="layui-col-xs12">
						<label class="layui-form-label">估重起始点</label>
						<div class="layui-input-inline">
							<input type="text" name="estimateStart" placeholder="请输入估重起始点" 
								autocomplete="off" class="layui-input" value="${wmLeasePriceStandard.estimateStart}" maxlength="25">
						</div>
					</div>
				</div>
				
				<div class="layui-form-item">
					<div class="layui-col-xs12">
						<label class="layui-form-label">估重结束点</label>
						<div class="layui-input-inline">
							<input type="text" name="estimateEnd" placeholder="请输入估重结束点" 
								autocomplete="off" class="layui-input" value="${wmLeasePriceStandard.estimateEnd}" maxlength="25">
						</div>
					</div>
				</div>
				
				<div class="layui-form-item">
					<div class="layui-col-xs12">
						<label class="layui-form-label">起步价格&nbsp;<span style="color: red;">*</span></label>
						<div class="layui-input-inline">
							<input type="text" name="startPrice" lay-verify="required" placeholder="请输入起步价格" 
								autocomplete="off" class="layui-input" value="${wmLeasePriceStandard.startPrice}" maxlength="25">
						</div>
					</div>
				</div>
				
				<div class="layui-form-item">
					<div class="layui-col-xs12">
						<label class="layui-form-label">起步里程&nbsp;<span style="color: red;">*</span></label>
						<div class="layui-input-inline">
							<input type="text" name="startDistance" lay-verify="required" placeholder="请输入起步里程" 
								autocomplete="off" class="layui-input" value="${wmLeasePriceStandard.startDistance}" maxlength="25">
						</div>
					</div>
				</div>
				
				<div class="layui-form-item">
					<div class="layui-col-xs12">
						<label class="layui-form-label">超里程费&nbsp;<span style="color: red;">*</span></label>
						<div class="layui-input-inline">
							<input type="text" name="overDistanceFee" lay-verify="required" placeholder="请输入超里程费" 
								autocomplete="off" class="layui-input" value="${wmLeasePriceStandard.overDistanceFee}" maxlength="25">
						</div>
					</div>
				</div>
				
				<c:if test="${wmLeasePriceStandard.id != null }">
					<div class="layui-form-item">
						<div class="layui-col-xs12">
							<label class="layui-form-label">排序号&nbsp;<span style="color: red;">*</span></label>
							<div class="layui-input-inline">
								<input type="text" name="orderNo" lay-verify="required" placeholder="请输入排序号" 
									autocomplete="off" class="layui-input" value="${wmLeasePriceStandard.orderNo}" maxlength="25">
							</div>
						</div>
					</div>
				</c:if>
				
				<div class="layui-form-item">
					<div class="layui-col-xs12">
						<label class="layui-form-label">启用状态&nbsp;<span style="color: red;">*</span></label>
						<div class="layui-input-inline">
							<input type="radio" name="isEnable" ${wmLeasePriceStandard.isEnable eq '0'?'':'checked'} value="1" title="启用" /> 
							<input type="radio" name="isEnable" ${wmLeasePriceStandard.isEnable eq '0'?'checked':''} value="0" title="禁用" />
						</div>
					</div>
				</div>
				
				<div class="layui-form-item">
					<div class="layui-col-xs12">
						<label class="layui-form-label">备注</label>
						<div class="layui-input-inline">
							<textarea placeholder="请输入备注" maxlength="100" name="remark" class="layui-textarea">${wmLeasePriceStandard.remark}</textarea>
						</div>
					</div>
				</div>
				
			</div>
			
			<!-- 标准化表单提交按钮 -->
			<%@ include file="/WEB-INF/views/modules/templet/form/templetSubmitButton.jsp" %>
		</form>
	</div>
	
	<script type="text/javascript">
		
		layui.use(['layer','form'], function() {
			var layer = layui.layer, form = layui.form;
			
			// 监听搜索框下拉框选择为ALL时刷新表单
			form.on('select(carSpecId)', function(data) { 
				var date = data.value;
				var carName = date.split("-")[1];
				var carLength = date.split("-")[2];
				var carSpecId = date.split("-")[0];
				$("#carName").val(carName);
				$("#carLength").val(carLength);
				$("#carSpecId").val(carSpecId);
			});
			
		});
	</script>
	
	<!-- 标准化表单提交JS -->
	<%@ include file="/WEB-INF/views/modules/templet/form/templetSubmit.jsp" %>

</body>
</html>