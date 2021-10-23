<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>数据字典信息管理</title>
	
	<!-- 标准化通用头部 -->
	<%@ include file="/WEB-INF/views/modules/templet/headExport/templetExport.jsp" %>
	
	<!-- 标准化表格页面CSS -->
	<link rel="stylesheet" href="${ctxStatic}/app/list/templetList.css" />
	
	<!-- 标准化表格页面CSS -->
	<link rel="stylesheet" href="${ctxStatic}/app/list/templetTree.css" />
	
	<!-- 引入dtree属性结构CSS -->
	<link rel="stylesheet" href="${ctxStatic}/layui_ext/dtree/dtree.css">
	<link rel="stylesheet" href="${ctxStatic}/layui_ext/dtree/font/iconfont.css">
	
</head>
<body>

	<!-- 标准化表单隐藏文本 -->
	<%@ include file="/WEB-INF/views/modules/templet/templetHide.jsp" %>
	
	<!-- 切换组件 -->
	<%@ include file="/WEB-INF/views/modules/templet/toggle/templetIsEnable.jsp" %>
	
	<!-- 标准化树形结构TEXTHTML -->
	<%@ include file="/WEB-INF/views/modules/templet/templetTreeTextHtml.jsp" %>
	
	<!-- 主体内容 -->
	<div class="row" style="margin-top: 1rem;"> 
		<!-- 左侧树内容 -->
		<%@ include file="/WEB-INF/views/modules/templet/templetLeftTree.jsp" %>
		
		<!-- 右侧表格表单部分 -->
		<div class="layui-col-sm4 layui-col-md3 layui-col-lg2" style="height: 85%; overflow: auto; width: 79%; margin-top: 0rem;">
		
			<!-- 右侧表格部分 -->
        	<div class="layui-card" id="list"  style=" overflow: auto;">
        		<!-- 搜索DIV -->
				<div class="layui-inline">
					<form id="selectDiv">
						<div class="layui-inline layui-form selectDiv-input">
							<input type="text" placeholder="请输入数据字典名称" id="name" autocomplete="off" class="layui-input" maxlength="20" >
						</div>
						
						<div class="layui-inline layui-form selectDiv-input">
				        	<select id="p_isEnable" lay-filter="isEnable" autocomplete="off">
					          	<option value="">启用状态（全部）</option>
					          	<option value="1">启用</option>
					          	<option value="0">禁用</option>
				          	</select>
					    </div>
						
						<%@ include file="/WEB-INF/views/modules/templet/list/templetSelectSeacher.jsp" %>
					</form>
				</div>
       	
          		<table id="templetTable" lay-filter="templetTable"></table>
        	</div>
		
			<!-- 右侧表单部分  -->
			<div id="form" class="layui-card layui-form layui-border-box layui-table-view"  style="overflow: auto; width: 55rem; display: none; margin-top: 0rem;">
				
				<form class="layui-form layui-form-pane" action="" style=" margin-left: 1em;">
					<!-- 右侧表单标题部分 -->
					<fieldset class="layui-elem-field layui-field-title"> <legend id="legendDiv"></legend> </fieldset>
				
					<!-- 右侧表单主体部分 -->
					<div id="dis">
						<input type="hidden" name="id" id="dId" />
						
						<!-- 数据字典编码 -->
						<div class="layui-form-item">
							<div class="layui-col-xs12">
								<label class="layui-form-label">编码&nbsp;<span style="color: red;">*</span></label>
								<div class="layui-input-inline">
									<input type="text" name="code" id="dCode" lay-verify="required" placeholder="请输入编码" 
										autocomplete="off" class="layui-input" maxlength="10">
								</div>
							</div>
						</div>
						
						<!-- 数据字典名称 -->
						<div class="layui-form-item">
							<div class="layui-col-xs12">
								<label class="layui-form-label">名称&nbsp;<span style="color: red;">*</span></label>
								<div class="layui-input-inline">
									<input type="text" name="name" id="dName" lay-verify="required" placeholder="请输入名称" 
										autocomplete="off" class="layui-input" maxlength="25">
								</div>
							</div>
						</div>
						
						<!-- 数据字典类型 -->
						<div class="layui-form-item">
							<div class="layui-col-xs12">
								<label class="layui-form-label">字典类型&nbsp;<span style="color: red;">*</span></label>
								<div class="layui-input-inline">
									<input type="text" name="type" id="dType" lay-verify="required"
										placeholder="请输入字典类型(拼音首字母)" autocomplete="off" class="layui-input" maxlength="25">
								</div>
							</div>
						</div>
						
						<!-- 分类名称 -->
						<div class="layui-form-item">
							<div class="layui-col-xs12">
								<label class="layui-form-label">分类名称&nbsp;<span style="color:red;">*</span></label>
								<div class="layui-input-inline">
									<input type="text" name="typeName" id="dTypeName" lay-verify="required"
										placeholder="请输入分类名称(汉字)" autocomplete="off" class="layui-input" maxlength="25">
								</div>
							</div>
						</div>
						
						<input type="hidden" name="parentId" value="0">
						
						<div class="layui-form-item">
							<div class="layui-col-xs12">
								<label class="layui-form-label">父级编号</label>
								<div class="layui-input-inline">
									<input type="text" name="parentTempId" id="dParentTempId" placeholder="请输入父级编号" 
										autocomplete="off" class="layui-input" maxlength="25">
								</div>
							</div>
						</div>
					
						<!-- 排序号 -->
						<div class="layui-form-item">
							<div class="layui-col-xs12">
								<label class="layui-form-label">排序号&nbsp;<span style="color:red;">*</span></label>
								<div class="layui-input-inline">
									<input type="text" name="orderNo" id="dOrderNo" lay-verify="required"
										placeholder="请输入排序号" autocomplete="off" class="layui-input" maxlength="25">
								</div>
							</div>
						</div>
						
						<!-- 开始区间 -->
						<div class="layui-form-item">
							<div class="layui-col-xs12">
								<label class="layui-form-label">开始区间</label>
								<div class="layui-input-inline">
									<input type="text" name="startSection" id="startSection"
										placeholder="请输入开始区间" autocomplete="off" class="layui-input" maxlength="25">
								</div>
							</div>
						</div>
						
						<!-- 结束区间 -->
						<div class="layui-form-item">
							<div class="layui-col-xs12">
								<label class="layui-form-label">结束区间</label>
								<div class="layui-input-inline">
									<input type="text" name="endSection" id="endSection"
										placeholder="请输入结束区间" autocomplete="off" class="layui-input" maxlength="25">
								</div>
							</div>
						</div>
						
						<!-- 启用状态 -->
						<div class="layui-form-item">
							<div class="layui-col-xs12">
								<label class="layui-form-label">启用状态&nbsp;<span style="color: red;">*</span></label>
								<div class="layui-input-inline" style="margin-top: 1rem; margin-left: 1rem;">
									<div id="isEnableRedio">
										<input type="radio" checked="checked" name="isEnable" value="1" title="启用" /> 
										<input type="radio" name="isEnable" value="0" title="禁用" />
									</div>
								</div>
							</div>
						</div>
						
						<!-- 备注 -->
						<div class="layui-form-item">
							<div class="layui-col-xs12">
								<label class="layui-form-label">备注</label>
								<div class="layui-input-inline">
									<textarea placeholder="请输入备注" maxlength="100" name="remark" id="dRemark" class="layui-textarea" ></textarea>
								</div>
							</div>
						</div>
					</div>
				</form>
				
				<!-- 右侧表单按钮部分 -->
				<%@ include file="/WEB-INF/views/modules/templet/templetRightButton.jsp" %>
				
			</div>
			
		</div>
	</div>
	
	<!-- 生成表格 -->
	<script type="text/javascript">
		//JavaScript代码区域  
		var rootUrl = $("#rootUrl").val();
		var tableName = $("#tableName").val();
		
		// 返回事件
		function rtTable() {
			$("#list").css("display","block");
			$("#form").css("display","none");
	 	}
		
		layui.extend({ dtree: '${ctxStatic}/layui_ext/dtree/dtree'}).use(['table','tree','dtree','form'], function() {
			var table = layui.table, dtree = layui.dtree, form = layui.form;
			
			form.render();
			
			//初始化树结构
			dtree.render({
			   	elem: "#commonTree",
			   	url:"${ctx}/wisdom/base/sysBaseDict/getTree?parentId=0",
			    initLevel: 2,
			    menubar:true,
			    dot: false,
				skin: "zdy",  // 自定义风格
				done:function(result){
					//查看时选对应的节点   （只是加了样式而已） 样式选中后有bug
					var cites = document.getElementsByTagName("cite");
					for(var i = 0; i<cites.length;i++){
						if(cites[i].innerHTML=="${sysBaseDict.typeName}"){
							document.getElementsByTagName("cite")[i].parentNode.className+=' dtree-zdy-item-this';
						}
					}
				}
		  	});
			
			// 加载表格区域
			table.render({
				toolbar : '#templetTableHeader',
				elem : '#templetTable',
				url  :  rootUrl + '/list',
				page : true,
				id 	 : "templetTable",
				cols : [ [
					{
						align : 'center',
						type: 'checkbox',
						hide : true
					},
					{
						align : 'center',
						field : 'id',
						title : '编号',
						width : 80
					}, 
					{
						align : 'center',
						field : 'code',
						title : '编码',
						width : 80
					},
					{
						align : 'center',
						field : 'name',
						title : '名称',
						width : 165
					},
					{
						align : 'center',
						field : 'type',
						title : '类型',
						width : 90
					},
					{
						align : 'center',
						field : 'typeName',
						title : '分类名称',
						width : 170
					},
					{
						align : 'center',
						field : 'parentTempName',
						title : '父级分类名称',
						width : 150
					},
					{
						align : 'center',
						field : 'orderNo',
						title : '排序号',
						width : 85
					},
					{
						align : 'center',
						field : 'startSection',
						title : '开始区间',
						width : 95
					},
					{
						align : 'center',
						field : 'endSection',
						title : '结束区间',
						width : 95
					},
					{
						align : 'center',
						field : 'isEnable',
						title : '是否启用',
						templet : "#isEnableCheck",
						width : 105
					},
					{
						align : 'center',
						title : '操作',
						width : 200,
						toolbar : '#templetDemo',
					}
				]]
			});
			
			// 表格搜索JS
			form.render();																									// 表单刷新（防止下拉框外加载）
			form.on('select(isEnable)', function(data) { if (data.value == '') { reloadTable(); } });						// 监听搜索框下拉框选择为ALL时刷新表单
			form.on('submit(demo)', function(data) { reloadTable(); });														// 监听提交按钮
			$('form').find(':reset').click(function() {	 $("#selectDiv")[0].reset(); layui.form.render(); return false; });	// 下拉框表单内容重置
	
			function reloadTable() {
				var code = $("#code").val(); 
				var name = $("#name").val(); 
				var isEnable = $("#p_isEnable").val();
	
				table.reload('templetTable', {
					url : rootUrl + '/list',
					where : {
						code : code,
						name : name,
						isEnable : isEnable
					}
				});
			}
			
			//树节点单击事件
		 	dtree.on("node('commonTree')" ,function(param){
				// 重加载表格信息
				table.reload('templetTable', {
					url : '${ctx}/wisdom/base/sysBaseDict/list',
					page : true,
					where : {	
						typeName:param.context=="基础数据"?"":param.context
					}
				});
				
				$("#list").css("display","block");
				$("#form").css("display","none");
				
				// var typeName = param.context;
				
				// 设置表单分类名称信息
				// $("#dTypeName").val(typeName);
				
				// 设置表单分类信息
				/* $.post("${ctx}/base/pinyin/getPinyin", { "pinyinName" : typeName }, function(result) {
					var obj = JSON.parse(result)// 将json数据转为对象
					if (obj.code == 1) {
						$("#dType").val(obj.data[0]);
					} 
				}); */
				
			});
			
			
			// 头部工具栏
		 	table.on('toolbar(templetTable)', function(obj) {
				switch (obj.event) {
					case 'add':		// 普通新增
						// window.location.href = rootUrl + '/getShow?type=edit';
					
						$("#dis").css("pointer-events", "auto");
					
						// 初始化文本值
						$("#dId").val("");							// 数据字典主键
						$("#dCode").val("");						// 数据字典编码
						$("#dName").val("");						// 数据字典名称
						$("#dType").val("");						// 数据字典类型
						$("#dTypeName").val("");					// 分类名称
						$("#dOrderNo").val("");						// 排序号
						$("#dParentTempId").val("");				// 父级编号
						$("#startSection").val("");					// 开始区间
						$("#endSection").val("");					// 结束区间
						
						$("#dRemark").text("");						// 备注
						$("#legendDiv").text("数据字典信息添加");		// 标题文本
						
						// 初始化启用状态
						$("#isEnableRedio").empty();
						$("#isEnableRedio").append("<input type='radio' checked name='isEnable' value='1' title='启用' />"+
							"<input type='radio' name='isEnable' value='0' title='禁用' />");
					
						$("#showButton").css("display","none");
						$("#tempButton").css("display","inline");	
					
						$("#list").css("display","none");
						$("#form").css("display","block");
						
						form.render();
						break;
				};
			});
			
			// 表单工具栏
			table.on('tool(templetTable)', function(obj) {
				var data = obj.data;
				var layEvent = obj.event;
				var ctx = "${ctx}";
				
				if (layEvent === "edit") { //编辑
					
					console.log(data);
					// window.location.href = rootUrl + '/getShow?type=show&id='+data.id;
					
					$("#dis").css("pointer-events", "auto");
					
					$("#dId").val(data.id);						// 数据字典主键
					$("#dCode").val(data.code);					// 数据字典编码
					$("#dName").val(data.name);					// 数据字典名称
					$("#dType").val(data.type);					// 数据字典类型
					$("#dTypeName").val(data.typeName);			// 分类名称
					$("#dParentTempId").val(data.parentTempId);	// 父级编号
					$("#dOrderNo").val(data.orderNo);			// 排序号
					$("#startSection").val(data.startSection);	// 开始区间
					$("#endSection").val(data.endSection);		// 结束区间
					
					$("#dRemark").text(data.remark);			// 备注
					$("#legendDiv").text("数据字典信息修改");		// 标题文本
					
					// 启用状态
					$("#isEnableRedio").empty();
					if (data.isEnable == 0) {
						$("#isEnableRedio").append("<input type='radio' name='isEnable' value='1' title='启用' />"+
						"<input type='radio' name='isEnable' value='0' checked title='禁用' />");
					} else {
						$("#isEnableRedio").append("<input type='radio' checked name='isEnable' value='1' title='启用' />"+
							"<input type='radio' name='isEnable' value='0' title='禁用' />");
					}
					
					$("#showButton").css("display","none");
					$("#tempButton").css("display","inline");	
					
					$("#list").css("display","none");
					$("#form").css("display","block");
					
					form.render();
					
					// window.location.href = rootUrl + '/getShow?type=edit&id='+data.id;
				
				} else if (layEvent === "del") { //删除
					
					var id = data.id;
					var tableName = $("#tableName").val();
					
					layer.confirm('是否删除选中信息', function(index){
		        		$.ajax({
							type:'post',
							url: '${ctx}/base/group/deleteOne',
							data:
							{
								"tableName" : tableName,
								"id" : id
							},
							success:function(result){
								
								var obj = eval('('+result+')');
								
								if(obj.code == 1){
									layer.msg("删除成功", { icon: 6 });
									setTimeout(function(){ window.location.href = rootUrl + "/show" }, 1000);
								} else if (obj.code == -1 ){
									layer.msg("删除失败", { icon: 5 });
								} else {
									layer.alert('系统错误请联系管理员', { icon: 2 });
								}
							}
						})
			        });
					
				}  else if(layEvent === "show"){	//查看
					
					// console.log(data);
					// window.location.href = rootUrl + '/getShow?type=show&id='+data.id;
					
					$("#dis").css("pointer-events", "none");
					
					$("#dCode").val(data.code);					// 数据字典编码
					$("#dName").val(data.name);					// 数据字典名称
					$("#dType").val(data.type);					// 数据字典类型
					$("#dTypeName").val(data.typeName);			// 分类名称
					$("#dParentTempId").val(data.parentTempId);	// 父级编号
					$("#dOrderNo").val(data.orderNo);			// 排序号
					$("#startSection").val(data.startSection);	// 开始区间
					$("#endSection").val(data.endSection);		// 结束区间
					
					$("#dRemark").text(data.remark);			// 备注
					$("#legendDiv").text("数据字典信息查看");		// 标题文本
					
					// 启用状态
					$("#isEnableRedio").empty();
					if (data.isEnable == 0) {
						$("#isEnableRedio").append("<input type='radio' name='isEnable' value='1' title='启用' />"+
						"<input type='radio' name='isEnable' value='0' checked title='禁用' />");
					} else {
						$("#isEnableRedio").append("<input type='radio' checked name='isEnable' value='1' title='启用' />"+
							"<input type='radio' name='isEnable' value='0' title='禁用' />");
					}
					
					$("#showButton").css("display","inline");
					$("#tempButton").css("display","none");		
					
					$("#list").css("display","none");
					$("#form").css("display","block");
					
					form.render();
				
				}  
			});
			
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
				
				return false;
			});
		 	
		});
	</script>
	
</body>
</html>