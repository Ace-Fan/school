package com.thinkgem.jeesite.modules.base.web;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.thinkgem.jeesite.common.mapper.JsonMapper;
import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.modules.base.service.ValidateService;
import com.thinkgem.jeesite.modules.card.utils.AESUtil;
import com.thinkgem.jeesite.modules.card.utils.Result;

@Controller
@RequestMapping(value = "${adminPath}/validate/validate")
public class ValidateController extends BaseController {
	@Autowired
	private ValidateService validateService;
	
	Result result = new Result(); // 消息工具类

	/**
	 * 验证传递的表名和字段的值是否存在
	 * @param colunms 字段名称
	 * @param tableName 表名
	 * @param value	传递验证的值
	 * @param response
	 * @throws Exception
	 */
	@RequestMapping(value="/checkColumnsValue", method = {RequestMethod.POST})
	@ResponseBody
	public void checkColumnsValue(String colunms, String tableName, String value, HttpServletResponse response)throws Exception {
		tableName = AESUtil.AESDncode("pulsation", tableName); // 解析主表名
		
		boolean bool = validateService.checkColumnsValue(colunms, tableName, value);
		if(bool) {
			result.setCode(-1);
			result.setMsg("当前信息已存在!");
			result.setSuccess(false);
			result.setData(-1);
		} else {
			result.setCode(1);
			result.setMsg("当前信息未存在!");
			result.setSuccess(true);
			result.setData(1);
		}
		
		response.getWriter().write(JsonMapper.toJsonString(result));
	}
}
