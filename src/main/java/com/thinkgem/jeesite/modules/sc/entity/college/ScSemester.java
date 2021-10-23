package com.thinkgem.jeesite.modules.sc.entity.college;

import org.hibernate.validator.constraints.Length;

import com.thinkgem.jeesite.common.crud.BaseCrudEntity;
import com.thinkgem.jeesite.modules.card.utils.AESUtil;

/**
 * @title 学期信息持久层
 * @author wufan
 * @version 2019-12-21
 */
public class ScSemester extends BaseCrudEntity {
	
	private static final long serialVersionUID = 1L;
	private String code;		// 学期编码
	private String name;		// 学期名称
	private String isEnable;		// 是否启用（0：未启用，1：启用）
	private String orderNo;		// 排序号
	
	private String tableName = AESUtil.AESEncode("pulsation", "sc_semester"); // SQL表名
	
	public ScSemester() {
		super();
	}
	
	public String getTableName() {
		return tableName;
	}

	public void setTableName(String tableName) {
		this.tableName = tableName;
	}


	@Length(min=0, max=10, message="编码长度必须介于 0 和 10 之间")
	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}
	
	@Length(min=0, max=50, message="名称长度必须介于 0 和 50 之间")
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
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