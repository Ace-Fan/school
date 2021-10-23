package com.thinkgem.jeesite.modules.wisdom.service.base;

import java.util.Date;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.crud.BaseCrudService;
import com.thinkgem.jeesite.modules.wisdom.dao.base.SysBaseRegionCodeDao;
import com.thinkgem.jeesite.modules.wisdom.entity.base.SysBaseRegionCode;

/**
 * 行政区划经纬度Service
 * @author weekly
 * @version 2019-09-17
 */
@Service
@Transactional(readOnly = true)
public class SysBaseRegionCodeService extends BaseCrudService<SysBaseRegionCodeDao, SysBaseRegionCode> {

	// 新增
	@Transactional(readOnly = false)
	public boolean insert(SysBaseRegionCode entity) {
		entity.setCreateTime(new Date());
		return dao.insert(entity) > 0 ? true : false;
	}
	
	// 修改
	@Transactional(readOnly = false)
	public boolean update(SysBaseRegionCode entity) {
		entity.setUpdateTime(new Date());
		return dao.update(entity) > 0 ? true : false;
	}
}