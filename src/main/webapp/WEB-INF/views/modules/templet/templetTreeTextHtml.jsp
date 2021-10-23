<%@ page contentType="text/html;charset=UTF-8"%>

<!-- 是否启用 -->
<script type="text/html" id="isEnableDemo">
	{{#if (d.isEnable == 1) { }}
        <span style="color:green">启用</span>
    {{# }else if(d.isEnable == 0){ }}
        <span style="color:red">禁用</span>  
    {{# } }}
	</script>

<!-- 标准化表单头部操作页面 -->
<script type="text/html" id="templetTableHeader">
	<div class="layui-btn-container">
		<button class="layui-btn layui-btn-primary layui-btn-sm" lay-event="add" style="background-color:#5FB878;">
			<i class="layui-icon" style="color:white;">&#xe654;</i><span style="color:white;">新增</span>
		</button>
	</div>
	</script>

<!-- 标准化表单操作按钮 -->
<script type="text/html" id="templetDemo">
    <div class="layui-btn-container">
		<a class="layui-btn layui-btn-xs" lay-event="show">
			<i class="layui-icon" style="color:white;">&#xe615;</i><span style="color:white;">查看</span>
		</a>
        <a class="layui-btn layui-btn-normal layui-btn-xs" lay-event="edit">
			<i class="layui-icon layui-icon-edit"></i><span style="color:white;">修改</span>
		</a>
		<a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">
			<i class="layui-icon layui-icon-delete"></i><span style="color:white;">删除</span>
		</a>
    </div>
</script>