package com.thinkgem.jeesite.modules.wisdom.service.base;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.modules.wisdom.dao.base.ColumnsDao;
import com.thinkgem.jeesite.modules.wisdom.entity.base.Columns;

/**
 * @title 数据表格信息
 * @author weekly
 * @version V19.09.12
 */
@Service
@Transactional(readOnly = true)
public class ColumnsService {
	
	@Autowired
	private ColumnsDao columnsDao;
	
	/**
	 * 依据表名获取数据表格信息
	 * @param tableName
	 * @return
	 */
	public List<Columns> findList(String tableName){
		return columnsDao.findList(tableName);
	}
	
}
