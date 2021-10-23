<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>司机信息管理</title>
	
	<!-- 标准化通用头部 -->
	<%@ include file="/WEB-INF/views/modules/templet/headExport/templetExport.jsp" %>
	
	<!-- 通用图片上传引入 -->
	<%@ include file="/WEB-INF/views/modules/templet/headExport/templetUploadExport.jsp" %>
	
	<!-- 三级联动引入 -->
	<link rel="stylesheet" href="${ctxStatic}/layui-selectThree/layui/css/layui.css">
	
	<!-- 标准化表格页面CSS -->
	<link rel="stylesheet" href="${ctxStatic}/app/form/templetForLine.css" />
	
</head>
<body>
	
	<!-- 标准化表单隐藏文本 -->
	<%@ include file="/WEB-INF/views/modules/templet/templetHide.jsp" %>
	
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
			
			$("#imgerUploadId2").upload(function(_this, data) {
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
			
			$("#imgerUploadId5").upload(function(_this, data) {
				$("#img_id").attr("src",data);
	    		imgOpen();
			})
			
			$("#imgerUploadId6").upload(function(_this, data) {
				$("#img_id").attr("src",data);
	    		imgOpen();
			})
			
			$("#imgerUploadId7").upload(function(_this, data) {
				$("#img_id").attr("src",data);
	    		imgOpen();
			})
			
			$("#imgerUploadId8").upload(function(_this, data) {
				$("#img_id").attr("src",data);
	    		imgOpen();
			})
			
			$("#imgerUploadId9").upload(function(_this, data) {
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
		        		司机信息查看
		        	</c:when>
					<c:otherwise>
		        		司机信息${wmDriverInfo.id eq null ?'添加':'修改'}
		        	</c:otherwise>
				</c:choose>
		    </legend>
		</fieldset>
	    
	    <!-- 主体内容 -->
	    <form class="layui-form layui-form-pane" action="" style="margin-top: 1em;">
	    
			<div id="dis">
				<input type="hidden" name="id" value="${wmDriverInfo.id}" />
				<input type="hidden" name="pid" value="${wmDriverInfo.pid}" />
				
				<div class="layui-form-item">
				
					<div class="layui-col-xs3">
						<label class="layui-form-label" style="padding-left: 0rem;">司机真实姓名&nbsp;<span style="color: red;">*</span></label>
						<div class="layui-input-inline">
							<input type="text" name="trueName" lay-verify="required" placeholder="请输入司机真实姓名" 
								autocomplete="off" class="layui-input" value="${wmDriverInfo.trueName}" maxlength="15">
						</div>
					</div>
					
					<div class="layui-col-xs3">
						<label class="layui-form-label">联系电话&nbsp;<span style="color: red;">*</span></label>
						<div class="layui-input-inline">
							<input type="text" name="phone" lay-verify="required|phone" placeholder="请输入联系电话" 
								autocomplete="off" class="layui-input" value="${wmDriverInfo.phone}" maxlength="13">
						</div>
					</div>
					
					<div class="layui-col-xs3">
						<label class="layui-form-label">登录账户&nbsp;<span style="color: red;">*</span></label>
						<div class="layui-input-inline">
							<input type="text" name="loginName" lay-verify="required" placeholder="请输入登录账户" 
								autocomplete="off" class="layui-input" value="${wmDriverInfo.loginName}" maxlength="25">
						</div>
					</div>
					
					<div class="layui-col-xs3 layui-hide">
						<c:if test="${wmDriverInfo.id == null }">
							<label class="layui-form-label">登录密码&nbsp;<span style="color: red;">*</span></label>
							<div class="layui-input-inline">
								<input type="password" name="loginPass" placeholder="请输入登录密码" 
									autocomplete="off" class="layui-input" value="${wmDriverInfo.loginPass}" maxlength="25">
							</div>
						</c:if>
						
						<c:if test="${wmDriverInfo.id != null }">
							<label class="layui-form-label">登录密码</label>
							<div class="layui-input-inline">
								<input type="password" name="loginPass" placeholder="不填原密码/填写修改密码" 
									autocomplete="off" class="layui-input" maxlength="25">
							</div>
						</c:if>
					</div>
					
					<div class="layui-col-xs3">
						<label class="layui-form-label" style="padding-left: 0rem;">身份证号码&nbsp;<span style="color: red;">*</span></label>
						<div class="layui-input-inline">
							<input type="text" name="idNum" lay-verify="required" placeholder="请输入身份证号码" 
								autocomplete="off" class="layui-input" value="${wmDriverInfo.idNum}" maxlength="18">
						</div>
					</div>
					
				</div>
				
				<div class="layui-form-item" id="area-picker">
				
					<div class="layui-col-xs3">
						<label class="layui-form-label" style="padding-left: 0rem;">微信OPENID&nbsp;<span style="color: red;">*</span></label>
						<div class="layui-input-inline">
							<input type="openid" name="openid" placeholder="请输入微信OPENID" lay-verify="required"
								autocomplete="off" class="layui-input" value="${wmDriverInfo.openid}" maxlength="100">
						</div>
					</div>
				
					<div class="layui-col-xs3">
						<label class="layui-form-label">所在省&nbsp;<span style="color: red;">*</span></label>
			            <div class="layui-input-inline">
			            	<c:if test="${wmDriverInfo.province == null }">
			            		<select name="province" class="province-selector" lay-verify="required" data-value="请选择省" lay-filter="province-1">
				                    <option value="">请选择省</option>
				                </select>
			            	</c:if>
			            	<c:if test="${wmDriverInfo.province != null }">
			            		<select name="province" class="province-selector" lay-verify="required" data-value="${wmDriverInfo.province}" lay-filter="province-1">
				                    <option value="">请选择省</option>
				                </select>
			            	</c:if>
			            </div>
					</div>
					
					<div class="layui-col-xs3">
						<label class="layui-form-label" >所在市&nbsp;<span style="color: red;">*</span></label>
			            <div class="layui-input-inline" >
			            	<c:if test="${wmDriverInfo.city == null }">
			            		<select name="city" class="city-selector"  lay-verify="required" data-value="请选择市" lay-filter="city-1">
				                    <option value="">请选择市</option>
				                </select>
			            	</c:if>
			            	<c:if test="${wmDriverInfo.city != null }">
			            		<select name="city" class="city-selector" lay-verify="required" data-value="${wmDriverInfo.city}" lay-filter="city-1">
				                    <option value="">请选择市</option>
				                </select>
			            	</c:if>
			            </div>
					</div>
					
					<div class="layui-col-xs3">
						<label class="layui-form-label" >所在区&nbsp;<span style="color: red;">*</span></label>
			            <div class="layui-input-inline" >
			               	<c:if test="${wmDriverInfo.country == null }">
			            		<select name="country" class="county-selector" lay-verify="required" data-value="请选择区" lay-filter="county-1">
				                    <option value="">请选择区</option>
				                </select>
			            	</c:if>
			            	<c:if test="${wmDriverInfo.country != null }">
			            		<select name="country" class="county-selector" lay-verify="required" data-value="${wmDriverInfo.country}" lay-filter="county-1">
				                    <option value="">请选择区</option>
				                </select>
			            	</c:if>
			            </div>
					</div>
				
				</div>
				
				<div class="layui-form-item">
					
					<div class="layui-col-xs3">
						<label class="layui-form-label" style="padding-left: 0rem;">推荐人</label>
						<div class="layui-input-inline">
							<input type="text" name="pname" placeholder="请输入推荐人"
								autocomplete="off" class="layui-input" value="${wmDriverInfo.pname}" maxlength="100">
						</div>
					</div>
					
					<div class="layui-col-xs3">
						<label class="layui-form-label" style="padding-left: 0rem;">推荐人openid</label>
						<div class="layui-input-inline">
							<input type="text" name="popenid" placeholder="请输入推荐人openid"
								autocomplete="off" class="layui-input" value="${wmDriverInfo.popenid}" maxlength="100">
						</div>
					</div>
					
					<div class="layui-col-xs3 layui-hide">
						<label class="layui-form-label" >是否启用&nbsp;<span style="color: red;">*</span></label>
						<div class="layui-input-inline" >
							<input type="radio" name="isEnable" ${wmDriverInfo.isEnable eq '0'?'':'checked'} value="1" title="启用" /> 
							<input type="radio" name="isEnable" ${wmDriverInfo.isEnable eq '0'?'checked':''} value="0" title="禁用" />
						</div>
					</div>
					
					<div class="layui-col-xs3">
						<label class="layui-form-label" style="padding-left: 0rem;">紧急联系人</label>
						<div class="layui-input-inline">
							<input type="urgentRelationName" name="urgentRelationName" 
								autocomplete="off" class="layui-input" value="${wmDriverInfo.urgentRelationName}" maxlength="25">
						</div>
					</div>
					
					<div class="layui-col-xs3">
						<label class="layui-form-label" style="padding-left: 0rem;">紧急联系电话</label>
						<div class="layui-input-inline">
							<input type="urgentRelationTel" name="urgentRelationTel" 
								autocomplete="off" class="layui-input" value="${wmDriverInfo.urgentRelationTel}" maxlength="25">
						</div>
					</div>
					
				</div>
				
				<div class="layui-form-item">
				
					<div class="layui-col-xs6">
						<label class="layui-form-label" >认证状态&nbsp;<span style="color: red;">*</span></label>
						<div class="layui-input-inline" >
							<c:choose>
								<c:when test="${wmDriverInfo.authStatus eq null}">
									<input type="radio" name="authStatus" checked="checked" value="1" title="认证中" />
									<input type="radio" name="authStatus" value="2" title="认证成功"   />
									<input type="radio" name="authStatus" value="3" title="认证失败" />
								</c:when>
								<c:otherwise>
									<input type="radio" name="authStatus" ${wmDriverInfo.authStatus eq '1'?'checked':''} value="1" title="认证中"  />
									<input type="radio" name="authStatus" ${wmDriverInfo.authStatus eq '2'?'checked':''} value="2" title="认证成功" />
									<input type="radio" name="authStatus" ${wmDriverInfo.authStatus eq '3'?'checked':''} value="3" title="认证失败" />
								</c:otherwise>
							</c:choose>
						</div>
					</div>
				</div>
				
				<div class="layui-form-item">
					<div class="layui-col-xs6">
						<label class="layui-form-label">认证信息</label>
						<div class="layui-input-inline">
							<textarea name="autoInfo" placeholder="请输入认证信息" style="width: 100%;" 
								class="layui-textarea" maxlength="200">${wmDriverInfo.autoInfo}</textarea>
						</div>
					</div>
					
					<div class="layui-col-xs6">
						<label class="layui-form-label" >备注</label>
						<div class="layui-input-inline">
							<textarea name="remark" placeholder="请输入备注" style="width: 100%;" 
								class="layui-textarea" maxlength="100">${wmDriverInfo.remark}</textarea>
						</div>
					</div>
				</div>
				
				<div class="layui-form-item">
					<div class="layui-col-xs3">
						<label class="layui-form-label">头像</label>
						
						<div class="layui-input-inline">
							<div class="case">
								<c:if test="${wmDriverInfo.headerImg != null}">
									<c:if test="${wmDriverInfo.headerImg != ''}">
										<div class="upload" action='${interfacePath}' data-value='${wmDriverInfo.headerImg}' 
											id='imgerUploadId4' data-num='1' data-type='png,jpg,jpeg' style="margin-left: 0rem; width: 100%;" onclick="getValOneFlag(4)">
											<input type="hidden" id="valOne4" size="100" name="headerImg" value="${wmDriverInfo.headerImg}"/>
										</div>
									</c:if>
									
									<c:if test="${wmDriverInfo.headerImg == ''}">
										<div class="upload" action='${interfacePath}' data-value=''
											id='imgerUploadId4' data-num='1' data-type='png,jpg,jpeg' style="margin-left: 0rem; width: 100%;" onclick="getValOneFlag(4)">
											<input type="hidden" id="valOne4" size="100" name="headerImg" value="${wmDriverInfo.headerImg}"/>
										</div>
									</c:if>
								</c:if>
								
								<c:if test="${wmDriverInfo.headerImg == null}">
									<div class="upload" action='${interfacePath}' data-value='' 
										id='imgerUploadId4' data-num='1' data-type='png,jpg,jpeg' style="margin-left: 0rem; width: 100%;" onclick="getValOneFlag(4)">
										<input type="hidden" id="valOne4" size="100" name="headerImg" value=""/>
									</div>
								</c:if>
							</div>
						</div>
					</div>
					
					<div class="layui-col-xs3">
						<label class="layui-form-label">身份证正面</label>
						
						<div class="layui-input-inline">
							<div class="case">
								<c:if test="${wmDriverInfo.idFrontImg != null}">
									<c:if test="${wmDriverInfo.idFrontImg != ''}">
										<div class="upload" action='${interfacePath}' data-value='${imgServerPath}${wmDriverInfo.idFrontImg}' 
											id='imgerUploadId1' data-num='1' data-type='png,jpg,jpeg' style="margin-left: 0rem; width: 100%;" onclick="getValOneFlag(1)">
											<input type="hidden" id="valOne1" size="100" name="idFrontImg" value="${wmDriverInfo.idFrontImg}"/>
										</div>
									</c:if>
									
									<c:if test="${wmDriverInfo.idFrontImg == ''}">
										<div class="upload" action='${interfacePath}' data-value=''
											id='imgerUploadId1' data-num='1' data-type='png,jpg,jpeg' style="margin-left: 0rem; width: 100%;" onclick="getValOneFlag(1)">
											<input type="hidden" id="valOne1" size="100" name="idFrontImg" value="${wmDriverInfo.idFrontImg}"/>
										</div>
									</c:if>
								</c:if>
								
								<c:if test="${wmDriverInfo.idFrontImg == null}">
									<div class="upload" action='${interfacePath}' data-value='' 
										id='imgerUploadId1' data-num='1' data-type='png,jpg,jpeg' style="margin-left: 0rem; width: 100%;" onclick="getValOneFlag(1)">
										<input type="hidden" id="valOne1" size="100" name="idFrontImg" value=""/>
									</div>
								</c:if>
							</div>
						</div>
					</div>
					
					<div class="layui-col-xs3">
						<label class="layui-form-label">身份证反面</label>
						
						<div class="layui-input-inline">
							<div class="case">
								<c:if test="${wmDriverInfo.idBackImg != null}">
									<c:if test="${wmDriverInfo.idBackImg != ''}">
										<div class="upload" action='${interfacePath}' data-value='${imgServerPath}${wmDriverInfo.idBackImg}' 
											id='imgerUploadId2' data-num='1' data-type='png,jpg,jpeg' style="margin-left: 0rem; width: 100%;" onclick="getValOneFlag(2)">
											<input type="hidden" id="valOne2" size="100" name="idBackImg" value="${wmDriverInfo.idBackImg}"/>
										</div>
									</c:if>
									
									<c:if test="${wmDriverInfo.idBackImg == ''}">
										<div class="upload" action='${interfacePath}' data-value=''
											id='imgerUploadId2' data-num='1' data-type='png,jpg,jpeg' style="margin-left: 0rem; width: 100%;" onclick="getValOneFlag(2)">
											<input type="hidden" id="valOne2" size="100" name="idBackImg" value="${wmDriverInfo.idBackImg}"/>
										</div>
									</c:if>
								</c:if>
								
								<c:if test="${wmDriverInfo.idBackImg == null}">
									<div class="upload" action='${interfacePath}' data-value='' 
										id='imgerUploadId2' data-num='1' data-type='png,jpg,jpeg' style="margin-left: 0rem; width: 100%;" onclick="getValOneFlag(2)">
										<input type="hidden" id="valOne2" size="100" name="idBackImg" value=""/>
									</div>
								</c:if>
							</div>
						</div>
					</div>
					
					<div class="layui-col-xs3">
						<label class="layui-form-label" >驾驶证照片</label>
						
						<div class="layui-input-inline">
							<div class="case">
								<c:if test="${wmDriverInfo.driverLicenceImg != null}">
									<c:if test="${wmDriverInfo.driverLicenceImg != ''}">
										<div class="upload" action='${interfacePath}' data-value='${imgServerPath}${wmDriverInfo.driverLicenceImg}' 
											id='imgerUploadId3' data-num='1' data-type='png,jpg,jpeg' style="margin-left: 0rem; width: 100%;" onclick="getValOneFlag(3)">
											<input type="hidden" id="valOne3" size="100" name="driverLicenceImg" value="${wmDriverInfo.driverLicenceImg}"/>
										</div>
									</c:if>
									
									<c:if test="${wmDriverInfo.driverLicenceImg == ''}">
										<div class="upload" action='${interfacePath}' data-value='' 
											id='imgerUploadId3' data-num='1' data-type='png,jpg,jpeg' style="margin-left: 0rem; width: 100%;" onclick="getValOneFlag(3)">
											<input type="hidden" id="valOne3" size="100" name="driverLicenceImg" value="${wmDriverInfo.driverLicenceImg}"/>
										</div>
									</c:if>
								</c:if>
								
								<c:if test="${wmDriverInfo.driverLicenceImg == null}">
									<div class="upload" action='${interfacePath}' data-value='' 
										id='imgerUploadId3' data-num='1' data-type='png,jpg,jpeg' style="margin-left: 0rem; width: 100%;" onclick="getValOneFlag(3)">
										<input type="hidden" id="valOne3" size="100" name="driverLicenceImg" value=""/>
									</div>
								</c:if>
							</div>
						</div>
					</div>
				</div>
				
				<div class="layui-form-item">
					<div class="layui-col-xs3">
						<label class="layui-form-label">行驶证照片 </label>
						
						<div class="layui-input-inline">
							<div class="case">
								<c:if test="${wmDriverInfo.travelLicenceImg != null}">
									<c:if test="${wmDriverInfo.travelLicenceImg != ''}">
										<div class="upload" action='${interfacePath}' data-value='${imgServerPath}${wmDriverInfo.travelLicenceImg}' 
											id='imgerUploadId5' data-num='1' data-type='png,jpg,jpeg' style="margin-left: 0rem; width: 100%;" onclick="getValOneFlag(5)">
											<input type="hidden" id="valOne5" size="100" name="travelLicenceImg" value="${wmDriverInfo.travelLicenceImg}"/>
										</div>
									</c:if>
									
									<c:if test="${wmDriverInfo.travelLicenceImg == ''}">
										<div class="upload" action='${interfacePath}' data-value=''
											id='imgerUploadId5' data-num='1' data-type='png,jpg,jpeg' style="margin-left: 0rem; width: 100%;" onclick="getValOneFlag(5)">
											<input type="hidden" id="valOne5" size="100" name="travelLicenceImg" value="${wmDriverInfo.travelLicenceImg}"/>
										</div>
									</c:if>
								</c:if>
								
								<c:if test="${wmDriverInfo.travelLicenceImg == null}">
									<div class="upload" action='${interfacePath}' data-value='' 
										id='imgerUploadId5' data-num='1' data-type='png,jpg,jpeg' style="margin-left: 0rem; width: 100%;" onclick="getValOneFlag(5)">
										<input type="hidden" id="valOne5" size="100" name="travelLicenceImg" value=""/>
									</div>
								</c:if>
							</div>
						</div>
					</div>
					
					<div class="layui-col-xs3">
						<label class="layui-form-label">车辆前正面 </label>
						
						<div class="layui-input-inline">
							<div class="case">
								<c:if test="${wmDriverInfo.carFrontImg != null}">
									<c:if test="${wmDriverInfo.carFrontImg != ''}">
										<div class="upload" action='${interfacePath}' data-value='${imgServerPath}${wmDriverInfo.carFrontImg}' 
											id='imgerUploadId6' data-num='1' data-type='png,jpg,jpeg' style="margin-left: 0rem; width: 100%;" onclick="getValOneFlag(6)">
											<input type="hidden" id="valOne6" size="100" name="carFrontImg" value="${wmDriverInfo.carFrontImg}"/>
										</div>
									</c:if>
									
									<c:if test="${wmDriverInfo.carFrontImg == ''}">
										<div class="upload" action='${interfacePath}' data-value=''
											id='imgerUploadId6' data-num='1' data-type='png,jpg,jpeg' style="margin-left: 0rem; width: 100%;" onclick="getValOneFlag(6)">
											<input type="hidden" id="valOne6" size="100" name="carFrontImg" value="${wmDriverInfo.carFrontImg}"/>
										</div>
									</c:if>
								</c:if>
								
								<c:if test="${wmDriverInfo.carFrontImg == null}">
									<div class="upload" action='${interfacePath}' data-value='' 
										id='imgerUploadId6' data-num='1' data-type='png,jpg,jpeg' style="margin-left: 0rem; width: 100%;" onclick="getValOneFlag(6)">
										<input type="hidden" id="valOne6" size="100" name="carFrontImg" value=""/>
									</div>
								</c:if>
							</div>
						</div>
					</div>
					
					<div class="layui-col-xs3">
						<label class="layui-form-label">车辆左后侧 </label>
						
						<div class="layui-input-inline">
							<div class="case">
								<c:if test="${wmDriverInfo.carLeftbackImg != null}">
									<c:if test="${wmDriverInfo.carLeftbackImg != ''}">
										<div class="upload" action='${interfacePath}' data-value='${imgServerPath}${wmDriverInfo.carLeftbackImg}' 
											id='imgerUploadId7' data-num='1' data-type='png,jpg,jpeg' style="margin-left: 0rem; width: 100%;" onclick="getValOneFlag(7)">
											<input type="hidden" id="valOne7" size="100" name="carLeftbackImg" value="${wmDriverInfo.carLeftbackImg}"/>
										</div>
									</c:if>
									
									<c:if test="${wmDriverInfo.carLeftbackImg == ''}">
										<div class="upload" action='${interfacePath}' data-value=''
											id='imgerUploadId7' data-num='1' data-type='png,jpg,jpeg' style="margin-left: 0rem; width: 100%;" onclick="getValOneFlag(7)">
											<input type="hidden" id="valOne7" size="100" name="carLeftbackImg" value="${wmDriverInfo.carLeftbackImg}"/>
										</div>
									</c:if>
								</c:if>
								
								<c:if test="${wmDriverInfo.carLeftbackImg == null}">
									<div class="upload" action='${interfacePath}' data-value='' 
										id='imgerUploadId7' data-num='1' data-type='png,jpg,jpeg' style="margin-left: 0rem; width: 100%;" onclick="getValOneFlag(7)">
										<input type="hidden" id="valOne7" size="100" name="carLeftbackImg" value=""/>
									</div>
								</c:if>
							</div>
						</div>
					</div>
					
					<div class="layui-col-xs3">
						<label class="layui-form-label">车辆右后侧 </label>
						
						<div class="layui-input-inline">
							<div class="case">
								<c:if test="${wmDriverInfo.carRightbackImg != null}">
									<c:if test="${wmDriverInfo.carRightbackImg != ''}">
										<div class="upload" action='${interfacePath}' data-value='${imgServerPath}${wmDriverInfo.carRightbackImg}' 
											id='imgerUploadId8' data-num='1' data-type='png,jpg,jpeg' style="margin-left: 0rem; width: 100%;" onclick="getValOneFlag(8)">
											<input type="hidden" id="valOne8" size="100" name="carRightbackImg" value="${wmDriverInfo.carRightbackImg}"/>
										</div>
									</c:if>
									
									<c:if test="${wmDriverInfo.carRightbackImg == ''}">
										<div class="upload" action='${interfacePath}' data-value=''
											id='imgerUploadId8' data-num='1' data-type='png,jpg,jpeg' style="margin-left: 0rem; width: 100%;" onclick="getValOneFlag(8)">
											<input type="hidden" id="valOne8" size="100" name="carRightbackImg" value="${wmDriverInfo.carRightbackImg}"/>
										</div>
									</c:if>
								</c:if>
								
								<c:if test="${wmDriverInfo.carRightbackImg == null}">
									<div class="upload" action='${interfacePath}' data-value='' 
										id='imgerUploadId8' data-num='1' data-type='png,jpg,jpeg' style="margin-left: 0rem; width: 100%;" onclick="getValOneFlag(8)">
										<input type="hidden" id="valOne8" size="100" name="carRightbackImg" value=""/>
									</div>
								</c:if>
							</div>
						</div>
					</div>
					
				</div>
				
				<div class="layui-form-item">
				
					<div class="layui-col-xs3">
						<label class="layui-form-label">车厢内照片 </label>
						
						<div class="layui-input-inline">
							<div class="case">
								<c:if test="${wmDriverInfo.carInsideImg != null}">
									<c:if test="${wmDriverInfo.carInsideImg != ''}">
										<div class="upload" action='${interfacePath}' data-value='${imgServerPath}${wmDriverInfo.carInsideImg}' 
											id='imgerUploadId9' data-num='1' data-type='png,jpg,jpeg' style="margin-left: 0rem; width: 100%;" onclick="getValOneFlag(9)">
											<input type="hidden" id="valOne9" size="100" name="carInsideImg" value="${wmDriverInfo.carInsideImg}"/>
										</div>
									</c:if>
									
									<c:if test="${wmDriverInfo.carInsideImg == ''}">
										<div class="upload" action='${interfacePath}' data-value=''
											id='imgerUploadId9' data-num='1' data-type='png,jpg,jpeg' style="margin-left: 0rem; width: 100%;" onclick="getValOneFlag(9)">
											<input type="hidden" id="valOne9" size="100" name="carInsideImg" value="${wmDriverInfo.carInsideImg}"/>
										</div>
									</c:if>
								</c:if>
								
								<c:if test="${wmDriverInfo.carInsideImg == null}">
									<div class="upload" action='${interfacePath}' data-value='' 
										id='imgerUploadId9' data-num='1' data-type='png,jpg,jpeg' style="margin-left: 0rem; width: 100%;" onclick="getValOneFlag(9)">
										<input type="hidden" id="valOne9" size="100" name="carInsideImg" value=""/>
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
	
	<!-- 通用三级联动信息 -->
	<%@ include file="/WEB-INF/views/modules/templet/form/templetThreeArea.jsp" %>
	
	<!-- 标准化表单提交JS -->
	<%@ include file="/WEB-INF/views/modules/templet/form/templetSubMitDict.jsp" %>

</body>
</html>