package com.thinkgem.jeesite.modules.wisdom.service.base;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.crud.BaseCrudService;
import com.thinkgem.jeesite.modules.wisdom.dao.base.WisDataImportTabDao;
import com.thinkgem.jeesite.modules.wisdom.entity.base.WisDataImportTab;

/**
 * @title 数据导入配置业务层
 * @author weekly
 * @version 2019-10-07
 */
@Service
@Transactional(readOnly = true)
public class WisDataImportTabService extends BaseCrudService<WisDataImportTabDao, WisDataImportTab> {

	public WisDataImportTab getExcelFileUrlByTabCode(String tableName) {
		return dao.getExcelFileUrlByTabCode(tableName);
	}
	
}