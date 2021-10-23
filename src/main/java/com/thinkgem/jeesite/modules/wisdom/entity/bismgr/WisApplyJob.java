package com.thinkgem.jeesite.modules.wisdom.entity.bismgr;

import java.util.Date;

import org.hibernate.validator.constraints.Length;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.thinkgem.jeesite.common.crud.BaseCrudEntity;
import com.thinkgem.jeesite.modules.card.utils.AESUtil;

/**
 * @title 应聘岗位信息持久层
 * @author weekly
 * @version V19.09.21
 */
public class WisApplyJob extends BaseCrudEntity {
	
	private static final long serialVersionUID = 1L;
	private String userId;		// 用户ID（关联用户信息表ID）
	private String jobId;		// 岗位ID（关联招聘岗位信息表ID）
	private String resumeUrl;	// 简历路径
	private Date applyDate;		// 申请日期
	
	private String jobName;		// 岗位名称
	
	private String tableName = AESUtil.AESEncode("pulsation", "wis_apply_job"); // SQL表名
	
	public WisApplyJob() {
		super();
	}

	@Length(min=0, max=200, message="简历路径长度必须介于 0 和 200 之间")
	public String getResumeUrl() {
		return resumeUrl;
	}

	public void setResumeUrl(String resumeUrl) {
		this.resumeUrl = resumeUrl;
	}
	
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	public Date getApplyDate() {
		return applyDate;
	}

	public void setApplyDate(Date applyDate) {
		this.applyDate = applyDate;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getJobId() {
		return jobId;
	}

	public void setJobId(String jobId) {
		this.jobId = jobId;
	}

	public String getTableName() {
		return tableName;
	}

	public void setTableName(String tableName) {
		this.tableName = tableName;
	}

	public String getJobName() {
		return jobName;
	}

	public void setJobName(String jobName) {
		this.jobName = jobName;
	}
}