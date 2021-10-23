package com.thinkgem.jeesite.modules.wisdom.web.base;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
import com.thinkgem.jeesite.modules.wisdom.dao.base.SysBaseDictDao;
import com.thinkgem.jeesite.modules.wisdom.entity.base.SysBaseDict;
import com.thinkgem.jeesite.modules.wisdom.service.base.SysBaseDictService;

import net.sf.json.JSONObject;

/**
 * 数据字典信息Controller
 * @author weekly
 * @version 2019-09-19
 */
@Controller
@RequestMapping(value = "${adminPath}/wisdom/base/sysBaseDict")
public class SysBaseDictController extends BaseCrudController<SysBaseDictService, SysBaseDictDao, SysBaseDict> {

	String list = "modules/wisdom/base/sysBaseDictList";	// 表格页面
	String form = "modules/wisdom/base/sysBaseDictForm";	// 表单页面
	
	// 通用model
	public void model(Model model) {
		SysBaseDict sysBaseDict = new SysBaseDict();
		model.addAttribute("rootUrl", "/wisdom/base/sysBaseDict"); // rootUrl 访问路径
		model.addAttribute("tableName", sysBaseDict.getTableName()); // tableName 表名
	}
	
	// JSON对象字符串封装为对象
	public SysBaseDict repJson(String json) { 
		return (SysBaseDict) JSONObject.toBean(toJsonObject(json), SysBaseDict.class);
	}
	
	@ModelAttribute
	public SysBaseDict get(@RequestParam(required=false) String id) {
		SysBaseDict entity = null;
		if (StringUtils.isNotBlank(id)){ entity = entityService.get(id); }
		if (entity == null){ entity = new SysBaseDict(); }
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
	public ResultPage<List<SysBaseDict>> findAllList(SysBaseDict sysBaseDict) {
		return findList(sysBaseDict);
	}

	// 跳转到修改或者查看页面
	@RequestMapping(value = "getShow")
	public String form(String id, String type, Model model) {
		model(model); // 当前model方法
		modelType(type, model);
		logger.debug("type:"+type);
		if (id != null && !"".equals(id)) { model.addAttribute("sysBaseDict", entityService.get(id));  }
		return form;
	}
	
	// 添加或修改信息
	@RequestMapping(value = "save")
	@ResponseBody
	public void save(HttpServletResponse response, String json,String tableName) throws Exception {
		String officeId = UserUtils.getUser().getOffice().getId();	//当前登录机构
		SysBaseDict entity = repJson(json);
		entity.setCreateOrg(officeId);
		response.getWriter().write(JsonMapper.getInstance().toJson(saveServiceTree(entity, tableName)));
	}
	
	/**
	 * 获取树形菜单信息
	 * @param parentId
	 * @param name
	 * @return
	 */
	@RequestMapping("/getTree")
	@ResponseBody
	public Map<String, Object> getTree(@RequestParam(required=false,defaultValue="0") String parentId,@RequestParam(required=false,defaultValue="")String name){
		Map<String, Object> map = new HashMap<>();
		List<Map<String, Object>> findListMap = entityService.findListMap(parentId,name);
		Map<String, Object> subMap = new HashMap<>();
		
		if(findListMap!=null && !findListMap.isEmpty()) {
			subMap.put("code", 200);
			subMap.put("message", "操作成功");
			map.put("status", subMap);//必须添加响应状态
			
			List<Map<String, Object>> rootList = new ArrayList<>();
			Map<String, Object> root = new HashMap<>();//创建根节点
			root.put("id", "0");
			root.put("title", "基础数据");
			root.put("isLast", false);
			root.put("level", "1");
			root.put("parentId", "0");
			root.put("children", findListMap);
			rootList.add(root);
			
			map.put("data", rootList);//数据集
		}else {
			subMap.put("code", 500);
			subMap.put("message", "操作失败");
			map.put("status", subMap);
			map.put("data", null);
		}
		return map;
	}

}