<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>额外费用订单管理</title>
	
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link rel="stylesheet" href="${ctxStatic}/layui/css/layui.css" />
	<link rel="stylesheet" href="${ctxStatic}/mechunion/css/common.css" />
	<script src="${ctxStatic}/layui/layui.js"></script>
	<script src="${ctxStatic}/jquery/jquery-1.9.1.js"></script>
	
	<!-- 标准化表格页面CSS -->
	<link rel="stylesheet" href="${ctxStatic}/app/form/templetOneLine.css" />
	
</head>
<body>
	
	<!-- 标准化表单隐藏文本 -->
	<%@ include file="/WEB-INF/views/modules/templet/templetHide.jsp" %>
	
	<input type="hidden" value="${ctx}${rootOUrl}" id="rootOUrl">
	
	<!-- 全局默认设置 -->
	<script type="text/javascript">
		$(function() {
			if ('${is}' == "show") {//查看时全局禁用	
				$("#dis").css("pointer-events", "none");
			}
		});
		
		function rtShowList(rootUrl) {
			window.location.href= rootUrl + "/show";
		}
	</script>
	
	<!-- 主体内容 -->
	<div class="layui-main">
		<!-- 头部标题内容 -->
	  	<fieldset class="layui-elem-field layui-field-title">
		    <legend>
		    	<c:choose>
					<c:when test="${is eq 'show'}">
		        		额外费用订单信息查看
		        	</c:when>
					<c:otherwise>
		        		额外费用订单信息${wmExtraOrderInfo.id eq null ?'添加':'修改'}
		        	</c:otherwise>
				</c:choose>
			</legend>
		</fieldset>
	    
	    <!-- 主体内容 -->
	    <form class="layui-form layui-form-pane" action="" style="margin-top: 1em;">
			<div id="dis">
				<input type="hidden" name="id" value="${wmExtraOrderInfo.id}" />
				
				<div class="layui-form-item">
					<div class="layui-col-xs12">
						<label class="layui-form-label">主订单编号&nbsp;<span style="color: red;">*</span></label>
						<div class="layui-input-inline">
							<input type="text" name="mainOrderId" lay-verify="required" placeholder="请输入主订单编号" oninput ="value=value.replace(/[^0-9.]/g,'')"
								autocomplete="off" class="layui-input" value="${wmExtraOrderInfo.mainOrderId}" maxlength="25">
						</div>
					</div>
				</div>
				
				<div class="layui-form-item">
					<div class="layui-col-xs12">
						<label class="layui-form-label">返程费用&nbsp;<span style="color: red;">*</span></label>
						<div class="layui-input-inline">
							<input type="text" name="returnFee" lay-verify="required" placeholder="请输入返程费用" oninput ="value=value.replace(/[^0-9.]/g,'')"
								autocomplete="off" class="layui-input" value="${wmExtraOrderInfo.returnFee}" maxlength="25">
						</div>
					</div>
				</div>
				
				<div class="layui-form-item">
					<div class="layui-col-xs12">
						<label class="layui-form-label">装卸货费用&nbsp;<span style="color: red;">*</span></label>
						<div class="layui-input-inline">
							<input type="text" name="loadUnloadFee" lay-verify="required" placeholder="请输入装卸货费用" oninput ="value=value.replace(/[^0-9.]/g,'')"
								autocomplete="off" class="layui-input" value="${wmExtraOrderInfo.loadUnloadFee}" maxlength="25">
						</div>
					</div>
				</div>
				
				<div class="layui-form-item">
					<div class="layui-col-xs12">
						<label class="layui-form-label">分发费用&nbsp;<span style="color: red;">*</span></label>
						<div class="layui-input-inline">
							<input type="text" name="distributeFee" lay-verify="required" placeholder="请输入分发费用" oninput ="value=value.replace(/[^0-9.]/g,'')"
								autocomplete="off" class="layui-input" value="${wmExtraOrderInfo.distributeFee}" maxlength="25">
						</div>
					</div>
				</div>
				
				<div class="layui-form-item">
					<div class="layui-col-xs12">
						<label class="layui-form-label">搬运费用&nbsp;<span style="color: red;">*</span></label>
						<div class="layui-input-inline">
							<input type="text" name="carryFee" lay-verify="required" placeholder="请输入搬运费用" oninput ="value=value.replace(/[^0-9.]/g,'')"
								autocomplete="off" class="layui-input" value="${wmExtraOrderInfo.carryFee}" maxlength="25">
						</div>
					</div>
				</div>
				
				<div class="layui-form-item">
					<div class="layui-col-xs12">
						<label class="layui-form-label">尾板费用&nbsp;<span style="color: red;">*</span></label>
						<div class="layui-input-inline">
							<input type="text" name="tailPlateFee" lay-verify="required" placeholder="请输入尾板费用" oninput ="value=value.replace(/[^0-9.]/g,'')"
								autocomplete="off" class="layui-input" value="${wmExtraOrderInfo.tailPlateFee}" maxlength="25">
						</div>
					</div>
				</div>
				
				<div class="layui-form-item">
					<div class="layui-col-xs12">
						<label class="layui-form-label">预估额外费用&nbsp;<span style="color: red;">*</span></label>
						<div class="layui-input-inline">
							<input type="text" name="estimateExtraFee" lay-verify="required" placeholder="请输入预估额外费用" oninput ="value=value.replace(/[^0-9.]/g,'')"
								autocomplete="off" class="layui-input" value="${wmExtraOrderInfo.estimateExtraFee}" maxlength="25">
						</div>
					</div>
				</div>
				
				<div class="layui-form-item">
					<div class="layui-col-xs12">
						<label class="layui-form-label">实际额外费用&nbsp;<span style="color: red;">*</span></label>
						<div class="layui-input-inline">
							<input type="text" name="totalExtraFee" lay-verify="required" placeholder="请输入实际额外费用" oninput ="value=value.replace(/[^0-9.]/g,'')"
								autocomplete="off" class="layui-input" value="${wmExtraOrderInfo.totalExtraFee}" maxlength="25">
						</div>
					</div>
				</div>
				
				<div class="layui-form-item">
					<div class="layui-col-xs12">
						<label class="layui-form-label">支付状态&nbsp;<span style="color: red;">*</span></label>
						<div class="layui-input-inline">
							<input type="radio" name="payStatu" ${wmExtraOrderInfo.payStatu eq '1'?'checked':''} value="1" title="待支付" /> 
							<input type="radio" name="payStatu" ${wmExtraOrderInfo.payStatu eq '2'?'checked':''} value="2" title="成功支付" />
							<input type="radio" name="payStatu" ${wmExtraOrderInfo.payStatu eq '3'?'checked':''} value="3" title="支付失败" />
						</div>
					</div>
				</div>
				
				<div class="layui-form-item">
					<div class="layui-col-xs12">
						<label class="layui-form-label">支付时间&nbsp;<span style="color: red;">*</span></label>
						<div class="layui-input-inline">
							<input type="text" autocomplete="off" class="layui-input" id="payTime" placeholder="请选择支付时间" readonly="readonly"
								value='<fmt:formatDate value="${wmExtraOrderInfo.payTime}" type="date"/>' maxlength="5">
						</div>
					</div>
				</div>
				
			</div>
			
			<!-- 标准化表单提交按钮 -->
			<div class="layui-form-item" style="margin-left: 28%;">
				<div class="layui-input-block">
					<c:if test="${is eq 'edit' }">
						<button class="layui-btn" lay-submit lay-filter="formDemos">保存</button>
					</c:if>
					<input class="layui-btn layui-btn-primary" type="button" value="返回" onclick="rtShowList('${ctx}${rootOUrl}')" />
				</div>
			</div>
		</form>
	</div>
	
	<!-- 标准化表单提交JS -->
	<script type="text/javascript">
		layui.use(['layer','form'], function() {
			var layer = layui.layer, form = layui.form;
			
			form.render();
			
			var rootUrl =  $("#rootUrl").val(); // 访问路径
			var rootOUrl =  $("#rootOUrl").val(); // 访问路径
			var tableName = $("#tableName").val(); // 表名
			
			form.on('submit(formDemos)', function(data) {
				
				$(this).attr({"disabled":"disabled"});
				var json = JSON.stringify(data.field);
				
				console.log(json);
				
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
							setTimeout(function(){ window.location.href = rootOUrl + "/show" }, 1000);
						} else if(obj.code == -1){	// 新增失败
							layer.msg(obj.msg, { icon: 5 });
						} else if(obj.code == 2){	// 修改成功
							layer.msg(obj.msg, { icon: 6 });
							setTimeout(function(){ window.location.href = rootOUrl + "/show" }, 1000);
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
				
				return false;
			});
		});
	</script>
</body>
</html>