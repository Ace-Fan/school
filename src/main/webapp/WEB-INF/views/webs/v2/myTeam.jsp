<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0" />
	<meta name="keywords" content="" />
	<meta name="description" content="" />
	<link href="${ctxStatic}/webs/v2/css/amazeui.min.css" rel="stylesheet" type="text/css" />
	<link href="${ctxStatic}/webs/v2/css/pagenew.css" rel="stylesheet" type="text/css" />
	<title>我的团队</title>

	<style>
		.integral-table li span {
			width: 25%;
		}
	</style>

</head>

<body>

<div class="main_container">
	<!--顶部信息-->
	<div class="top_content">
		<div class="team_info">
			<div class="am-u-sm-6"><span class="font18 margin_left1 nowrap">当前级别:</span><span class="txt_color1 font18 nowrap">${currlevel}</span></div>
			<div class="am-u-sm-6"><span class="font18 margin_left2 nowrap">团队人数:</span><span class="txt_color1 font18 nowrap">${teamUserCount}</span></div>
		</div>
	</div>

	<input type="hidden" name="opentoken" id="id_opentoken" value="${opentoken}">

	<!--团队列表-->
	<div class="whitebar">
		<div data-am-widget="tabs" class="am-tabs am-tabs-d2">
			<ul class="am-tabs-nav am-cf">
				<li class="am-active">
					<a href="javascript:;" onclick="loadData('0')">团队列表(${teamUserCount})</a>
				</li>
				<c:forEach items="${titleMap}" var="x">
					<li class="">
						<a href="javascript:;" onclick="loadData('${x.key}')">${x.key}(${x.value})</a>
					</li>
				</c:forEach>
			</ul>
			<div style="height: 6px;"></div>
			<div class="">
				<div class="am-tab-panel am-active">
					<div class="content_layout">
						<div class="inner_content_layout">
							<ul class="integral-table">
								<li class="tit">
									<span class="font12">昵称</span>
									<span class="font12">进货业绩</span>
									<%--<span class="font12">零售业绩</span>--%>
									<span class="font12">团队人数</span>
									<span class="font12">充值</span>
								</li>
								<div id="id_data_div">
								</div>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<jsp:include page="../common/modal.jsp"></jsp:include>

<script src="${ctxStatic}/webs/v2/js/jquery.min.js"></script>
<script src="${ctxStatic}/webs/v2/js/amazeui.min.js"></script>
</body>


<script>
    $(function(){
        loadData('0');
	});

    var dataList;

	var loadData = function(level) {
	    if ('0' == level) {
            $.post("${pageContext.request.contextPath}/f/webs/usercenter/myTeamData",{"opentoken":$("input[name='opentoken']").val(), "level":level}, function (r) {
                if (r.code == 0) {
                    $("#id_data_div").html("");
                    dataList = r.data;
                    showHtml('0');
                } else {
                    $("#id_my-alert_msg").text(r.msg);
                    $('#my-alert').modal();
                }
            });
		} else {
            showHtml(level);
        }
    }

    var showHtml = function(level) {
        var data = dataList;
	    if ('0' != level) {
            data = $.grep(dataList,function(item){
                return item.level==level;
            });
		}

        var html = '';
        for (var i=0;i<data.length;i++) {
            var d = data[i];
            html+='<li class="for">';
            html+='    <span class="nowrap"><div class="font12 nowrap_auto"><img  class="head_img" src="'+d.headimgurl+'">';
            if (d.gid == d.fid) {
                html+=d.name;
			} else {
                html+=d.name+'(gid)';
			}
            html+='<div class=" ';
			if (d.jhStatus == 1) {
                html+='txt_color1 ';
            }
            html+='active_statu">';
            if (d.jhStatus == 1) {
                html+='已激活 ';
            } else {
                if ("VIP" == d.level) {
                    html+='VIP ';
				} else {
                    html += '未激活 ';
                }
			}
            html+='</div></div></span>';
            html+='    <span class="nowrap_auto">0</span>';
            html+='    <span class="nowrap_auto">'+d.teamUserCount+'</span>';
            html+='    <span class="nowrap">';
            if (d.jhStatus == 1) {
                html+='<button type="button" class="am-btn am-btn-primary chongzhi_btn" onclick="doRecharge(this,\''+d.dealersId+'\')">充值</button>';
            } else {
                if ("VIP" == d.level) {
                } else {
                    html+='<button type="button" class="am-btn am-btn-primary chongzhi_btn" onclick="doRecharge(this,\''+d.dealersId+'\')">充值</button>';
                }
			}
            html+='</span>';
            html+='</li>';
        }
        $("#id_data_div").html(html);
	}

	var doRecharge = function (e, dealersId) {
	    window.location.href = '${pageContext.request.contextPath}/f/webs/usercenter/toRecharge?dealersId='+dealersId;
    }
	
</script>

</html>
