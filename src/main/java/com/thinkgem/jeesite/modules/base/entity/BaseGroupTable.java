package com.thinkgem.jeesite.modules.base.entity;

import java.util.Date;

public class BaseGroupTable {
	
	private String id;					// 对象ID
	private String maxId;				// 最大值编号
	private String orderNo;				// 对象排序号
	private String maxColumns;			// 选定字段
	private String prevOrderNo;			// 前者排序号
	private String nextOrderNo;			// 后者排序号
	private String filterColumns;		// 过滤字段信息
	private String filterValue;			// 过滤内容
	private String tableName;			// 表名
	private String columns;				// 修改字段
	private String value;				// 修改内容
	private String updateBy;			// 修改人
	private Date updateDate;			// 修改时间
	private String auditStatuColumns; 	// 审核/认证信息字段
	private String auditStatuValue;	 	// 审核/认证信息内容
	private String auditDateColumns;  	// 审核/认证日期字段
	private Date auditDateValue;	  	// 审核/认证日期内容
	private String auditByColumns;	  	// 审核/认证人字段
	private String auditByValue;	  	// 审核/认证人内容
	private String maxOrderNo;		  	// 最大值排序号，用于基础数据表获取最大排序号
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getOrderNo() {
		return orderNo;
	}
	public void setOrderNo(String orderNo) {
		this.orderNo = orderNo;
	}
	public String getPrevOrderNo() {
		return prevOrderNo;
	}
	public void setPrevOrderNo(String prevOrderNo) {
		this.prevOrderNo = prevOrderNo;
	}
	public String getNextOrderNo() {
		return nextOrderNo;
	}
	public void setNextOrderNo(String nextOrderNo) {
		this.nextOrderNo = nextOrderNo;
	}
	public String getFilterColumns() {
		return filterColumns;
	}
	public void setFilterColumns(String filterColumns) {
		this.filterColumns = filterColumns;
	}
	public String getFilterValue() {
		return filterValue;
	}
	public void setFilterValue(String filterValue) {
		this.filterValue = filterValue;
	}
	public String getTableName() {
		return tableName;
	}
	public void setTableName(String tableName) {
		this.tableName = tableName;
	}
	public String getColumns() {
		return columns;
	}
	public void setColumns(String columns) {
		this.columns = columns;
	}
	public String getValue() {
		return value;
	}
	public void setValue(String value) {
		this.value = value;
	}
	public String getUpdateBy() {
		return updateBy;
	}
	public void setUpdateBy(String updateBy) {
		this.updateBy = updateBy;
	}
	public Date getUpdateDate() {
		return updateDate;
	}
	public void setUpdateDate(Date updateDate) {
		this.updateDate = updateDate;
	}
	public String getAuditStatuColumns() {
		return auditStatuColumns;
	}
	public void setAuditStatuColumns(String auditStatuColumns) {
		this.auditStatuColumns = auditStatuColumns;
	}
	public String getAuditStatuValue() {
		return auditStatuValue;
	}
	public void setAuditStatuValue(String auditStatuValue) {
		this.auditStatuValue = auditStatuValue;
	}
	public String getAuditDateColumns() {
		return auditDateColumns;
	}
	public void setAuditDateColumns(String auditDateColumns) {
		this.auditDateColumns = auditDateColumns;
	}
	public Date getAuditDateValue() {
		return auditDateValue;
	}
	public void setAuditDateValue(Date auditDateValue) {
		this.auditDateValue = auditDateValue;
	}
	public String getAuditByColumns() {
		return auditByColumns;
	}
	public void setAuditByColumns(String auditByColumns) {
		this.auditByColumns = auditByColumns;
	}
	public String getAuditByValue() {
		return auditByValue;
	}
	public void setAuditByValue(String auditByValue) {
		this.auditByValue = auditByValue;
	}
	public String getMaxOrderNo() {
		return maxOrderNo;
	}
	public void setMaxOrderNo(String maxOrderNo) {
		this.maxOrderNo = maxOrderNo;
	}
	public String getMaxColumns() {
		return maxColumns;
	}
	public void setMaxColumns(String maxColumns) {
		this.maxColumns = maxColumns;
	}
	public String getMaxId() {
		return maxId;
	}
	public void setMaxId(String maxId) {
		this.maxId = maxId;
	}

}
