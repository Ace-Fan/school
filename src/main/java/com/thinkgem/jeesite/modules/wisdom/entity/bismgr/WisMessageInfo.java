package com.thinkgem.jeesite.modules.wisdom.entity.bismgr;


import com.thinkgem.jeesite.common.crud.BaseCrudEntity;
import com.thinkgem.jeesite.modules.card.utils.AESUtil;

/**
 * 系统消息管理Entity
 * 
 * @author ysq
 * @version 2019-09-20
 */
public class WisMessageInfo extends BaseCrudEntity {

	private static final long serialVersionUID = 1L;

	private String tableName = AESUtil.AESEncode("pulsation", "wis_message_info"); // SQL表名

	public WisMessageInfo() {
		super();
	}

	public String getTableName() {
		return tableName;
	}

	public void setTableName(String tableName) {
		this.tableName = tableName;
	}
}