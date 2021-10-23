package com.thinkgem.jeesite.modules.wisdom.entity.base;

import com.thinkgem.jeesite.common.crud.BaseCrudEntity;
import com.thinkgem.jeesite.modules.card.utils.AESUtil;

/**
 * @title 社区信息持久层
 * @author weekly
 * @version V19.09.21
 */
public class WisCommunityInfo extends BaseCrudEntity {
	
	private static final long serialVersionUID = 1L;
	
	private String tableName = AESUtil.AESEncode("pulsation", "wis_community_info"); // SQL表名
	
	public WisCommunityInfo() {
		super();
	}

	public String getTableName() {
		return tableName;
	}

	public void setTableName(String tableName) {
		this.tableName = tableName;
	}
	
}