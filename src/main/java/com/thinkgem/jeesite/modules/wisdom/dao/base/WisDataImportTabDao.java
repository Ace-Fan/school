package com.thinkgem.jeesite.modules.wisdom.dao.base;

import org.apache.ibatis.annotations.Param;

import com.thinkgem.jeesite.common.crud.BaseCrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.thinkgem.jeesite.modules.wisdom.entity.base.WisDataImportTab;

/**
 * @title 数据导入配置数据访问层
 * @author weekly
 * @version 2019-10-07
 */
@MyBatisDao
public interface WisDataImportTabDao extends BaseCrudDao<WisDataImportTab> {

	// 传递表名获取导入配置主体信息
	public WisDataImportTab getExcelFileUrlByTabCode(@Param(value="tableName")String tableName);
	
}