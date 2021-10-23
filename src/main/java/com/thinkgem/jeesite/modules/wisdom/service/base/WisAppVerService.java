package com.thinkgem.jeesite.modules.wisdom.service.base;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.crud.BaseCrudService;
import com.thinkgem.jeesite.modules.wisdom.dao.base.WisAppVerDao;
import com.thinkgem.jeesite.modules.wisdom.entity.base.WisAppVer;

/**
 * @title 版本信息业务层
 * @author weekly
 * @version 2019-10-07
 */
@Service
@Transactional(readOnly = true)
public class WisAppVerService extends BaseCrudService<WisAppVerDao, WisAppVer> {

	/**
	 * 获取最新版本信息
	 * @return
	 */
	public WisAppVer getNewVer() {
		return dao.getNewVer();
	}
	
}