package com.thinkgem.jeesite.modules.wisdom.web.agree;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringEscapeUtils;
import org.springframework.beans.factory.annotation.Autowired;
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
import com.thinkgem.jeesite.modules.wisdom.dao.agree.WisAgreementContentDao;
import com.thinkgem.jeesite.modules.wisdom.entity.agree.WisAgreementContent;
import com.thinkgem.jeesite.modules.wisdom.service.agree.WisAgreementContentService;
import com.thinkgem.jeesite.modules.wisdom.service.agree.WisAgreementTypeService;
import com.thinkgem.jeesite.modules.wisdom.util.base.StringUtil;
import com.thinkgem.jeesite.modules.wm.util.UeditorUtil;

import net.sf.json.JSONObject;

/**
 * 协议内容信息Controller
 * @author weekly
 * @version 2019-09-19
 */
@Controller
@RequestMapping(value = "${adminPath}/wisdom/agree/wisAgreementContent")
public class WisAgreementContentController extends BaseCrudController<WisAgreementContentService, WisAgreementContentDao, WisAgreementContent> {

	@Autowired
	private WisAgreementTypeService wisAgreementTypeService;
	
	String list = "modules/wisdom/agree/wisAgreementContentList";	// 表格页面
	String form = "modules/wisdom/agree/wisAgreementContentForm";	// 表单页面
	
	// 通用model
	public void model(Model model) {
		WisAgreementContent wisAgreementContent = new WisAgreementContent();
		model.addAttribute("rootUrl", "/wisdom/agree/wisAgreementContent"); 	// rootUrl 访问路径
		model.addAttribute("tableName", wisAgreementContent.getTableName()); 	// tableName 表名
		model.addAttribute("agreementTypeList", wisAgreementTypeService.getAllList()); 	// tableName 表名
	}
	
	// JSON对象字符串封装为对象
	public WisAgreementContent repJson(String json) { 
		return (WisAgreementContent) JSONObject.toBean(toJsonObject(json), WisAgreementContent.class);
	}
	
	@ModelAttribute
	public WisAgreementContent get(@RequestParam(required=false) String id) {
		WisAgreementContent entity = null;
		if (StringUtils.isNotBlank(id)){ entity = entityService.get(id); }
		if (entity == null){ entity = new WisAgreementContent(); }
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
	public ResultPage<List<WisAgreementContent>> findAllList(WisAgreementContent wisAgreementContent) {
		return findList(wisAgreementContent);
	}

	// 跳转到修改或者查看页面
	@RequestMapping(value = "getShow")
	public String form(String id, String type, Model model) {
		model(model); // 当前model方法
		modelType(type, model);
		logger.debug("type:"+type);
		if (id != null && !"".equals(id)) { model.addAttribute("wisAgreementContent", entityService.get(id));  }
		return form;
	}
	
	// 添加或修改信息
	@RequestMapping(value = "save")
	@ResponseBody
	public void save(HttpServletResponse response, String json,String tableName, HttpServletRequest request) throws Exception {
		
		String projectPath  = request.getSession().getServletContext().getRealPath("/");  // 当前项目路径
		projectPath = projectPath.substring(0, projectPath.length()-1);	// 去掉最后一位
		projectPath = projectPath.replaceAll("\\\\", "/");
		projectPath = StringUtil.getLastIndexOf(projectPath, "/");
		
		// 转义JSON转义的前端字符
		WisAgreementContent entity = repJson(json);
		String updateLog = StringEscapeUtils.unescapeHtml4(entity.getAgreementContent());
		String content = UeditorUtil.getUploadFileRes(updateLog, projectPath);	// 需要修改的内容字段
		entity.setAgreementContent(content);
		
		response.getWriter().write(JsonMapper.getInstance().toJson(saveService(entity, tableName)));
	}
	
}