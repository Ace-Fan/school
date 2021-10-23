package com.thinkgem.jeesite.modules.wisdom.entity.base;

import java.util.List;

public class ExcelTable {
	private String fieldName;				// 字段名称（英文）
	private String fieldComment;			// 字段说明(字段注释)-- 中文名
	private String fieldType;				// 字段类型（默认1）
	private String isNullable;				// 是否为空（yes,no）
	private String defaultVal;				// 默认值
	
	private String dataTabId;				// 所属数据表id(对应主表ID)  传递的主键信息
	private String dataTabName;				// 所属数据表name(对应主表名称)  传递的表名（保存时无需该值传递，仅供查看）
	
	private String isImport;				// 是否导入（0：不需导入；1：需导入）  初始需导入 1
	
	private List<String> excelColumnName;	// EXCEL列名（List<String>）下拉框
	private List<String> excelColumnNo;		// EXCEL列号（List<String>）下拉框
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
	public String getDataTabId() {
		return dataTabId;
	}
	public void setDataTabId(String dataTabId) {
		this.dataTabId = dataTabId;
	}
	public String getDataTabName() {
		return dataTabName;
	}
	public void setDataTabName(String dataTabName) {
		this.dataTabName = dataTabName;
	}
	public String getIsImport() {
		return isImport;
	}
	public void setIsImport(String isImport) {
		this.isImport = isImport;
	}
	public List<String> getExcelColumnName() {
		return excelColumnName;
	}
	public void setExcelColumnName(List<String> excelColumnName) {
		this.excelColumnName = excelColumnName;
	}
	public List<String> getExcelColumnNo() {
		return excelColumnNo;
	}
	public void setExcelColumnNo(List<String> excelColumnNo) {
		this.excelColumnNo = excelColumnNo;
	}
	public String getDefaultVal() {
		return defaultVal;
	}
	public void setDefaultVal(String defaultVal) {
		this.defaultVal = defaultVal;
	}
	@Override
	public String toString() {
		return "ExcelTable [fieldName=" + fieldName + ", fieldComment=" + fieldComment + ", fieldType=" + fieldType
				+ ", isNullable=" + isNullable + ", defaultVal=" + defaultVal + ", dataTabId=" + dataTabId
				+ ", dataTabName=" + dataTabName + ", isImport=" + isImport + ", excelColumnName=" + excelColumnName
				+ ", excelColumnNo=" + excelColumnNo + "]";
	}
	
}
