<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>社区信息管理</title>
	
	<!-- 标准化通用头部 -->
	<%@ include file="/WEB-INF/views/modules/templet/headExport/templetExport.jsp" %>
	
	<!-- 引入腾讯地图 -->
	<%@ include file="/WEB-INF/views/modules/templet/txMap.jsp" %>
	
	<style type="text/css">
		.layui-field-title legend {
			margin-left: 30rem;
		} 
		
		/* 设置单文本框 文本框的宽度 */
		.layui-form-pane #dis .layui-form-item .layui-col-xs11 .layui-input-inline {
			width: 55rem;
		}
		
		.layui-form-pane #dis .layui-form-item .layui-col-xs11 .layui-form-label {
			width: 9rem;
		}
		
		/* 腾讯地图css */
		#container {
			width: 100%;
			height: 80%;
		}
	</style>
	
</head>
<body onload="init()">
	
	<!-- 标准化表单隐藏文本 -->
	<%@ include file="/WEB-INF/views/modules/templet/templetHide.jsp" %>
	
	<!-- 引入三级联动JS -->
	<%@ include file="/WEB-INF/views/modules/templet/area/templetCity.jsp" %>
	<%@ include file="/WEB-INF/views/modules/templet/area/templetCounty.jsp" %>
	<%@ include file="/WEB-INF/views/modules/templet/area/templetProvince.jsp" %>
	
	<!-- 主体内容 -->
	<div class="layui-main" style="padding: 1rem; margin-left: 1rem; margin-top: 1rem;">
		
	    <fieldset class="layui-elem-field layui-field-title">
		   	<legend>
		        <c:choose>
					<c:when test="${is eq 'show'}">
		        		社区信息查看
		        	</c:when>
					<c:otherwise>
		        		社区信息${wisCommunityInfo.id eq null ?'添加':'修改'}
		        	</c:otherwise>
				</c:choose>
		    </legend>
		</fieldset>
		
		<form class="layui-form layui-form-pane" action="" style="margin-top: 1em;">
			<div id="dis">
				<input type="hidden" name="province" id="province" value="${wisCommunityInfo.province}">
				<input type="hidden" name="city" id="city" value="${wisCommunityInfo.city}">
				<input type="hidden" name="county" id="county" value="${wisCommunityInfo.county}">
				
				<input type="hidden" name="id" value="${wisCommunityInfo.id}" />
				
				<div class="layui-form-item">
					<div class="layui-col-xs11 layui-col-xs-offset1">
						<label class="layui-form-label">社区名称&nbsp;<span style="color: red;">*</span></label>
						<div class="layui-input-inline">
							<input type="text" name="name" lay-verify="required" placeholder="请输入社区名称"
								autocomplete="off" class="layui-input" value="${wisCommunityInfo.name}" maxlength="200">
						</div>
					</div>
				</div>
				
				<div class="layui-form-item">
					<div class="layui-col-xs11 layui-col-xs-offset1">
						<label class="layui-form-label">所在省份&nbsp;<span style="color: red;">*</span></label>
						<div class="layui-input-inline">
							<select lay-filter="province" lay-verify="required" id="sysBaseAreaIndexInfo" autocomplete="off">
								<option value="">请选择所在省份</option>
								<c:forEach var="item" items="${indexAreaInfoList}">
									<option ${wisCommunityInfo.province eq item.name ? 'selected':'' } value="${item.code}">${item.name}</option>
								</c:forEach>
							</select>
						</div>
					</div>
				</div>
			
				<div class="layui-form-item">
					<div class="layui-col-xs11 layui-col-xs-offset1">
						<label class="layui-form-label">所在城市&nbsp;<span style="color: red;">*</span></label>
						<div class="layui-input-inline">
							<select lay-filter="city" lay-verify="required" id="sysBaseAreaSecondInfo" autocomplete="off">
								<option value="">请选择所在城市</option>
								<c:forEach var="item" items="${secondAreaInfoList}">
									<option ${wisCommunityInfo.city eq item.name ? 'selected':'' } value="${item.code}">${item.name}</option>
								</c:forEach>
							</select>
						</div>
					</div>
				</div>
				
				<div class="layui-form-item">
					<div class="layui-col-xs11 layui-col-xs-offset1">
						<label class="layui-form-label">所在区县&nbsp;<span style="color: red;">*</span></label>
						<div class="layui-input-inline">
							<select lay-filter="county" lay-verify="required" id="sysBaseAreaThirdInfo" autocomplete="off">
								<option value="">请选择所在区县</option>
								<c:forEach var="item" items="${thirdAreaInfoList}">
									<option ${wisCommunityInfo.county eq item.name?'selected':''} value="${item.code}">${item.name}</option>
								</c:forEach>
							</select>
						</div>
					</div>
				</div>
				
				<div class="layui-form-item">
					<div class="layui-col-xs11 layui-col-xs-offset1">
						<label class="layui-form-label">社区地址&nbsp;<span style="color: red;">*</span></label>
						<div class="layui-input-inline">
							<input type="text" name="address" value="${wisCommunityInfo.address}" required maxlength="200"
								lay-verify="required" placeholder="请选择社区地址" readonly="readonly" class="layui-input" onclick="txMapOpen();" id="addr">
						</div>
					</div>
				</div>
				
				<div class="layui-form-item">
					<div class="layui-col-xs11 layui-col-xs-offset1">
						<label class="layui-form-label">社区经度&nbsp;<span style="color: red;">*</span></label>
						<div class="layui-input-inline">
							<input type="text" name="lng" disabled="disabled" value="${wisCommunityInfo.lng}" required maxlength="50"
								lay-verify="required" placeholder="请选择社区地址" autocomplete="off" class="layui-input" readonly="readonly" id="lng">
						</div>
					</div>
				</div>
				
				<div class="layui-form-item">
					<div class="layui-col-xs11 layui-col-xs-offset1">
						<label class="layui-form-label">社区纬度&nbsp;<span style="color: red;">*</span></label>
						<div class="layui-input-inline">
							<input type="text" name="lat" disabled="disabled" value="${wisCommunityInfo.lat}" required maxlength="50"
								lay-verify="required" placeholder="请选择社区地址" autocomplete="off" class="layui-input" readonly="readonly" id="lat">
						</div>
					</div>
				</div>
		
				<!-- 启用状态 -->
				<div class="layui-form-item">
					<div class="layui-col-xs11 layui-col-xs-offset1">
						<label class="layui-form-label">启用状态&nbsp;<span style="color: red;">*</span></label>
						<div class="layui-input-inline">
							<input type="radio" name="isEnable" ${wisCommunityInfo.isEnable eq '0'?'':'checked'} value="1" title="启用" /> 
							<input type="radio" name="isEnable" ${wisCommunityInfo.isEnable eq '0'?'checked':''} value="0" title="禁用" />
						</div>
					</div>
				</div>
				
				<!-- 备注 -->
				<div class="layui-form-item">
					<div class="layui-col-xs11 layui-col-xs-offset1">
						<label class="layui-form-label">备注</label>
						<div class="layui-input-inline">
							<textarea placeholder="请输入备注" maxlength="100" name="remark" class="layui-textarea">${wisCommunityInfo.remark}</textarea>
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