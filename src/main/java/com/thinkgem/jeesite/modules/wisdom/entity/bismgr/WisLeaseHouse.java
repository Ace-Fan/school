package com.thinkgem.jeesite.modules.wisdom.entity.bismgr;

import java.util.Date;

import com.thinkgem.jeesite.common.crud.BaseCrudEntity;
import com.thinkgem.jeesite.modules.card.utils.AESUtil;

/**
 * 租房信息管理Entity
 * @author ysq
 * @version 2019-09-21
 */
public class WisLeaseHouse extends BaseCrudEntity{
	
	private static final long serialVersionUID = 1L;
	private String leaseType;		// 租房类型（读取字典）
	private String province;		// 所在省
	private String city;		// 所在市
	private String county;		// 所在区县
	private String communityName;		// 小区名称
	private String roomNum;		// 室数
	private String hallNum;		// 厅数
	private String toiletNum;		// 卫生间数
	private String rent;		// 租金(每月）
	private String houseArea;		// 建筑面积
	private String depositMode;		// 押金方式（读取字典）
	private String payMode;		// 收租方式（读取字典）
	private String renovationMode;		// 装修方式（读取字典）
	private String houseImgs;		// 房屋图片（图片路径，多个之间采用,隔开）
	private String contact;		// 联系人
	private String tel;		// 联系电话
	private String propertyTel;		// 物业电话
	private String dataSource;		// 数据源(app端：1 ,pc后台：2)
	private String publisher;		// 发布人
	private Date publishDate;		// 发布日期
	private String tableName = AESUtil.AESEncode("pulsation", "wis_lease_house"); // SQL表名

	public String getTableName() {
		return tableName;
	}

	public void setTableName(String tableName) {
		this.tableName = tableName;
	}
	public WisLeaseHouse() {
		super();
	}

	public String getLeaseType() {
		return leaseType;
	}

	public void setLeaseType(String leaseType) {
		this.leaseType = leaseType;
	}

	public String getProvince() {
		return province;
	}

	public void setProvince(String province) {
		this.province = province;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getCounty() {
		return county;
	}

	public void setCounty(String county) {
		this.county = county;
	}

	public String getCommunityName() {
		return communityName;
	}

	public void setCommunityName(String communityName) {
		this.communityName = communityName;
	}

	public String getRoomNum() {
		return roomNum;
	}

	public void setRoomNum(String roomNum) {
		this.roomNum = roomNum;
	}

	public String getHallNum() {
		return hallNum;
	}

	public void setHallNum(String hallNum) {
		this.hallNum = hallNum;
	}

	public String getToiletNum() {
		return toiletNum;
	}

	public void setToiletNum(String toiletNum) {
		this.toiletNum = toiletNum;
	}

	public String getRent() {
		return rent;
	}

	public void setRent(String rent) {
		this.rent = rent;
	}

	public String getHouseArea() {
		return houseArea;
	}

	public void setHouseArea(String houseArea) {
		this.houseArea = houseArea;
	}

	public String getDepositMode() {
		return depositMode;
	}

	public void setDepositMode(String depositMode) {
		this.depositMode = depositMode;
	}

	public String getPayMode() {
		return payMode;
	}

	public void setPayMode(String payMode) {
		this.payMode = payMode;
	}

	public String getRenovationMode() {
		return renovationMode;
	}

	public void setRenovationMode(String renovationMode) {
		this.renovationMode = renovationMode;
	}

	public String getHouseImgs() {
		return houseImgs;
	}

	public void setHouseImgs(String houseImgs) {
		this.houseImgs = houseImgs;
	}

	public String getContact() {
		return contact;
	}

	public void setContact(String contact) {
		this.contact = contact;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getPropertyTel() {
		return propertyTel;
	}

	public void setPropertyTel(String propertyTel) {
		this.propertyTel = propertyTel;
	}

	public String getDataSource() {
		return dataSource;
	}

	public void setDataSource(String dataSource) {
		this.dataSource = dataSource;
	}

	public String getPublisher() {
		return publisher;
	}

	public void setPublisher(String publisher) {
		this.publisher = publisher;
	}

	public Date getPublishDate() {
		return publishDate;
	}

	public void setPublishDate(Date publishDate) {
		this.publishDate = publishDate;
	}
	
}