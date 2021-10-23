package com.thinkgem.jeesite.modules.wisdom.web.base;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
import com.thinkgem.jeesite.modules.wisdom.dao.base.SysBaseAreaCodeDao;
import com.thinkgem.jeesite.modules.wisdom.entity.base.SysBaseAreaCode;
import com.thinkgem.jeesite.modules.wisdom.service.base.SysBaseAreaCodeService;

import net.sf.json.JSONObject;

/**
 * 行政区划编码Controller
 * @author weekly
 * @version 2019-09-17
 */
@Controller
@RequestMapping(value = "${adminPath}/wisdom/base/sysBaseAreaCode")
public class SysBaseAreaCodeController extends BaseCrudController<SysBaseAreaCodeService, SysBaseAreaCodeDao, SysBaseAreaCode> {

	String list = "modules/wisdom/base/sysBaseAreaCodeList";	// 表格页面
	String form = "modules/wisdom/base/sysBaseAreaCodeForm";	// 表单页面
	
	// 通用model
	public void model(Model model) {
		SysBaseAreaCode sysBaseAreaCode = new SysBaseAreaCode();
		model.addAttribute("rootUrl", "/wisdom/base/sysBaseAreaCode"); // rootUrl 访问路径
		model.addAttribute("tableName", sysBaseAreaCode.getTableName()); // tableName 表名
		model.addAttribute("indexAreaInfoList", entityService.getIndexAreaInfo()); // 一级省份信息
	}
	
	@RequestMapping(value = "areaList")
	@ResponseBody
	public void areaList(HttpServletResponse response,HttpServletRequest request) throws Exception {
		SysBaseAreaCode province = new SysBaseAreaCode();
		province.setCurrLevel("1");
		
		SysBaseAreaCode city = new SysBaseAreaCode();
		city.setCurrLevel("2");
		
		SysBaseAreaCode country = new SysBaseAreaCode();
		country.setCurrLevel("3");
		
		List<SysBaseAreaCode> provincelist = entityService.areaListOne(province);
		List<SysBaseAreaCode> citylist = entityService.areaListTwo(city);
		List<SysBaseAreaCode> countrylist = entityService.areaListThree(country);
		
		Map<String, List<SysBaseAreaCode>> map = new HashMap<String, List<SysBaseAreaCode>>();
		map.put("provincelist", provincelist);
		map.put("citylist", citylist);
		map.put("countrylist", countrylist);
		result.setData(map);
		response.getWriter().write(JsonMapper.getInstance().toJson(result));
	}
	
	// JSON对象字符串封装为对象
	public SysBaseAreaCode repJson(String json) { 
		return (SysBaseAreaCode) JSONObject.toBean(toJsonObject(json), SysBaseAreaCode.class);
	}
	
	@ModelAttribute
	public SysBaseAreaCode get(@RequestParam(required=false) String id) {
		SysBaseAreaCode entity = null;
		if (StringUtils.isNotBlank(id)){ entity = entityService.get(id); }
		if (entity == null){ entity = new SysBaseAreaCode(); }
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
	public ResultPage<List<SysBaseAreaCode>> findAllList(SysBaseAreaCode sysBaseAreaCode) {
		return findList(sysBaseAreaCode);
	}

	// 跳转到修改或者查看页面
	@RequestMapping(value = "getShow")
	public String form(String id, String type, Model model) {
		model(model); // 当前model方法
		modelType(type, model);
		logger.debug("type:"+type);
		if (id != null && !"".equals(id)) { model.addAttribute("sysBaseAreaCode", entityService.get(id));  }
		return form;
	}
	
	// 添加或修改信息
	@RequestMapping(value = "save")
	@ResponseBody
	public void save(HttpServletResponse response, String json,String tableName) throws Exception {
		response.getWriter().write(JsonMapper.getInstance().toJson(saveService(repJson(json), tableName)));
	}
	
	/**
	 * 根据省份名称和统计编码获取行政区划信息
	 * @param currLevel
	 * @param areaCode
	 * @return
	 */
	@RequestMapping(value = "getAreaInfoByStacodeAndCode")
	@ResponseBody
	public List<SysBaseAreaCode> getAreaInfoByStacodeAndCode(String currLevel,String areaCode) {
		List<SysBaseAreaCode> sysBaseAreaCode = entityService.getAreaInfoByAreaCodeAndLev(currLevel, areaCode);
		return sysBaseAreaCode;
	}

}