package com.thinkgem.jeesite.modules.wisdom.dao.base;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.thinkgem.jeesite.common.crud.BaseCrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.thinkgem.jeesite.modules.wisdom.entity.base.WisCommunityInfo;

/**
 * @title 社区信息数据访问层
 * @author weekly
 * @version V19.09.21
 */
@MyBatisDao
public interface WisCommunityInfoDao extends BaseCrudDao<WisCommunityInfo> {
	
	List<WisCommunityInfo> findListQ(@Param(value= "entity") WisCommunityInfo entity, @Param(value= "pageNum")String pageNum, 
			@Param(value= "pageSize") String pageSize);
	
}