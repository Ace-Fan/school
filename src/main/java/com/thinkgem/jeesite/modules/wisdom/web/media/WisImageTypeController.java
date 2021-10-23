package com.thinkgem.jeesite.modules.wisdom.web.media;

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
import com.thinkgem.jeesite.modules.wisdom.dao.media.WisImageTypeDao;
import com.thinkgem.jeesite.modules.wisdom.entity.media.WisImageType;
import com.thinkgem.jeesite.modules.wisdom.service.media.WisImageTypeService;

import net.sf.json.JSONObject;

/**
 * 图片资源分类管理Controller
 * @author weekly
 * @version 2019-09-18
 */
@Controller
@RequestMapping(value = "${adminPath}/wisdom/media/wisImageType")
public class WisImageTypeController extends BaseCrudController<WisImageTypeService, WisImageTypeDao, WisImageType> {

	String list = "modules/wisdom/media/wisImageTypeList";	// 表格页面
	String form = "modules/wisdom/media/wisImageTypeForm";	// 表单页面
	
	// 通用model
	public void model(Model model) {
		WisImageType wisImageType = new WisImageType();
		model.addAttribute("rootUrl", "/wisdom/media/wisImageType"); // rootUrl 访问路径
		model.addAttribute("tableName", wisImageType.getTableName()); // tableName 表名
	}
	
	// JSON对象字符串封装为对象
	public WisImageType repJson(String json) { 
		return (WisImageType) JSONObject.toBean(toJsonObject(json), WisImageType.class);
	}
	
	@ModelAttribute
	public WisImageType get(@RequestParam(required=false) String id) {
		WisImageType entity = null;
		if (StringUtils.isNotBlank(id)){ entity = entityService.get(id); }
		if (entity == null){ entity = new WisImageType(); }
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
	public ResultPage<List<WisImageType>> findAllList(WisImageType wisImageType) {
		return findList(wisImageType);
	}

	// 跳转到修改或者查看页面
	@RequestMapping(value = "getShow")
	public String form(String id, String type, Model model) {
		model(model); // 当前model方法
		modelType(type, model);
		logger.debug("type:"+type);
		if (id != null && !"".equals(id)) { model.addAttribute("wisImageType", entityService.get(id));  }
		return form;
	}
	
	// 添加或修改信息
	@RequestMapping(value = "save")
	@ResponseBody
	public void save(HttpServletResponse response, String json,String tableName) throws Exception {
		response.getWriter().write(JsonMapper.getInstance().toJson(saveService(repJson(json), tableName)));
	}

}