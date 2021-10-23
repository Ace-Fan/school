<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
<title>保存评分信息管理</title>

<!-- 标准化通用头部 -->
<%@ include
	file="/WEB-INF/views/modules/templet/headExport/templetExport.jsp"%>

<!-- 标准化表格页面CSS -->
<link rel="stylesheet" href="${ctxStatic}/app/form/templetOneLine.css" />

</head>
<body>

	<!-- 标准化表单隐藏文本 -->
	<%@ include file="/WEB-INF/views/modules/templet/templetHide.jsp"%>

	<!-- 主体内容 -->
	<div class="layui-main">
		<!-- 头部标题内容 -->
		<fieldset class="layui-elem-field layui-field-title">
			<legend>
				<c:choose>
					<c:when test="${is eq 'show'}">
		        		评分信息查看
		        	</c:when>
					<c:otherwise>
		        		评分信息${scGradeMsg.id eq null ?'添加':'修改'}
		        	</c:otherwise>
				</c:choose>
			</legend>
		</fieldset>

		<!-- 主体内容 -->
		<form class="layui-form layui-form-pane" action=""
			style="margin-top: 1em;">
			<div id="dis">
				<input type="hidden" name="id" value="${scGradeMsg.id}" />

				<div class="layui-form-item">
					<div class="layui-col-xs12">
						<label class="layui-form-label">教师姓名&nbsp;<span
							style="color: red;">*</span></label>
						<div class="layui-input-inline">
							<select lay-search lay-filter="teachId" lay-verify="required"
								id="teachId" name="teachId" autocomplete="off">
								<option value="">请选择教师姓名</option>
								<c:forEach var="item" items="${scTeacherList}">
									<option ${scGradeMsg.teachId eq item.id ? 'selected':'' }
										value="${item.id}">${item.name}</option>
								</c:forEach>
							</select>
						</div>
					</div>
				</div>
				<div class="layui-form-item">
					<div class="layui-col-xs12">
						<label class="layui-form-label">评分类型&nbsp;<span
							style="color: red;">*</span></label>
						<div class="layui-input-inline">
							<select lay-search lay-filter="typeId" lay-verify="required"
								id="typeId" name="typeId" autocomplete="off">
								<option value="">请选择评分类型</option>
								<c:forEach var="item" items="${gradeTypeList}">
									<option ${scGradeMsg.typeId eq item.id ? 'selected':'' }
										value="${item.id}">${item.name}</option>
								</c:forEach>
							</select>
						</div>
					</div>
				</div>
				<div class="layui-form-item">
					<div class="layui-col-xs12">
						<label class="layui-form-label">评分项&nbsp;<span
							style="color: red;">*</span></label>
						<div class="layui-input-inline">
							<c:choose>
								<c:when
									test="${scGradeMsg.itemId !='' && scGradeMsg.itemId != null}">
									<select id="itemId" name="itemId">
										<option value="">请选择评分项</option>
										<c:forEach var="item" items="${gradeTermList}">
										<c:if test="${scGradeMsg.typeId eq item.typeId}" >
												<option ${scGradeMsg.itemId eq item.id ? 'selected':'' }
													value="${item.id}">${item.name}</option>
													</c:if>
										</c:forEach>
									</select>
								</c:when>
								<c:otherwise>
									<select id="itemId" name="itemId">
										<option value="">请选择评分项</option>
									</select>
								</c:otherwise>
							</c:choose>
						</div>
					</div>
				</div>
				<div class="layui-form-item">
					<div class="layui-col-xs12">
						<label class="layui-form-label">分值&nbsp;<span
							style="color: red;">*</span></label>
						<div class="layui-input-inline">
							<div id="rate" style="padding-left: 0.5rem;"></div>
							<input type="text" id="grade" name="grade" autocomplete="off"
								class="layui-input"  maxlength="2">
							<div class="layui-form-mid layui-word-aux">请点击星星评分：1颗星: 极差
								&nbsp;&nbsp;2颗星: 差 &nbsp;&nbsp;3颗星: 中等&nbsp;&nbsp;4颗星:
								好&nbsp;&nbsp;5颗星: 极好<br/>注：手动输入分值，保存后即可查看效果</div>
						</div>
					</div>
				</div>
				<div class="layui-form-item">
					<div class="layui-col-xs12">
						<label class="layui-form-label">学期&nbsp;<span
							style="color: red;">*</span></label>
						<div class="layui-input-inline">
							<select lay-search lay-filter="semId" lay-verify="required"
								id="semId" name="semId" autocomplete="off">
								<option value="">请选择学期</option>
								<c:forEach var="item" items="${scSemesterList}">
									<option ${scGradeMsg.semId eq item.id ? 'selected':'' }
										value="${item.id}">${item.name}</option>
								</c:forEach>
							</select>
						</div>
					</div>
				</div>
				<!-- 启用状态 -->
				<div class="layui-form-item">
					<div class="layui-col-xs12">
						<label class="layui-form-label">启用状态&nbsp;<span
							style="color: red;">*</span></label>
						<div class="layui-input-inline">
							<input type="radio" name="isEnable"
								${scGradeMsg.isEnable eq '0'?'':'checked'} value="1" title="启用" />
							<input type="radio" name="isEnable"
								${scGradeMsg.isEnable eq '0'?'checked':''} value="0" title="禁用" />
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
	<script type="text/javascript">
		var rootUrl = $("#rootUrl").val();
		layui.use([ 'layer', 'form', 'rate' ], function() {
			var layer = layui.layer, form = layui.form, rate = layui.rate

			form.render('select');

			form.on('select(typeId)', function(data) {
				var typeId = data.value;
				$.ajax({
					type : "post",
					url : rootUrl + "/getByTypeId",
					data : {
						typeId : typeId
					},
					dataType : "json",
					success : function(t) {
						var recover = '<option value="">请选择评分项</option>';
						for ( var i in t) {
							recover += '<option value="'+t[i].id+'">'
									+ t[i].name + '</option>';0
						}
						$("#itemId").html(recover);
						form.render();
					},
					error : function() {
						layer.alert('请求失败，稍后再试', {
							icon : 5
						});
					}
				});
			});

			//自定义文本
			rate.render({
				elem : '#rate',
				text : true,
				value : '${scGradeMsg.grade}',
				setText : function(value) { //自定义文本的回调
					var arrs = {
						'0' : '无',
						'1' : '极差',
						'2' : '差',
						'3' : '中等',
						'4' : '好',
						'5' : '极好'
					};
				console.log(value);
					this.span.text(arrs[value]);
					$("#grade").val(value);
				}
			});
		});
	</script>
</body>
</html>