package com.thinkgem.jeesite.modules.wisdom.entity.base;

import org.hibernate.validator.constraints.Length;

import com.thinkgem.jeesite.common.crud.BaseCrudEntity;
import com.thinkgem.jeesite.modules.card.utils.AESUtil;

/**
 * @title 数据导入配置持久层
 * @author weekly
 * @version 2019-10-07
 */
public class WisDataImportTab extends BaseCrudEntity {
	
	private static final long serialVersionUID = 1L;
	private String tabName;			// 数据表名称
	private String tableCode;		// 数据表code
	private String fileName;		// excel文件名
	private String fileUrl;			// excel路径
	private String excelHeader;		// excel表头
	
	private String tableName = AESUtil.AESEncode("pulsation", "wis_data_import_tab"); // SQL表名
	
	private String tableVal;		// 表格数据
	
	public WisDataImportTab() {
		super();
	}
	
	public String getTableName() {
		return tableName;
	}

	public void setTableName(String tableName) {
		this.tableName = tableName;
	}

	@Length(min=0, max=100, message="数据表名称长度必须介于 0 和 100 之间")
	public String getTabName() {
		return tabName;
	}

	public void setTabName(String tabName) {
		this.tabName = tabName;
	}
	
	@Length(min=0, max=100, message="数据表code长度必须介于 0 和 100 之间")
	public String getTableCode() {
		return tableCode;
	}

	public void setTableCode(String tableCode) {
		this.tableCode = tableCode;
	}
	
	@Length(min=0, max=100, message="excel文件名长度必须介于 0 和 100 之间")
	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	
	@Length(min=0, max=100, message="excel路径长度必须介于 0 和 100 之间")
	public String getFileUrl() {
		return fileUrl;
	}

	public void setFileUrl(String fileUrl) {
		this.fileUrl = fileUrl;
	}
	
	@Length(min=0, max=4000, message="excel表头长度必须介于 0 和 4000 之间")
	public String getExcelHeader() {
		return excelHeader;
	}

	public void setExcelHeader(String excelHeader) {
		this.excelHeader = excelHeader;
	}

	public String getTableVal() {
		return tableVal;
	}

	public void setTableVal(String tableVal) {
		this.tableVal = tableVal;
	}
	
}