package com.thinkgem.jeesite.modules.wm.dao.user;

import com.thinkgem.jeesite.common.crud.BaseCrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.thinkgem.jeesite.modules.wm.entity.user.WmUserIncome;

/**
 * @title 用户收入表数据访问层
 * @author yangfu
 * @version 2020-10-13
 */
@MyBatisDao
public interface WmUserIncomeDao extends BaseCrudDao<WmUserIncome> {
	
}