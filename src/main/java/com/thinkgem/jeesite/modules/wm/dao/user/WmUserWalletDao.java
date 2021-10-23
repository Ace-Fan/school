package com.thinkgem.jeesite.modules.wm.dao.user;

import com.thinkgem.jeesite.common.crud.BaseCrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.thinkgem.jeesite.modules.wm.entity.user.WmUserWallet;

/**
 * @title 用户钱包管理数据访问层
 * @author Songwufan
 * @version 2020-10-13
 */
@MyBatisDao
public interface WmUserWalletDao extends BaseCrudDao<WmUserWallet> {
	
}