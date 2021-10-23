package com.thinkgem.jeesite.modules.wm.entity.user;

import org.hibernate.validator.constraints.Length;

import com.thinkgem.jeesite.common.crud.BaseCrudEntity;
import com.thinkgem.jeesite.modules.card.utils.AESUtil;
import com.thinkgem.jeesite.modules.sys.entity.User;

/**
 * @title 用户钱包管理持久层
 * @author Songwufan
 * @version 2020-10-13
 */
public class WmUserWallet extends BaseCrudEntity {
	
	private static final long serialVersionUID = 1L;
	private User user;		// 用户ID
	private String balance;		// 钱包余额
	private String remark;		// 备注
	private String isEnable;		// 是否启用（0：未启用，1：启用）
	private String orderNo;		// 排序号
	
	private String tableName = AESUtil.AESEncode("pulsation", ""); // SQL表名
	
	public WmUserWallet() {
		super();
	}
	
	public String getTableName() {
		return tableName;
	}

	public void setTableName(String tableName) {
		this.tableName = tableName;
	}


	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}
	
	public String getBalance() {
		return balance;
	}

	public void setBalance(String balance) {
		this.balance = balance;
	}
	
	@Length(min=0, max=200, message="备注长度必须介于 0 和 200 之间")
	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}
	
	@Length(min=0, max=4, message="是否启用（0：未启用，1：启用）长度必须介于 0 和 4 之间")
	public String getIsEnable() {
		return isEnable;
	}

	public void setIsEnable(String isEnable) {
		this.isEnable = isEnable;
	}
	
	public String getOrderNo() {
		return orderNo;
	}

	public void setOrderNo(String orderNo) {
		this.orderNo = orderNo;
	}
	
}