package com.thinkgem.jeesite.modules.wm.util;

import java.util.ArrayList;
import java.util.List;

import com.thinkgem.jeesite.modules.wisdom.entity.base.SysBaseDict;

/**
 * @title 字典信息工具类
 * @author weekly
 * @version V19.12.04
 */
public class DictUtil {

	/**
	 * 传递字典集合和类型名称获取指定类型名称的字典集合
	 * @param list		字典集合
	 * @param typeName	类型名称
	 * @return
	 */
	public static List<SysBaseDict> getDictList(List<SysBaseDict> list, String typeName) {
		
		List<SysBaseDict> resList = new ArrayList<SysBaseDict>();
		
		for (int i = 0; i < list.size(); i++) {
			if (list.get(i).getType().equals(typeName)) {
				resList.add(list.get(i));
			}
		}
		
		return resList;
	}
	
}
