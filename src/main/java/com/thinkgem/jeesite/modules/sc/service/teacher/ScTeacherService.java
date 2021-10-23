package com.thinkgem.jeesite.modules.sc.service.teacher;


import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.crud.BaseCrudService;
import com.thinkgem.jeesite.modules.sc.entity.teacher.ScTeacher;
import com.thinkgem.jeesite.modules.sc.dao.teacher.ScTeacherDao;

/**
 * @title 教师信息表业务层
 * @author wufan
 * @version 2019-12-21
 */
@Service
@Transactional(readOnly = true)
public class ScTeacherService extends BaseCrudService<ScTeacherDao, ScTeacher> {
	public ScTeacher getByCode(String code) {
		return dao.getByCode(code);
	}
}