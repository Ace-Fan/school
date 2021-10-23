package com.thinkgem.jeesite.modules.wisdom.entity.base;

import org.hibernate.validator.constraints.Length;

import com.thinkgem.jeesite.common.crud.BaseCrudEntity;
import com.thinkgem.jeesite.modules.card.utils.AESUtil;

/**
 * @title 版本信息持久层
 * @author weekly
 * @version 2019-10-07
 */
public class WisAppVer extends BaseCrudEntity {
	
	private static final long serialVersionUID = 1L;
	private String appName;		// 应用名称
	private String appType;		// 应用类型(android,ios)
	private String appVer;		// 版本号(例：V1.0.0)
	private String appDesc;		// 版本描述
	private String fileName;	// 文件名称
	private String fileUrl;		// 文件路径
	
	private String tableName = AESUtil.AESEncode("pulsation", "wis_app_ver"); // SQL表名
	
	public WisAppVer() {
		super();
	}
	
	public String getTableName() {
		return tableName;
	}

	public void setTableName(String tableName) {
		this.tableName = tableName;
	}

	@Length(min=0, max=50, message="应用名称长度必须介于 0 和 50 之间")
	public String getAppName() {
		return appName;
	}

	public void setAppName(String appName) {
		this.appName = appName;
	}
	
	@Length(min=0, max=50, message="应用类型(android,ios)长度必须介于 0 和 50 之间")
	public String getAppType() {
		return appType;
	}

	public void setAppType(String appType) {
		this.appType = appType;
	}
	
	@Length(min=0, max=20, message="版本号长度必须介于 0 和 20 之间")
	public String getAppVer() {
		return appVer;
	}

	public void setAppVer(String appVer) {
		this.appVer = appVer;
	}
	
	@Length(min=0, max=500, message="版本描述长度必须介于 0 和 500 之间")
	public String getAppDesc() {
		return appDesc;
	}

	public void setAppDesc(String appDesc) {
		this.appDesc = appDesc;
	}
	
	@Length(min=0, max=50, message="文件名称长度必须介于 0 和 50 之间")
	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	
	@Length(min=0, max=200, message="文件路径长度必须介于 0 和 200 之间")
	public String getFileUrl() {
		return fileUrl;
	}

	public void setFileUrl(String fileUrl) {
		this.fileUrl = fileUrl;
	}
	
}