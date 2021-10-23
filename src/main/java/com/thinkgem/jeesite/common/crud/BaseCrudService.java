package com.thinkgem.jeesite.common.crud;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.service.BaseService;
import com.thinkgem.jeesite.common.utils.PageUtils;
import com.thinkgem.jeesite.modules.base.dao.BaseGroupTableDao;
import com.thinkgem.jeesite.modules.card.utils.AESUtil;
import com.thinkgem.jeesite.modules.sys.utils.UserUtils;

/**
 * 基础CRUD-SERVICE层
 * @author weekly
 * @version V19.08.15
 *
 * @param <D>	持久层对象
 * @param <T>	对象
 */
@Transactional(readOnly=true)
public abstract class BaseCrudService<D extends BaseCrudDao<T>,T extends BaseCrudEntity> extends BaseService{
	
	@Autowired
	public D dao;
	
	@Autowired
	public BaseGroupTableDao baseGroupTableDao;
	
	/**
	 * 依据主键获取对象信息
	 * @param id		主键
	 * @return
	 */
	public T get(String id) {
		return dao.get(id);
	}
	
	/**
	 * 依据对象获取对象信息
	 * @param entity	对象信息
	 * @return
	 */
	public T get(T entity) {
		return dao.get(entity);
	}
	
	/**
	 * 依据主键集合获取对象集合
	 * @param id		主键集合
	 * @return
	 */
	public List<T> getByBatchId(List<String> id) {
		return dao.getByBatchId(id);
	}
	
	/**
	 * 依据对象获取分页信息
	 * @param entity
	 * @return
	 */
	public List<T> findList(T entity) {
		return dao.findList(entity);
	}
	
	/**
	 * 依据对象获取分页数量
	 * @param entity
	 * @return
	 */
	public int getCountPage(T entity) {
		return dao.getCountPage(entity);
	}
	
	/**
	 * 获取全部信息
	 * @return
	 */
	public List<T> getAllList() {
		return dao.getAllList();
	}
	
	/**
	 * 新增
	 * @param entity		对象
	 * @param tableName		表名
	 * @return
	 */
	@Transactional(readOnly = false)
	public boolean insert(T entity,String tableName) {
		try {
			tableName = AESUtil.AESDncode("pulsation", tableName); // 解析表名
			String currentUser = UserUtils.getUser().getId();//当前登录的用户
			entity.setCreateBy(currentUser);
			entity.setCreateDate(new Date());
			entity.setDelFlag(PageUtils.UNDELETE);
			if(dao.insert(entity)>0) {
				return true;
			}
		} catch (Exception e) {
			logger.error("BaseCrudService.save error:",e);
		}
		return false;
	}
	
	/**
	 * 新增-业务
	 * @param entity		对象
	 * @param tableName		表名
	 * @return
	 */
	@Transactional(readOnly = false)
	public boolean insertService(T entity,String tableName) {
		try {
			tableName = AESUtil.AESDncode("pulsation", tableName); // 解析表名
			
			String currentUser = UserUtils.getUser().getId();//当前登录的用户
			final int orderNo =1;//初始排序号
			String finalOrderNo = baseGroupTableDao.selectMaxOrderNo(tableName)==null?orderNo
					+"":(baseGroupTableDao.selectMaxOrderNo(tableName)+orderNo)+"";
			entity.setCreateBy(currentUser);
			entity.setOrderNo(finalOrderNo);
			entity.setCreateDate(new Date());
			entity.setDelFlag(PageUtils.UNDELETE);
			if(dao.insert(entity)>0) {
				return true;
			}
		} catch (Exception e) {
			logger.error("BaseCrudService.save error:",e);
		}
		return false;
	}
	
	/**
	 * 新增-业务
	 * @param entity		对象
	 * @param tableName		表名
	 * @return
	 */
	@Transactional(readOnly = false)
	public boolean insertServiceTree(T entity,String tableName) {
		try {
			tableName = AESUtil.AESDncode("pulsation", tableName); // 解析表名
			
			String currentUser = UserUtils.getUser().getId();//当前登录的用户
			entity.setCreateBy(currentUser);
			entity.setCreateDate(new Date());
			entity.setDelFlag(PageUtils.UNDELETE);
			if(dao.insert(entity)>0) {
				return true;
			}
		} catch (Exception e) {
			logger.error("BaseCrudService.save error:",e);
		}
		return false;
	}
	
	/**
	 * 修改
	 * @param entity	对象
	 * @return
	 */
	@Transactional(readOnly = false)
	public boolean update(T entity) {
		try {
			String currentUser = UserUtils.getUser().getId();//当前登录的用户 
			entity.setUpdateBy(currentUser);
			entity.setUpdateDate(new Date());
			if(dao.update(entity)>0) {
				return true;
			}
		} catch (Exception e) {
			logger.error("BaseCrudService.update error:",e);
		}
		return false;
	}
	
	// 导入故障编码信息
	@Transactional(readOnly = false)
	public int insertLead(List<T> list) {
		return dao.insertLead(list);
	}
	
	// 删除信息
	@Transactional(readOnly = false)
	public boolean delete(T entity) {
		return dao.delete(entity)>0 ? true:false;
	}
	
	/**
	 * 获取校验信息
	 * @param entity
	 * @return
	 */
	public T findCheckInfo(T entity) {
		return dao.findCheckInfo(entity);
	}
}