package com.thinkgem.jeesite.modules.wm.web.user;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.thinkgem.jeesite.common.crud.BaseCrudController;
import com.thinkgem.jeesite.common.mapper.JsonMapper;
import com.thinkgem.jeesite.common.utils.ResultPage;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.common.utils.Token;
import com.thinkgem.jeesite.modules.wm.entity.user.WmUserIncome;
import com.thinkgem.jeesite.modules.wm.service.user.WmUserIncomeService;
import com.thinkgem.jeesite.modules.wm.dao.user.WmUserIncomeDao;

import net.sf.json.JSONObject;

/**
 * @title 用户收入表控制层
 * @author yangfu
 * @version 2020-10-13
 */
@Controller
@RequestMapping(value = "${adminPath}/wm/user/wmUserIncome")
public class WmUserIncomeController extends BaseCrudController<WmUserIncomeService, WmUserIncomeDao, WmUserIncome> {

	String list = "modules/wm/user/wmUserIncomeList";		// 表格页面
	String form = "modules/wm/user/wmUserIncomeForm";		// 表单页面
	String tableName = new WmUserIncome().getTableName();		// 数据表名
	
	// 通用model
	public void model(Model model) {
		model.addAttribute("rootUrl", "/wm/user/wmUserIncome"); // rootUrl 访问路径
		model.addAttribute("tableName", tableName); // tableName 表名
	}
	
	// JSON对象字符串封装为对象
	public WmUserIncome repJson(String json) { 
		return (WmUserIncome) JSONObject.toBean(toJsonObject(json), WmUserIncome.class);
	}
	
	// 获取模板分页信息
	@RequestMapping(value = "/list")
	@ResponseBody
	@Token(save = true)
	public ResultPage<List<WmUserIncome>> findAllList(WmUserIncome entity) {
		return super.findList(entity);
	}
	
	// 根据主键获取模板信息
	@ModelAttribute
	public WmUserIncome get(@RequestParam(required = false) String id) {
		WmUserIncome entity = null;
		if (StringUtils.isNotBlank(id)) { entity = super.entityService.get(id); }
		if (entity == null) { entity = new WmUserIncome(); }
		return entity;
	}
	
	// 跳转到表格页面
	@RequestMapping(value = { "show", "" })
	public String list(String localStoragePage, Model model) {
		model(model); // 通用model
		return list;
	}
	
	// 调整到修改或者查看页面
	@RequestMapping(value = "getShow")
	public String form(String id, String type, Model model) {
		model(model); // 通用model方法
		modelType(type, model);
		return form;
	}
	
	// 添加或修改信息
	@RequestMapping(value = "save")
	@ResponseBody
	public void save(String json, HttpServletResponse response, HttpServletRequest request) throws Exception {
		response.getWriter().write(JsonMapper.getInstance().toJson(saveService(repJson(json), tableName)));
	}

}