package com.thinkgem.jeesite.modules.wisdom.entity.base;

import java.util.Date;

import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.Length;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.thinkgem.jeesite.common.crud.BaseCrudEntity;
import com.thinkgem.jeesite.modules.card.utils.AESUtil;

/**
 * 收货地址信息Entity
 * @author weekly
 * @version 2019-09-19
 */
public class WisReceiveAddress extends BaseCrudEntity {
	
	private static final long serialVersionUID = 1L;
	private String userId;			// 用户ID
	private String city;			// 详细地址
	private String isDefault;		// 是否默认
	private String detail;			// detail
	private String cityCode;		// 城市Code
	private Date createTime;		// 创建时间
	private Date updateTime;		// 更新时间
	private String postcode;		// 邮编
	
	private String tableName = AESUtil.AESEncode("pulsation", "wis_receive_address"); // SQL表名
	
	public WisReceiveAddress() {
		super();
	}

	@Length(min=0, max=50, message="详细地址长度必须介于 0 和 50 之间")
	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}
	
	@Length(min=1, max=1, message="是否默认长度必须介于 1 和 1 之间")
	public String getIsDefault() {
		return isDefault;
	}

	public void setIsDefault(String isDefault) {
		this.isDefault = isDefault;
	}
	
	@Length(min=1, max=200, message="detail长度必须介于 1 和 200 之间")
	public String getDetail() {
		return detail;
	}

	public void setDetail(String detail) {
		this.detail = detail;
	}
	
	@Length(min=0, max=100, message="城市Code长度必须介于 0 和 100 之间")
	public String getCityCode() {
		return cityCode;
	}

	public void setCityCode(String cityCode) {
		this.cityCode = cityCode;
	}
	
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	@NotNull(message="创建时间不能为空")
	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
	
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	@NotNull(message="更新时间不能为空")
	public Date getUpdateTime() {
		return updateTime;
	}

	public void setUpdateTime(Date updateTime) {
		this.updateTime = updateTime;
	}
	
	@Length(min=0, max=6, message="邮编长度必须介于 0 和 6 之间")
	public String getPostcode() {
		return postcode;
	}

	public void setPostcode(String postcode) {
		this.postcode = postcode;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getTableName() {
		return tableName;
	}

	public void setTableName(String tableName) {
		this.tableName = tableName;
	}
	
}