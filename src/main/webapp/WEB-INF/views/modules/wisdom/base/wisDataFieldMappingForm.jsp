<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>导入字段映射配置管理</title>
	
	<!-- 标准化通用头部 -->
	<%@ include file="/WEB-INF/views/modules/templet/headExport/templetExport.jsp" %>
	
	<!-- 标准化表格页面CSS -->
	<style type="text/css">
		/* 设置头部legend CSS样式 */
		.layui-field-title legend {
			margin-left: 1rem;
		}
		
		/* 设置单文本框 文本框的宽度 */
		.layui-form-pane #dis .layui-form-item .layui-col-xs12 .layui-input-inline {
			width: 60rem;
		}
		
		.layui-form-pane #dis .layui-form-item .layui-col-xs12 .layui-form-label {
			width: 9rem;
		}
		
		.tempMain {
			padding: 1rem; 
			margin-left: 1rem; 
			margin-top: -1rem;
		}
		
		/* 双表结构表格INPUT框输入样式 */
		.editTableInput {
			margin-top: -10px;
			margin-left: -15px;
			margin-right: -15px;
			width: 117%;
		}
		
		.editTableInputOld {
			border: 0px;
			outline: none;
			cursor: pointer;
			margin-top: -3px;
			background-color: white;
		}
		
		/* 设置下拉框的高度与表格单元相同 */
		td .layui-form-select {
			margin-top: -10px;
			margin-left: -15px;
			margin-right: -15px;
		}

		/* 设置单文本框 文本框的宽度 */
		.layui-form-pane #dis .layui-form-item .layui-col-xs11 .layui-input-inline {
			width: 55rem;
		}
		
		.layui-form-pane #dis .layui-form-item .layui-col-xs11 .layui-form-label {
			width: 9rem;
		}
		
	</style>
	
</head>
<body>
	
	<!-- 标准化表单隐藏文本 -->
	<%@ include file="/WEB-INF/views/modules/templet/templetHide.jsp" %>
	
	<!-- 启用状态切换 -->
	<script type="text/html" id="isNullableCheck">
	{{#if (d.isNullable == "yes") { }}
		<input type="checkbox" checked="" value="yes" name="isNullable" lay-filter="isNullableSwitch" lay-skin="switch" lay-text="可空|不可空">
    {{# }else if(d.isNullable == "no"){ }}
		<input type="checkbox" value="no" name="isNullable" lay-filter="isNullableSwitch" lay-skin="switch" lay-text="可空|不可空">
    {{# } }}
	</script>
	
	<script type="text/html" id="isImportCheck">
	{{#if (d.isImport == 1) { }}
		<input type="checkbox" checked="" value="1" name="isImport" lay-skin="switch" lay-filter="isImportSwitch" lay-text="需导入|不需导入" dataId="importIndex{{d.LAY_TABLE_INDEX}}">
    {{# }else if(d.isImport == 0){ }}
		<input type="checkbox" value="0" name="isImport" lay-skin="switch" lay-filter="isImportSwitch" lay-text="需导入|不需导入" dataId="importIndex{{d.LAY_TABLE_INDEX}}">
    {{# } }}
	</script>
	
	<!-- 下拉列名组件 -->
	<script type="text/html" id="excelColumnNameSelect">
		<select id="excelColumnNameDemo" name="excelColumnName" lay-filter="excelColumnNameDemo" dataId="excelName{{d.LAY_TABLE_INDEX}}">
			<option value=""></option>
			{{# for(var i=0; i<d.excelColumnName.length; i++){ }}
				<option value="{{d.excelColumnName[i]}},{{d.excelColumnNo[i]}}">{{d.excelColumnName[i]}}</option>
			{{# } }}
		</select>
	</script>
	
	<!-- 主体内容 -->
	<div class="layui-main" style="padding: 1rem; margin-left: 1rem; margin-top: -1rem;">
		<!-- 头部标题内容 -->
	  	<fieldset class="layui-elem-field layui-field-title">
		    <legend>
				<c:choose>
					<c:when test="${is == 'show'}">
		      			导入字段映射配置信息查看
		         	</c:when>
					<c:otherwise>
						导入字段映射配置信息${not empty wisDataFieldMapping.id?'修改':'添加'}
		      		</c:otherwise>
				</c:choose>
			</legend>
		</fieldset>
	    
	    <!-- 主体内容 -->
	    <form class="layui-form layui-form-pane" action="" style="margin-top: 1em;">
	    	
	    	<c:if test="${wisDataFieldMapping.id == null }">
				<div class="layui-form-item" style="margin-left: 0%; display: none;" id="excelSubmit">
					<div class="layui-input-inline">
						<c:if test="${is eq 'edit' }">
							<button class="layui-btn subMit" lay-submit lay-filter="formDemos">保存</button>
						</c:if>
						<input class="layui-btn layui-btn-primary" type="button" value="返回" onclick="rtShowList('${ctx}${rootUrl}')" />
					</div>
				</div>
			</c:if>
	    
			<div id="dis" style="margin-top: 0.5rem;">
				<input type="hidden" name="id" value="${wisDataFieldMapping.id}" />
				
				<c:choose>
					<c:when test="${wisDataFieldMapping.id == null }">
						<div class="layui-form-item">
							<div class="layui-col-xs12">
								<label class="layui-form-label">数据表名称</label>
								<div class="layui-input-inline">
									<select lay-filter="tabName" id="tabName" autocomplete="off" lay-search>
										<option value="">请选择数据表名称</option>
										<c:forEach var="item" items="${tabList}">
											<option value="${item.tableVal}">${item.tabName}</option>
										</c:forEach>
									</select>
								</div>
							</div>
						</div>
					</c:when>
					
					<c:otherwise>
						
						<!-- 字段名称 -->
						<div class="layui-form-item">
							<div class="layui-col-xs11 layui-col-xs-offset1">
								<label class="layui-form-label">字段名称</label>
								<div class="layui-input-inline">
									<input type="text" name="fieldName" lay-verify="required" id="fieldName" readonly="readonly"
										autocomplete="off" class="layui-input" value="${wisDataFieldMapping.fieldName}" maxlength="10">
								</div>
							</div>
						</div>
						
						<!-- 字段说明 -->
						<div class="layui-form-item">
							<div class="layui-col-xs11 layui-col-xs-offset1">
								<label class="layui-form-label">字段说明</label>
								<div class="layui-input-inline">
									<input type="text" name="fieldComment" lay-verify="required" id="fieldComment" readonly="readonly"
										autocomplete="off" class="layui-input" value="${wisDataFieldMapping.fieldComment}" maxlength="10">
								</div>
							</div>
						</div>
						
						<!-- 字段类型 -->
						<div class="layui-form-item">
							<div class="layui-col-xs11 layui-col-xs-offset1">
								<label class="layui-form-label">字段类型</label>
								<div class="layui-input-inline">
									<input type="text" name="fieldType" lay-verify="required" id="fieldType" readonly="readonly"
										autocomplete="off" class="layui-input" value="${wisDataFieldMapping.fieldType}" maxlength="10">
								</div>
							</div>
						</div>
						
						<!-- 所属数据表 -->
						<div class="layui-form-item">
							<div class="layui-col-xs11 layui-col-xs-offset1">
								<label class="layui-form-label">所属数据表</label>
								<div class="layui-input-inline">
									<input type="text" lay-verify="required" id="dataTabName" readonly="readonly"
										autocomplete="off" class="layui-input" value="${wisDataFieldMapping.dataTabName}" maxlength="10">
								</div>
							</div>
						</div>
						
						<!-- EXCEL列名 -->
						<div class="layui-form-item">
							<div class="layui-col-xs11 layui-col-xs-offset1">
								<label class="layui-form-label">EXCEL列名</label>
								<div class="layui-input-inline">
									<input type="text" lay-verify="required" id="excelColumnName" readonly="readonly"
										autocomplete="off" class="layui-input" value="${wisDataFieldMapping.excelColumnName}" maxlength="10">
								</div>
							</div>
						</div>
						
						<!-- EXCEL列序 -->
						<div class="layui-form-item">
							<div class="layui-col-xs11 layui-col-xs-offset1">
								<label class="layui-form-label">EXCEL列序</label>
								<div class="layui-input-inline">
									<input type="text" lay-verify="required" id="excelColumnNo" readonly="readonly"
										autocomplete="off" class="layui-input" value="${wisDataFieldMapping.excelColumnNo}" maxlength="10">
								</div>
							</div>
						</div>
						
						<!-- 是否可为空 -->
						<div class="layui-form-item">
							<div class="layui-col-xs11 layui-col-xs-offset1">
								<label class="layui-form-label">是否可为空</label>
								<div class="layui-input-inline">
									<c:if test="${wisDataFieldMapping.isNullable eq 'no' }">
										<input type="text" lay-verify="required" id="isNullable" readonly="readonly"
											autocomplete="off" class="layui-input" value="不可为空" maxlength="10">
									</c:if>
									<c:if test="${wisDataFieldMapping.isNullable eq 'yes' }">
										<input type="text" lay-verify="required" id="isNullable" readonly="readonly"
											autocomplete="off" class="layui-input" value="可为空" maxlength="10">
									</c:if>
								</div>
							</div>
						</div>
						
						<!-- 是否导入 -->
						<div class="layui-form-item">
							<div class="layui-col-xs11 layui-col-xs-offset1">
								<label class="layui-form-label">是否需导入</label>
								<div class="layui-input-inline">
									<input type="radio" name="isImport" ${wisDataFieldMapping.isImport eq 0?'':'checked'} value="1" title="需导入" /> 
									<input type="radio" name="isImport" ${wisDataFieldMapping.isImport eq 0?'checked':''} value="0" title="不需导入" />
								</div>
							</div>
						</div>
						
						<!-- 默认值 -->
						<div class="layui-form-item">
							<div class="layui-col-xs11 layui-col-xs-offset1">
								<label class="layui-form-label">默认值</label>
								<div class="layui-input-inline">
									<input type="text" lay-verify="required" id="columnDefault" readonly="readonly"
										autocomplete="off" class="layui-input" value="${wisDataFieldMapping.columnDefault}" maxlength="10">
								</div>
							</div>
						</div>
						
					</c:otherwise>
				</c:choose>
				
			</div>
			
			<c:if test="${wisDataFieldMapping.id != null }">
				<!-- 标准化表单提交按钮 -->
				<div class="layui-form-item" style="margin-left: 35%;">
					<div class="layui-input-block">
						<c:if test="${is eq 'edit' }">
							<button class="layui-btn subMit" lay-submit lay-filter="formDemos">保存</button>
						</c:if>
						<input class="layui-btn layui-btn-primary" type="button" value="返回" onclick="rtShowList('${ctx}${rootUrl}')" />
					</div>
				</div>
			</c:if>
			
			<!-- 通用表格容器 -->
			<div class="layui-form-item" style="margin-top: 0rem;">
				<div class="layui-col-xs12" style="width: 68.8rem; display: none;" id="excelDiv">
					<div class="layui-input-inline" style="width: 68.8rem; margin-top: -0.7rem;">
						<table id="templetTable" lay-filter="templetTable"/>
					</div>
				</div>
			</div>
		</form>
	</div>
	
	<!-- 标准化表单提交JS -->
	<!-- 表单JS -->
	<script type="text/javascript">
		layui.use(['table','layer','form'], function() {
			var table = layui.table, layer = layui.layer, form = layui.form;
			var rootUrl =  $("#rootUrl").val(); 	// 访问路径
			var tableName = $("#tableName").val(); 	// 表名
			var fileData = [];						// 声明表格数据信息
			
			form.render();
			
			// 表格列号监听
			form.on('select(excelColumnNameDemo)', function(data){
				// 当前操作的下拉框DOM文本
				var nameElem = data.elem;
				// 当前操作的DataId区分
				var excelDataId = nameElem.getAttributeNode("dataId").nodeValue;
				// 当前操作的索引
				var excelIndex = excelDataId.substring(9,excelDataId.length);
				
				// 选定值
				var dataVal = data.value;
				
				if (dataVal != '') {
					// 后缀信息
					var dataPVal = dataVal.split(",")[1];
					// 设置文本框的属性值
					$("input[dataId='excelNo"+excelIndex+"']").val(dataPVal);
				} else {
					$("input[dataId='excelNo"+excelIndex+"']").val('');
				}
				
				console.log(nameElem);
				console.log(excelDataId);
				console.log(excelIndex);
				console.log(dataVal);
				console.log(dataPVal);
				
			});
			
			form.on('select(tabName)', function(data){
				
				if (data.value != '') {
					var data = data.value;					// 封装表数据
					var id = data.split(",")[0];			// 选定主表主键
					var tableCode = data.split(",")[1];		// 选定主表英文名
							
					$.ajax({
						type : 'POST',
						url  : '${ctx}/wisdom/base/wisDataImportTab/getList',
						data : {
							'id' : id,
							'tableName' : tableCode 
						},
						success : function(result) {
							var obj = eval('('+result+')');
							fileData = obj.data;
							
							console.log(fileData);
							
							$("#excelFieldset").css('display','inline');	// excel映射展示
							$("#excelDiv").css('display','inline');			// excel映射展示 
							$("#excelSubmit").css('display','inline');		// excel映射展示
							
							table.render({
								elem : '#templetTable',
								id   : "templetTable",
								data : fileData,
								limit: Number.MAX_VALUE, // 数据表格默认全部显示
								done: function(res, curr, count){
									//数据渲染完的回调。
					              	//由于layui 设置了超出隐藏，所以这里改变下，以兼容操作按钮的下拉菜单
					              	$(".layui-table-body, .layui-table-box, .layui-table-cell").css('overflow', 'visible');
								},
								cols : [ [
									{
										align : 'center',
										title : '序号',
										type  : 'numbers',
										width : 80
							    	},
							    	{
										align : 'center',
										title : '字段名称',
										width : 150,
										templet: function (d) {
											return '<input type="text" name="fieldName" id="fieldName" value="' + (d.fieldName || '') + '" readOnly="true" class="layui-input editTableInput" />';
								        }
							    	},
							    	{
										align : 'center',
										title : '字段说明',
										width : 140,
										templet: function (d) {
											return '<input type="text" name="fieldComment" id="fieldComment" value="' + (d.fieldComment || '') + '" readOnly="true" class="layui-input editTableInput" />';
								        }
							    	},
							    	{
										align : 'center',
										title : '字段类型',
										width : 150,
										templet: function (d) {
											return '<input type="text" name="fieldType" id="fieldType" value="' + (d.fieldType || '') + '" readOnly="true" class="layui-input editTableInput" />';
								        }
							    	},
							    	{
										align : 'center',
										title : '所属表编号',
										width : 100,
										hide  : true,
										templet: function (d) {
											return '<input type="text" name="dataTabId" id="dataTabId" value="' + (d.dataTabId || '') + '" readOnly="true" class="layui-input editTableInput" />';
								        }
							    	},
							    	{
										align : 'center',
										title : '是否可空',
										width : 100,
										templet: '#isNullableCheck'
							    	},
							    	{
										align : 'center',
										title : '是否需导入',
										width : 120,
										templet: '#isImportCheck'
							    	},
							    	{
										align : 'center',
										title : '字段默认值',
										width : 100,
										// hide  : true,
										templet: function (d) {
											return '<input type="text" name="defaultVal" id="defaultVal" value="' + (d.defaultVal || '') + '" readOnly="true" class="layui-input editTableInput" />';
								        }
							    	},
							    	{
										align : 'center',
										title : 'excel列名',
										width : 160,
										templet: '#excelColumnNameSelect'
							    	},
							    	{
										align : 'center',
										title : 'excel列号',
										width : 90,
										templet: function (d) {
											return '<input type="text" name="excelColumnNo" id="excelColumnNo" value="' + ('' || '') + '" dataId="excelNo'+d.LAY_TABLE_INDEX+'" readOnly="true" class="layui-input editTableInput" />';
								        }
										/* templet: '#excelColumnNoSelect' */
							    	}
								]]
							});
						}
					});
					
				} else {
					$("#excelFieldset").css('display','none');	// excel映射展示
					$("#excelDiv").css('display','none');		// excel映射展示
					$("#excelSubmit").css('display','none');	// excel映射展示
				}
			});
			
			//监听是否导入切换组件
		  	form.on('switch(isNullableSwitch)', function(data){
		        var checked = data.elem.checked;	//开关是否开启，true或者false
		        if (checked == true) { this.value = "yes"; } else { this.value = "no"; }
		  	});
			
		  	//监听是否导入切换组件
		  	form.on('switch(isImportSwitch)', function(data){
		        var checked = data.elem.checked;	//开关是否开启，true或者false
		        if (checked == true) { this.value = "1"; } else { this.value = "0"; }
		  	});
			
			
			// 表单提交JS
			form.on('submit(formDemos)', function(data) {
				// console.log(data.field.id);
				
				$(this).attr({"disabled":"disabled"});
				
				// 检验ID是否存在来判断当前是否是新增状态
				var checkId = data.field.id;
				
				// 修改状态
				if (checkId != ''){
					
					var json = JSON.stringify(data.field);
					
					console.log(json);
					
					$.ajax({
						type : 'POST',
						url  : rootUrl + '/save',
						data : {
							'json'  : json
						},
						success : function(result) {
							var obj = eval('('+result+')');
							
							console.log(obj);
							
							if(obj.code == 2){	// 修改成功
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
					
				} else {
					
					var tableBak = table.cache["templetTable"];
					
					if(null != tableBak){
						for (var i = 0; i < tableBak.length; i++) {
							// 是否为空
							tableBak[i].isNullable = document.getElementsByName("isNullable")[i].value;
							
							// 是否导入
							tableBak[i].isImport = document.getElementsByName("isImport")[i].value;
							
							// excel列序信息
							tableBak[i].excelColumnNo = document.getElementsByName("excelColumnNo")[i].value;
							
							// excel列号信息
							var excelName = document.getElementsByName("excelColumnName")[i].value;
							if (excelName != '') { excelName = excelName.split(",")[0]; }
							tableBak[i].excelColumnName = excelName;
							
							// 校验
							var isNullable = tableBak[i].isNullable;
							var isImport = tableBak[i].isImport;
							var defaultVal = tableBak[i].defaultVal;
							
							console.log(tableBak[i]);
							
							if (isNullable == 'no') {
								if (isImport == '1') {
									if (defaultVal == undefined) {
										layer.msg('请确认是否需要导入', { icon: 5});
										return false;
									}
								}
							}
						}
					}
					
					// 集合转JSON字符串
					var jsonList = JSON.stringify(tableBak);
					
					console.log(tableBak);
					// console.log(jsonList);
					
					// 批量新增
					$.ajax({
	    				type : 'POST',
	    				url  : rootUrl + '/excelSave',
	    				data : {
	    					'json'  : jsonList,
	    				},
	    				success : function(result) {
	    					var obj = eval('('+result+')');
	    					if(obj.code == 1){	// 新增成功
	    						layer.msg(obj.msg, { icon: 6 });
	    						setTimeout(function(){window.location.href= rootUrl + "/show"; }, 1000);
	    					} else if(obj.code == -1){	// 新增失败
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