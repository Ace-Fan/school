package com.thinkgem.jeesite.modules.wisdom.dao.base;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.thinkgem.jeesite.modules.wisdom.entity.base.Columns;

/**
* @title 数据表格信息 
* @author weekly
* @version V19.09.12
*/
@MyBatisDao
public interface ColumnsDao {
	
	public List<Columns> findList(@Param(value = "tableName")String tableName);
	
}