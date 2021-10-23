package com.thinkgem.jeesite.modules.wisdom.dao.base;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.thinkgem.jeesite.common.crud.BaseCrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.thinkgem.jeesite.modules.wisdom.entity.base.SysBaseDict;

/**
 * 数据字典信息DAO接口
 * @author weekly
 * @version 2019-09-19
 */
@MyBatisDao
public interface SysBaseDictDao extends BaseCrudDao<SysBaseDict> {
	
	/**
	 * 获取属性结果信息
	 * @param parentId
	 * @param name
	 * @return
	 */
	List<Map<String, Object>> findListMap(@Param("parentId") String parentId,@Param("name")String name);

}