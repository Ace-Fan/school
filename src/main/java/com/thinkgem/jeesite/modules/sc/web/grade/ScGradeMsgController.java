package com.thinkgem.jeesite.modules.sc.web.grade;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.thinkgem.jeesite.common.crud.BaseCrudController;
import com.thinkgem.jeesite.common.mapper.JsonMapper;
import com.thinkgem.jeesite.common.utils.ResultPage;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.common.utils.Token;
import com.thinkgem.jeesite.modules.sc.entity.grade.ScGradeMsg;
import com.thinkgem.jeesite.modules.sc.entity.grade.ScGradeTerm;
import com.thinkgem.jeesite.modules.sc.service.college.ScSemesterService;
import com.thinkgem.jeesite.modules.sc.service.grade.ScGradeMsgService;
import com.thinkgem.jeesite.modules.sc.service.grade.ScGradeTermService;
import com.thinkgem.jeesite.modules.sc.service.grade.ScGradeTypeService;
import com.thinkgem.jeesite.modules.sc.service.teacher.ScTeacherService;
import com.thinkgem.jeesite.modules.sc.dao.grade.ScGradeMsgDao;

import net.sf.json.JSONObject;

/**
 * @title 评分信息控制层
 * @author wufan
 * @version 2019-12-24
 */
@Controller
@RequestMapping(value = "${adminPath}/sc/grade/scGradeMsg")
public class ScGradeMsgController extends BaseCrudController<ScGradeMsgService, ScGradeMsgDao, ScGradeMsg> {

	@Autowired
	private ScTeacherService scTeacherService;
	@Autowired
	private ScGradeTermService scGradeTermService;
	@Autowired
	private ScGradeTypeService scGradeTypeService;
	@Autowired
	private ScSemesterService scSemesterService;

	String list = "modules/sc/grade/scGradeMsgList"; // 表格页面
	String form = "modules/sc/grade/scGradeMsgForm"; // 表单页面
	String tableName = new ScGradeMsg().getTableName(); // 数据表名

	// 通用model
	public void model(Model model) {
		model.addAttribute("rootUrl", "/sc/grade/scGradeMsg"); // rootUrl 访问路径
		model.addAttribute("tableName", tableName); // tableName 表名
		model.addAttribute("scTeacherList", scTeacherService.getAllList());
		model.addAttribute("gradeTypeList", scGradeTypeService.getAllList());
		model.addAttribute("gradeTermList", scGradeTermService.getAllList());
		model.addAttribute("scSemesterList", scSemesterService.getAllList());
	}

	// JSON对象字符串封装为对象
	public ScGradeMsg repJson(String json) {
		return (ScGradeMsg) JSONObject.toBean(toJsonObject(json), ScGradeMsg.class);
	}

	// 获取模板分页信息
	@RequestMapping(value = "/list")
	@ResponseBody
	@Token(save = true)
	public ResultPage<List<ScGradeMsg>> findAllList(ScGradeMsg entity) {
		return super.findList(entity);
	}

	// 根据主键获取模板信息
	@ModelAttribute
	public ScGradeMsg get(@RequestParam(required = false) String id) {
		ScGradeMsg entity = null;
		if (StringUtils.isNotBlank(id)) {
			entity = super.entityService.get(id);
		}
		if (entity == null) {
			entity = new ScGradeMsg();
		}
		return entity;
	}

	// 根据类型ID获取评分信息
	@RequestMapping(value = "/getByTypeId", method = RequestMethod.POST)
	@ResponseBody
	public List<ScGradeTerm> getByTypeId(String typeId) {
		List<ScGradeTerm> list = scGradeTermService.getByTypeId(typeId);
		return list;
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