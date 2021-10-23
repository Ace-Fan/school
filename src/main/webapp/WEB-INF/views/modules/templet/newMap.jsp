<%@ page contentType="text/html;charset=UTF-8"%>

<!-- 腾讯地图必须声明 -->
<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
<!-- 引用地图插件 -->
<script charset="utf-8" src="https://map.qq.com/api/js?v=2.exp&key=OB3BZ-KG23X-U7S4Y-Z73ON-PWXXJ-CAB7Y&libraries=place"></script>

<!-- 腾讯地图容器 -->
<div id="txMapApi" style="display: none;">
	<p style="margin:5px">
		<input type="text" id="place" class="layui-input" style="width:500px;">
	
		<button class="layui-btn" id="query" onclick="codeAddress();" style="background-color:#018bed; margin-left:530px; margin-top: -38px; height: 38px;">
			<i class="layui-icon" style="color:white;">&#xe615;</i><span style="color:white;">搜索</span>
		</button>
	
		<button class="layui-btn layui-btn-danger" name="quits" id="quits" style="background-color:#FF5722; margin-left: 620px; margin-top: -38px; height: 38px;">
			<i class="layui-icon" style="color:white;">&#x1006;</i><span style="color:white;">退出</span>
		</button>
	</p>
	<div id="container">
	</div>
	<div style="margin-top:10px;">
		<font size="3" style="color: red;">单击具体位置可返回地址信息和经纬度信息</font>
	</div>
</div>

<!-- 腾讯地图JS -->
<script>
// 定义模块
layui.use(['layer','form'], function() {
    var layer = layui.layer;
    var form = layui.form;
})

function init(){

 var map = new qq.maps.Map(document.getElementById("container"),{
	 	// 默认中心点
	 	center: new qq.maps.LatLng(39.916527,116.397128),
        zoom: 13
    });
 	
 	 //调用地址解析类
	 geocoder = new qq.maps.Geocoder({
	     complete : function(result){
	         map.setCenter(result.detail.location);
	         var marker = new qq.maps.Marker({
	             map:map,
	             position: result.detail.location
	         });
	     }
	 });
 
    //实例化自动完成
    var ap = new qq.maps.place.Autocomplete(document.getElementById('place'));
    var keyword = "";
    //调用Poi检索类。用于进行本地检索、周边检索等服务。
    var searchService = new qq.maps.SearchService({
        complete : function(results){
           if(results.type === "CITY_LIST") {
                searchService.setLocation(results.detail.cities[0].cityName);
                searchService.search(keyword);
                return;
            }
            var pois = results.detail.pois;
            var latlngBounds = new qq.maps.LatLngBounds();
            for(var i = 0,l = pois.length;i < l; i++){
                var poi = pois[i];
                latlngBounds.extend(poi.latLng);  
                var marker = new qq.maps.Marker({
                    map:map,
                    position: poi.latLng
                });

                marker.setTitle(poi.name);
            }
            map.fitBounds(latlngBounds);
        }
    });
    
    //添加监听事件 input
    qq.maps.event.addListener(ap, "confirm", function(res){
        keyword = res.value;
        searchService.search(keyword);
    });
    
    // 点击监听
    qq.maps.event.addListener(map, 'click', function(event) {
    	// lat<纬度>,lng<经度>
    	var lat = event.latLng.getLat(); // 纬度
    	var lng = event.latLng.getLng(); // 经度
    	// OB3BZ-KG23X-U7S4Y-Z73ON-PWXXJ-CAB7Y
		// 获取经纬度
		var location = lat+","+lng; // 拼接纬度经度
		var data = {key:'OB3BZ-KG23X-U7S4Y-Z73ON-PWXXJ-CAB7Y',location : location}
		var url = "https://apis.map.qq.com/ws/geocoder/v1/?";
		data.output="jsonp";  
		// 获取详细地址
		$.ajax({
			type: "get",
            dataType: 'jsonp',
            data: data,
            jsonp: "callback",
            jsonpCallback: "QQmap",
            url: url,
            success: function(json) {
            	// 赋值详细地址
            	$('#addr').val(json.result.address);
            	//赋值精确位置
            	$('#detailed').val(json.result.address_component.city+json.result.formatted_addresses.recommend);
            	// 赋值纬度
            	$('#lat').val(json.result.location.lat);
            	// 赋值经度
            	$('#lng').val(json.result.location.lng);
            	console.log(json);
            },
            error: function(err) {
            }
		})
    	// 关闭全部层
    	layer.closeAll();
    });
}
 function txMapOpen() {
		layer.open({
			offset : [ '9rem', '17rem' ],
			type : 1,
			anim : 1,
			title : '详细地址',
			shadeClose : true,
			shade : 0.01,
			area : [ '50%', '72%' ],
			content : $("#txMapApi"),
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
				div1.setAttribute('onclick','closeWins()');
				div1.innerHTML='<i class="layui-icon" close="a" style="color:#FFF;font-size: 17px;">ဆ</i>';
				// 添加到指定位置
				$(".layui-layer.layui-layer-page ").children('div')[1].after(div1);
			},
			end : function(index) {
			}
		});
	} 
 	
 	// 搜索
 	function codeAddress() {
	    var place = document.getElementById("place").value;
	    //通过getLocation();方法获取位置信息值
	    geocoder.getLocation(place);
	}
 	
 	// 单击退出
 	function closeWins(){
		layer.closeAll();
	}
    // 退出按钮
    $('#quits').on('click', function() {
		layer.closeAll();
	});
</script>