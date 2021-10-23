package com.thinkgem.jeesite.modules.sc.entity.grade;

import org.hibernate.validator.constraints.Length;

import com.thinkgem.jeesite.common.crud.BaseCrudEntity;
import com.thinkgem.jeesite.modules.card.utils.AESUtil;

/**
 * @title 评分信息持久层
 * @author wufan
 * @version 2019-12-24
 */
public class ScGradeMsg extends BaseCrudEntity {

	private static final long serialVersionUID = 1L;
	private String teachId; // 教师编号
	private String typeId; // 评分类型编号
	private String itemId; // 评分项编号
	private String semId; // 学期表编号
	private String isEnable; // 是否启用（0：未启用，1：启用）
	private String orderNo; // 排序号
	private String teachName; // 教师姓名
	private String gradeType; // 评分类型
	private String gradeTerm; // 评分项
	private String semester; // 学期
	private String grade; //分数

	private String tableName = AESUtil.AESEncode("pulsation", "sc_grade_msg"); // SQL表名

	public ScGradeMsg() {
		super();
	}

	public String getTableName() {
		return tableName;
	}

	public void setTableName(String tableName) {
		this.tableName = tableName;
	}

	@Length(min = 0, max = 50, message = "教师编号长度必须介于 0 和 50 之间")
	public String getTeachId() {
		return teachId;
	}

	public void setTeachId(String teachId) {
		this.teachId = teachId;
	}

	@Length(min = 0, max = 50, message = "评分类型编号长度必须介于 0 和 50 之间")
	public String getTypeId() {
		return typeId;
	}

	public void setTypeId(String typeId) {
		this.typeId = typeId;
	}

	@Length(min = 0, max = 50, message = "评分项编号长度必须介于 0 和 50 之间")
	public String getItemId() {
		return itemId;
	}

	public void setItemId(String itemId) {
		this.itemId = itemId;
	}

	@Length(min = 0, max = 50, message = "学期表编号长度必须介于 0 和 50 之间")
	public String getSemId() {
		return semId;
	}

	public void setSemId(String semId) {
		this.semId = semId;
	}

	@Length(min = 0, max = 4, message = "是否启用（0：未启用，1：启用）长度必须介于 0 和 4 之间")
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

	public String getTeachName() {
		return teachName;
	}

	public void setTeachName(String teachName) {
		this.teachName = teachName;
	}

	public String getGradeType() {
		return gradeType;
	}

	public void setGradeType(String gradeType) {
		this.gradeType = gradeType;
	}

	public String getGradeTerm() {
		return gradeTerm;
	}

	public void setGradeTerm(String gradeTerm) {
		this.gradeTerm = gradeTerm;
	}

	public String getSemester() {
		return semester;
	}

	public void setSemester(String semester) {
		this.semester = semester;
	}

	public String getGrade() {
		return grade;
	}

	public void setGrade(String grade) {
		this.grade = grade;
	}
	
	
}