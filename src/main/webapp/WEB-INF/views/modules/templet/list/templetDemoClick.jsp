<%@ page contentType="text/html;charset=UTF-8" %>

<!-- 标准化单击选中复选框 -->
<script type="text/javascript">
	layui.use(['form','layer','table'], function() {
		var layer = layui.layer, form = layui.from, table = layui.table;
		
		// 单击行选中复选框事件
		$(document).on("click",".layui-table-body table.layui-table tbody tr", function () {
		    var index = $(this).attr('data-index');
		    var tableBox = $(this).parents('.layui-table-box');
		    if (tableBox.find(".layui-table-fixed.layui-table-fixed-l").length>0) {
		        tableDiv = tableBox.find(".layui-table-fixed.layui-table-fixed-l");
		    } else {
		        tableDiv = tableBox.find(".layui-table-body.layui-table-main");
		    }
		    var checkCell = tableDiv.find("tr[data-index=" + index + "]").find("td div.laytable-cell-checkbox div.layui-form-checkbox I");
		    if (checkCell.length>0) {
		        checkCell.click();
		    }
		    
		    // 点击行选中设置单元行背景颜色 
		    // var trElem = $(this);
	      	// var tableView = trElem.closest('.layui-table-view');
	      	// tableView.find('.layui-table-body tr.table_tr_click').removeClass('table_tr_click');
	      	// tableView.find('.layui-table-body tr[data-index="' + trElem.data('index') + '"]').addClass('table_tr_click');
		});
		
		$(document).on("click", "td div.laytable-cell-checkbox div.layui-form-checkbox", function (e) {
		    e.stopPropagation();
		});
	});
</script>
