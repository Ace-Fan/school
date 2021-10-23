package com.thinkgem.jeesite.modules.sc.service.grade;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.crud.BaseCrudService;
import com.thinkgem.jeesite.modules.sc.entity.grade.ScGradeType;
import com.thinkgem.jeesite.modules.sc.dao.grade.ScGradeTypeDao;

/**
 * @title 保存评分类型信息业务层
 * @author wufan
 * @version 2019-12-20
 */
@Service
@Transactional(readOnly = true)
public class ScGradeTypeService extends BaseCrudService<ScGradeTypeDao, ScGradeType> {

}