package com.thinkgem.jeesite.modules.wisdom.service.base;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.crud.BaseCrudService;
import com.thinkgem.jeesite.modules.wisdom.dao.base.SysBaseDictDao;
import com.thinkgem.jeesite.modules.wisdom.entity.base.SysBaseDict;

/**
 * 数据字典信息Service
 * @author weekly
 * @version 2019-09-19
 */
@Service
@Transactional(readOnly = true)
public class SysBaseDictService extends BaseCrudService<SysBaseDictDao, SysBaseDict> {

	/**
	 * 左侧树形菜单
	 * @param parentId
	 * @param name
	 * @return
	 */
	public List<Map<String, Object>> findListMap(String parentId,String name) {
		List<Map<String, Object>> lists = new ArrayList<>();
		List<Map<String, Object>> ListMap = dao.findListMap(parentId,name);
		if(ListMap!=null && ListMap.size()>0) {
			for (Map<String, Object> map : ListMap) {
				List<Map<String, Object>> listMap2 = findListMap(String.valueOf(map.get("id")),name);
				if(listMap2!=null && listMap2.size()>0) {
					map.put("children",listMap2);
					map.put("isLast", false);
				}else {
					map.put("isLast", true);
					map.put("level", "2");
				}
				lists.add(map);
			}
		}
		return lists;
	}


}