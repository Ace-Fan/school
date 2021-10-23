package com.thinkgem.jeesite.modules.sc.dao.college;

import com.thinkgem.jeesite.common.crud.BaseCrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.thinkgem.jeesite.modules.sc.entity.college.ScSemester;

/**
 * @title 学期信息数据访问层
 * @author wufan
 * @version 2019-12-21
 */
@MyBatisDao
public interface ScSemesterDao extends BaseCrudDao<ScSemester> {
	
}