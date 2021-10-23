<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
<title>保存评分信息列表</title>

<!-- 标准化通用头部 -->
<%@ include
	file="/WEB-INF/views/modules/templet/headExport/templetExport.jsp"%>

<!-- 标准化表格页面CSS -->
<link rel="stylesheet" href="${ctxStatic}/app/list/templetList.css" />

</head>
<body>

	<!-- 标准化表单隐藏文本 -->
	<%@ include file="/WEB-INF/views/modules/templet/templetHide.jsp"%>

	<!-- 切换组件 -->
	<%@ include
		file="/WEB-INF/views/modules/templet/toggle/templetIsEnable.jsp"%>

	<!-- 引入标准化表格头部工具栏页面 -->
	<%@ include
		file="/WEB-INF/views/modules/templet/list/templetHeader.jsp"%>

	<!-- 引入标准化表格操作页面 -->
	<%@ include file="/WEB-INF/views/modules/templet/list/templetDemo.jsp"%>

	<!-- 模板-头部搜索DIV -->
	<div style="margin-left: 1rem;">
		<div class="layui-inline" style="margin-top: 0.5rem;">
			<form id="selectDiv">

				<div class="layui-inline layui-form selectDiv-input">
					<select lay-search lay-filter="teachId" id="teachId">
						<option value="">请选择或输入教师姓名</option>
						<c:forEach var="item" items="${scTeacherList}">
							<option value="${item.id}">${item.name}</option>
						</c:forEach>
					</select>
				</div>
				<div class="layui-inline layui-form selectDiv-input">
					<select lay-search lay-filter="typeId" id="typeId">
						<option value="">请选择评分类型</option>
						<c:forEach var="item" items="${gradeTypeList}">
							<option value="${item.id}">${item.name}</option>
						</c:forEach>
					</select>
				</div>
				<div class="layui-inline layui-form selectDiv-input">
					<select lay-search lay-filter="itemId" id="itemId">
						<option value="">请选择评分项</option>
					</select>
				</div>
				<div class="layui-inline layui-form selectDiv-input">
					<select lay-search lay-filter="semId" id="semId">
						<option value="">请选择学期</option>
						<c:forEach var="item" items="${scSemesterList}">
							<option value="${item.id}">${item.name}</option>
						</c:forEach>
					</select>
				</div>
				<div class="layui-inline layui-form selectDiv-input">
					<select lay-search id="isEnable" lay-filter="isEnable"
						autocomplete="off">
						<option value="">启用状态（全部）</option>
						<option value="1">启用</option>
						<option value="0">禁用</option>
					</select>
				</div>
				<!-- 引入标准化表单操作页面 -->
				<%@ include
					file="/WEB-INF/views/modules/templet/list/templetSelectSeacher.jsp"%>
			</form>
		</div>
	</div>
	<!-- 搜索JS -->
	<script type="text/javascript">
		layui.use([ 'table', 'form' ], function() {
			var table = layui.table, form = layui.form; // 声明layui的table，form
			var rootUrl = $("#rootUrl").val(); // 访问业务模块路径

			form.render('select'); // 表单刷新（防止下拉框外加载）

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
									+ t[i].name + '</option>';
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

			form.on('select(isEnable)', function(data) {
				if (data.value == '') {
					reloadTable();
				}
			}); // 监听搜索框下拉框选择为ALL时刷新表单
			form.on('submit(demo)', function(data) {
				reloadTable();
			}); // 监听提交按钮
			$('form').find(':reset').click(function() {
				$("#selectDiv")[0].reset();
				layui.form.render();
				return false;
			}); // 下拉框表单内容重置

			function reloadTable() {
				var teachId = $("#teachId").val();
				var typeId = $("#typeId").val();
				var itemId = $("#itemId").val();
				var semId = $("#semId").val();
				var isEnable = $("#isEnable").val();

				table.reload('templetTable', {
					url : rootUrl + '/list',
					where : {
						teachId : teachId,
						typeId : typeId,
						itemId : itemId,
						semId : semId,
						isEnable : isEnable
					}
				});
			}
		});
	</script>


	<!-- 通用表格容器 -->
	<table id="templetTable" lay-filter="templetTable"></table>
	<div class="layui-col-xs6">
	<div id="gradeDiv" style="width:100%;height:40%;"></div>
	</div>
	<div class="layui-col-xs6">
	<div id="gradeShowDiv" style="width:100%;height:40%;"></div>
	</div>
	<script src="${ctxStatic}/adopens/plugins/echarts3/echarts.min.js">
	</script>
	<script>
	var gradeChart = echarts.init(document.getElementById('gradeDiv'));
	var gradeShowChart = echarts.init(document.getElementById('gradeShowDiv'));
	gradeShowOption = {
			title:{
					text:'评分信息'
			},
			tooltip:{
				trigger:'axis'
			},
			legend:{
				data:['吴凡','康林']
			},
			grid:{
				left:'3%',
				right:'4%',
				bottom:'3$',
				containLabel: true
			},
			toolbox:{
				feature:{
					saveAsImage:{}
				}
			},
			xAxis:{
				type:'category',
				boundaryGap: false,
				data : xList
			}
			
	}
	gradeShowChart.setOption(gradeShowOption);
	</script>
	<!-- 表格JS -->
	<script>
		var rootUrl = $("#rootUrl").val();

		layui.use('table', function() {
			var table = layui.table;

			table.render({
				toolbar : '#templetTableHeader',
				elem : '#templetTable',
				url : rootUrl + '/list',
				cellMinWidth : 80,
				page : true,
				id : "templetTable",
				cols : [ [ {
					align : 'center',
					type : 'checkbox',
				}, {
					align : 'center',
					field : 'id',
					title : '编号',
					hide : true
				}, {
					align : 'center',
					field : 'teachName',
					title : '教师姓名',
				}, {
					align : 'center',
					field : 'gradeType',
					title : '评分类型',
				}, {
					align : 'center',
					field : 'gradeTerm',
					title : '评分项',
					width : 450,
				}, {
					align : 'center',
					field : 'grade',
					title : '评分',
					templet : function(g) {
						if (g.grade == 1) {
							return '极差'
						} else if (g.grade == 2) {
							return '差'
						} else if (g.grade == 3) {
							return '中等'
						} else if (g.grade == 4) {
							return '好'
						} else if (g.grade == 5) {
							return '极好'
						} else if (g.grade == 0) {
							return ''
						}
					}
				}, {
					align : 'center',
					field : 'semester',
					title : '学期',
				}, {
					align : 'center',
					field : 'isEnable',
					title : '是否启用',
					templet : "#isEnableCheck"
				}, {
					align : 'center',
					field : 'createDate',
					title : '创建时间',
				// hide  : true
				}, {
					align : 'center',
					field : 'updateDate',
					title : '更新时间',
					hide : true
				}, {
					align : 'center',
					title : '操作',
					toolbar : '#templetDemo',
					width : 200
				} ] ]
			});
		})
	</script>
</body>
</html>