package com.thinkgem.jeesite.modules.wisdom.service.base;

import java.util.Date;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.crud.BaseCrudService;
import com.thinkgem.jeesite.modules.wisdom.dao.base.WisReceiveAddressDao;
import com.thinkgem.jeesite.modules.wisdom.entity.base.WisReceiveAddress;

/**
 * 收货地址信息Service
 * @author weekly
 * @version 2019-09-19
 */
@Service
@Transactional(readOnly = true)
public class WisReceiveAddressService extends BaseCrudService<WisReceiveAddressDao, WisReceiveAddress> {

	// 新增
	@Transactional(readOnly = false)
	public boolean insert(WisReceiveAddress entity) {
		entity.setCreateTime(new Date());
		return dao.insert(entity) > 0 ? true : false;
	}
	
	// 修改
	@Transactional(readOnly = false)
	public boolean update(WisReceiveAddress entity) {
		entity.setUpdateTime(new Date());
		return dao.update(entity) > 0 ? true : false;
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
		int num = dao.toggleTableColumns(colunms,tableName,id,value, currentUser, uDate);
		if(num > 0) {
			bool = true;
		}
		return bool;
	}
}