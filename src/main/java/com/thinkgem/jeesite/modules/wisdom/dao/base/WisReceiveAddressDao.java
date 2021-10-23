package com.thinkgem.jeesite.modules.wisdom.dao.base;

import java.util.Date;

import org.apache.ibatis.annotations.Param;

import com.thinkgem.jeesite.common.crud.BaseCrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.thinkgem.jeesite.modules.wisdom.entity.base.WisReceiveAddress;

/**
 * 收货地址信息DAO接口
 * @author weekly
 * @version 2019-09-19
 */
@MyBatisDao
public interface WisReceiveAddressDao extends BaseCrudDao<WisReceiveAddress> {
	
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
	
}