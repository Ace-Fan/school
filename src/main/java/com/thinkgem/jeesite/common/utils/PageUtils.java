package com.thinkgem.jeesite.common.utils;

import java.io.Serializable;
import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

/**
 * 分页类
 * 
 * @author Derek
 *
 */
public class PageUtils implements Serializable {

	private static final long serialVersionUID = 1L;

	public static final Integer DELETED = 1; // 删除状态

	public static final Integer UNDELETE = 0; // 未删除状态

	private String id; // id
	private Integer page;
	private Integer limit;
	private Date createDate; // 创建时间
	private Date updateDate; // 修改时间
	private Integer delFlag; // 删除标志 0正常 1删除
	private String createBy; // 创建人
	private String updateBy; // 修改人
	private Date beginDate; // 开始时间
	private Date endDate; // 结束时间
	private String remark; // 备注
	private String orgName; // 机构名称
	private String createName; // 创建者名字
	private String updateName; // 修改者名字

	private String kdjgName; // 开单机构名称
	private String jsjgName; // 结算结构名称
	private String thjgName; // 退货机构名称

	private String creatorName; // 开单人

	public String getCreatorName() {
		return creatorName;
	}

	public void setCreatorName(String creatorName) {
		this.creatorName = creatorName;
	}

	public String getThjgName() {
		return thjgName;
	}

	public void setThjgName(String thjgName) {
		this.thjgName = thjgName;
	}

	public String getKdjgName() {
		return kdjgName;
	}

	public void setKdjgName(String kdjgName) {
		this.kdjgName = kdjgName;
	}

	public String getJsjgName() {
		return jsjgName;
	}

	public void setJsjgName(String jsjgName) {
		this.jsjgName = jsjgName;
	}

	public String getCreateName() {
		return createName;
	}

	public void setCreateName(String createName) {
		this.createName = createName;
	}

	public String getUpdateName() {
		return updateName;
	}

	public void setUpdateName(String updateName) {
		this.updateName = updateName;
	}

	public String getOrgName() {
		return orgName;
	}

	public void setOrgName(String orgName) {
		this.orgName = orgName;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	public Date getBeginDate() {
		return beginDate;
	}

	public void setBeginDate(Date beginDate) {
		this.beginDate = beginDate;
	}

	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	public Date getEndDate() {
		return endDate;
	}

	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}

	public Integer getDelFlag() {
		return delFlag;
	}

	public void setDelFlag(Integer delFlag) {
		this.delFlag = delFlag;
	}

	public String getCreateBy() {
		return createBy;
	}

	public void setCreateBy(String createBy) {
		this.createBy = createBy;
	}

	public String getUpdateBy() {
		return updateBy;
	}

	public void setUpdateBy(String updateBy) {
		this.updateBy = updateBy;
	}

	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	public Date getUpdateDate() {
		return updateDate;
	}

	public void setUpdateDate(Date updateDate) {
		this.updateDate = updateDate;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public Integer getPage() {
		return page;
	}

	public void setPage(Integer page) {
		this.page = page;
	}

	public Integer getLimit() {
		return limit;
	}

	public void setLimit(Integer limit) {
		this.limit = limit;
	}

	@Override
	public String toString() {
		return "PageUtils [id=" + id + ", page=" + page + ", limit=" + limit + ", createDate=" + createDate
				+ ", updateDate=" + updateDate + ", delFlag=" + delFlag + ", createBy=" + createBy + ", updateBy="
				+ updateBy + ", beginDate=" + beginDate + ", endDate=" + endDate + ", remark=" + remark + "]";
	}

}
