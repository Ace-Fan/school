<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
<title>保存教师信息列表</title>

<!-- 标准化通用头部 -->
<%@ include
	file="/WEB-INF/views/modules/templet/headExport/templetExport.jsp"%>

<!-- 标准化表格页面CSS -->
<link rel="stylesheet" href="${ctxStatic}/app/list/templetList.css" />

<style type="text/css">
.layui-table-cell {
	height: 50px;
	line-height: 50px;
}
</style>
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
				<div class="layui-form">
					<div class="layui-form-item" id="area-picker">
						<div class="layui-input-inline">
							<select id="province" class="province-selector"
								data-value="${scTeacher.province}" lay-filter="province-1"
								lay-search>
								<option value="">请选择省</option>
							</select>
						</div>
						<div class="layui-input-inline">
							<select id="city" class="city-selector"
								data-value="${scTeacher.city}" lay-filter="city-1" lay-search>
								<option value="">请选择市</option>
							</select>
						</div>
						<div class="layui-input-inline">
							<select id="county" class="county-selector"
								data-value="${scTeacher.county}" lay-filter="county-1"
								lay-search>
								<option value="">请选择区</option>
							</select>
						</div>
						<div class="layui-inline layui-form selectDiv-input">
							<input type="text" placeholder="请输入教师编码" id="code"
								autocomplete="off" class="layui-input" maxlength="20">
						</div>
						<div class="layui-inline layui-form selectDiv-input">
							<input type="text" placeholder="请输入教师姓名" id="name"
								autocomplete="off" class="layui-input" maxlength="20">
						</div>
						<!-- 引入标准化表单操作页面 -->
						<%@ include
							file="/WEB-INF/views/modules/templet/list/templetSelectSeacher.jsp"%>
					</div>
				</div>
			</form>
		</div>
	</div>
	<!-- 标准头部搜索JS -->
	<script type="text/javascript">
		var rootUrl = $("#rootUrl").val();

		layui.use([ 'table', 'form' ], function() {
			var table = layui.table, form = layui.form;

			form.render();

			// 监听提交按钮
			form.on('submit(demo)', function(data) {
				reloadTable();
			});

			// 重置按钮
			$('form').find(':reset').click(function() {
				$("#selectDiv")[0].reset();
				layui.form.render();
			});

			function reloadTable() {
				var code = $("#code").val();
				var name = $("#name").val();
				var province = $("#province").val();
				var city = $("#city").val();
				var county = $("#county").val();

				if (province != '请选择省') {
					table.reload('templetTable', {
						url : rootUrl + '/list',
						where : {
							code : code,
							name : name,
							city : city,
							county : county
						}
					});
				} else {
					table.reload('templetTable', {
						url : rootUrl + '/list',
						where : {
							code : code,
							name : name
						}
					});
				} // 监听提交按钮
			}

		});
	</script>

	<!-- 通用表格容器 -->
	<table id="templetTable" lay-filter="templetTable"></table>

	<!-- 表格JS -->
	<script>
		var rootUrl = $("#rootUrl").val();

		layui.use('table', function() {
			var table = layui.table;

			table.render({
				toolbar : '#templetHeader',
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
					field : 'code',
					title : '教师编码',
					width : 120,
				}, {
					align : 'center',
					field : 'name',
					title : '教师姓名',

				}, {
					align : 'center',
					field : 'sex',
					title : '性别',
					width : 80,
					templet : function(s) {
						if (s.sex == 1) {
							return '男'
						} else {
							return '女'
						}
					}
				}, {
					align : 'center',
					field : 'age',
					title : '年龄',
					width : 80,
				}, {
					align : 'center',
					field : 'jgId',
					title : '籍贯编号',
					hide : true
				}, {
					align : 'center',
					field : 'xzId',
					title : '星座',
					hide : true
				}, {
					align : 'center',
					field : 'mzId',
					title : '民族',
					width : 80,
				}, {
					align : 'center',
					field : 'zzmmId',
					title : '政治面貌',

				}, {
					align : 'center',
					field : 'sxId',
					title : '生肖',
					hide : true
				}, {
					align : 'center',
					field : 'phone',
					title : '手机号码',
					width : 120
				}, {
					align : 'center',
					field : 'emergencyContact',
					title : '紧急联系人',
					hide : true
				}, {
					align : 'center',
					field : 'emergencyTel',
					title : '紧急联系电话',
					hide : true
				}, {
					align : 'center',
					field : 'idNum',
					title : '身份证号码',
					hide : true
				}, {
					align : 'center',
					field : 'wxNum',
					title : '微信号码',
					hide : true
				}, {
					align : 'center',
					field : 'qqNum',
					title : 'QQ号码',
					hide : true
				}, {
					align : 'center',
					field : 'email',
					title : '电子邮箱',
					hide : true
				}, {
					align : 'center',
					field : 'province',
					title : '所在省',

				}, {
					align : 'center',
					field : 'city',
					title : '所在市',

				}, {
					align : 'center',
					field : 'county',
					title : '所在区县',

				}, {
					align : 'center',
					field : 'address',
					title : '常住地址',
					width : 250
				}, {
					align : 'center',
					field : 'lng',
					title : '经度',
					hide : true
				}, {
					align : 'center',
					field : 'lat',
					title : '纬度',
					hide : true
				}, {
					align : 'center',
					field : 'glBirthday',
					title : '公历生日',
					hide : true
				}, {
					align : 'center',
					field : 'nlBirthday',
					title : '农历生日',
					hide : true
				}, {
					align : 'center',
					field : 'registeredAddr',
					title : '户口所在地',
					hide : true
				}, {
					align : 'center',
					field : 'birthAddr',
					title : '出生地',
					hide : true
				}, {
					align : 'center',
					field : 'height',
					title : '身高',
					hide : true
				}, {
					align : 'center',
					field : 'bloodType',
					title : '血型',
					hide : true
				}, {
					align : 'center',
					field : 'hoby',
					title : '兴趣爱好',
					hide : true
				}, {
					align : 'center',
					field : 'teachImg',
					title : '教师头像',
					templet : "#teachImgTmp"
				}, {
					align : 'center',
					field : 'remark',
					title : '备注',
					hide : true
				}, {
					align : 'center',
					field : 'isEnable',
					title : '是否启用',
					templet : "#isEnableCheck"
				}, {
					align : 'center',
					field : 'createDate',
					title : '创建时间',
					width : 170,
					hide : true
				}, {
					align : 'center',
					field : 'updateDate',
					title : '更新时间',
					hide : true
				}, {
					align : 'center',
					title : '操作',
					width : 200,
					toolbar : '#templetDemo',
				} ] ]
			});
		})
	</script>
	<!-- 头像显示预览 -->
	<div id="showTempletImage" style="display: none;">
		<img id="showImg" style="width: 100%;">
	</div>
	<script type="text/html" id="teachImgTmp">
	{{#if (d.teachImg != null && d.teachImg != '') { }}
		{{#for (var i = 0; i < d.teachImg.split(',').length; i++) { }}
			<img src="${imgServerPath}{{d.teachImg.split(',')[i]}}" onclick="showTempletImage('${imgServerPath}{{d.teachImg.split(',')[i]}}');" style="width:3rem;">
		{{# } }}
    {{# } }}
</script>
	<script type="text/javascript">
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
		//单机事件关闭窗口
		function closeWin() {
			layer.closeAll();
		}
	</script>
	<!-- 三级联动 -->
	<%@ include
		file="/WEB-INF/views/modules/templet/form/templetThreeArea.jsp"%>
	<!-- EXCEL导入JS -->
	<%@ include
		file="/WEB-INF/views/modules/templet/list/templetExcelImport.jsp"%>
</body>
</html>