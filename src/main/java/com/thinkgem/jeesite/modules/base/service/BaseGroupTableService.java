package com.thinkgem.jeesite.modules.base.service;

import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.service.BaseService;
import com.thinkgem.jeesite.modules.base.dao.BaseGroupTableDao;
import com.thinkgem.jeesite.modules.base.entity.BaseGroupTable;
import com.thinkgem.jeesite.modules.card.utils.AESUtil;

@Service
@Transactional(readOnly = true)
public class BaseGroupTableService extends BaseService {
	
	@Autowired
	private BaseGroupTableDao baseGroupTableDao; 
	
	/**
	 * 单个删除
	 * @param id
	 * @param field
	 * @param tableName
	 * @return
	 */
	@Transactional(readOnly = false)
	public boolean deleteOne(String tableName, String id) {
		boolean bool = false;
		int num = baseGroupTableDao.deleteOne(tableName,id);
		if(num > 0) {
			bool = true;
		}
		return bool;
	}
	
	/**
	 * 批量删除
	 * @param id
	 * @param field
	 * @param tableName
	 * @return
	 */
	@Transactional(readOnly = false)
	public boolean batchDelete(String[] id, String field, String tableName) {
		boolean bool = false;
		int num = baseGroupTableDao.batchDelete(id,field,tableName);
		if(num > 0) {
			bool = true;
		}
		return bool;
	}
	
	/**
	 * 切换指定表指定主键指定字段的值
	 * @param colunms		字段名
	 * @param tableName		表名
	 * @param id			主键值
	 * @param value			切换值
	 * @param currentUser	切换人
	 * @param uDate			切换时间
	 * 
	 * @author weekly
	 * @version V19.07.29
	 * @return
	 */
	@Transactional(readOnly = false)
	public boolean toggleTableColumns(String colunms, String tableName, String id, String value, String currentUser, Date uDate) {
		boolean bool = false;
		int num = baseGroupTableDao.toggleTableColumns(colunms,tableName,id,value, currentUser, uDate);
		if(num > 0) {
			bool = true;
		}
		return bool;
	}
	
	/**
	 * 获取最大值排序号
	 * @param tableName
	 * @return
	 */
	public String getMaxOrderNo(String tableName) {
		// 传递解析表名获取最大排序号，将最大排序号信息转为int类型，返回排序号信息
		BaseGroupTable sysBaseTableGroup = baseGroupTableDao.getMaxOrderNo(AESUtil.AESDncode("pulsation", tableName));
		
		int maxOrderNo = 1;
		
		if (sysBaseTableGroup != null) {
			maxOrderNo = Integer.valueOf(sysBaseTableGroup.getMaxOrderNo()) + 1;
		} 		
		
		logger.debug("最大值排序号："+maxOrderNo);
		
		return maxOrderNo+""; 
	}
	
}