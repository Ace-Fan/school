package com.thinkgem.jeesite.modules.wisdom.service.media;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.crud.BaseCrudService;
import com.thinkgem.jeesite.modules.wisdom.dao.media.WisImageTypeDao;
import com.thinkgem.jeesite.modules.wisdom.entity.media.WisImageType;

/**
 * 图片资源分类管理Service
 * @author weekly
 * @version 2019-09-18
 */
@Service
@Transactional(readOnly = true)
public class WisImageTypeService extends BaseCrudService<WisImageTypeDao, WisImageType> {

}