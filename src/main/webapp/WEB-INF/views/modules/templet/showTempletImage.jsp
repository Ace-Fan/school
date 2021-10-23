<%@ page contentType="text/html;charset=UTF-8" %>

<div id="showTempletImage" style="display: none;">
	<img id="showImg" style="width: 50%; ">
</div>

<script type="text/javascript">
	function showTempletImage(data) {
		layer.open({
			offset: ['5rem', '30rem'], 
			type : 1,
			anim : 1,
			title : '图片预览',
			shadeClose : true,
			shade : 0.01,
			area : [ '30%', '50%' ],
			content : $("#showTempletImage"),
			success : function(lay){
				// 标题加入背景色 以及字体颜色
				$(".layui-layer-title").css('background-color','#2F4056');
				$(".layui-layer-title").css('color','#FFF');
				// 将原有的X符号替换成图标
				// 删除原有的样式
				$(".layui-layer.layui-layer-page ").children('span')[0].remove(); 
				// 创建元素
				var div1=document.createElement("span");
				// 加入CSS样式以及单机事件
				div1.setAttribute('style','position: absolute;right: 15px; top: 11px;line-height: initial;cursor:hand; ');
				div1.setAttribute('onclick','closeWin()');
				div1.innerHTML='<i class="layui-icon" close="a" style="color:#FFF;font-size: 17px;">ဆ</i>';
				// 添加到指定位置
				$(".layui-layer.layui-layer-page ").children('div')[1].after(div1);
				
				var showImg = document.getElementById('showImg');
				showImg.setAttribute('src', data);
			},
			end : function(index) {
			}
		});
	}
	
	// 单机事件关闭窗口
	function closeWin(){
	 	layer.closeAll();
	}
</script>