<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
<title>保存教师信息管理</title>

<!-- 标准化通用头部 -->
<%@ include
	file="/WEB-INF/views/modules/templet/headExport/templetExport.jsp"%>

<!-- 标准化表格页面CSS -->
<link rel="stylesheet" href="${ctxStatic}/app/form/templetOneLine.css" />

<!-- 引入富文本框 -->
<%@ include file="/WEB-INF/views/modules/templet/templetUeditor.jsp"%>

<!-- ueditor兼容样式 -->
<style type="text/css">
#edui1
>
div






:not



 



(
[
class
]



 



){
display






:



 



none






;
}
#edui1_toolbarbox {
	width: unset !important;
	z-index: unset !important;
	position: unset !important;
	top: unset !important;
}
/* 防止下拉框被富文本框遮挡 */
.layui-form-select dl {
	z-index: 9999;
}
</style>

<!-- 腾讯地图 -->
<style type="text/css">
#container {
	width: 100%;
	height: 100%;
}
</style>

<!-- 图片上传插件 -->
<script src="${ctxStatic}/imgerUpload/jquery.min.js"></script>
<script src="${ctxStatic}/imgerUpload/jQuery.upload.min.js"></script>
<link rel="stylesheet" href="${ctxStatic}/imgerUpload/upload.css">
</head>
<body onload="init()">

	<!-- 标准化表单隐藏文本 -->
	<%@ include file="/WEB-INF/views/modules/templet/templetHide.jsp"%>

	<!-- 主体内容 -->
	<div class="layui-main">
		<!-- 头部标题内容 -->
		<fieldset class="layui-elem-field layui-field-title">
			<legend>
				<c:choose>
					<c:when test="${is eq 'show'}">
		        		教师信息查看
		        	</c:when>
					<c:otherwise>
		        		教师信息${scTeacher.id eq null ?'添加':'修改'}
		        	</c:otherwise>
				</c:choose>
			</legend>
		</fieldset>

		<!-- 主体内容 -->
		<form class="layui-form layui-form-pane" action=""
			style="margin-top: 1em;">
			<div id="dis">
				<input type="hidden" name="id" value="${scTeacher.id}" />

				<div class="layui-form-item">
					<div class="layui-col-xs3">
						<label class="layui-form-label">教师编码&nbsp;<span
							style="color: red;">*</span></label>
						<div class="layui-input-inline">
							<input type="text" lay-verType="tips" id="code" name="code"
								onkeyup="this.value=this.value.replace(/\D/g,'')"
								lay-verify="required|code" placeholder="请输入教师编码"
								autocomplete="off" class="layui-input" value="${scTeacher.code}"
								maxlength="10">
						</div>
					</div>
					<div class="layui-col-xs3">
						<label class="layui-form-label">教师姓名&nbsp;<span
							style="color: red;">*</span></label>
						<div class="layui-input-inline">
							<input type="text" lay-verType="tips" name="name"
								lay-verify="required|name" placeholder="请输入教师姓名"
								autocomplete="off" class="layui-input" value="${scTeacher.name}"
								onkeyup="value=value.replace(/[\d]/g,'') "
								onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[\d]/g,''))"
								maxlength="10">
						</div>
					</div>
					<div class="layui-col-xs3">
						<label class="layui-form-label">性别&nbsp;<span
							style="color: red;">*</span></label>
						<div class="layui-input-inline">
							<select lay-verify="required" lay-verType="tips" name="sex">
								<c:if test="${scTeacher.sex == null}">
									<option value="">请选择性别</option>
									<option value="1">男</option>
									<option value="0">女</option>
								</c:if>
								<c:if test="${scTeacher.sex == '1'}">
									<option value="1" selected="selected">男</option>
									<option value="0">女</option>
								</c:if>
								<c:if test="${scTeacher.sex == '0'}">
									<option value="1">男</option>
									<option value="0" selected="selected">女</option>
								</c:if>
							</select>
						</div>
					</div>
					<div class="layui-col-xs3">
						<label class="layui-form-label">年龄&nbsp;<span
							style="color: red;">*</span></label>
						<div class="layui-input-inline">
							<input type="text" lay-verType="tips" name="age"
								lay-verify="required|age" placeholder="请输入教师年龄"
								autocomplete="off" class="layui-input" value="${scTeacher.age}"
								maxlength="3" onkeyup="this.value=this.value.replace(/\D/g,'')">
						</div>
					</div>
				</div>

				<div class="layui-form-item">
					<div class="layui-col-xs3">
						<label class="layui-form-label">籍贯&nbsp;<span
							style="color: red;">*</span></label>
						<div class="layui-input-inline">
							<input type="text" lay-verType="tips" name="jgId"
								lay-verify="required" placeholder="请输入籍贯" autocomplete="off"
								class="layui-input" value="${scTeacher.jgId}" maxlength="6">
						</div>
					</div>
					<div class="layui-col-xs3">
						<label class="layui-form-label">星座&nbsp;</label>
						<div class="layui-input-inline">
							<select lay-filter="xzId" lay-verType="tips" lay-verify="" id="xzId" name="xzId"
								autocomplete="off" maxlength="3">
								<option value="">请选择星座</option>
								<c:forEach var="item" items="${dictList}">
									<c:if test="${item.type == 'xz'}">
										<option ${scTeacher.xzId eq item.name ? 'selected':'' }
											value="${item.name}">${item.name}</option>
									</c:if>
								</c:forEach>
							</select>
						</div>
					</div>
					<div class="layui-col-xs3">
						<label class="layui-form-label">民族&nbsp;<span
							style="color: red;">*</span></label>
						<div class="layui-input-inline">
							<select lay-filter="mzId" lay-verType="tips" lay-verify="required" id="mzId"
								name="mzId" autocomplete="off">
								<option value="">请选择民族</option>
								<c:forEach var="item" items="${dictList}">
									<c:if test="${item.type == 'mz'}">
										<option ${scTeacher.mzId eq item.name ? 'selected':'' }
											value="${item.name}">${item.name}</option>
									</c:if>
								</c:forEach>
							</select>
						</div>
					</div>
					<div class="layui-col-xs3">
						<label class="layui-form-label">政治面貌&nbsp;<span
							style="color: red;">*</span></label>
						<div class="layui-input-inline">
							<select lay-filter="zzmmId" lay-verType="tips" lay-verify="required" id="zzmmId"
								name="zzmmId" autocomplete="off">
								<option value="">请选择政治面貌</option>
								<c:forEach var="item" items="${dictList}">
									<c:if test="${item.type == 'zzmm' }">
										<option ${scTeacher.zzmmId eq item.name ? 'selected':'' }
											value="${item.name}">${item.name}</option>
									</c:if>
								</c:forEach>
							</select>
						</div>
					</div>
				</div>
				<div class="layui-form-item">
					<div class="layui-col-xs3">
						<label class="layui-form-label">生肖</label>
						<div class="layui-input-inline">
							<select lay-filter="sxId" lay-verType="tips" id="sxId" name="sxId"
								autocomplete="off">
								<option value="">请选择生肖</option>
								<c:forEach var="item" items="${dictList}">
									<c:if test="${item.type == 'sx' }">
										<option ${scTeacher.sxId eq item.name ? 'selected':'' }
											value="${item.name}">${item.name}</option>
									</c:if>
								</c:forEach>
							</select>
						</div>
					</div>
					<div class="layui-col-xs3">
						<label class="layui-form-label">手机号码&nbsp;<span
							style="color: red;">*</span></label>
						<div class="layui-input-inline">
							<input type="tel" lay-verType="tips" name="phone"
								lay-verify="phoneNumber" placeholder="请输入手机号码"
								autocomplete="off" class="layui-input"
								value="${scTeacher.phone}" maxlength="11"
								onkeyup="this.value=this.value.replace(/\D/g,'')">
						</div>
					</div>
					<div class="layui-col-xs3">
						<label class="layui-form-label" style="width: auto;">紧急联系人&nbsp;<span
							style="color: red;">*</span></label>
						<div class="layui-input-inline">
							<input type="text" lay-verType="tips" name="emergencyContact"
								placeholder="请输入紧急联系人" lay-verify="required|name" autocomplete="off"
								class="layui-input" value="${scTeacher.emergencyContact}"
								maxlength="5" onkeyup="value=value.replace(/[\d]/g,'')">
						</div>
					</div>
					<div class="layui-col-xs3">
						<label class="layui-form-label" style="width: auto;">紧急联系电话&nbsp;<span
							style="color: red;">*</span></label>
						<div class="layui-input-inline" style="width: auto;">
							<input type="tel" lay-verType="tips" name="emergencyTel"
								lay-verify="phoneNumber" placeholder="请输入紧急联系电话"
								autocomplete="off" class="layui-input"
								value="${scTeacher.emergencyTel}" maxlength="11"
								onkeyup="this.value=this.value.replace(/\D/g,'')">
						</div>
					</div>
				</div>
				<div class="layui-form-item">
					<div class="layui-col-xs3">
						<label class="layui-form-label">身份证号码&nbsp;<span
							style="color: red;">*</span></label>
						<div class="layui-input-inline">
							<input type="text" lay-verType="tips" name="idNum"
								lay-verify="idcard" placeholder="请输入身份证号码" autocomplete="off"
								class="layui-input" value="${scTeacher.idNum}" maxlength="18"
								onKeyUp="value=value.replace(/[\W]/g,'')">
						</div>
					</div>
					<div class="layui-col-xs3">
						<label class="layui-form-label">微信号码&nbsp;<span
							style="color: red;">*</span></label>
						<div class="layui-input-inline">
							<input type="text" lay-verType="tips" name="wxNum"
								placeholder="请输入微信号码" lay-verify="username" autocomplete="off"
								class="layui-input" value="${scTeacher.wxNum}" maxlength="10">
						</div>
					</div>
					<div class="layui-col-xs3">
						<label class="layui-form-label">QQ号码&nbsp;<span
							style="color: red;">*</span></label>
						<div class="layui-input-inline">
							<input type="text" lay-verType="tips" name="qqNum"
								lay-verify="qqNumber" placeholder="请输入QQ号码" autocomplete="off"
								class="layui-input" value="${scTeacher.qqNum}" maxlength="10"
								onkeyup="this.value=this.value.replace(/\D/g,'')">
						</div>
					</div>
					<div class="layui-col-xs3">
						<label class="layui-form-label">电子邮箱&nbsp;<span
							style="color: red;">*</span></label>
						<div class="layui-input-inline">
							<input type="text" lay-verType="tips" name="email"
								lay-verify="email" placeholder="请输入电子邮箱" autocomplete="off"
								class="layui-input" value="${scTeacher.email}" maxlength="30">
						</div>
					</div>
				</div>
				<div class="layui-form-item" id="area-picker">
					<div class="layui-col-xs3">
						<label class="layui-form-label">所在省</label>
						<div class="layui-input-inline">
							<select id="province" name="province" class="province-selector"
								data-value="${scTeacher.province}" lay-filter="province-1">
							</select>
						</div>
					</div>
					<div class="layui-col-xs3">
						<label class="layui-form-label">所在市</label>
						<div class="layui-input-inline">
							<select id="city" name="city" class="city-selector"
								data-value="${scTeacher.city}" lay-filter="city-1">
							</select>
						</div>
					</div>
					<div class="layui-col-xs3">
						<label class="layui-form-label">所在区县</label>
						<div class="layui-input-inline">
							<select id="county" name="county" class="county-selector"
								data-value="${scTeacher.county}" lay-filter="county-1">
							</select>
						</div>
					</div>
					<div class="layui-col-xs3">
						<label class="layui-form-label">常住地址</label>
						<div class="layui-input-inline">
							<input type="text" lay-verType="tips" id="detailed"
								name="address" value="${scTeacher.address}"
								style="width: 12rem;" placeholder="请输入常住地址" autocomplete="off"
								onclick="txMapOpen();" class="layui-input" maxlength="30">
						</div>
					</div>
				</div>
				<div class="layui-form-item">
					<div class="layui-col-xs3">
						<label class="layui-form-label">经度</label>
						<div class="layui-input-inline">
							<input type="text" lay-verType="tips" name="lng" id="lng"
								placeholder="请输入经度" autocomplete="off" class="layui-input"
								value="${scTeacher.lng}" maxlength="8"
								onkeyup="if(isNaN(value))execCommand('undo')"
								onafterpaste="if(isNaN(value))execCommand('undo')">
						</div>
					</div>
					<div class="layui-col-xs3">
						<label class="layui-form-label">纬度</label>
						<div class="layui-input-inline">
							<input type="text" lay-verType="tips" name="lat" id="lat"
								placeholder="请输入纬度" autocomplete="off" class="layui-input"
								value="${scTeacher.lat}" maxlength="8"
								onkeyup="if(isNaN(value))execCommand('undo')"
								onafterpaste="if(isNaN(value))execCommand('undo')">
						</div>
					</div>
					<div class="layui-col-xs3">
						<label class="layui-form-label">公历生日&nbsp;<span
							style="color: red;">*</span></label>
						<div class="layui-input-inline">
							<input type="text" lay-verType="tips" lay-verify="date" name="glBirthday" id="date"
								autocomplete="off" class="layui-input"
								value="${scTeacher.glBirthday}" placeholder="请选择公历生日"
								onkeyup="this.value=this.value.replace(/\D/g,'')">
						</div>
					</div>
					<div class="layui-col-xs3">
						<label class="layui-form-label">农历生日&nbsp;<span
							style="color: red;">*</span></label>
						<div class="layui-input-inline">
							<input type="text" lay-verType="tips" lay-verify="date" name="nlBirthday"
								id="date2" autocomplete="off" class="layui-input"
								value="${scTeacher.nlBirthday}" placeholder="请选择农历生日"
								onkeyup="this.value=this.value.replace(/\D/g,'')">
						</div>
					</div>
				</div>
				<div class="layui-form-item">
					<div class="layui-col-xs3">
						<label class="layui-form-label">户口所在地</label>
						<div class="layui-input-inline">
							<input type="text" lay-verType="tips" name="registeredAddr"
								placeholder="请输入户口所在地" autocomplete="off" class="layui-input"
								value="${scTeacher.registeredAddr}" maxlength="25"
								onkeyup="value=value.replace(/[\d]/g,'')">
						</div>
					</div>
					<div class="layui-col-xs3">
						<label class="layui-form-label">出生地</label>
						<div class="layui-input-inline">
							<input type="text" lay-verType="tips" name="birthAddr"
								placeholder="请输入出生地" autocomplete="off" class="layui-input"
								value="${scTeacher.birthAddr}" maxlength="25"
								onkeyup="value=value.replace(/[\d]/g,'')">
						</div>
					</div>
					<div class="layui-col-xs3">
						<label class="layui-form-label">身高</label>
						<div class="layui-input-inline">
							<input type="text" lay-verType="tips" name="height"
								placeholder="请输入身高" lay-verify="height" autocomplete="off"
								class="layui-input" value="${scTeacher.height}" maxlength="5"
								onkeyup="this.value=this.value.replace(/\D/g,'')">
						</div>
					</div>
					<div class="layui-col-xs3">
						<label class="layui-form-label">血型&nbsp;<span
							style="color: red;">*</span></label>
						<div class="layui-input-inline">
							<select lay-filter="bloodType" lay-verType="tips" id="bloodType" name="bloodType"
								autocomplete="off">
								<option value="">请选择血型</option>
								<c:forEach var="item" items="${dictList}">
									<c:if test="${item.type == 'xx' }">
										<option ${scTeacher.bloodType eq item.name ? 'selected':'' }
											value="${item.name}">${item.name}</option>
									</c:if>
								</c:forEach>
							</select>
						</div>
					</div>
				</div>
				<div class="layui-form-item">
					<div class="layui-col-xs3">
						<label class="layui-form-label">兴趣爱好</label>
						<div class="layui-input-inline">
							<input type="text" lay-verType="tips" name="hoby"
								placeholder="请输入兴趣爱好" autocomplete="off" class="layui-input"
								value="${scTeacher.hoby}" maxlength="10">
						</div>
					</div>
					<div class="layui-col-xs3">
						<label class="layui-form-label">启用状态&nbsp;<span
							style="color: red;">*</span></label>
						<div class="layui-input-inline">
							<input type="radio" name="isEnable"
								${scTeacher.isEnable eq '0'?'':'checked'} value="1" title="启用" />
							<input type="radio" name="isEnable"
								${scTeacher.isEnable eq '0'?'checked':''} value="0" title="禁用" />
						</div>
					</div>
				</div>
				<div class="layui-form-item">
					<div class="layui-col-xs9">
						<label class="layui-form-label">教师证书</label>
						<div class="layui-input-block">
							<div class="case">
								<div class="upload" action='${interfacePath}'
									data-value='${teacherImageList}' id='imgerUploadId'
									data-num='9' data-type='png,jpg,jpeg'>
									<input type="hidden" id="imgurl" size="100" name="teachCert"
										value="${scTeacher.teachCert}" />
								</div>
							</div>
						</div>
					</div>
					<div class="layui-col-xs3" style="padding-left: 3rem">
						<div class="layui-form-item layui-form-text">
							<label class="layui-form-label" style="width: 15rem;">教师头像</label>
							<div class="case">
								<c:if test="${scTeacher.teachImg != null }">
									<c:if test="${scTeacher.teachImg != ''}">
										<div class="upload" action='${interfacePath}'
											data-value='${imgServerPath}${scTeacher.teachImg}'
											id='imgerUploadId1' data-num='1' data-type='png,jpg,jpeg'
											style="height: 15.5rem; width: 15rem;">
											<input type="hidden" id="valOne" size="100" name="teachImg"
												value="${scTeacher.teachImg}" />
										</div>
									</c:if>
									<c:if test="${scTeacher.teachImg == ''}">
										<div class="upload" action='${interfacePath}' data-value=''
											id='imgerUploadId1' data-num='1' data-type='png,jpg,jpeg'
											style="height: 15.5rem; width: 15rem;">
											<input type="hidden" id="valOne" size="100" name="teachImg"
												value="${scTeacher.teachImg}" />
										</div>
									</c:if>
								</c:if>
								<c:if test="${scTeacher.teachImg == null }">
									<div class="upload" action='${interfacePath}' data-value=''
										id='imgerUploadId1' data-num='1' data-type='png,jpg,jpeg'
										style="height: 15.5rem; width: 15rem;">
										<input type="hidden" id="valOne" size="100" name="teachImg"
											value="${scTeacher.teachImg}" />
									</div>
								</c:if>
							</div>
						</div>
					</div>
				</div>

				<div class="layui-form-item">
					<label class="layui-form-label">教师简介</label>
					<div class="layui-input-block">
						<div class="layui-col-xs12">
							<textarea rows="50" cols="100" id="editor" name="teachBiref"
								maxlength="300 ">${scTeacher.teachBiref}</textarea>
						</div>
					</div>
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label">备注</label>
					<div class="layui-input-block">
						<div class="layui-col-xs12">
							<textarea class="layui-textarea" name="remark" id="remark"
								placeholder="请输入备注" maxlength="100">${scTeacher.remark}</textarea>
						</div>
					</div>
				</div>
			</div>
			<!-- 标准化表单提交按钮 -->
			<%@ include
				file="/WEB-INF/views/modules/templet/form/templetSubmitButton.jsp"%>
		</form>
	</div>
	<!-- 标准化表单提交JS -->
	<%@ include
		file="/WEB-INF/views/modules/templet/form/templetSubmit.jsp"%>
	<!-- 三级联动 -->
	<%@ include
		file="/WEB-INF/views/modules/templet/form/templetThreeArea.jsp"%>
	<!-- 富文本框 -->
	<script type="text/javascript" charset="utf-8">
		var ue = UE.getEditor('editor');
		ue.ready(function() {
			this.setHeight(230);
		});
	</script>
	<!-- 腾讯地图 -->
	<%@ include file="/WEB-INF/views/modules/templet/newMap.jsp"%>
	<!-- 图片上传 -->
	<div id="showTempletImage" style="display: none;">
		<img id="showImg" style="width: 100%;">
	</div>
	<script type="text/javascript">
		$(function() {
			$("#imgerUploadId").upload(function(_this, data) {
				showTempletImage(data);
			})
		});

		$(function() {
			$("#imgerUploadId1").upload(function(_this, data) {
				showTempletImage(data);
			})
		});
		//图片预览
		function showTempletImage(data) {
			layer
					.open({
						offset : [ '9rem', '17rem' ],
						type : 1,
						anim : 1,
						title : '图片高清预览',
						shadeClose : true,
						shade : 0.01,
						area : [ '50%', '70%' ],
						content : $("#showTempletImage"),
						success : function(lay) {
							// 标题加入背景色 以及字体颜色
							$(".layui-layer-title").css('background-color',
									'#08c');
							$(".layui-layer-title").css('color', 'white');
							// 将原有的X符号替换成图标
							// 删除原有的样式
							$(".layui-layer.layui-layer-page ")
									.children('span')[0].remove();
							// 创建元素
							var div1 = document.createElement("span");
							// 加入CSS样式以及单机事件
							div1
									.setAttribute('style',
											'position: absolute;right: 15px; top: 11px;line-height: initial;cursor:hand; ');
							div1.setAttribute('onclick', 'closeWin()');
							div1.innerHTML = '<i class="layui-icon" close="a" style="color:#FFF;font-size: 20px;">ဆ</i>';
							// 添加到指定位置
							$(".layui-layer.layui-layer-page ").children('div')[1]
									.after(div1);

							var showImg = document.getElementById('showImg');
							showImg.setAttribute('src', data);
						},
						end : function(index) {
						}
					});
		}

		// 单机事件关闭窗口
		function closeWin() {
			layer.closeAll();
		}
	</script>
	<!--LayuiJS -->
	<script type="text/javascript">
		var rootUrl = $("#rootUrl").val();
		layui.use([ 'laydate', 'form' ], function() {
			var laydate = layui.laydate;
			laydate.render({
				elem : '#date',
				format : 'yyyy-MM-dd',
				theme : 'grid'
			});
			laydate.render({
				elem : '#date2',
				format : 'yyyy-MM-dd',
				theme : 'grid'
			});

		});
	</script>
	<!-- 提交验证JS -->
	<script type="text/javascript">
		layui
				.use(
						'form',
						function() {
							var form = layui.form;
							form
									.verify({
										code : [ /^\d{10}$/, '请输入10位数正确的教师编码' ],
										name : [ /^[\u4E00-\u9FA5A-Za-z]+$/,
												'请输入正确的姓名' ],
										idcard : [
												/^([1-6][1-9]|50)\d{4}(18|19|20)\d{2}((0[1-9])|10|11|12)(([0-2][1-9])|10|20|30|31)\d{3}[0-9Xx]$/,
												'请输入正确的身份证号' ],
										age : [
												/^(?:[1-9][0-9]?|1[01][0-9]|120)$/,
												'请输入正确的年龄' ],
										username : [
												/^[a-zA-Z]{1}[-_a-zA-Z0-9]{5,19}$/,
												'请输入正确的微信号码' ],
										qqNumber : [ /[1-9][0-9]{4,}/,
												'请输入正确的QQ号码' ],
										height : [
												/^(0{1}|[1-9]\d{0,3}|.{0})$/,
												'请输入正确的身高' ],
										phoneNumber : function(value) {
											var regex = /^1(3|4|5|7|8)\d{9}$/;
											if (!value.match(regex)) {
												return '请输入正确的手机号码';
											} else {
												return false;
											}
										}
									});
							//监听表单提交
							/* form.on('submit(formDemos)', function(value) {
								var params = {
									"code" : value.field.code
								};
								console.log(params);
								 var message='';
								$.ajax({
									url : rootUrl + "/getByCode",
									contentType : "application/json",
									dataType : 'json',
									type : "post",
									async : false,
									data: JSON.stringify(params),
									success: function(data) {
							            if(data){
							            	
							            }else{
							            	message="用户名已存在，请重新输入"
							            }
							        }
								});
								if(message !== '')
									return message; 
									return true;
							}); */
						});
	</script>
</body>
</html>