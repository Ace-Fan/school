package com.thinkgem.jeesite.modules.base.dao;

import java.util.Date;

import org.apache.ibatis.annotations.Param;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.thinkgem.jeesite.modules.base.entity.BaseGroupTable;

@MyBatisDao
public interface BaseGroupTableDao extends CrudDao<BaseGroupTable> {
	
	/**
	 * 获取排序号(给定的表格名)
	 * @return
	 */
	Integer selectMaxOrderNo(@Param(value = "tableName") String tableName);
	
	/**
	 * 单个删除
	 */
	int deleteOne (@Param(value = "tableName") String tableName, @Param(value = "id") String id);
	
	/**
	 * 批量删除
	 * @param id
	 * @param field
	 * @param tableName
	 * @return int
	 */
	int batchDelete(@Param("id")String[] id, @Param("field")String field, @Param("tableName")String tableName);
	
	/**
	 * 切换指定表指定主键指定字段的值
	 * @param colunms 		指定字段
	 * @param tableName		指定表名
	 * @param id			指定主键
	 * @param value			指定内容
	 * @param currentUser	切换人
	 * @param uDate			切换时间
	 * 
	 * @author weekly
	 * @version V19.07.29
	 * @return
	 */
	int toggleTableColumns(@Param(value= "colunms")String colunms, @Param(value= "tableName")String tableName, @Param(value= "id")String id, @Param(value= "value")String value,
			@Param(value = "currentUser" ) String currentUser, @Param(value = "uDate") Date uDate);
	
	/**
	 * 传递表名获取最大排序号
	 * @param tableName				表名
	 * @author weekly
	 * @version V19.08.07
	 * @return	最大排序号
	 */
	public BaseGroupTable getMaxOrderNo(@Param(value = "tableName") String tableName);
}
