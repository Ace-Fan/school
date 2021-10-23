<%@ page contentType="text/html;charset=UTF-8"%>

<!-- 三级联动 -->
<script type="text/javascript">
//配置插件目录
layui.config({
    base: '${ctxStatic}/layui-selectThree/mods/'
    , version: '1.0'
});
//一般直接写在一个js文件中
layui.use(['layer', 'form', 'layarea'], function () {
    var layer = layui.layer
        , form = layui.form
        , layarea = layui.layarea;

    layarea.render({
        elem: '#area-picker',
        change: function (res) {
            //选择结果
            console.log(res);
        }
    });
});
</script>