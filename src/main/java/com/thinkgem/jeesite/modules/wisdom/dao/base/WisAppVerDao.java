package com.thinkgem.jeesite.modules.wisdom.dao.base;

import com.thinkgem.jeesite.common.crud.BaseCrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.thinkgem.jeesite.modules.wisdom.entity.base.WisAppVer;

/**
 * @title 版本信息数据访问层
 * @author weekly
 * @version 2019-10-07
 */
@MyBatisDao
public interface WisAppVerDao extends BaseCrudDao<WisAppVer> {
	
	// 获取最新关于我们信息
	public WisAppVer getNewVer();
	
}