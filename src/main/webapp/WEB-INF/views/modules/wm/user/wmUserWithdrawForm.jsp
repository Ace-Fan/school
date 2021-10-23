<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>用户提现管理管理</title>
	
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
		        		用户提现信息查看
		        	</c:when>
					<c:otherwise>
		        		用户提现信息${wmUserWallet.id eq null ?'添加':'修改'}
		        	</c:otherwise>
				</c:choose>
			</legend>
		</fieldset>
	    
	    <!-- 主体内容 -->
	    <form class="layui-form layui-form-pane" action="" style="margin-top: 1em;">
			<div id="dis">
				<input type="hidden" name="id" value="${wmUserWithdraw.id}" />
				<input type="hidden" name="userId" id="userId" value="${wmUserWithdraw.userId}" />
				
				<div class="layui-form-item">
					<div class="layui-col-xs12">
						<label class="layui-form-label">用户联系电话&nbsp;<span style="color: red;">*</span></label>
						<div class="layui-input-inline">
							<select lay-filter="userId" lay-verify="required" autocomplete="off" lay-search>
								<option value="">请选择用户联系电话</option>
								<c:forEach var="item" items="${uwList}">
									<option ${wmUserWithdraw.userId eq item.userId ? 'selected':'' } value="${item.userId}-${item.balance}-${item.userName}">${item.userName}</option>
								</c:forEach>
							</select>
						</div>
					</div>
				</div>
				
				<div class="layui-form-item">
					<div class="layui-col-xs12">
						<label class="layui-form-label">用户</label>
						<div class="layui-input-inline">
							<input type="text" id="userName" placeholder="请选择用户联系电话" readonly="readonly"
								autocomplete="off" class="layui-input" value="${wmUserWithdraw.userName}" maxlength="25">
						</div>
					</div>
				</div>
				
				<div class="layui-form-item">
					<div class="layui-col-xs12">
						<label class="layui-form-label">用户余额</label>
						<div class="layui-input-inline">
							<input type="text" id="userBalance" placeholder="请选择用户联系电话" readonly="readonly"
								autocomplete="off" class="layui-input" value="${wmUserWithdraw.userBalance}" maxlength="25">
						</div>
					</div>
				</div>
				
				<div class="layui-form-item">
					<div class="layui-col-xs12">
						<label class="layui-form-label">提现金额&nbsp;<span style="color: red;">*</span></label>
						<div class="layui-input-inline">
							<input type="text" name="withdrawAmount" lay-verify="required" placeholder="请输入当前提现" oninput ="value=value.replace(/[^0-9.]/g,'')"
								autocomplete="off" class="layui-input" value="${wmUserWithdraw.withdrawAmount}" maxlength="25">
						</div>
					</div>
				</div>
				
				<div class="layui-form-item">
				<!-- 认证状态 -->
					<div class="layui-col-xs12">
						<label class="layui-form-label">提现状态&nbsp;<span style="color: red;">*</span></label>
						<div class="layui-input-inline">
							<c:choose>
								<c:when test="${wmUserWithdraw.status eq null}">
									<input type="radio" name="status" checked="checked" value="1" title="审核中" />
									<input type="radio" name="status" value="2" title="提现中"   />
									<input type="radio" name="status" value="3" title="审核不通过"   />
									<input type="radio" name="status" value="4" title="提现成功"    />
									<input type="radio" name="status" value="5" title="提现失败"   />
								</c:when>
								<c:otherwise>
									<input type="radio" name="status" ${wmUserWithdraw.status eq '1'?'checked':''} value="1" title="审核中"  />
									<input type="radio" name="status" ${wmUserWithdraw.status eq '2'?'checked':''} value="2" title="提现中" />
									<input type="radio" name="status" ${wmUserWithdraw.status eq '3'?'checked':''} value="3" title="审核不通过" />
									<input type="radio" name="status" ${wmUserWithdraw.status eq '4'?'checked':''} value="4" title="提现成功" />
									<input type="radio" name="status" ${wmUserWithdraw.status eq '5'?'checked':''} value="5" title="提现失败" />
									
								</c:otherwise>
							</c:choose>
						</div>
					</div>
				</div>
				
				<div class="layui-form-item">
					<div class="layui-col-xs12">
						<label class="layui-form-label">启用状态&nbsp;<span style="color: red;">*</span></label>
						<div class="layui-input-inline">
							<input type="radio" name="isEnable" ${wmUserWithdraw.isEnable eq '0'?'':'checked'} value="1" title="启用" />&ensp;&ensp;  
							<input type="radio" name="isEnable" ${wmUserWithdraw.isEnable eq '0'?'checked':''} value="0" title="禁用" />
						</div>
					</div>
				</div>
				
			   <div class="layui-form-item">
					<div class="layui-col-xs12">
						<label class="layui-form-label">审核备注</label>
						<div class="layui-input-inline">
							<textarea placeholder="请输入备注"  maxlength="100" name="auditRemark" class="layui-textarea" >${wmUserWithdraw.auditRemark}</textarea>
						</div>
					</div>
				</div>
				
				<div class="layui-form-item">
					<div class="layui-col-xs12">
						<label class="layui-form-label">备注</label>
						<div class="layui-input-inline">
							<textarea placeholder="请输入备注" maxlength="100" name="remark" class="layui-textarea">${wmUserWithdraw.remark}</textarea>
						</div>
					</div>
				</div>
				
			</div>
			
			<!-- 标准化表单提交按钮 -->
			<%@ include file="/WEB-INF/views/modules/templet/form/templetSubmitButton.jsp" %>
		</form>
	</div>
	
	<!-- 标准化表单提交JS -->
	<script type="text/javascript">
		layui.use(['layer','form'], function() {
			var layer = layui.layer, form = layui.form;
			
			form.render();
			
			var rootUrl =  $("#rootUrl").val(); // 访问路径
			var tableName = $("#tableName").val(); // 表名
			
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
			
			
			form.on('submit(formDemos)', function(data) {
				
				$(this).attr({"disabled":"disabled"});
				var json = JSON.stringify(data.field);
				
				var withdrawAmount = Number(data.field.withdrawAmount);
				console.log("提现："+withdrawAmount);
				
				var userBalance = Number($("#userBalance").val());
				console.log(userBalance);
				
				if (withdrawAmount>userBalance) {
					
					layer.msg("提现金额不能大于用户余额", { icon: 5 });
					$(this).removeAttr("disabled");
					
				} else {
					
					$.ajax({
						type : 'POST',
						url  : rootUrl + '/save',
						data : {
							'json'  : json,
							'tableName'	: tableName
						},
						success : function(result) {
							var obj = eval('('+result+')');
							
							console.log(obj);
							
							if(obj.code == 1){	// 新增成功
								layer.msg(obj.msg, { icon: 6 });
								setTimeout(function(){ window.location.href = rootUrl + "/show" }, 1000);
							} else if(obj.code == -1){	// 新增失败
								layer.msg(obj.msg, { icon: 5 });
							} else if(obj.code == 2){	// 修改成功
								layer.msg(obj.msg, { icon: 6 });
								setTimeout(function(){ window.location.href = rootUrl + "/show" }, 1000);
							} else if(obj.code == -2){	// 修改失败
								layer.msg(obj.msg, { icon: 5 });
							} else {
								layer.msg('系统错误请联系管理员', { icon: 2 });
							}
						},
						error : function(data) {
							layer.msg('操作失败', { icon: 6 });
						}
					}); 
					
				}
				
				
				return false;
			});
		});
	</script>

</body>
</html>