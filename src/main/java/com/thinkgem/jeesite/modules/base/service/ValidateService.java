package com.thinkgem.jeesite.modules.base.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.modules.base.dao.ValidateDao;

@Service
@Transactional(readOnly = true)
public class ValidateService {
	
	@Autowired
	ValidateDao validateDao;
	
	/**
	 * 验证传递的表名和字段的值是否存在
	 * @param colunms 字段名称
	 * @param tableName 表名
	 * @param value 传递验证的值
	 * @return
	 */
	public boolean checkColumnsValue(String colunms, String tableName, String value) {
		boolean bool = false;
		int num = validateDao.checkColumnsValue(colunms,tableName,value);
		if(num > 0) {
			bool = true;
		}
		return bool;
	}
}
