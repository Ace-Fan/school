package com.thinkgem.jeesite.modules.wisdom.service.base;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.crud.BaseCrudService;
import com.thinkgem.jeesite.modules.wisdom.entity.base.BaseGenTable;
import com.thinkgem.jeesite.modules.wisdom.dao.base.BaseGenTableDao;

/**
 * @title 业务表业务层
 * @author weekly
 * @version 2019-10-07
 */
@Service
@Transactional(readOnly = true)
public class BaseGenTableService extends BaseCrudService<BaseGenTableDao, BaseGenTable> {

}