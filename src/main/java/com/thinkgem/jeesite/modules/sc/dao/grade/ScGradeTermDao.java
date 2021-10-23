package com.thinkgem.jeesite.modules.sc.dao.grade;

import java.util.List;


import com.thinkgem.jeesite.common.crud.BaseCrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.thinkgem.jeesite.modules.sc.entity.grade.ScGradeTerm;

/**
 * @title 保存评分项信息数据访问层
 * @author wufan
 * @version 2019-12-20
 */
@MyBatisDao
public interface ScGradeTermDao extends BaseCrudDao<ScGradeTerm> {
	public List<ScGradeTerm> getByTypeId(String typeId);
}