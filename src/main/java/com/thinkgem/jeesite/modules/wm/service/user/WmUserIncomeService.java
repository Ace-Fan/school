package com.thinkgem.jeesite.modules.wm.service.user;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.crud.BaseCrudService;
import com.thinkgem.jeesite.modules.wm.entity.user.WmUserIncome;
import com.thinkgem.jeesite.modules.wm.dao.user.WmUserIncomeDao;

/**
 * @title 用户收入表业务层
 * @author yangfu
 * @version 2020-10-13
 */
@Service
@Transactional(readOnly = true)
public class WmUserIncomeService extends BaseCrudService<WmUserIncomeDao, WmUserIncome> {

}