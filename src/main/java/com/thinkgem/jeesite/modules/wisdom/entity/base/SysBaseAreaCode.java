package com.thinkgem.jeesite.modules.wisdom.entity.base;

import org.hibernate.validator.constraints.Length;

import com.thinkgem.jeesite.common.crud.BaseCrudEntity;
import com.thinkgem.jeesite.modules.card.utils.AESUtil;

/**
 * 行政区划编码Entity
 * @author weekly
 * @version 2019-09-17
 */
public class SysBaseAreaCode extends BaseCrudEntity {
	
	private static final long serialVersionUID = 1L;
	private String currLevel;		// 当前级别
	private String statisticsCode;	// 统计编码（如：北京市：110000000000）
	private String spellFull;		// 拼音全码
	private String spellShort;		// 拼音简码
	private String shortCode;		// 助记码
	private String parentCode;		// 父级编码
	
	private String tableName = AESUtil.AESEncode("pulsation", "sys_base_area_code"); // SQL表名
	
	public SysBaseAreaCode() {
		super();
	}

	@Length(min=0, max=4, message="当前级别长度必须介于 0 和 4 之间")
	public String getCurrLevel() {
		return currLevel;
	}

	public void setCurrLevel(String currLevel) {
		this.currLevel = currLevel;
	}
	
	@Length(min=0, max=50, message="统计编码（如：北京市：110000000000）长度必须介于 0 和 50 之间")
	public String getStatisticsCode() {
		return statisticsCode;
	}

	public void setStatisticsCode(String statisticsCode) {
		this.statisticsCode = statisticsCode;
	}
	
	@Length(min=0, max=100, message="拼音全码长度必须介于 0 和 100 之间")
	public String getSpellFull() {
		return spellFull;
	}

	public void setSpellFull(String spellFull) {
		this.spellFull = spellFull;
	}
	
	@Length(min=0, max=100, message="拼音简码长度必须介于 0 和 100 之间")
	public String getSpellShort() {
		return spellShort;
	}

	public void setSpellShort(String spellShort) {
		this.spellShort = spellShort;
	}
	
	@Length(min=0, max=100, message="助记码长度必须介于 0 和 100 之间")
	public String getShortCode() {
		return shortCode;
	}

	public void setShortCode(String shortCode) {
		this.shortCode = shortCode;
	}
	
	@Length(min=0, max=50, message="父级编码长度必须介于 0 和 50 之间")
	public String getParentCode() {
		return parentCode;
	}

	public void setParentCode(String parentCode) {
		this.parentCode = parentCode;
	}

	public String getTableName() {
		return tableName;
	}

	public void setTableName(String tableName) {
		this.tableName = tableName;
	}
}