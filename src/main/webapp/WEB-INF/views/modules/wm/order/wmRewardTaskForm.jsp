<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>悬赏任务管理管理</title>
	
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
		        		基础订单信息查看
		        	</c:when>
					<c:otherwise>
		        		基础订单信息${wmRewardTask.id eq null ?'添加':'修改'}
		        	</c:otherwise>
				</c:choose>
			</legend>
		</fieldset>
	    
	    <!-- 主体内容 -->
	    <form class="layui-form layui-form-pane" action="" style="margin-top: 1em;">
			<div id="dis">
				<input type="hidden" name="id" value="${wmRewardTask.id}" />
				<input type="hidden" name="userId" value="${wmRewardTask.userId}" />
				
				<div class="layui-form-item">
					<div class="layui-col-xs12">
						<label class="layui-form-label">用户</label>
						<div class="layui-input-inline">
						
						<!-- lay-search -->
							<select lay-filter="userId" lay-verify="required" id="userId" name="userId" autocomplete="off" disabled="disabled">
								<option value="">请选择用户</option>
								<c:forEach var="item" items="${wmOrderInfoList}">
									<option ${wmRewardTask.userId eq item.id ? 'selected':'' } value="${item.id}">${item.phone}</option>
								</c:forEach>
							</select>
						
						</div>
					</div>
				</div>
				
				<div class="layui-form-item">
					<div class="layui-col-xs12">
						<label class="layui-form-label">订单号</label>
						<div class="layui-input-inline">
							<input type="text" name="ordernos" placeholder="请输入订单" readonly="readonly" 
								autocomplete="off" class="layui-input" value="${wmRewardTask.ordernos}" maxlength="10">
						</div>
					</div>
				</div>
				
				<div class="layui-form-item">
					<div class="layui-col-xs12">
						<label class="layui-form-label">预计出发时间&nbsp;<span style="color: red;">*</span></label>
						<div class="layui-input-inline">
							<input type="text" autocomplete="off" class="layui-input" id="startTime" lay-verify="required" name="startTime"
								value='<fmt:formatDate value="${wmRewardTask.startTime}" type="date"/>' maxlength="10">
						</div>
					</div>
				</div>
				
				<div class="layui-form-item">
					<div class="layui-col-xs12">
						<label class="layui-form-label">任务执行短地址&nbsp;<span style="color: red;">*</span></label>
						<div class="layui-input-inline">
							<input type="text" name="taskShortAddr" lay-verify="required" placeholder="请输入任务执行短地址"
								autocomplete="off" class="layui-input" value="${wmRewardTask.taskShortAddr}" maxlength="25">
						</div>
					</div>
				</div>
				
				<div class="layui-form-item">
					<div class="layui-col-xs12">
						<label class="layui-form-label">任务执行地址&nbsp;<span style="color: red;">*</span></label>
						<div class="layui-input-inline">
							<input type="text" name="taskAddr" lay-verify="required" placeholder="请输入任务执行地址"
								autocomplete="off" class="layui-input" value="${wmRewardTask.taskAddr}" maxlength="25">
						</div>
					</div>
				</div>
				
				<div class="layui-form-item">
					<div class="layui-col-xs12">
						<label class="layui-form-label">任务执行经度&nbsp;<span style="color: red;">*</span></label>
						<div class="layui-input-inline">
							<input type="text" name="taskLng" lay-verify="required" placeholder="请输入任务执行经度"
								autocomplete="off" class="layui-input" value="${wmRewardTask.taskLng}" maxlength="25">
						</div>
					</div>
				</div>
				
				<div class="layui-form-item">
					<div class="layui-col-xs12">
						<label class="layui-form-label">任务执行纬度&nbsp;<span style="color: red;">*</span></label>
						<div class="layui-input-inline">
							<input type="text" name="taskLat" lay-verify="required" placeholder="请输入任务执行纬度"
								autocomplete="off" class="layui-input" value="${wmRewardTask.taskLat}" maxlength="25">
						</div>
					</div>
				</div>
				
				<div class="layui-form-item">
					<div class="layui-col-xs12">
						<label class="layui-form-label">联系人&nbsp;<span style="color: red;">*</span></label>
						<div class="layui-input-inline">
							<input type="text" name="relation" lay-verify="required" placeholder="请输入联系人"
								autocomplete="off" class="layui-input" value="${wmRewardTask.relation}" maxlength="25">
						</div>
					</div>
				</div>
				
				<div class="layui-form-item">
					<div class="layui-col-xs12">
						<label class="layui-form-label">联系电话&nbsp;<span style="color: red;">*</span></label>
						<div class="layui-input-inline">
							<input type="text" name="relationTel" lay-verify="required|phone" placeholder="请输入联系电话"
								autocomplete="off" class="layui-input" value="${wmRewardTask.relationTel}" maxlength="11">
						</div>
					</div>
				</div>
				
				<div class="layui-form-item">
					<div class="layui-col-xs12">
						<label class="layui-form-label">悬赏金额&nbsp;<span style="color: red;">*</span></label>
						<div class="layui-input-inline">
							<input type="text" name="fee" lay-verify="required" placeholder="请输入悬赏金额" oninput ="value=value.replace(/[^0-9.]/g,'')"
								autocomplete="off" class="layui-input" value="${wmRewardTask.fee}" maxlength="25">
						</div>
					</div>
				</div>
				
				<div class="layui-form-item">
					<div class="layui-col-xs12">
						<label class="layui-form-label">支付状态&nbsp;<span style="color: red;">*</span></label>
						<div class="layui-input-inline">
							<input type="radio" name="payStatu" ${wmRewardTask.payStatu eq '1'?'checked':''} value="1" title="待支付" /> 
							<input type="radio" name="payStatu" ${wmRewardTask.payStatu eq '2'?'checked':''} value="2" title="成功支付" />
							<input type="radio" name="payStatu" ${wmRewardTask.payStatu eq '3'?'checked':''} value="3" title="支付失败" />
						</div>
					</div>
				</div>
				
				<div class="layui-form-item">
					<div class="layui-col-xs12">
						<label class="layui-form-label">支付时间</label>
						<div class="layui-input-inline">
							<input type="text" autocomplete="off" class="layui-input" id="payTime" readonly="readonly"
								value='<fmt:formatDate value="${wmRewardTask.payTime}" type="date"/>' maxlength="5">
						</div>
					</div>
				</div>
				
				<div class="layui-form-item">
					<div class="layui-col-xs12">
						<label class="layui-form-label">任务描述</label>
						<div class="layui-input-inline">
							<input type="text" name="taskDesc" placeholder="请输入任务描述" 
								autocomplete="off" class="layui-input" value="${wmRewardTask.taskDesc}" maxlength="100">
						</div>
					</div>
				</div>
				
				<div class="layui-form-item">
					<div class="layui-col-xs12">
						<label class="layui-form-label">备注</label>
						<div class="layui-input-inline">
							<input type="text" name="remark" placeholder="请输入备注" 
								autocomplete="off" class="layui-input" value="${wmRewardTask.remark}" maxlength="100">
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
	
	<!-- 模板年月格式化 -->
	<script type="text/javascript">
		layui.use('laydate', function() {
			var laydate = layui.laydate;
			laydate.render({
				elem : '#startTime',
				type : 'date'
			});
		})
	</script>
	
</body>
</html>