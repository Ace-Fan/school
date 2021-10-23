package com.thinkgem.jeesite.modules.sc.dao.teacher;

import com.thinkgem.jeesite.common.crud.BaseCrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.thinkgem.jeesite.modules.sc.entity.teacher.ScTeacher;

/**
 * @title 教师信息表数据访问层
 * @author wufan
 * @version 2019-12-21
 */
@MyBatisDao
public interface ScTeacherDao extends BaseCrudDao<ScTeacher> {
	public ScTeacher getByCode(String code);
}