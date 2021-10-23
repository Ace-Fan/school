package com.thinkgem.jeesite.modules.wisdom.service.base;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.crud.BaseCrudService;
import com.thinkgem.jeesite.modules.wisdom.dao.base.WisCommunityInfoDao;
import com.thinkgem.jeesite.modules.wisdom.entity.base.WisCommunityInfo;

/**
 * @title 社区信息业务层
 * @author weekly
 * @version V19.09.21
 */
@Service
@Transactional(readOnly = true)
public class WisCommunityInfoService extends BaseCrudService<WisCommunityInfoDao, WisCommunityInfo> {

	// 分页接口
	public List<WisCommunityInfo> findListQ(WisCommunityInfo wisCommunityInfo, String pageNum, String pageSize) {
		return dao.findListQ(wisCommunityInfo, pageNum, pageSize);
	}
	
}