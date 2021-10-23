package com.thinkgem.jeesite.modules.wisdom.entity.media;

import com.thinkgem.jeesite.common.crud.BaseCrudEntity;
import com.thinkgem.jeesite.modules.card.utils.AESUtil;

/**
 * 图片资源分类管理Entity
 * @author weekly
 * @version 2019-09-18
 */
public class WisImageType extends BaseCrudEntity {
	
	private static final long serialVersionUID = 1L;
	
	private String tableName = AESUtil.AESEncode("pulsation", "wis_image_type"); // SQL表名
	
	public WisImageType() {
		super();
	}

	public String getTableName() {
		return tableName;
	}

	public void setTableName(String tableName) {
		this.tableName = tableName;
	}
	
}