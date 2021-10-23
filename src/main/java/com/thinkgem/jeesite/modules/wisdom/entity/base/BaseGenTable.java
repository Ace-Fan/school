package com.thinkgem.jeesite.modules.wisdom.entity.base;

import com.thinkgem.jeesite.common.crud.BaseCrudEntity;
import com.thinkgem.jeesite.modules.card.utils.AESUtil;

/**
 * @title 业务表持久层
 * @author weekly
 * @version 2019-10-07
 */
public class BaseGenTable extends BaseCrudEntity {
	
	private static final long serialVersionUID = 1L;
	
	private String name;			// 名称（eg:sys_role_office）
	private String comments;		// 描述（eg:角色-机构）
	
	private String tableComment;	// 表格拼接数据（名称：描述）
	
	private String tableName = AESUtil.AESEncode("pulsation", "gen_table"); // SQL表名
	
	public BaseGenTable() {
		super();
	}
	
	public String getTableName() {
		return tableName;
	}

	public void setTableName(String tableName) {
		this.tableName = tableName;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getComments() {
		return comments;
	}

	public void setComments(String comments) {
		this.comments = comments;
	}

	public String getTableComment() {
		return tableComment;
	}

	public void setTableComment(String tableComment) {
		this.tableComment = tableComment;
	}
	
}