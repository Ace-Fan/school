<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>车辆信息管理</title>
	
	<!-- 图片上传插件 -->
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link rel="stylesheet" href="${ctxStatic}/layui/css/layui.css" />
	<link rel="stylesheet" href="${ctxStatic}/mechunion/css/common.css" />
	<script src="${ctxStatic}/layui/layui.js"></script>
	<script src="${ctxStatic}/jquery/jquery-1.9.1.js"></script>
	
	<script src="${ctxStatic}/imgerUpload/jquery.min.js"></script>
	<script src="${ctxStatic}/imgerUpload/jQuery.upload.min.js"></script>
	<link rel="stylesheet" href="${ctxStatic}/imgerUpload/upload.css">
	
	<style type="text/css">
		/* 设置头部legend CSS样式 */
		.layui-field-title legend {
			margin-left: 30rem;
		}
		
		.layui-form-pane .layui-form-item {
			margin: 0.5rem;
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
	
	<input id="valOneFlag" value="0" type="hidden">
	
	<!-- 多张图片点击监听事件 -->
	<script type="text/javascript">
		function getValOneFlag(value) {
			$("#valOneFlag").val(value);
		}
	</script>
	
	<div id="img_dome" style="display: none;">
		<img width="100%" height="100%" src="" id="img_id">
	</div>
	
	<!-- 默认加载:图片上传插件 -->
	<script>
	    // 图片上传参数必须要
		$(function() {
			$("#imgerUploadId1").upload(function(_this, data) {
				$("#img_id").attr("src",data);
	    		imgOpen();
			})
			
			$("#imgerUploadId3").upload(function(_this, data) {
				$("#img_id").attr("src",data);
	    		imgOpen();
			})
			
			$("#imgerUploadId4").upload(function(_this, data) {
				$("#img_id").attr("src",data);
	    		imgOpen();
			})
		})
	    
		function imgOpen(){
		    layer.open({
				type : 1,
				anim : 1,
				title : '图片查看',
				shadeClose : true,
				shade : 0.01,
				area : ['27%', '60%'],
				content : $("#img_dome"),
				success : function(lay){
					// 标题加入背景色 以及字体颜色
					$(".layui-layer-title").css('background-color','#2F4056');
					$(".layui-layer-title").css('color','#FFF');
					// 将原有的X符号替换成图标
					// 删除原有的样式
					$(".layui-layer.layui-layer-page ").children('span')[0].remove(); 
					// 创建元素
					var div1=document.createElement("span");
					// 加入CSS样式以及单机事件
					div1.setAttribute('style','position: absolute;right: 15px; top: 11px;line-height: initial;cursor:hand; ');
					div1.setAttribute('onclick','imgClose()');
					div1.innerHTML='<i class="layui-icon" close="a" style="color:#FFF;font-size: 17px;">ဆ</i>';
					// 添加到指定位置
					$(".layui-layer.layui-layer-page ").children('div')[1].after(div1);
				},
				end : function(index) {
				}
			});
		}
	    
	 	// 退出图片查看弹窗		
	    function imgClose(){
			layer.closeAll();
		} 
	</script>
	
	<!-- 主体内容 -->
	<div class="layui-main">
		<!-- 头部标题内容 -->
	  	<fieldset class="layui-elem-field layui-field-title">
		    <legend>
		        <c:choose>
					<c:when test="${is eq 'show'}">
		        		车辆信息查看
		        	</c:when>
					<c:otherwise>
		        		车辆信息${wmCarInfo.id eq null ?'添加':'修改'}
		        	</c:otherwise>
				</c:choose>
		    </legend>
		</fieldset>
	    
	    <!-- 主体内容 -->
	    <form class="layui-form layui-form-pane" action="" style="margin-top: 1em;">
			<div id="dis">
				<input type="hidden" name="id" value="${wmCarInfo.id}" />
				
				<div class="layui-form-item">
				
					<label class="layui-form-label" style="width: 8rem;">所属用户&nbsp;<span style="color: red;">*</span></label>
					<div class="layui-input-inline">
						<input type="text" name="userId" lay-verify="required" placeholder="请输入所属用户" 
							autocomplete="off" class="layui-input" value="${wmCarInfo.userId}" maxlength="15">
					</div>
				
					<label class="layui-form-label" style="width: 8rem; margin-left: 0.5rem;">车辆颜色&nbsp;<span style="color: red;">*</span></label>
					<div class="layui-input-inline">
						<select lay-filter="carColor" lay-verify="required" id="carColor" name="carColor" autocomplete="off">
							<option value="">请选择车辆颜色</option>
							<c:forEach var="item" items="${dictList}">
								<option ${wmCarInfo.carColor eq item.id ? 'selected':'' } value="${item.id}">${item.name}</option>
							</c:forEach>
						</select>
					</div>
				
					<label class="layui-form-label" style="width: 8rem; margin-left: 0.5rem;">车辆号码&nbsp;<span style="color: red;">*</span></label>
					<div class="layui-input-inline">
						<input type="text" name="carNum" lay-verify="required" placeholder="请输入车辆号码" style="width: 13.6rem;"
							autocomplete="off" class="layui-input" value="${wmCarInfo.carNum}" maxlength="25">
					</div>
					
				</div>
				
				
				<div class="layui-form-item">
				
					<label class="layui-form-label" style="width: 8rem;">车辆类别&nbsp;<span style="color: red;">*</span></label>
					<div class="layui-input-inline">
						<select lay-filter="carType" lay-verify="required" id="carType" name="carType" autocomplete="off">
							<option value="">请选择车厢类型</option>
							<c:forEach var="item" items="${wmLeaseCarTypeList}">
								<option ${wmCarInfo.carType eq item.id ? 'selected':'' } value="${item.id}">${item.carName}</option>
							</c:forEach>
						</select>
					</div>
				
					<label class="layui-form-label" style="width: 8rem; margin-left: 0.5rem; ">整车/车厢长&nbsp;<span style="color: red;">*</span></label>
					<div class="layui-input-inline">
						<input type="text" name="length" lay-verify="required" placeholder="请输入整车长/车厢长类别" 
							autocomplete="off" class="layui-input" value="${wmCarInfo.length}" maxlength="25">
					</div>
				
					<label class="layui-form-label" style="width: 8rem; margin-left: 0.5rem;">车身长&nbsp;<span style="color: red;">*</span></label>
					<div class="layui-input-inline">
						<input type="text" name="carLen" lay-verify="required" placeholder="请输入车身长" style="width: 13.6rem;"
							autocomplete="off" class="layui-input" value="${wmCarInfo.carLen}" maxlength="25">
					</div>
					
				</div>
				
				
				<div class="layui-form-item">
				
					<label class="layui-form-label" style="width: 8rem;">车身宽&nbsp;<span style="color: red;">*</span></label>
					<div class="layui-input-inline">
						<input type="text" name="carWidth" lay-verify="required" placeholder="请输入车身宽"
							autocomplete="off" class="layui-input" value="${wmCarInfo.carWidth}" maxlength="15">
					</div>
				
					<label class="layui-form-label" style="width: 8rem; margin-left: 0.5rem; ">车身高&nbsp;<span style="color: red;">*</span></label>
					<div class="layui-input-inline">
						<input type="text" name="carHeight" lay-verify="required" placeholder="请输入车身高" 
							autocomplete="off" class="layui-input" value="${wmCarInfo.carHeight}" maxlength="25">
					</div>
				
					<label class="layui-form-label" style="width: 8rem; margin-left: 0.5rem;">特殊规格&nbsp;<span style="color: red;">*</span></label>
					<div class="layui-input-inline">
						<input type="text" name="spec" lay-verify="required" placeholder="请输入特殊规格" style="width: 13.6rem;"
							autocomplete="off" class="layui-input" value="${wmCarInfo.spec}" maxlength="25">
					</div>
					
				</div>
				
				<div class="layui-form-item">
				
					<label class="layui-form-label" style="width: 8rem;">行驶证所有人&nbsp;<span style="color: red;">*</span></label>
					<div class="layui-input-inline">
						<input type="text" name="driverLicenceOwnerType" lay-verify="required" placeholder="请输入行驶证所有人类型" 
							autocomplete="off" class="layui-input" value="${wmCarInfo.driverLicenceOwnerType}" maxlength="15">
					</div>
					
					<!-- 认证状态 -->
					<div class="layui-inline" style="width: 35rem; margin-left: 0.5rem;">
						<label class="layui-form-label" style="width: 8rem;">认证状态&nbsp;<span style="color: red;">*</span></label>
						<div class="layui-input-inline" style="width: 25rem;">
							<c:choose>
								<c:when test="${wmCarInfo.authStatus eq null}">
									<input type="radio" name="authStatus" checked="checked" value="1" title="认证中" />
									<input type="radio" name="authStatus" value="2" title="认证成功"   />
									<input type="radio" name="authStatus" value="3" title="认证失败" />
								</c:when>
								<c:otherwise>
									<input type="radio" name="authStatus" ${wmCarInfo.authStatus eq '1'?'checked':''} value="1" title="认证中"  />
									<input type="radio" name="authStatus" ${wmCarInfo.authStatus eq '2'?'checked':''} value="2" title="认证成功" />
									<input type="radio" name="authStatus" ${wmCarInfo.authStatus eq '3'?'checked':''} value="3" title="认证失败" />
								</c:otherwise>
							</c:choose>
						</div>
					</div>
					
				</div>
				
				<div class="layui-form-item">
					<label class="layui-form-label" style="width: 8rem;">认证信息</label>
					<div class="layui-input-inline">
						<textarea name="autoInfo" placeholder="请输入认证信息" style="width: 200%;" 
							class="layui-textarea" maxlength="200">${wmCarInfo.autoInfo}</textarea>
					</div>
					
					<label class="layui-form-label" style="width: 8rem; margin-left: 11.5rem;">备注</label>
					<div class="layui-input-inline">
						<textarea name="remark" placeholder="请输入备注" style="width: 200%;" 
							class="layui-textarea" maxlength="100">${wmCarInfo.remark}</textarea>
					</div>
				</div>
				
				<div class="layui-form-item">
				
					<div class="layui-inline" style="width: 21rem;">
						<label class="layui-form-label" style="width: 8rem; padding-left: 0rem;">车辆45度照片</label>
						
						<div class="layui-input-inline">
							<div class="case">
								<c:if test="${wmCarInfo.id != null}">
									<div class="upload" action='${interfacePath}' data-value='${imgServerPath}${wmCarInfo.carImg}' 
										id='imgerUploadId1' data-num='1' data-type='png,jpg,jpeg' style="height: 10rem; margin-left: 0rem; width: 10rem;" onclick="getValOneFlag(1)">
										<input type="hidden" id="valOne1" size="100" name="carImg" value="${wmCarInfo.carImg}"/>
									</div>
								</c:if>
								
								<c:if test="${wmCarInfo.id == null}">
									<div class="upload" action='${interfacePath}' data-value='' 
										id='imgerUploadId1' data-num='1' data-type='png,jpg,jpeg' style="height: 10rem; margin-left: 0rem; width: 10rem;" onclick="getValOneFlag(1)">
										<input type="hidden" id="valOne1" size="100" name="carImg" value=""/>
									</div>
								</c:if>
							</div>
						</div>
					</div>
				
					<div class="layui-inline" style="width: 21rem;">
						<label class="layui-form-label" style="width: 8rem; padding-left: 0rem;">行驶证照片</label>
						
						<div class="layui-input-inline">
							<div class="case">
								<c:if test="${wmCarInfo.id != null}">
									<div class="upload" action='${interfacePath}' data-value='${imgServerPath}${wmCarInfo.driverLicenceImg}' 
										id='imgerUploadId3' data-num='1' data-type='png,jpg,jpeg' style="height: 10rem; margin-left: 0rem; width: 10rem;" onclick="getValOneFlag(3)">
										<input type="hidden" id="valOne3" size="100" name="driverLicenceImg" value="${wmCarInfo.driverLicenceImg}"/>
									</div>
								</c:if>
								
								<c:if test="${wmCarInfo.id == null}">
									<div class="upload" action='${interfacePath}' data-value='' 
										id='imgerUploadId3' data-num='1' data-type='png,jpg,jpeg' style="height: 10rem; margin-left: 0rem; width: 10rem;" onclick="getValOneFlag(3)">
										<input type="hidden" id="valOne3" size="100" name="driverLicenceImg" value=""/>
									</div>
								</c:if>
							</div>
						</div>
					</div>
					
					<div class="layui-inline" style="width: 25rem; margin-left: -1rem;">
						<label class="layui-form-label" style="width: 11rem; padding-left: 0rem;">行驶证所有人身份证照片 </label>
						
						<div class="layui-input-inline">
							<div class="case">
								<c:if test="${wmCarInfo.id != null}">
									<div class="upload" action='${interfacePath}' data-value='${imgServerPath}${wmCarInfo.driverLicenceOwnerIdimg}' 
										id='imgerUploadId4' data-num='1' data-type='png,jpg,jpeg' style="height: 10rem; margin-left: 0rem; width: 10rem;" onclick="getValOneFlag(4)">
										<input type="hidden" id="valOne4" size="100" name="driverLicenceOwnerIdimg" value="${wmCarInfo.driverLicenceOwnerIdimg}"/>
									</div>
								</c:if>
								
								<c:if test="${wmCarInfo.id == null}">
									<div class="upload" action='${interfacePath}' data-value='' 
										id='imgerUploadId4' data-num='1' data-type='png,jpg,jpeg' style="height: 10rem; margin-left: 0rem; width: 10rem;" onclick="getValOneFlag(4)">
										<input type="hidden" id="valOne4" size="100" name="driverLicenceOwnerIdimg" value=""/>
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
	
	<!-- 标准化表单提交JS -->
	<%@ include file="/WEB-INF/views/modules/templet/form/templetSubmit.jsp" %>

</body>
</html>