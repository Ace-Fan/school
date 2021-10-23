<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>司机收入管理管理</title>
	
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
		        		司机收入信息查看
		        	</c:when>
					<c:otherwise>
		        		司机收入信息${wmUserWallet.id eq null ?'添加':'修改'}
		        	</c:otherwise>
				</c:choose>
			</legend>
		</fieldset>
	    
	    <!-- 主体内容 -->
	    <form class="layui-form layui-form-pane" action="" style="margin-top: 1em;">
			<div id="dis">
				<input type="hidden" name="id" value="${wmDriverWallet.id}" />
				<input type="hidden" name="userId" id="userId" value="${wmDriverWallet.userId}" />
				
				<div class="layui-form-item">
					<div class="layui-col-xs12">
						<label class="layui-form-label">司机联系电话&nbsp;<span style="color: red;">*</span></label>
						<div class="layui-input-inline">
							<select lay-filter="userId" lay-verify="required" autocomplete="off" lay-search>
								<option value="">请选择用户联系电话</option>
								<c:forEach var="item" items="${uwList}">
									<option ${wmDriverIncome.userId eq item.userId ? 'selected':'' } value="${item.userId}-${item.balance}-${item.userName}">${item.userName}</option>
								</c:forEach>
							</select>
						</div>
					</div>
				</div>
				
				<div class="layui-form-item">
					<div class="layui-col-xs12">
						<label class="layui-form-label">司机</label>
						<div class="layui-input-inline">
							<input type="text" id="userName" placeholder="请选择用户联系电话" readonly="readonly"
								autocomplete="off" class="layui-input" value="${wmDriverIncome.userName}" maxlength="25">
						</div>
					</div>
				</div>
				
				<div class="layui-form-item">
					<div class="layui-col-xs12">
						<label class="layui-form-label">用户余额</label>
						<div class="layui-input-inline">
							<input type="text" id="userBalance" placeholder="请选择用户联系电话" readonly="readonly"
								autocomplete="off" class="layui-input" value="${wmDriverIncome.userBalance}" maxlength="25">
						</div>
					</div>
				</div>
				
				<div class="layui-form-item">
					<div class="layui-col-xs12">
						<label class="layui-form-label">收入金钱&nbsp;<span style="color: red;">*</span></label>
						<div class="layui-input-inline">
							<input type="text" name="incomeAmount" lay-verify="required" placeholder="请输入当前收入" 
								autocomplete="off" class="layui-input" value="${wmDriverIncome.incomeAmount}" maxlength="25">
						</div>
					</div>
				</div>
				<c:if test="${wmDriverIncome.id != null }">
					<div class="layui-form-item">
						<div class="layui-col-xs12">
							<label class="layui-form-label">排序号&nbsp;<span style="color: red;">*</span></label>
							<div class="layui-input-inline">
								<input type="text" name="orderNo" lay-verify="required" placeholder="请输入司机收入排序号" 
									autocomplete="off" class="layui-input" value="${wmDriverIncome.orderNo}" maxlength="25">
							</div>
						</div>
					</div>
				</c:if>
				
				<div class="layui-form-item">
				<!-- 认证状态 -->
					<div class="layui-col-xs12">
						<label class="layui-form-label">认证状态&nbsp;<span style="color: red;">*</span></label>
						<div class="layui-input-inline">
							<c:choose>
								<c:when test="${wmDriverIncome.incomeType eq null}">
									<input type="radio" name="incomeType" checked="checked" value="1" title="运费" />
									<input type="radio" name="incomeType" value="2" title="额外费用"   />
									<input type="radio" name="incomeType" value="3" title="保证金" />
									<input type="radio" name="incomeType" value="4" title="推广佣金"   />
								</c:when>
								<c:otherwise>
									<input type="radio" name="incomeType" ${wmDriverIncome.incomeType eq '1'?'checked':''} value="1" title="运费"  />
									<input type="radio" name="incomeType" ${wmDriverIncome.incomeType eq '2'?'checked':''} value="2" title="额外费用" />
									<input type="radio" name="incomeType" ${wmDriverIncome.incomeType eq '3'?'checked':''} value="3" title="保证金"  />
									<input type="radio" name="incomeType" ${wmDriverIncome.incomeType eq '4'?'checked':''} value="4" title="推广佣金" />
								</c:otherwise>
							</c:choose>
						</div>
					</div>
				</div>
				
				<div class="layui-form-item">
					<div class="layui-col-xs12">
						<label class="layui-form-label">启用状态&nbsp;<span style="color: red;">*</span></label>
						<div class="layui-input-inline">
							<input type="radio" name="isEnable" ${wmDriverIncome.isEnable eq '0'?'':'checked'} value="1" title="启用" />&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<input type="radio" name="isEnable" ${wmDriverIncome.isEnable eq '0'?'checked':''} value="0" title="禁用" />
						</div>
					</div>
				</div>
				
				<div class="layui-form-item">
					<div class="layui-col-xs12">
						<label class="layui-form-label">备注</label>
						<div class="layui-input-inline">
							<textarea placeholder="请输入备注" maxlength="100" name="remark" class="layui-textarea">${wmDriverIncome.remark}</textarea>
						</div>
					</div>
				</div>
				
			</div>
			
			<!-- 标准化表单提交按钮 -->
			<%@ include file="/WEB-INF/views/modules/templet/form/templetSubmitButton.jsp" %>
		</form>
	</div>
	<script type="text/javascript">
	
		layui.use([ 'table', 'form' ], function() {
			var table = layui.table, form = layui.form;		// 声明layui的table，form
			
			form.on('select(userId)', function(data) { 
				var data = data.value;
				var userId = data.split("-")[0];
				var userBalance = data.split("-")[1];
				var userName = data.split("-")[2];
				$("#userId").val(userId);
				$("#userBalance").val(userBalance);
				$("#userName").val(userName);
				return false;
			});
		});
	</script>
	<!-- 标准化表单提交JS -->
	<%@ include file="/WEB-INF/views/modules/templet/form/templetSubmit.jsp" %>

</body>
</html>