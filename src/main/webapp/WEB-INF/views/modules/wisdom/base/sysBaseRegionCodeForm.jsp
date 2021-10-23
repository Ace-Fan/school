<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>行政区划经纬度管理</title>
	
	<!-- 标准化通用头部 -->
	<%@ include file="/WEB-INF/views/modules/templet/headExport/templetExport.jsp" %>
	
	<style type="text/css">
		/* 设置头部legend CSS样式 */
		.layui-field-title legend {
			margin-left: 30rem;
		}
		
		/* 设置提示文本框宽度 */
		.layui-main .layui-form-pane .layui-form-item .layui-col-xs4 .layui-form-label {
			width : 10rem;
		}
	</style>
	
</head>
<body>

	<!-- 标准化表单隐藏文本 -->
	<%@ include file="/WEB-INF/views/modules/templet/templetHide.jsp" %>
	
	<!-- 主体内容 -->
	<div class="layui-main" style="padding: 1rem; margin-left: 1rem; margin-top: 1rem;">
		<!-- 引入行政区划表单头部信息 -->
	    <fieldset class="layui-elem-field layui-field-title">
		   	<legend>
		        <c:choose>
					<c:when test="${is eq 'show'}">
		        		行政区划经纬度信息查看
		        	</c:when>
					<c:otherwise>
		        		行政区划经纬度信息类型${sysBaseRegionCode.id eq null ?'添加':'修改'}
		        	</c:otherwise>
				</c:choose>
		    </legend>
		</fieldset>
		
		<!-- 表单内容 -->
		<form class="layui-form layui-form-pane" action="" style="margin-top: 1rem;">
			<div id="dis">
				<input type="hidden" name="id" value="${sysBaseRegionCode.id}">
			
				<!-- 第一行：行政区划ID、父级ID、行政区划全称 -->
				<div class="layui-form-item">
					<!-- 行政区划ID -->
					<div class="layui-col-xs4">
						<label class="layui-form-label">行政区划id&nbsp;<span style="color: red;">*</span></label>
						
						<div class="layui-input-inline">
							<input type="text" name="cityCode" id="cityCode" value="${sysBaseRegionCode.cityCode}" lay-verify="required" 
								placeholder="请输入行政区划id" autocomplete="off" class="layui-input" maxlength="15">
						</div>
					</div>
					
					<!-- 父级ID -->
					<div class="layui-col-xs4">
						<label class="layui-form-label">父级id</label>
						<div class="layui-input-inline">
							<input type="text" name="parentCode" maxlength="15" value="${sysBaseRegionCode.parentCode}" placeholder="请输入父级id"
								autocomplete="off" class="layui-input">
						</div>
					</div>
					
					<!-- 行政区划全称 -->
					<div class="layui-col-xs4">
						<label class="layui-form-label">行政区划全称&nbsp;<span style="color: red;">*</span></label>
						<div class="layui-input-inline">
							<input type="text" name="name" maxlength="100" id="name" value="${sysBaseRegionCode.name}" required
								lay-verify="required" placeholder="请输入行政区划全称" autocomplete="off" class="layui-input">
						</div>
					</div>
				</div>
				
				<!-- 第二行：省市区全称聚合、行政区划简称、行政区划简称聚合 -->
				<div class="layui-form-item">
					<!-- 省市区全称聚合 -->
					<div class="layui-col-xs4">
						<label class="layui-form-label">省市区全称聚合&nbsp;<span style="color: red;">*</span></label>
						<div class="layui-input-inline">
							<input type="text" name="mergerName" value="${sysBaseRegionCode.mergerName }" lay-verify="required"
								placeholder="请输入省市区全称聚合" autocomplete="off" class="layui-input" maxlength="100">
						</div>
					</div>
					
					<!-- 行政区划简称 -->
					<div class="layui-col-xs4">
						<label class="layui-form-label">行政区划简称&nbsp;<span style="color: red;">*</span></label>
						<div class="layui-input-inline">
							<input type="text" name="shortName" maxlength="25" value="${sysBaseRegionCode.shortName }" lay-verify="required"
								placeholder="请输入行政区划简称" autocomplete="off" class="layui-input">
						</div>
					</div>
				
					<!-- 行政区划简称聚合 -->
					<div class="layui-col-xs4">
						<label class="layui-form-label" style=" width: 160px;">行政区划简称聚合&nbsp;<span style="color: red;">*</span></label>
						<div class="layui-input-inline">
							<input type="text" name="mergerShortName" maxlength="50" value="${sysBaseRegionCode.mergerShortName }" required
								lay-verify="required" placeholder="请输入行政区划简称聚合" autocomplete="off" class="layui-input">
						</div>
					</div>
				</div>
				
				<!-- 第三行：行政区划编码、所属级别、邮编 -->
				<div class="layui-form-item">
				
					<!-- 行政区划级别 -->
					<div class="layui-col-xs4">
						<label class="layui-form-label">行政区划级别&nbsp;<span style="color: red;">*</span></label>
						<div class="layui-input-inline">
							<select lay-verify="required" name="level">
								<c:if test="${sysBaseRegionCode.level == 'country'}">
									<option value="country" selected="selected">国家</option>
									<option value="province">省份</option>
									<option value="city">市</option>
									<option value="district">区/县</option>
									<option value="street">街道</option>
								</c:if>
								<c:if test="${sysBaseRegionCode.level == 'province'}">
									<option value="country">国家</option>
									<option value="province" selected="selected">省份</option>
									<option value="city">市</option>
									<option value="district">区/县</option>
									<option value="street">街道</option>
								</c:if>
								<c:if test="${sysBaseRegionCode.level == 'city'}">
									<option value="country">国家</option>
									<option value="province">省份</option>
									<option value="city" selected="selected">市</option>
									<option value="district">区/县</option>
									<option value="street">街道</option>
								</c:if>
								<c:if test="${sysBaseRegionCode.level == 'district'}">
									<option value="country">国家</option>
									<option value="province">省份</option>
									<option value="city">市</option>
									<option value="district" selected="selected">区/县</option>
									<option value="street">街道</option>
								</c:if>
								<c:if test="${sysBaseRegionCode.level == 'street'}">
									<option value="country">国家</option>
									<option value="province">省份</option>
									<option value="city">市</option>
									<option value="district">区/县</option>
									<option value="street" selected="selected">街道</option>
								</c:if>
								<c:if test="${sysBaseRegionCode.level == null}">
									<option value="country">国家</option>
									<option value="province">省份</option>
									<option value="city">市</option>
									<option value="district">区/县</option>
									<option value="street">街道</option>
								</c:if>
							</select>
						</div>
					</div>
					
					<!-- 所属级别 -->
					<div class="layui-col-xs4">
						<label class="layui-form-label">所属级别&nbsp;<span style="color: red;">*</span></label>
						<div class="layui-input-inline">
							<select lay-verify="required" name="levelType">
								<c:if test="${sysBaseRegionCode.levelType == 0}">
									<option value="0" selected="selected">国家</option>
									<option value="1">省(直辖市)</option>
									<option value="2">市</option>
									<option value="3">区(县)</option>
									<option value="4">街道</option>
								</c:if>
								<c:if test="${sysBaseRegionCode.levelType == 1}">
									<option value="0">国家</option>
									<option value="1" selected="selected">省(直辖市)</option>
									<option value="2">市</option>
									<option value="3">区(县)</option>
									<option value="4">街道</option>
								</c:if>
								<c:if test="${sysBaseRegionCode.levelType == 2}">
									<option value="0">国家</option>
									<option value="1">省(直辖市)</option>
									<option value="2" selected="selected">市</option>
									<option value="3">区(县)</option>
									<option value="4">街道</option>
								</c:if>
								<c:if test="${sysBaseRegionCode.levelType == 3}">
									<option value="0">国家</option>
									<option value="1">省(直辖市)</option>
									<option value="2">市</option>
									<option value="3" selected="selected">区(县)</option>
									<option value="4">街道</option>
								</c:if>
								<c:if test="${sysBaseRegionCode.levelType == 4}">
									<option value="0">国家</option>
									<option value="1">省(直辖市)</option>
									<option value="2">市</option>
									<option value="3">区(县)</option>
									<option value="4" selected="selected">街道</option>
								</c:if>
								<c:if test="${sysBaseRegionCode.levelType == null}">
									<option value="0">国家</option>
									<option value="1">省(直辖市)</option>
									<option value="2">市</option>
									<option value="3">区(县)</option>
									<option value="4">街道</option>
								</c:if>
							</select>
						</div>
					</div>
				
					<!-- 邮编 -->
					<div class="layui-col-xs4">
						<label class="layui-form-label">邮编</label>
						<div class="layui-input-inline">
							<input type="text" name="zipCode" maxlength="15" value="${sysBaseRegionCode.zipCode }" autocomplete="off"
								class="layui-input" placeholder="请输入邮编">
						</div>
					</div>
				</div>
		
				<!-- 第四行：拼音、简拼、城市中心点 -->		
				<div class="layui-form-item">
					<!-- 拼音 -->
					<div class="layui-col-xs4">
						<label class="layui-form-label">拼音</label>
						<div class="layui-input-inline">
							<input type="text" name="namePinyin" maxlength="100" id="namePinyin" value="${sysBaseRegionCode.namePinyin }"
								readonly="readonly" autocomplete="off" class="layui-input" placeholder="请输入行政区划全称">
						</div>
					</div>
					
					<!-- 简拼 -->
					<div class="layui-col-xs4">
						<label class="layui-form-label">简拼</label>
						<div class="layui-input-inline">
							<input type="text" name="nameJianpin" maxlength="30" id="nameJianpin" value="${sysBaseRegionCode.nameJianpin }"
								readonly="readonly" autocomplete="off" class="layui-input" placeholder="请输入行政区划全称">
						</div>
					</div>
				
					<!-- 城市中心点 -->
					<div class="layui-col-xs4">
						<label class="layui-form-label">城市中心点&nbsp;<span style="color: red;">*</span></label>
						<div class="layui-input-inline">
							<input type="text" name="center" maxlength="30" value="${sysBaseRegionCode.center }" lay-verify="required"
								placeholder="请输入城市中心点" autocomplete="off" class="layui-input">
						</div>
					</div>
				</div>
				
				<!-- 第五行：经度、纬度、首字母 -->
				<div class="layui-form-item">
					<!-- 经度 -->
					<div class="layui-col-xs4">
						<label class="layui-form-label">经度</label>
						<div class="layui-input-inline">
							<input type="text" name="longitude" maxlength="20" value="${sysBaseRegionCode.longitude}" placeholder="请输入经度"
								autocomplete="off" class="layui-input">
						</div>
					</div>
					
					<!-- 纬度 -->
					<div class="layui-col-xs4">
						<label class="layui-form-label">纬度</label>
						<div class="layui-input-inline">
							<input type="text" name="latitude" maxlength="20" value="${sysBaseRegionCode.latitude}" placeholder="请输入纬度"
								autocomplete="off" class="layui-input">
						</div>
					</div>
				
					<!-- 首字母 -->
					<div class="layui-col-xs4">
						<label class="layui-form-label">首字母</label>
						<div class="layui-input-inline">
							<input type="text" name="nameFirstChar" maxlength="20" id="nameFirstChar" value="${sysBaseRegionCode.nameFirstChar }"
								readonly="readonly" autocomplete="off" class="layui-input" placeholder="请输入行政区划全称">
						</div>
					</div>
				</div>
				
				<!-- 第六行：状态、历史版本、电话区划 -->
				<div class="layui-form-item">
					<!-- 状态 -->
					<div class="layui-col-xs4">
						<label class="layui-form-label">状态&nbsp;<span style="color: red;">*</span></label>
						<div class="layui-input-inline">
							<select lay-verify="required" name="status">
								<c:if test="${sysBaseRegionCode.status == 1}">
									<option value="1" selected="selected">可修改 </option>
									<option value="2">不可修改 </option>
									<option value="3">已删除</option>
								</c:if>
								<c:if test="${sysBaseRegionCode.status == 2}">
									<option value="1">可修改 </option>
									<option value="2" selected="selected">不可修改 </option>
									<option value="3">已删除</option>
								</c:if>
								<c:if test="${sysBaseRegionCode.status == 3}">
									<option value="1" selected="selected">可修改 </option>
									<option value="2">不可修改 </option>
									<option value="3" selected="selected">已删除</option>
								</c:if>
								<c:if test="${sysBaseRegionCode.status == null}">
									<option value="1">可修改 </option>
									<option value="2">不可修改 </option>
									<option value="3">已删除</option>
								</c:if>
							</select>
						</div>
					</div>
					
					<!-- 历史版本 -->
					<div class="layui-col-xs4">
						<label class="layui-form-label">历史版本&nbsp;<span style="color: red;">*</span></label>
						<div class="layui-input-inline">
							<input type="text" name="version" maxlength="12" value="${sysBaseRegionCode.version }" lay-verify="required"
								placeholder="请输入历史版本" autocomplete="off" class="layui-input">
						</div>
					</div>
					
					<!-- 电话区划号码 -->
					<div class="layui-col-xs4">
						<label class="layui-form-label">电话区划号码</label>
						<div class="layui-input-inline">
							<input type="text" name="telephoneCode" maxlength="15" value="${sysBaseRegionCode.telephoneCode }"
								placeholder="请输入电话区划号码" autocomplete="off" class="layui-input">
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
	
	<!-- 组记词生成 -->
	<script type="text/javascript">
		$('#name').on('input propertychange',function(){
		 	var name = $("#name").val();
		 	
		 	if(name!='') {
		 		$.post("${ctx}/base/pinyin/getPinyin", { "pinyinName" : name }, function(result) {
					var obj = JSON.parse(result)// 将json数据转为对象
					
					if (obj.code == 1) {
						var codeInfo = obj.data;
						var shortCode = codeInfo[0];
						var fullCode = codeInfo[1];
						
						if (fullCode == '') {
							$("#namePinyin").val(shortCode);
						} else {
							$("#namePinyin").val(fullCode);	
						}
						
						$("#nameJianpin").val(shortCode);				
						$("#nameFirstChar").val(shortCode.substring(0,1));				
					} else {
						$("input[name='namePinyin']").val(obj.msg);
						$("input[name='nameJianpin']").val(obj.msg);
						$("input[name='nameFirstChar']").val(obj.msg);
					}
				});
		 	}
	    });    
	</script>
	
</body>
</html>