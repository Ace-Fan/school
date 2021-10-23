package com.thinkgem.jeesite.modules.wisdom.service.base;

import java.util.Date;
import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.crud.BaseCrudService;
import com.thinkgem.jeesite.common.utils.PageUtils;
import com.thinkgem.jeesite.modules.wisdom.entity.base.WisDataFieldMapping;
import com.thinkgem.jeesite.modules.card.utils.AESUtil;
import com.thinkgem.jeesite.modules.sys.utils.UserUtils;
import com.thinkgem.jeesite.modules.wisdom.dao.base.WisDataFieldMappingDao;

/**
 * @title 导入字段映射配置业务层
 * @author weekly
 * @version 2019-10-07
 */
@Service
@Transactional(readOnly = true)
public class WisDataFieldMappingService extends BaseCrudService<WisDataFieldMappingDao, WisDataFieldMapping> {

	/**
	 * EXCEL批量新增
	 * @param dataList
	 * @return
	 */
	@Transactional(readOnly = false)
	public boolean excelSave(List<WisDataFieldMapping> dataList) {
		logger.debug("dataList:"+dataList.toString());
		
		String tableName = AESUtil.AESDncode("pulsation", new WisDataFieldMapping().getTableName()); // 解析表名
		
		for (int i = 0; i < dataList.size(); i++) {
			final int orderNo =1;//初始排序号
			String finalOrderNo = baseGroupTableDao.selectMaxOrderNo(tableName)==null?orderNo
					+"":(baseGroupTableDao.selectMaxOrderNo(tableName)+orderNo)+"";
			String currentUser = UserUtils.getUser().getId();//当前登录的用户
			dataList.get(i).setCreateBy(currentUser);
			dataList.get(i).setCreateDate(new Date());
			dataList.get(i).setOrderNo(finalOrderNo);
			dataList.get(i).setDelFlag(PageUtils.UNDELETE);
		}
		boolean bool = dao.excelSave(dataList) > 0;
		if (bool) { return true; }
		return false;
	}

	/**
	 * 获取EXCEL信息
	 * @param tableName
	 * @return
	 */
	public List<WisDataFieldMapping> findExcelList(String tableName){
		return dao.findExcelList(tableName);
	}
	
	/**
	 * 获取映射关系个数
	 * @param gsDataFieldMapping
	 * @return
	 */
	public boolean countMapping(WisDataFieldMapping entity) {
		return dao.countMapping(entity) >0 ? true : false;
	}
	
}