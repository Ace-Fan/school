package com.thinkgem.jeesite.modules.wisdom.entity.base;

/**
 * @title 数据库表格信息
 * @author weekly
 * @version V19.09.12
 */
public class Columns {
	private String fieldName;			// 字段名称(英文字段）
	private String fieldComment;		// 字段说明(字段注释)
	private String fieldType;			// 字段类型
	private String isNullable;			// 是否可空（yes,no)
	private String defaultVal;			// 默认值
	private String tableName;
	
	public String getFieldName() {
		return fieldName;
	}
	public void setFieldName(String fieldName) {
		this.fieldName = fieldName;
	}
	public String getFieldComment() {
		return fieldComment;
	}
	public void setFieldComment(String fieldComment) {
		this.fieldComment = fieldComment;
	}
	public String getFieldType() {
		return fieldType;
	}
	public void setFieldType(String fieldType) {
		this.fieldType = fieldType;
	}
	public String getIsNullable() {
		return isNullable;
	}
	public void setIsNullable(String isNullable) {
		this.isNullable = isNullable;
	}
	public String getTableName() {
		return tableName;
	}
	public void setTableName(String tableName) {
		this.tableName = tableName;
	}
	public String getDefaultVal() {
		return defaultVal;
	}
	public void setDefaultVal(String defaultVal) {
		this.defaultVal = defaultVal;
	}
	@Override
	public String toString() {
		return "Columns [fieldName=" + fieldName + ", fieldComment=" + fieldComment + ", fieldType=" + fieldType
				+ ", isNullable=" + isNullable + ", defaultVal=" + defaultVal + ", tableName=" + tableName + "]";
	}
	
}
