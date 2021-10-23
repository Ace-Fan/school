package com.thinkgem.jeesite.modules.wisdom.dao.base;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.thinkgem.jeesite.common.crud.BaseCrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.thinkgem.jeesite.modules.wisdom.entity.base.SysBaseAreaCode;

/**
 * 行政区划编码DAO接口
 * @author weekly
 * @version 2019-09-17
 */
@MyBatisDao
public interface SysBaseAreaCodeDao extends BaseCrudDao<SysBaseAreaCode> {
	
	List<SysBaseAreaCode> getIndexAreaInfo(); // 默认获取一级行政区划信息
	
	List<SysBaseAreaCode> getAreaInfoByAreaCodeAndLev(@Param("currLevel") String currLevel,@Param("areaCode") String areaCode); // 根据等级和统计编码获取行政区划信息
	
	SysBaseAreaCode getAreaInfoByAreaNameAndLev(@Param("currLevel") String currLevel,@Param("name") String name); // 根据等级和省份名称获取行政区划信息
	
	List<SysBaseAreaCode> areaList(SysBaseAreaCode sysBaseAreaCode); // 查询所有信息
	
}