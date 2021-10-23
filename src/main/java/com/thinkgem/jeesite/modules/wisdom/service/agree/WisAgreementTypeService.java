package com.thinkgem.jeesite.modules.wisdom.service.agree;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.crud.BaseCrudService;
import com.thinkgem.jeesite.modules.wisdom.dao.agree.WisAgreementTypeDao;
import com.thinkgem.jeesite.modules.wisdom.entity.agree.WisAgreementType;

/**
 * 协议类型信息Service
 * @author weekly
 * @version 2019-09-19
 */
@Service
@Transactional(readOnly = true)
public class WisAgreementTypeService extends BaseCrudService<WisAgreementTypeDao, WisAgreementType> {

}