package com.thinkgem.jeesite.modules.wisdom.entity.agree;

import org.hibernate.validator.constraints.Length;

import com.thinkgem.jeesite.common.crud.BaseCrudEntity;
import com.thinkgem.jeesite.modules.card.utils.AESUtil;

/**
 * 协议内容信息Entity
 * @author weekly
 * @version 2019-09-19
 */
public class WisAgreementContent extends BaseCrudEntity {
	
	private static final long serialVersionUID = 1L;
	private String agreementTitle;			// 协议标题
	private String agreementVersion;		// 协议版本
	private String agreementContent;		// 协议内容
	private String agreementId;				// 所属类型编号(关联协议类型的id)
	private String agreementName;			// 所属类型名称
	
	private String tableName = AESUtil.AESEncode("pulsation", "wis_agreement_content"); // SQL表名
	
	public WisAgreementContent() {
		super();
	}

	@Length(min=0, max=100, message="协议标题长度必须介于 0 和 100 之间")
	public String getAgreementTitle() {
		return agreementTitle;
	}

	public void setAgreementTitle(String agreementTitle) {
		this.agreementTitle = agreementTitle;
	}
	
	@Length(min=0, max=10, message="协议版本长度必须介于 0 和 10 之间")
	public String getAgreementVersion() {
		return agreementVersion;
	}

	public void setAgreementVersion(String agreementVersion) {
		this.agreementVersion = agreementVersion;
	}
	
	public String getAgreementContent() {
		return agreementContent;
	}

	public void setAgreementContent(String agreementContent) {
		this.agreementContent = agreementContent;
	}
	
	@Length(min=0, max=11, message="所属类型编号(关联协议类型的id)长度必须介于 0 和 11 之间")
	public String getAgreementId() {
		return agreementId;
	}

	public void setAgreementId(String agreementId) {
		this.agreementId = agreementId;
	}

	public String getAgreementName() {
		return agreementName;
	}

	public void setAgreementName(String agreementName) {
		this.agreementName = agreementName;
	}

	public String getTableName() {
		return tableName;
	}

	public void setTableName(String tableName) {
		this.tableName = tableName;
	}
	
}