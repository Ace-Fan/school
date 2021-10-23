package com.thinkgem.jeesite.modules.sc.service.grade;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.crud.BaseCrudService;
import com.thinkgem.jeesite.modules.sc.entity.grade.ScGradeTerm;
import com.thinkgem.jeesite.modules.sc.dao.grade.ScGradeTermDao;

/**
 * @title 保存评分项信息业务层
 * @author wufan
 * @version 2019-12-20
 */
@Service
@Transactional(readOnly = true)
public class ScGradeTermService extends BaseCrudService<ScGradeTermDao, ScGradeTerm> {
	public List<ScGradeTerm> getByTypeId(String typeId) {
		return dao.getByTypeId(typeId);
	}
}