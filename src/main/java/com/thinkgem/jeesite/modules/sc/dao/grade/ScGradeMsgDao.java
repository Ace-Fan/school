package com.thinkgem.jeesite.modules.sc.dao.grade;

import java.util.List;

import com.thinkgem.jeesite.common.crud.BaseCrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.thinkgem.jeesite.modules.sc.entity.grade.ScGradeMsg;

/**
 * @title 评分信息数据访问层
 * @author wufan
 * @version 2019-12-24
 */
@MyBatisDao
public interface ScGradeMsgDao extends BaseCrudDao<ScGradeMsg> {
	public List<ScGradeMsg> getBySemId(String semId);
	public List<ScGradeMsg> getByTeachId(String teachId);
}