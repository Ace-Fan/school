package com.thinkgem.jeesite.modules.wisdom.entity.base;

import org.hibernate.validator.constraints.Length;

import com.thinkgem.jeesite.common.crud.BaseCrudEntity;
import com.thinkgem.jeesite.modules.card.utils.AESUtil;

/**
 * @title 导入字段映射配置持久层
 * @author weekly
 * @version 2019-10-07
 */
public class WisDataFieldMapping extends BaseCrudEntity {
	
	private static final long serialVersionUID = 1L;
	private String fieldName;			// 字段名称(英文字段）
	private String fieldComment;		// 字段说明(字段注释)
	private String fieldType;			// 字段类型
	private String isNullable;			// 是否可空（yes,no)
	private String columnDefault;		// 字段默认值
	
	private String isImport;			// 是否导入(0:不需导入 1:需导入)
	private String excelColumnName;		// excel列名
	private String excelColumnNo;		// excel列号
	
	private String dataTabId;			// 所属数据表id
	private String dataTabName;			// 所属数据表名称
	
	private String tableName = AESUtil.AESEncode("pulsation", "wis_data_field_mapping"); // SQL表名
	
	public WisDataFieldMapping() {
		super();
	}
	
	public String getTableName() {
		return tableName;
	}

	public void setTableName(String tableName) {
		this.tableName = tableName;
	}


	@Length(min=0, max=50, message="字段名称(英文字段）长度必须介于 0 和 50 之间")
	public String getFieldName() {
		return fieldName;
	}

	public void setFieldName(String fieldName) {
		this.fieldName = fieldName;
	}
	
	@Length(min=0, max=50, message="字段说明(字段注释)长度必须介于 0 和 50 之间")
	public String getFieldComment() {
		return fieldComment;
	}

	public void setFieldComment(String fieldComment) {
		this.fieldComment = fieldComment;
	}
	
	@Length(min=0, max=50, message="字段类型长度必须介于 0 和 50 之间")
	public String getFieldType() {
		return fieldType;
	}

	public void setFieldType(String fieldType) {
		this.fieldType = fieldType;
	}
	
	@Length(min=0, max=10, message="是否可空（yes,no)长度必须介于 0 和 10 之间")
	public String getIsNullable() {
		return isNullable;
	}

	public void setIsNullable(String isNullable) {
		this.isNullable = isNullable;
	}
	
	@Length(min=0, max=100, message="字段默认值长度必须介于 0 和 100 之间")
	public String getColumnDefault() {
		return columnDefault;
	}

	public void setColumnDefault(String columnDefault) {
		this.columnDefault = columnDefault;
	}
	
	@Length(min=0, max=4, message="是否导入(0:不需导入 1:需导入)长度必须介于 0 和 4 之间")
	public String getIsImport() {
		return isImport;
	}

	public void setIsImport(String isImport) {
		this.isImport = isImport;
	}
	
	@Length(min=0, max=50, message="excel列名长度必须介于 0 和 50 之间")
	public String getExcelColumnName() {
		return excelColumnName;
	}

	public void setExcelColumnName(String excelColumnName) {
		this.excelColumnName = excelColumnName;
	}
	
	@Length(min=0, max=10, message="excel列号长度必须介于 0 和 10 之间")
	public String getExcelColumnNo() {
		return excelColumnNo;
	}

	public void setExcelColumnNo(String excelColumnNo) {
		this.excelColumnNo = excelColumnNo;
	}
	
	@Length(min=0, max=11, message="所属数据表id长度必须介于 0 和 11 之间")
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
	
}