package com.thinkgem.jeesite.modules.wisdom.entity.agree;

import org.hibernate.validator.constraints.Length;

import com.thinkgem.jeesite.common.crud.BaseCrudEntity;
import com.thinkgem.jeesite.modules.card.utils.AESUtil;

/**
 * 协议类型信息Entity
 * @author weekly
 * @version 2019-09-19
 */
public class WisAgreementType extends BaseCrudEntity {
	
	private static final long serialVersionUID = 1L;
	private String agreementCode;		// 协议编码
	private String agreementType;		// 协议类型名称
	
	private String tableName = AESUtil.AESEncode("pulsation", "wis_agreement_type"); // SQL表名
	
	public WisAgreementType() {
		super();
	}

	@Length(min=0, max=20, message="协议编码长度必须介于 0 和 20 之间")
	public String getAgreementCode() {
		return agreementCode;
	}

	public void setAgreementCode(String agreementCode) {
		this.agreementCode = agreementCode;
	}
	
	@Length(min=0, max=100, message="协议类型名称长度必须介于 0 和 100 之间")
	public String getAgreementType() {
		return agreementType;
	}

	public void setAgreementType(String agreementType) {
		this.agreementType = agreementType;
	}

	public String getTableName() {
		return tableName;
	}

	public void setTableName(String tableName) {
		this.tableName = tableName;
	}
	
}