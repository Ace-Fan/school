package com.thinkgem.jeesite.modules.sc.service.grade;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.crud.BaseCrudService;
import com.thinkgem.jeesite.modules.sc.entity.grade.ScGradeMsg;
import com.thinkgem.jeesite.modules.sc.dao.grade.ScGradeMsgDao;

/**
 * @title 评分信息业务层
 * @author wufan
 * @version 2019-12-24
 */
@Service
@Transactional(readOnly = true)
public class ScGradeMsgService extends BaseCrudService<ScGradeMsgDao, ScGradeMsg> {
	public List<ScGradeMsg> getBySemId(String semId) {
		return dao.getBySemId(semId);
	}
	public List<ScGradeMsg> getByTeachId(String teachId){
		return dao.getByTeachId(teachId);
	}
}