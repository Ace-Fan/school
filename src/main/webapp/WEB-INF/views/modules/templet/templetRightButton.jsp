<%@ page contentType="text/html;charset=UTF-8"%>

<!-- 左侧树内容 -->
<div class="layui-form-item" style="margin-left: 35%;">
	<div class="layui-input-inline" id="tempButton">
		<button class="layui-btn" lay-submit lay-filter="formDemos">保存</button>
		<input class="layui-btn layui-btn-primary" type="button" value="返回" onclick="rtTable();" />
	</div>
	
	<div class="layui-input-inline" id="showButton" style="display: none;">
		<input class="layui-btn layui-btn-primary" type="button" value="返回" onclick="rtTable();" />
	</div>
</div>