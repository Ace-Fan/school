package com.thinkgem.jeesite.modules.base.web;

import java.io.IOException;

import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.thinkgem.jeesite.common.mapper.JsonMapper;
import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.modules.card.utils.Result;
import com.thinkgem.jeesite.modules.wisdom.util.pinyin.PinyinException;
import com.thinkgem.jeesite.modules.wisdom.util.pinyin.PinyinHelper;

/**
 * 通用拼音
 * @author weekly
 *
 */
@Controller
@RequestMapping(value = "${adminPath}/base/pinyin")
public class BasePinyinController extends BaseController {
	
	/**
	 * 获取拼音码
	 * 
	 * @param pinyinName
	 * @param response
	 * @throws IOException
	 * @throws PinyinException
	 */
	@RequestMapping(value = "/getPinyin")
	@ResponseBody
	public void getPinyin(String pinyinName, HttpServletResponse response) throws IOException, PinyinException {
		Result result = new Result();
		// 名称不能为空
		if (pinyinName == null || "".equals(pinyinName)) {
			result.setCode(-1);
			result.setMsg("未查询到数据");
		} else {
			// 获取简称
			String name = PinyinHelper.getShortPinyin(pinyinName);
			// 获取全拼
			String nameStr = PinyinHelper.getFullPinyin(pinyinName);
			String str[] = new String[2];
			str[0] = name;
			str[1] = nameStr;
			if (null != name && null != nameStr) {
				result.setCode(1);
				result.setMsg("查询成功");
				result.setData(str);
			} else {
				result.setCode(-1);
				result.setMsg("未查询到数据");
			}
		}
		response.getWriter().write(JsonMapper.getInstance().toJson(result));
	}
	
}
