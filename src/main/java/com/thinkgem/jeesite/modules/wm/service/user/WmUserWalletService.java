package com.thinkgem.jeesite.modules.wm.service.user;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.crud.BaseCrudService;
import com.thinkgem.jeesite.modules.wm.entity.user.WmUserWallet;
import com.thinkgem.jeesite.modules.wm.dao.user.WmUserWalletDao;

/**
 * @title 用户钱包管理业务层
 * @author Songwufan
 * @version 2020-10-13
 */
@Service
@Transactional(readOnly = true)
public class WmUserWalletService extends BaseCrudService<WmUserWalletDao, WmUserWallet> {

}