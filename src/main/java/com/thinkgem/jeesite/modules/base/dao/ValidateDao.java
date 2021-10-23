package com.thinkgem.jeesite.modules.base.dao;

import org.apache.ibatis.annotations.Param;

import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;

@MyBatisDao
public interface ValidateDao {

	/**
	 * 验证传递的字段名和表名和属性值，验证属性值是否存在
	 * 
	 * @param colunms
	 *            字段名
	 * @param tableName
	 *            表名
	 * @param value
	 *            属性值
	 * @return
	 */
	int checkColumnsValue(@Param(value = "colunms") String colunms, @Param(value = "tableName") String tableName,
			@Param(value = "value") String value);

}
