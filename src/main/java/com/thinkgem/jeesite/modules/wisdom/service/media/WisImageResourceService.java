package com.thinkgem.jeesite.modules.wisdom.service.media;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.crud.BaseCrudService;
import com.thinkgem.jeesite.modules.wisdom.dao.media.WisImageResourceDao;
import com.thinkgem.jeesite.modules.wisdom.entity.media.WisImageResource;

/**
 * 图片资源管理Service
 * @author weekly
 * @version 2019-09-18
 */
@Service
@Transactional(readOnly = true)
public class WisImageResourceService extends BaseCrudService<WisImageResourceDao, WisImageResource> {

}