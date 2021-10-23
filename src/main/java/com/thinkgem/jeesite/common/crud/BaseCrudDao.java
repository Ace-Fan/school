package com.thinkgem.jeesite.common.crud;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.thinkgem.jeesite.common.persistence.BaseDao;

/**
 * 基础CRUD-DAO层
 * @author weekly
 * @version V19.08.15
 * @param <T>
 */
public interface BaseCrudDao<T> extends BaseDao {

	/**
	 * 获取单条数据
	 * @param id
	 * @return
	 */
	public T get(String id);
	
	/**
	 * 获取单条数据
	 * @param entity
	 * @return
	 */
	public T get(T entity);
	
	/**
	 * 依据主键集合获取模板信息
	 * @param id	主键集合
	 * @return
	 */
	public List<T> getByBatchId(@Param(value = "list") List<String> id);
	
	/**
	 * 分页查询数据列表
	 * @param entity
	 * @return
	 */
	public List<T> findList(T entity);
	
	/**
	 * 获取分页查询数据总数
	 * @param entity
	 * @return
	 */
	public int getCountPage(T entity);
	
	/**
	 * 获取所有数据列表
	 * @return
	 */
	public List<T> getAllList();
	
	/**
	 * 查询所有数据列表
	 * @param entity
	 * @return
	 */
	public List<T> getAllList(T entity);
	
	/**
	 * 插入数据
	 * @param entity
	 * @return
	 */
	public int insert(T entity);
	
	/**
	 * 更新数据
	 * @param entity
	 * @return
	 */
	public int update(T entity);
	
	/**
	 * 删除数据（一般为逻辑删除，更新del_flag字段为1）
	 * @param entity
	 * @return
	 */
	public int delete(T entity);
	
	/**
	 * 批量导入
	 * @param list	对象集合
	 * @return
	 */
	int insertLead(List<T> list);
	
	/**
	 * 获取检验信息
	 * @param entity 校验对象
	 * @return
	 */
	T findCheckInfo(T entity);
}