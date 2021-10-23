package com.thinkgem.jeesite.modules.wm.entity.user;

import org.hibernate.validator.constraints.Length;

import com.thinkgem.jeesite.common.crud.BaseCrudEntity;
import com.thinkgem.jeesite.modules.card.utils.AESUtil;
import com.thinkgem.jeesite.modules.sys.entity.User;

/**
 * @title 用户收入表持久层
 * @author yangfu
 * @version 2020-10-13
 */
public class WmUserIncome extends BaseCrudEntity {
	
	private static final long serialVersionUID = 1L;
	private User user;		// 用户ID
	private String incomeAmount;		// 收入金额
	private String incomeType;		// 收入类型( 1：推广佣金   2：退款返回）
	private String remark;		// 备注
	private String isEnable;		// 是否启用（0：未启用，1：启用）
	private String orderNo;		// 排序号
	
	private String tableName = AESUtil.AESEncode("pulsation", ""); // SQL表名
	
	public WmUserIncome() {
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
	
	public String getIncomeAmount() {
		return incomeAmount;
	}

	public void setIncomeAmount(String incomeAmount) {
		this.incomeAmount = incomeAmount;
	}
	
	@Length(min=0, max=4, message="收入类型( 1：推广佣金   2：退款返回）长度必须介于 0 和 4 之间")
	public String getIncomeType() {
		return incomeType;
	}

	public void setIncomeType(String incomeType) {
		this.incomeType = incomeType;
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