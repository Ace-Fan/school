package com.thinkgem.jeesite.modules.sc.web.grade;

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
import com.thinkgem.jeesite.modules.sc.entity.grade.ScGradeType;
import com.thinkgem.jeesite.modules.sc.service.grade.ScGradeTypeService;
import com.thinkgem.jeesite.modules.sc.dao.grade.ScGradeTypeDao;

import net.sf.json.JSONObject;

/**
 * @title 保存评分类型信息控制层
 * @author wufan
 * @version 2019-12-20
 */
@Controller
@RequestMapping(value = "${adminPath}/sc/grade/scGradeType")
public class ScGradeTypeController extends BaseCrudController<ScGradeTypeService, ScGradeTypeDao, ScGradeType> {

	String list = "modules/sc/grade/scGradeTypeList";		// 表格页面
	String form = "modules/sc/grade/scGradeTypeForm";		// 表单页面
	String tableName = new ScGradeType().getTableName();		// 数据表名
	
	// 通用model
	public void model(Model model) {
		model.addAttribute("rootUrl", "/sc/grade/scGradeType"); // rootUrl 访问路径
		model.addAttribute("tableName", tableName); // tableName 表名
	}
	
	// JSON对象字符串封装为对象
	public ScGradeType repJson(String json) { 
		return (ScGradeType) JSONObject.toBean(toJsonObject(json), ScGradeType.class);
	}
	
	// 获取模板分页信息
	@RequestMapping(value = "/list")
	@ResponseBody
	@Token(save = true)
	public ResultPage<List<ScGradeType>> findAllList(ScGradeType entity) {
		return super.findList(entity);
	}
	
	// 根据主键获取模板信息
	@ModelAttribute
	public ScGradeType get(@RequestParam(required = false) String id) {
		ScGradeType entity = null;
		if (StringUtils.isNotBlank(id)) { entity = super.entityService.get(id); }
		if (entity == null) { entity = new ScGradeType(); }
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
		logger.debug("type:"+type);
		if (id != null && !"".equals(id)) { model.addAttribute("scGradeType", entityService.get(id));  }
		return form;
	}
	
	// 添加或修改信息
	@RequestMapping(value = "save")
	@ResponseBody
	public void save(String json, HttpServletResponse response, HttpServletRequest request) throws Exception {
		response.getWriter().write(JsonMapper.getInstance().toJson(saveService(repJson(json), tableName)));
	}

}