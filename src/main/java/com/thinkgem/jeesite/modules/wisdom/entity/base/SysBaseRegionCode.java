package com.thinkgem.jeesite.modules.wisdom.entity.base;

import java.util.Date;

import org.hibernate.validator.constraints.Length;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.thinkgem.jeesite.common.crud.BaseCrudEntity;

/**
 * 行政区划经纬度Entity
 * @author weekly
 * @version 2019-09-17
 */
public class SysBaseRegionCode extends BaseCrudEntity {
	
	private static final long serialVersionUID = 1L;
	private String cityCode;		// 行政区划id
	private String parentCode;		// 父级id
	private String name;			// 行政区划全称
	private String mergerName;		// 省市区全称聚合
	private String shortName;		// 行政区划简称
	private String mergerShortName;	// 行政区划简称聚合
	private String level;			// 行政区划级别country:国家,province:省份,city:市,district:区县,street:街道
	private String levelType;		// 级别 0.国家，1.省(直辖市) 2.市 3.区(县),4.街道
	private String telephoneCode;	// 电话区划号码
	private String zipCode;			// 邮编
	private String namePinyin;		// 拼音
	private String nameJianpin;		// 简拼
	private String center;			// 城市中心点
	private String nameFirstChar;	// 首字母
	private String longitude;		// 经度
	private String latitude;		// 纬度
	private String status;			// 状态 1可修改 2不可修改 3已删除
	private String version;			// 历史版本
	private Date createTime;		// 创建时间
	private Date updateTime;		// 更新时间
	
	public SysBaseRegionCode() {
		super();
	}
	
	@Length(min=1, max=32, message="行政区划id长度必须介于 1 和 32 之间")
	public String getCityCode() {
		return cityCode;
	}

	public void setCityCode(String cityCode) {
		this.cityCode = cityCode;
	}
	
	@Length(min=0, max=32, message="父级id长度必须介于 0 和 32 之间")
	public String getParentCode() {
		return parentCode;
	}

	public void setParentCode(String parentCode) {
		this.parentCode = parentCode;
	}
	
	@Length(min=1, max=256, message="行政区划全称长度必须介于 1 和 256 之间")
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
	@Length(min=1, max=256, message="省市区全称聚合长度必须介于 1 和 256 之间")
	public String getMergerName() {
		return mergerName;
	}

	public void setMergerName(String mergerName) {
		this.mergerName = mergerName;
	}
	
	@Length(min=1, max=48, message="行政区划简称长度必须介于 1 和 48 之间")
	public String getShortName() {
		return shortName;
	}

	public void setShortName(String shortName) {
		this.shortName = shortName;
	}
	
	@Length(min=1, max=200, message="行政区划简称聚合长度必须介于 1 和 200 之间")
	public String getMergerShortName() {
		return mergerShortName;
	}

	public void setMergerShortName(String mergerShortName) {
		this.mergerShortName = mergerShortName;
	}
	
	@Length(min=1, max=16, message="行政区划级别country:国家,province:省份,city:市,district:区县,street:街道长度必须介于 1 和 16 之间")
	public String getLevel() {
		return level;
	}

	public void setLevel(String level) {
		this.level = level;
	}
	
	public String getLevelType() {
		return levelType;
	}

	public void setLevelType(String levelType) {
		this.levelType = levelType;
	}
	
	@Length(min=0, max=32, message="电话区划号码长度必须介于 0 和 32 之间")
	public String getTelephoneCode() {
		return telephoneCode;
	}

	public void setTelephoneCode(String telephoneCode) {
		this.telephoneCode = telephoneCode;
	}
	
	@Length(min=0, max=32, message="邮编长度必须介于 0 和 32 之间")
	public String getZipCode() {
		return zipCode;
	}

	public void setZipCode(String zipCode) {
		this.zipCode = zipCode;
	}
	
	@Length(min=1, max=256, message="拼音长度必须介于 1 和 256 之间")
	public String getNamePinyin() {
		return namePinyin;
	}

	public void setNamePinyin(String namePinyin) {
		this.namePinyin = namePinyin;
	}
	
	@Length(min=1, max=64, message="简拼长度必须介于 1 和 64 之间")
	public String getNameJianpin() {
		return nameJianpin;
	}

	public void setNameJianpin(String nameJianpin) {
		this.nameJianpin = nameJianpin;
	}
	
	@Length(min=1, max=32, message="城市中心点长度必须介于 1 和 32 之间")
	public String getCenter() {
		return center;
	}

	public void setCenter(String center) {
		this.center = center;
	}
	
	@Length(min=0, max=64, message="首字母长度必须介于 0 和 64 之间")
	public String getNameFirstChar() {
		return nameFirstChar;
	}

	public void setNameFirstChar(String nameFirstChar) {
		this.nameFirstChar = nameFirstChar;
	}
	
	@Length(min=0, max=32, message="经度长度必须介于 0 和 32 之间")
	public String getLongitude() {
		return longitude;
	}

	public void setLongitude(String longitude) {
		this.longitude = longitude;
	}
	
	@Length(min=0, max=32, message="纬度长度必须介于 0 和 32 之间")
	public String getLatitude() {
		return latitude;
	}

	public void setLatitude(String latitude) {
		this.latitude = latitude;
	}
	
	@Length(min=1, max=3, message="状态 1可修改 2不可修改 3已删除长度必须介于 1 和 3 之间")
	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}
	
	@Length(min=1, max=16, message="历史版本长度必须介于 1 和 16 之间")
	public String getVersion() {
		return version;
	}

	public void setVersion(String version) {
		this.version = version;
	}
	
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
	
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	public Date getUpdateTime() {
		return updateTime;
	}

	public void setUpdateTime(Date updateTime) {
		this.updateTime = updateTime;
	}
	
}