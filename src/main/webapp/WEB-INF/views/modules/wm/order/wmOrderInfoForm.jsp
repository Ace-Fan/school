<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>基础订单管理管理</title>
	
	<!-- 标准化通用头部 -->
	<%@ include file="/WEB-INF/views/modules/templet/headExport/templetExport.jsp" %>
	
	<!-- 标准化表格页面CSS -->
	<link rel="stylesheet" href="${ctxStatic}/app/form/templetForLine.css" />
	
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
		        		基础订单信息${wmOrderInfo.id eq null ?'添加':'修改'}
		        	</c:otherwise>
				</c:choose>
			</legend>
		</fieldset>
	    
	    <!-- 主体内容 -->
	    <form class="layui-form layui-form-pane" action="" style="margin-top: 1em;">
			<div id="dis">
				<input type="hidden" name="id" value="${wmOrderInfo.id}" />
				<input type="hidden" name="userId" value="${wmOrderInfo.userId}" />
				
				<div class="layui-form-item">
					<div class="layui-col-xs3">
						<label class="layui-form-label layui-label-More">车型规格编号&nbsp;<span style="color: red;">*</span></label>
						<div class="layui-input-inline">
							<input type="text" name="carSpecId" lay-verify="required" placeholder="请输入车型规格编号" readonly="readonly" 
								autocomplete="off" class="layui-input" value="${wmOrderInfo.carSpecId}" maxlength="10">
						</div>
					</div>
					
					<div class="layui-col-xs3">
						<label class="layui-form-label">用户&nbsp;<span style="color: red;">*</span></label>
						<div class="layui-input-inline">
							<input type="text" name="userName" lay-verify="required" placeholder="请输入用户" readonly="readonly"
								autocomplete="off" class="layui-input" value="${wmOrderInfo.userName}" maxlength="10">
						</div>
					</div>
					
					<div class="layui-col-xs3">
						<label class="layui-form-label">估重&nbsp;<span style="color: red;">*</span></label>
						<div class="layui-input-inline">
							<input type="text" name="startDistance" lay-verify="required" placeholder="请输入估重" 
								autocomplete="off" class="layui-input" value="${wmOrderInfo.startDistance}" maxlength="10">
						</div>
					</div>
					
					<div class="layui-col-xs3">
						<label class="layui-form-label">订单号&nbsp;<span style="color: red;">*</span></label>
						<div class="layui-input-inline">
							<input type="text" name="ordernos" lay-verify="required" placeholder="请输入订单号" readonly="readonly"
								autocomplete="off" class="layui-input" value="${wmOrderInfo.ordernos}" maxlength="25">
						</div>
					</div>
				</div>
				
				<div class="layui-form-item">
					<div class="layui-col-xs6">
						<label class="layui-form-label layui-label-More">发货人地址&nbsp;<span style="color: red;">*</span></label>
						<div class="layui-input-inline">
							<input type="text" name="senderAddr" lay-verify="required" placeholder="请输入收货人地址" 
								autocomplete="off" class="layui-input" value="${wmOrderInfo.senderAddr}" maxlength="100">
						</div>
					</div>
					
					<div class="layui-col-xs3">
						<label class="layui-form-label layui-label-More">发货人经度&nbsp;<span style="color: red;">*</span></label>
						<div class="layui-input-inline">
							<input type="text" name="senderLng" lay-verify="required" placeholder="请输入发货人经度" 
								autocomplete="off" class="layui-input" value="${wmOrderInfo.senderLng}" maxlength="100">
						</div>
					</div>
					
					<div class="layui-col-xs3">
						<label class="layui-form-label layui-label-More">发货人纬度&nbsp;<span style="color: red;">*</span></label>
						<div class="layui-input-inline">
							<input type="text" name="senderLat" lay-verify="required" placeholder="请输入发货人纬度" 
								autocomplete="off" class="layui-input" value="${wmOrderInfo.senderLat}" maxlength="100">
						</div>
					</div>
				</div>
				
				<div class="layui-form-item">
					<div class="layui-col-xs6">
						<label class="layui-form-label layui-label-More">收货人地址1&nbsp;<span style="color: red;">*</span></label>
						<div class="layui-input-inline">
							<input type="text" name="receiver1Addr" lay-verify="required" placeholder="请输入收货人地址1" 
								autocomplete="off" class="layui-input" value="${wmOrderInfo.receiver1Addr}" maxlength="100">
						</div>
					</div>
					
					<div class="layui-col-xs3">
						<label class="layui-form-label layui-label-More">收货人经度1&nbsp;<span style="color: red;">*</span></label>
						<div class="layui-input-inline">
							<input type="text" name="receiver1Lng" lay-verify="required" placeholder="请输入收货人经度1" 
								autocomplete="off" class="layui-input" value="${wmOrderInfo.receiver1Lng}" maxlength="100">
						</div>
					</div>
					
					<div class="layui-col-xs3">
						<label class="layui-form-label layui-label-More">收货人纬度1&nbsp;<span style="color: red;">*</span></label>
						<div class="layui-input-inline">
							<input type="text" name="receiver1Lat" lay-verify="required" placeholder="请输入收货人纬度1" 
								autocomplete="off" class="layui-input" value="${wmOrderInfo.receiver1Lat}" maxlength="100">
						</div>
					</div>
				</div>
				
				<div class="layui-form-item">
					<div class="layui-col-xs6">
						<label class="layui-form-label layui-label-More">收货人地址2</label>
						<div class="layui-input-inline">
							<input type="text" name="receiver2Addr" placeholder="请输入收货人地址2" 
								autocomplete="off" class="layui-input" value="${wmOrderInfo.receiver2Addr}" maxlength="100">
						</div>
					</div>
					
					<div class="layui-col-xs3">
						<label class="layui-form-label layui-label-More">收货人经度2</label>
						<div class="layui-input-inline">
							<input type="text" name="receiver2Lng" placeholder="请输入收货人经度2" 
								autocomplete="off" class="layui-input" value="${wmOrderInfo.receiver2Lng}" maxlength="100">
						</div>
					</div>
					
					<div class="layui-col-xs3">
						<label class="layui-form-label layui-label-More">收货人纬度2</label>
						<div class="layui-input-inline">
							<input type="text" name="receiver2Lat" placeholder="请输入收货人纬度2" 
								autocomplete="off" class="layui-input" value="${wmOrderInfo.receiver2Lat}" maxlength="100">
						</div>
					</div>
				</div>
				
				<div class="layui-form-item">
					<div class="layui-col-xs6">
						<label class="layui-form-label layui-label-More">收货人地址3</label>
						<div class="layui-input-inline">
							<input type="text" name="receiver3Addr" placeholder="请输入收货人地址3" 
								autocomplete="off" class="layui-input" value="${wmOrderInfo.receiver3Addr}" maxlength="100">
						</div>
					</div>
					
					<div class="layui-col-xs3">
						<label class="layui-form-label layui-label-More">收货人经度3</label>
						<div class="layui-input-inline">
							<input type="text" name="receiver3Lng" placeholder="请输入收货人经度3" 
								autocomplete="off" class="layui-input" value="${wmOrderInfo.receiver3Lng}" maxlength="100">
						</div>
					</div>
					
					<div class="layui-col-xs3">
						<label class="layui-form-label layui-label-More">收货人纬度3</label>
						<div class="layui-input-inline">
							<input type="text" name="receiver3Lat" placeholder="请输入收货人纬度3" 
								autocomplete="off" class="layui-input" value="${wmOrderInfo.receiver3Lat}" maxlength="100">
						</div>
					</div>
				</div>
				
				<div class="layui-form-item">
					<div class="layui-col-xs3">
						<label class="layui-form-label">发货人短地址</label>
						<div class="layui-input-inline">
							<input type="text" name="senderShortAddr" placeholder="请输入发货人短地址" 
								autocomplete="off" class="layui-input" value="${wmOrderInfo.senderShortAddr}" maxlength="100">
						</div>
					</div>
					
					<div class="layui-col-xs3">
						<label class="layui-form-label">收货人短地址1</label>
						<div class="layui-input-inline">
							<input type="text" name="receiver1ShortAddr" placeholder="请输入收货人短地址1" 
								autocomplete="off" class="layui-input" value="${wmOrderInfo.receiver1ShortAddr}" maxlength="100">
						</div>
					</div>
					
					<div class="layui-col-xs3">
						<label class="layui-form-label">收货人短地址2</label>
						<div class="layui-input-inline">
							<input type="text" name="receiver2ShortAddr" placeholder="请输入收货人短地址2" 
								autocomplete="off" class="layui-input" value="${wmOrderInfo.receiver2ShortAddr}" maxlength="100">
						</div>
					</div>
					
					<div class="layui-col-xs3">
						<label class="layui-form-label">收货人短地址3</label>
						<div class="layui-input-inline">
							<input type="text" name="receiver3ShortAddr" placeholder="请输入收货人短地址3" 
								autocomplete="off" class="layui-input" value="${wmOrderInfo.receiver3ShortAddr}" maxlength="100">
						</div>
					</div>
					
				</div>
				
				
				<div class="layui-form-item">
					<div class="layui-col-xs3">
						<label class="layui-form-label">距离1&nbsp;<span style="color: red;">*</span></label>
						<div class="layui-input-inline">
							<input type="text" name="distance1" lay-verify="required" placeholder="请输入距离1" 
								autocomplete="off" class="layui-input" value="${wmOrderInfo.distance1}" maxlength="100">
						</div>
					</div>
					
					<div class="layui-col-xs3">
						<label class="layui-form-label">距离2</label>
						<div class="layui-input-inline">
							<input type="text" name="distance2" placeholder="请输入距离2" 
								autocomplete="off" class="layui-input" value="${wmOrderInfo.distance2}" maxlength="100">
						</div>
					</div>
					
					<div class="layui-col-xs3">
						<label class="layui-form-label">距离3</label>
						<div class="layui-input-inline">
							<input type="text" name="distance3" placeholder="请输入距离3" 
								autocomplete="off" class="layui-input" value="${wmOrderInfo.distance3}" maxlength="100">
						</div>
					</div>
					
					<div class="layui-col-xs3">
						<label class="layui-form-label">总距离&nbsp;<span style="color: red;">*</span></label>
						<div class="layui-input-inline">
							<input type="text" name="totalDistance" lay-verify="required" placeholder="请输入总距离" 
								autocomplete="off" class="layui-input" value="${wmOrderInfo.totalDistance}" maxlength="100">
						</div>
					</div>
				</div>
				
				<div class="layui-form-item">
					<div class="layui-col-xs3">
						<label class="layui-form-label">基础费用&nbsp;<span style="color: red;">*</span></label>
						<div class="layui-input-inline">
							<input type="text" name="fee" lay-verify="required" placeholder="请输入基础费用" 
								autocomplete="off" class="layui-input" value="${wmOrderInfo.fee}" maxlength="100">
						</div>
					</div>
					
					<div class="layui-col-xs3">
						<label class="layui-form-label">支付时间</label>
						<div class="layui-input-inline">
							<input type="text" autocomplete="off" class="layui-input" id="payTime" placeholder="请选择支付时间" readonly="readonly"
								value='<fmt:formatDate value="${wmOrderInfo.payTime}" type="date"/>' maxlength="5">
						</div>
					</div>
					
					<div class="layui-col-xs6">
						<label class="layui-form-label">支付状态&nbsp;<span style="color: red;">*</span></label>
						<div class="layui-input-inline">
							<input type="radio" name="payStatu" ${wmOrderInfo.payStatu eq '1'?'checked':''} value="1" title="待支付" /> 
							<input type="radio" name="payStatu" ${wmOrderInfo.payStatu eq '2'?'checked':''} value="2" title="成功支付" />
							<input type="radio" name="payStatu" ${wmOrderInfo.payStatu eq '3'?'checked':''} value="3" title="支付失败" />
						</div>
					</div>
					
				</div>
				
				<div class="layui-form-item">
					<div class="layui-col-xs12">
						<label class="layui-form-label">备注</label>
						<div class="layui-input-inline">
							<textarea placeholder="请输入备注" maxlength="100" name="remark" class="layui-textarea">${wmOrderInfo.remark}</textarea>
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