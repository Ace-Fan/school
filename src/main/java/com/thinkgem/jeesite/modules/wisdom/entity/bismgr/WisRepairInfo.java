package com.thinkgem.jeesite.modules.wisdom.entity.bismgr;

import org.hibernate.validator.constraints.Length;

import com.thinkgem.jeesite.common.crud.BaseCrudEntity;
import com.thinkgem.jeesite.modules.card.utils.AESUtil;

/**
 * @title 保修信息管理持久层
 * @author weekly
 * @version V19.09.20
 */
public class WisRepairInfo extends BaseCrudEntity {
	
	private static final long serialVersionUID = 1L;
	private String subject;		// 主题
	private String contact;		// 联系人
	private String tel;			// 联系电话
	
	private String tableName = AESUtil.AESEncode("pulsation", "wis_repair_info"); // SQL表名
	
	public WisRepairInfo() {
		super();
	}

	@Length(min=0, max=100, message="主题长度必须介于 0 和 100 之间")
	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}
	
	@Length(min=0, max=100, message="联系人长度必须介于 0 和 100 之间")
	public String getContact() {
		return contact;
	}

	public void setContact(String contact) {
		this.contact = contact;
	}
	
	@Length(min=0, max=20, message="联系电话长度必须介于 0 和 20 之间")
	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getTableName() {
		return tableName;
	}

	public void setTableName(String tableName) {
		this.tableName = tableName;
	}
	
}