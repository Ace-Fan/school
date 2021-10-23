<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>广告服务器系统参数管理</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript">
		$(document).ready(function() {
			
		});
		function page(n,s){
			$("#pageNo").val(n);
			$("#pageSize").val(s);
			$("#searchForm").submit();
        	return false;
        }
	</script>
</head>
<body>
	<ul class="nav nav-tabs">
		<li class="active"><a href="${ctx}/adopens/sysconfig/sysconfig/">广告服务器系统参数列表</a></li>
		<shiro:hasPermission name="adopens:sysconfig:sysconfig:edit"><li><a href="${ctx}/adopens/sysconfig/sysconfig/form">广告服务器系统参数添加</a></li></shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="sysconfig" action="${ctx}/adopens/sysconfig/sysconfig/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form">
			<li><label>请求者ID：</label>
				<form:input path="configname" htmlEscape="false" maxlength="100" class="input-medium"/>
			</li>
			<li><label>请求者名称：</label>
				<form:input path="configvalue" htmlEscape="false" maxlength="255" class="input-medium"/>
			</li>
			<li><label>归属模块：</label>
				<form:input path="useby" htmlEscape="false" maxlength="100" class="input-medium"/>
			</li>
			<li class="btns"><input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/></li>
			<li class="clearfix"></li>
		</ul>
	</form:form>
	<sys:message content="${message}"/>
	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead>
			<tr>
				<th>配置名称</th>
				<th>配置值</th>
				<th>归属模块</th>
				<th>备注</th>
				<shiro:hasPermission name="adopens:sysconfig:sysconfig:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="sysconfig">
			<tr>
				<td><a href="${ctx}/adopens/sysconfig/sysconfig/form?logid=${sysconfig.logid}">
					${sysconfig.configname}
				</a></td>
				<td>
					${sysconfig.configvalue}
				</td>
				<td>
					${sysconfig.useby}
				</td>
				<td>
					${sysconfig.remark}
				</td>
				<shiro:hasPermission name="adopens:sysconfig:sysconfig:edit"><td>
    				<a href="${ctx}/adopens/sysconfig/sysconfig/form?logid=${sysconfig.logid}">修改</a>
					<a href="${ctx}/adopens/sysconfig/sysconfig/delete?logid=${sysconfig.logid}" onclick="return confirmx('确认要删除该广告服务器系统参数吗？', this.href)">删除</a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>