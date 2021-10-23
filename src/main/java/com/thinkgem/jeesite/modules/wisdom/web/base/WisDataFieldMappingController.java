package com.thinkgem.jeesite.modules.wisdom.web.base;

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
import com.thinkgem.jeesite.modules.wisdom.dao.base.WisDataFieldMappingDao;
import com.thinkgem.jeesite.modules.wisdom.entity.base.WisDataFieldMapping;
import com.thinkgem.jeesite.modules.wisdom.entity.base.WisDataImportTab;
import com.thinkgem.jeesite.modules.wisdom.service.base.WisDataFieldMappingService;
import com.thinkgem.jeesite.modules.wisdom.service.base.WisDataImportTabService;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import net.sf.json.JsonConfig;

/**
 * @title 导入字段映射配置控制层
 * @author weekly
 * @version 2019-10-07
 */
@Controller
@RequestMapping(value = "${adminPath}/wisdom/base/wisDataFieldMapping")
public class WisDataFieldMappingController extends BaseCrudController<WisDataFieldMappingService, WisDataFieldMappingDao, WisDataFieldMapping> {

	@Autowired
	private WisDataImportTabService wisDataImportTabService;
	
	String list = "modules/wisdom/base/wisDataFieldMappingList";		// 表格页面
	String form = "modules/wisdom/base/wisDataFieldMappingForm";		// 表单页面
	
	// 通用model
	public void model(Model model) {
		WisDataFieldMapping entity = new WisDataFieldMapping();
		model.addAttribute("rootUrl", "/wisdom/base/wisDataFieldMapping"); 		// rootUrl 访问路径
		model.addAttribute("tableName", entity.getTableName()); // tableName 表名
		
		// 表格数据
		List<WisDataImportTab> tabList = wisDataImportTabService.getAllList();
		for (int i = 0; i < tabList.size(); i++) { tabList.get(i).setTableVal(tabList.get(i).getId()+","+tabList.get(i).getTableCode()); }
		model.addAttribute("tabList", tabList);	// 表格数据
	}
	
	// JSON对象字符串封装为对象
	public WisDataFieldMapping repJson(String json) { 
		return (WisDataFieldMapping) JSONObject.toBean(toJsonObject(json), WisDataFieldMapping.class);
	}
	
	// 获取模板分页信息
	@RequestMapping(value = "/list")
	@ResponseBody
	@Token(save = true)
	public ResultPage<List<WisDataFieldMapping>> findAllList(WisDataFieldMapping entity) {
		return super.findList(entity);
	}
	
	// 根据主键获取模板信息
	@ModelAttribute
	public WisDataFieldMapping get(@RequestParam(required = false) String id) {
		WisDataFieldMapping entity = null;
		if (StringUtils.isNotBlank(id)) { entity = super.entityService.get(id); }
		if (entity == null) { entity = new WisDataFieldMapping(); }
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
	public void save(String json, String tableName, HttpServletResponse response, HttpServletRequest request) throws Exception {
		response.getWriter().write(JsonMapper.getInstance().toJson(save(repJson(json), tableName)));
	}
	
	/**
	 * EXCEL批量新增
	 * @param response
	 * @param request
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "excelSave")
	@ResponseBody
	public void excelSave( HttpServletResponse response,HttpServletRequest request) throws Exception {
		String json = request.getParameter("json");
		
		// 数据结构JSON
		JSONArray dataListJson = JSONArray.fromObject(json);
		
		//参数1为要转换的JSONArray数据，参数2为要转换的目标数据，即List盛装的数据
		List<WisDataFieldMapping> dataList = JSONArray.toList(dataListJson, new WisDataFieldMapping(), new JsonConfig());
		// logger.debug("dataList前:"+dataList.toString());
		
		// 处理无需导入的字段信息并删除
		for (int i = dataList.size()-1; i >= 0 ; i--) {
			String importFlag = dataList.get(i).getIsImport();
			
			if ("0".equals(importFlag)) {
				dataList.remove(i);
			}
		}
		
		logger.debug("dataList后:"+dataList.toString());
		
		boolean bool = entityService.excelSave(dataList); // 新增操作
		if (bool) { getResult(result,1,"新增成功"); } else { getResult(result,-1,"新增失败");	}
		
		response.getWriter().write(JsonMapper.getInstance().toJson(result));
	}
	
	/**
	 * 传递表名获取数据表格信息
	 * @param tableName
	 * @param response
	 * @throws Exception
	 */
	@RequestMapping(value="/getList", method = {RequestMethod.POST})
	@ResponseBody
	public void findList(String id, HttpServletResponse response)throws Exception {
		
		// 声明查询映射表信息
		WisDataFieldMapping entity = new WisDataFieldMapping();
		entity.setDataTabId(id);
		
		// 声明回调信息
		List<WisDataFieldMapping> excelMappinglist = entityService.findList(entity);
		
		result.setCode(1);
		result.setMsg("查询成功");
		result.setSuccess(true);
		result.setData(excelMappinglist);
		response.getWriter().write(JsonMapper.toJsonString(result));
	}
	
	/**
	 * 传入dataId查询当前映射关系是否存在
	 * @param dataTabId	
	 * @param response
	 * @throws Exception
	 * @version V19.09.08
	 * 
	 */
	@RequestMapping(value="/countMapping", method = {RequestMethod.POST})
	@ResponseBody
	public void countMapping(String dataTabId, HttpServletResponse response)throws Exception {
		// logger.debug("dataTabId:"+dataTabId);
		WisDataFieldMapping entity = new WisDataFieldMapping();
		entity.setDataTabId(dataTabId);
		boolean bool = entityService.countMapping(entity);
		
		if (bool) {
			result.setCode(-1);
			result.setMsg("当前已存在");
			result.setSuccess(false);
		} else {
			result.setCode(1);
			result.setMsg("当前不存在");
			result.setSuccess(true);
		}
		response.getWriter().write(JsonMapper.toJsonString(result));
	}

}