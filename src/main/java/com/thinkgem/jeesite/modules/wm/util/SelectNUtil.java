package com.thinkgem.jeesite.modules.wm.util;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;

import com.thinkgem.jeesite.modules.wisdom.entity.base.SysBaseDict;
import com.thinkgem.jeesite.modules.wisdom.service.base.SysBaseDictService;

import net.sf.json.JSONArray;
import net.sf.json.JsonConfig;
import net.sf.json.util.CycleDetectionStrategy;

/**
 * 下拉框多选组件 拓展工具类
 * @author Administrator
 *
 */
public class SelectNUtil {
	
	// 字典
	@Autowired
	SysBaseDictService sysBaseDictService;
	
	/**
	 * 根据传递的字段类型 获取多个返回的JSONARRAY数组
	 * @param dictType
	 * @return
	 */
	public JSONArray getSelectNReturnJson(List<SysBaseDict> typeList) {
		List<Map<String,Object>> projectMapList = new ArrayList<Map<String,Object>>();
		
		for (SysBaseDict projectTypeInfo : typeList) {
			Map<String, Object> projectMap = new HashMap<String, Object>();
			projectMap.put("id", projectTypeInfo.getCode());
			projectMap.put("name", projectTypeInfo.getName());
			projectMapList.add(projectMap);
		}
		JsonConfig jsonConfig = new JsonConfig();
		jsonConfig.setCycleDetectionStrategy(CycleDetectionStrategy.LENIENT);
		
		JSONArray json = JSONArray.fromObject(projectMapList, jsonConfig);
		
		return json;
	}
	
	/**
	 * 传递编号集合和类型名称和字典集合信息，返回比对字典和类型名称对应的信息编码集合
	 * 
	 * @param codeList	编码集合
	 * @param dictList	字典集合信息
	 * @param type		传递下拉框多选类型信息
	 * @param checkType 比对字典类型
	 * @return
	 */
	public List<Integer> getCheckTypeList(List<SysBaseDict> dictList, List<Integer> codeList, String type, String checkType) {
		String[] typeArr = type.split("-");
		for (String typeStr : typeArr) {
			for (int i = 0; i < dictList.size(); i++) {
				if (checkType.equals(dictList.get(i).getType())) {
					if (typeStr.equals(dictList.get(i).getName())) {
						codeList.add(Integer.valueOf(dictList.get(i).getCode()));
					}
				}
			}
		}
		return codeList;
	}
}
