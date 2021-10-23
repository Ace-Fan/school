package com.thinkgem.jeesite.modules.wisdom.dao.base;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.thinkgem.jeesite.common.crud.BaseCrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.thinkgem.jeesite.modules.wisdom.entity.base.WisDataFieldMapping;

/**
 * @title 导入字段映射配置数据访问层
 * @author weekly
 * @version 2019-10-07
 */
@MyBatisDao
public interface WisDataFieldMappingDao extends BaseCrudDao<WisDataFieldMapping> {
	
	// EXCEL批量新增
	int excelSave(@Param(value = "list") List<WisDataFieldMapping> dataList);
	
	// 传递表名获取导入字段映射信息
	List<WisDataFieldMapping> findExcelList(@Param(value = "tableName")String tableName);
	
	// 根据表名获取当前存在个数
	int countMapping(WisDataFieldMapping wisDataFieldMapping);
	
}