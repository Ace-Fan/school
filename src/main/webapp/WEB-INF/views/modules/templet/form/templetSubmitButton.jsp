<%@ page contentType="text/html;charset=UTF-8"%>

<div class="layui-form-item" style="margin-left: 28%;">
	<div class="layui-input-block">
		<c:if test="${is eq 'edit' }">
			<button class="layui-btn" lay-submit lay-filter="formDemos">保存</button>
		</c:if>
		<input class="layui-btn layui-btn-primary" type="button" value="返回" onclick="rtShowList('${ctx}${rootUrl}')" />
	</div>
</div>