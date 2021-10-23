package com.thinkgem.jeesite.modules.wisdom.entity.base;

import org.hibernate.validator.constraints.Length;

import com.thinkgem.jeesite.common.crud.BaseCrudEntity;
import com.thinkgem.jeesite.modules.card.utils.AESUtil;

/**
 * 数据字典信息Entity
 * @author weekly
 * @version 2019-09-19
 */
public class SysBaseDict extends BaseCrudEntity {
	
	private static final long serialVersionUID = 1L;
	private String type;			// 类型
	private String parentId;		// 父级编号
	private String startSection;	// 开始区间
	private String endSection;		// 结束区间
	
	private String parentTempId;	// 临时分级编号
	private String parentTempName;	// 临时父级名称
	
	private String tableName = AESUtil.AESEncode("pulsation", "sys_base_dict"); // SQL表名
	
	public SysBaseDict() {
		super();
	}

	@Length(min=0, max=64, message="类型长度必须介于 0 和 64 之间")
	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}
	
	@Length(min=0, max=30, message="开始区间长度必须介于 0 和 30 之间")
	public String getStartSection() {
		return startSection;
	}

	public void setStartSection(String startSection) {
		this.startSection = startSection;
	}
	
	@Length(min=0, max=30, message="结束区间长度必须介于 0 和 30 之间")
	public String getEndSection() {
		return endSection;
	}

	public void setEndSection(String endSection) {
		this.endSection = endSection;
	}

	public String getParentId() {
		return parentId;
	}

	public void setParentId(String parentId) {
		this.parentId = parentId;
	}

	public String getTableName() {
		return tableName;
	}

	public void setTableName(String tableName) {
		this.tableName = tableName;
	}

	public String getParentTempId() {
		return parentTempId;
	}

	public void setParentTempId(String parentTempId) {
		this.parentTempId = parentTempId;
	}

	public String getParentTempName() {
		return parentTempName;
	}

	public void setParentTempName(String parentTempName) {
		this.parentTempName = parentTempName;
	}
}