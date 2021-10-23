package com.thinkgem.jeesite.modules.sc.service.college;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.crud.BaseCrudService;
import com.thinkgem.jeesite.modules.sc.entity.college.ScSemester;
import com.thinkgem.jeesite.modules.sc.dao.college.ScSemesterDao;

/**
 * @title 学期信息业务层
 * @author wufan
 * @version 2019-12-21
 */
@Service
@Transactional(readOnly = true)
public class ScSemesterService extends BaseCrudService<ScSemesterDao, ScSemester> {

}