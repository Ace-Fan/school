package com.thinkgem.jeesite.modules.wisdom.entity.bismgr;

import java.util.Date;

import org.hibernate.validator.constraints.Length;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.thinkgem.jeesite.common.crud.BaseCrudEntity;
import com.thinkgem.jeesite.modules.card.utils.AESUtil;

/**
 * @title 招聘岗位信息持久层
 * @author weekly
 * @version V19.09.21
 */
public class WisJobPosition extends BaseCrudEntity {
	
	private static final long serialVersionUID = 1L;
	private String positionName;	// 岗位名称
	private String tags;			// 标签（多个标签之间采用,隔开）
	private String salaryStart;		// 薪资起始点
	private String salaryEnd;		// 薪资结束点
	private String jobProvince;		// 工作地点所在省
	private String jobCity;			// 工作地点所在市
	private String county;			// 工作地点所在区县
	private String jobDetail;		// 职位描述
	private String companyName;		// 公司名称
	private String companyAddr;		// 公司地址
	private String publisher;		// 发布人
	private Date publishDate;		// 发布日期
	
	private String tableName = AESUtil.AESEncode("pulsation", "wis_job_position"); // SQL表名
	
	public WisJobPosition() {
		super();
	}

	@Length(min=0, max=200, message="岗位名称长度必须介于 0 和 200 之间")
	public String getPositionName() {
		return positionName;
	}

	public void setPositionName(String positionName) {
		this.positionName = positionName;
	}
	
	@Length(min=0, max=200, message="标签（多个标签之间采用,隔开）长度必须介于 0 和 200 之间")
	public String getTags() {
		return tags;
	}

	public void setTags(String tags) {
		this.tags = tags;
	}
	
	@Length(min=0, max=50, message="薪资起始点长度必须介于 0 和 50 之间")
	public String getSalaryStart() {
		return salaryStart;
	}

	public void setSalaryStart(String salaryStart) {
		this.salaryStart = salaryStart;
	}
	
	@Length(min=0, max=50, message="薪资结束点长度必须介于 0 和 50 之间")
	public String getSalaryEnd() {
		return salaryEnd;
	}

	public void setSalaryEnd(String salaryEnd) {
		this.salaryEnd = salaryEnd;
	}
	
	@Length(min=0, max=100, message="工作地点所在省长度必须介于 0 和 100 之间")
	public String getJobProvince() {
		return jobProvince;
	}

	public void setJobProvince(String jobProvince) {
		this.jobProvince = jobProvince;
	}
	
	@Length(min=0, max=100, message="工作地点所在市长度必须介于 0 和 100 之间")
	public String getJobCity() {
		return jobCity;
	}

	public void setJobCity(String jobCity) {
		this.jobCity = jobCity;
	}
	
	@Length(min=0, max=100, message="工作地点所在区县长度必须介于 0 和 100 之间")
	public String getCounty() {
		return county;
	}

	public void setCounty(String county) {
		this.county = county;
	}
	
	@Length(min=0, max=500, message="职位描述长度必须介于 0 和 500 之间")
	public String getJobDetail() {
		return jobDetail;
	}

	public void setJobDetail(String jobDetail) {
		this.jobDetail = jobDetail;
	}
	
	@Length(min=0, max=100, message="公司名称长度必须介于 0 和 100 之间")
	public String getCompanyName() {
		return companyName;
	}

	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}
	
	@Length(min=0, max=200, message="公司地址长度必须介于 0 和 200 之间")
	public String getCompanyAddr() {
		return companyAddr;
	}

	public void setCompanyAddr(String companyAddr) {
		this.companyAddr = companyAddr;
	}
	
	@Length(min=0, max=50, message="发布人长度必须介于 0 和 50 之间")
	public String getPublisher() {
		return publisher;
	}

	public void setPublisher(String publisher) {
		this.publisher = publisher;
	}
	
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	public Date getPublishDate() {
		return publishDate;
	}

	public void setPublishDate(Date publishDate) {
		this.publishDate = publishDate;
	}

	public String getTableName() {
		return tableName;
	}

	public void setTableName(String tableName) {
		this.tableName = tableName;
	}
	
}