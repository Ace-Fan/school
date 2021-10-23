package com.thinkgem.jeesite.modules.wisdom.web.base;

import java.util.List;

import javax.servlet.http.HttpServletResponse;

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
import com.thinkgem.jeesite.modules.adopens.common.Result;
import com.thinkgem.jeesite.modules.wisdom.dao.base.SysBaseRegionCodeDao;
import com.thinkgem.jeesite.modules.wisdom.entity.base.SysBaseRegionCode;
import com.thinkgem.jeesite.modules.wisdom.service.base.SysBaseRegionCodeService;

import net.sf.json.JSONObject;

/**
 * 行政区划经纬度Controller
 * @author weekly
 * @version 2019-09-17
 */
@Controller
@RequestMapping(value = "${adminPath}/wisdom/base/sysBaseRegionCode")
public class SysBaseRegionCodeController extends BaseCrudController<SysBaseRegionCodeService, SysBaseRegionCodeDao, SysBaseRegionCode> {

	String list = "modules/wisdom/base/sysBaseRegionCodeList";	// 表格页面
	String form = "modules/wisdom/base/sysBaseRegionCodeForm";	// 表单页面
	
	// 通用model
	public void model(Model model) {
		SysBaseRegionCode sysBaseRegionCode = new SysBaseRegionCode();
		model.addAttribute("rootUrl", "/wisdom/base/sysBaseRegionCode"); // rootUrl 访问路径
		model.addAttribute("tableName", sysBaseRegionCode.getTableName()); // tableName 表名
	}
	
	// JSON对象字符串封装为对象
	public SysBaseRegionCode repJson(String json) { 
		return (SysBaseRegionCode) JSONObject.toBean(toJsonObject(json), SysBaseRegionCode.class);
	}
	
	@ModelAttribute
	public SysBaseRegionCode get(@RequestParam(required=false) String id) {
		SysBaseRegionCode entity = null;
		if (StringUtils.isNotBlank(id)){ entity = entityService.get(id); }
		if (entity == null){ entity = new SysBaseRegionCode(); }
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
	public ResultPage<List<SysBaseRegionCode>> findAllList(SysBaseRegionCode sysBaseRegionCode) {
		return findList(sysBaseRegionCode);
	}

	// 跳转到修改或者查看页面
	@RequestMapping(value = "getShow")
	public String form(String id, String type, Model model) {
		model(model); // 当前model方法
		modelType(type, model);
		logger.debug("type:"+type);
		if (id != null && !"".equals(id)) { model.addAttribute("sysBaseRegionCode", entityService.get(id));  }
		return form;
	}
	
	// 添加或修改信息
	@RequestMapping(value = "save")
	@ResponseBody
	public void save(HttpServletResponse response, String json,String tableName) throws Exception {
		SysBaseRegionCode sysBaseRegionCode = repJson(json);
		
		if (null != sysBaseRegionCode.getId() && !sysBaseRegionCode.getId().equals("")) {
			boolean bool = entityService.update(sysBaseRegionCode);
			if (bool) {
				result.setCode(2);
				result.setMsg("修改成功");
			} else {
				result.setCode(-2);
				result.setMsg("修改失败");
			}
		} else {
			boolean bool = entityService.insert(sysBaseRegionCode);
			if (bool) {
				result.setCode(1);
				result.setMsg("添加成功");
			} else {
				result.setCode(-1);
				result.setMsg("添加失败");
			}
		}
		response.getWriter().write(JsonMapper.getInstance().toJson(result));
	}
	
	/**
	 * 删除单个
	 * @param id
	 * @param tableName
	 * @param response
	 * @throws Exception
	 */
	@RequestMapping(value="/delete", method = {RequestMethod.POST})
	@ResponseBody
	public void delete(String id, HttpServletResponse response)throws Exception {
		
		Result result = new Result();
		
		SysBaseRegionCode sysBaseRegionCode = new SysBaseRegionCode();
		sysBaseRegionCode.setId(id);
		
		if(null == id) {
			result.setMsg("ID不能为空");
		} else {
			boolean bool = entityService.delete(sysBaseRegionCode);
			if(bool) {
				result.setCode(1);
				result.setMsg("删除成功!");
			} else {
				result.setCode(-1);
				result.setMsg("删除失败!");
			}
		}
		response.getWriter().write(JsonMapper.toJsonString(result));
	}
	
}