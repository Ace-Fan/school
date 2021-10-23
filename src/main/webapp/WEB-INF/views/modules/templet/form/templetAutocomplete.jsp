<%@ page contentType="text/html;charset=UTF-8"%>

<!-- 文本自动填充 -->
<script type="text/javascript">
//配置插件目录
layui.config({
    base: '${ctxStatic}/layui/lay/modules'
    , version: '1.0'
});
//一般直接写在一个js文件中
layui.use(['jquery','autocomplete'], function () {
    var $ = layui.jquery,
    autocomplete = layui.autocomplete;
    autocomplete.render({
        elem: $('#autocomplete'),
        url: '${ctxStatic}/',
        template_val: '{{d.consignee}}',
        template_txt: '{{d.consignee}} <span class=\'layui-badge layui-bg-gray\'>{{d.phone_number}}</span>',
        onselect: function (resp) {
            
        }
    })
});
</script>