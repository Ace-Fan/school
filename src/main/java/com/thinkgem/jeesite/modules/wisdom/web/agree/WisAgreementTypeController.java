package com.thinkgem.jeesite.modules.wisdom.web.agree;

import java.util.List;

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
import com.thinkgem.jeesite.modules.sys.utils.UserUtils;
import com.thinkgem.jeesite.modules.wisdom.dao.agree.WisAgreementTypeDao;
import com.thinkgem.jeesite.modules.wisdom.entity.agree.WisAgreementType;
import com.thinkgem.jeesite.modules.wisdom.service.agree.WisAgreementTypeService;

import net.sf.json.JSONObject;

/**
 * 协议类型信息Controller
 * @author weekly
 * @version 2019-09-19
 */
@Controller
@RequestMapping(value = "${adminPath}/wisdom/agree/wisAgreementType")
public class WisAgreementTypeController extends BaseCrudController<WisAgreementTypeService, WisAgreementTypeDao, WisAgreementType> {

	String list = "modules/wisdom/agree/wisAgreementTypeList";	// 表格页面
	String form = "modules/wisdom/agree/wisAgreementTypeForm";	// 表单页面
	
	// 通用model
	public void model(Model model) {
		WisAgreementType wisAgreementType = new WisAgreementType();
		model.addAttribute("rootUrl", "/wisdom/agree/wisAgreementType"); // rootUrl 访问路径
		model.addAttribute("tableName", wisAgreementType.getTableName()); // tableName 表名
	}
	
	// JSON对象字符串封装为对象
	public WisAgreementType repJson(String json) { 
		return (WisAgreementType) JSONObject.toBean(toJsonObject(json), WisAgreementType.class);
	}
	
	@ModelAttribute
	public WisAgreementType get(@RequestParam(required=false) String id) {
		WisAgreementType entity = null;
		if (StringUtils.isNotBlank(id)){ entity = entityService.get(id); }
		if (entity == null){ entity = new WisAgreementType(); }
		return entity;
	}
	
	// 跳转到表格页面
	@RequestMapping(value = { "show", "" })
	public String list(Model model) {
		model(model); // 通用model
		return list;
	}

	// 获取模板分页信息
	@RequestMapping(value = "/list")
	@ResponseBody
	@Token(save = true)
	public ResultPage<List<WisAgreementType>> findAllList(WisAgreementType wisAgreementType) {
		return findList(wisAgreementType);
	}

	// 跳转到修改或者查看页面
	@RequestMapping(value = "getShow")
	public String form(String id, String type, Model model) {
		model(model); // 当前model方法
		modelType(type, model);
		logger.debug("type:"+type);
		if (id != null && !"".equals(id)) { model.addAttribute("wisAgreementType", entityService.get(id));  }
		return form;
	}
	
	// 添加或修改信息
	@RequestMapping(value = "save")
	@ResponseBody
	public void save(HttpServletResponse response, String json,String tableName) throws Exception {
		String officeId = UserUtils.getUser().getOffice().getId();	//当前登录机构
		WisAgreementType entity = repJson(json);
		entity.setCreateOrg(officeId);
		response.getWriter().write(JsonMapper.getInstance().toJson(saveService(entity, tableName)));
	}
	
}