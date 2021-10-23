package com.thinkgem.jeesite.modules.sc.dao.grade;

import com.thinkgem.jeesite.common.crud.BaseCrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.thinkgem.jeesite.modules.sc.entity.grade.ScGradeType;

/**
 * @title 保存评分类型信息数据访问层
 * @author wufan
 * @version 2019-12-20
 */
@MyBatisDao
public interface ScGradeTypeDao extends BaseCrudDao<ScGradeType> {
	
}