<%@ page contentType="text/html;charset=UTF-8"%>

<!-- 弹窗区域 -->
<div id="showTempletImage" style="display: none;">
	<img id="showImg" style="width: 100%; height: 100%;">
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
			area : [ '50%', '80%' ],
			content : $("#showTempletImage"),
			success : function(lay){
				$(".layui-layer-title").css('background-color','#2F4056');													// 标题加入背景色 以及字体颜色
				$(".layui-layer-title").css('color','#FFF');
				$(".layui-layer.layui-layer-page ").children('span')[0].remove(); 											// 删除原有的样式
				var div1=document.createElement("span");																	// 创建元素
				div1.setAttribute('style','position: absolute;right: 15px; top: 11px;line-height: initial;cursor:hand; ');	// 加入CSS样式以及单击事件
				div1.setAttribute('onclick','closeWin()');
				div1.innerHTML='<i class="layui-icon" close="a" style="color:#FFF;font-size: 17px;">ဆ</i>';
				$(".layui-layer.layui-layer-page ").children('div')[1].after(div1);										// 添加到指定位置
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

<!-- 图片路径 -->
<script type="text/html" id="imgUrlTmp">
	{{#if (d.imgUrl != null) { }}
		{{#for (var i = 0; i < d.imgUrl.split(',').length; i++) { }}
			<img src="{{d.imgUrl.split(',')[i]}}" onclick="showTempletImage('{{d.imgUrl.split(',')[i]}}');" style="width:3rem;">
		{{# } }}
    {{# } }}
</script>