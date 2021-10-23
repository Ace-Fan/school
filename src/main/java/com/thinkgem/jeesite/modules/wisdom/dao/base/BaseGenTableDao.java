package com.thinkgem.jeesite.modules.wisdom.dao.base;

import com.thinkgem.jeesite.common.crud.BaseCrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.thinkgem.jeesite.modules.wisdom.entity.base.BaseGenTable;

/**
 * @title 业务表数据访问层
 * @author weekly
 * @version 2019-10-07
 */
@MyBatisDao
public interface BaseGenTableDao extends BaseCrudDao<BaseGenTable> {
	
}