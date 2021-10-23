package com.thinkgem.jeesite.modules.wisdom.web.base;

import java.util.List;

import javax.servlet.http.HttpServletResponse;

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
import com.thinkgem.jeesite.modules.sys.utils.UserUtils;
import com.thinkgem.jeesite.modules.wisdom.dao.base.WisCommunityInfoDao;
import com.thinkgem.jeesite.modules.wisdom.entity.base.WisCommunityInfo;
import com.thinkgem.jeesite.modules.wisdom.service.base.SysBaseAreaCodeService;
import com.thinkgem.jeesite.modules.wisdom.service.base.WisCommunityInfoService;

import net.sf.json.JSONObject;

/**
 * @title 社区信息控制层
 * @author weekly
 * @version V19.09.21
 */
@Controller
@RequestMapping(value = "${adminPath}/wisdom/base/wisCommunityInfo")
public class WisCommunityInfoController extends BaseCrudController<WisCommunityInfoService, WisCommunityInfoDao, WisCommunityInfo> {

	@Autowired
	private SysBaseAreaCodeService sysBaseAreaCodeService;
	
	String list = "modules/wisdom/base/wisCommunityInfoList";	// 表格页面
	String form = "modules/wisdom/base/wisCommunityInfoForm";	// 表单页面
	
	// 通用model
	public void model(Model model) {
		WisCommunityInfo wisCommunityInfo = new WisCommunityInfo();
		model.addAttribute("rootUrl", "/wisdom/base/wisCommunityInfo"); // rootUrl 访问路径
		model.addAttribute("tableName", wisCommunityInfo.getTableName()); // tableName 表名
		model.addAttribute("indexAreaInfoList", sysBaseAreaCodeService.getIndexAreaInfo()); // 一级省份信息
	}
	
	// JSON对象字符串封装为对象
	public WisCommunityInfo repJson(String json) { 
		return (WisCommunityInfo) JSONObject.toBean(toJsonObject(json), WisCommunityInfo.class);
	}
	
	@ModelAttribute
	public WisCommunityInfo get(@RequestParam(required=false) String id) {
		WisCommunityInfo entity = null;
		if (StringUtils.isNotBlank(id)){ entity = entityService.get(id); }
		if (entity == null){ entity = new WisCommunityInfo(); }
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
	public ResultPage<List<WisCommunityInfo>> findAllList(WisCommunityInfo wisCommunityInfo) {
		return findList(wisCommunityInfo);
	}

	// 跳转到修改或者查看页面
	@RequestMapping(value = "getShow")
	public String form(String id, String type, Model model) {
		model(model); // 当前model方法
		modelType(type, model);
		logger.debug("type:"+type);
		if (id != null && !"".equals(id)) { 
			WisCommunityInfo wisCommunityInfo = entityService.get(id);
			model.addAttribute("wisCommunityInfo", wisCommunityInfo);  
			model.addAttribute("secondAreaInfoList", sysBaseAreaCodeService.getAreaInfoByLevAndName("2",wisCommunityInfo.getProvince())); // 二级城市信息
			model.addAttribute("thirdAreaInfoList", sysBaseAreaCodeService.getAreaInfoByLevAndName("3",wisCommunityInfo.getCity())); 	  // 三级区县信息
		}
		return form;
	}
	
	// 添加或修改信息
	@RequestMapping(value = "save")
	@ResponseBody
	public void save(HttpServletResponse response, String json,String tableName) throws Exception {
		String officeId = UserUtils.getUser().getOffice().getId();	//当前登录机构
		WisCommunityInfo entity = repJson(json);
		entity.setCreateOrg(officeId);
		response.getWriter().write(JsonMapper.getInstance().toJson(saveService(entity, tableName)));
	}

}