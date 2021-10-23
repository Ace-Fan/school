package com.thinkgem.jeesite.modules.wisdom.service.base;

import java.util.List;

import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.crud.BaseCrudService;
import com.thinkgem.jeesite.modules.wisdom.dao.base.SysBaseAreaCodeDao;
import com.thinkgem.jeesite.modules.wisdom.entity.base.SysBaseAreaCode;

/**
 * 行政区划编码Service
 * @author weekly
 * @version 2019-09-17
 */
@Service
@Transactional(readOnly = true)
public class SysBaseAreaCodeService extends BaseCrudService<SysBaseAreaCodeDao, SysBaseAreaCode> {

	/**
	 * 查询所有信息
	 */
	@Cacheable(value = "areaListOne", keyGenerator = "customKeyGenerator")
	public List<SysBaseAreaCode> areaListOne(SysBaseAreaCode sysBaseAreaCode) {
		return dao.areaList(sysBaseAreaCode);
	}
	
	/**
	 * 查询所有信息
	 */
	@Cacheable(value = "areaListTwo", keyGenerator = "customKeyGenerator")
	public List<SysBaseAreaCode> areaListTwo(SysBaseAreaCode sysBaseAreaCode) {
		return dao.areaList(sysBaseAreaCode);
	}
	
	/**
	 * 查询所有信息
	 */
	@Cacheable(value = "areaListThree", keyGenerator = "customKeyGenerator")
	public List<SysBaseAreaCode> areaListThree(SysBaseAreaCode sysBaseAreaCode) {
		return dao.areaList(sysBaseAreaCode);
	}
	
	/**
	 * 默认获取所有一级信息
	 * @return
	 */
	public List<SysBaseAreaCode> getIndexAreaInfo() {
		return dao.getIndexAreaInfo();
	}
	
	/**
	 * 根据传递的等级和统计编码信息获取对应的行政区划信息
	 * @param currLevel	等级
	 * @param areaCode	统计编码
	 * @return
	 */
	public List<SysBaseAreaCode> getAreaInfoByAreaCodeAndLev(String currLevel,String areaCode){
		return dao.getAreaInfoByAreaCodeAndLev(currLevel, areaCode);
	}
	
	/**
	 * 根据传递的等级和统计编码信息获取对应的行政区划信息
	 * @param currLevel	等级
	 * @param name		省份名称
	 * @return
	 */
	public SysBaseAreaCode getAreaInfoByAreaNameAndLev(String currLevel,String name){
		return dao.getAreaInfoByAreaNameAndLev(currLevel,name);
	}
	
	/**
	 * 根据传递的等级和名字获取二、三级行政区划信息 （可通用）
	 * @param currLevel
	 * @param areaName
	 * @return
	 */
	public List<SysBaseAreaCode> getAreaInfoByLevAndName(String currLevel,String areaName) {
		// 根据二级的名称和等级 获取二级行政区划信息
		if("2".equals(currLevel)) {
			SysBaseAreaCode indexSysBaseAreaCode = getAreaInfoByAreaNameAndLev("1", areaName);
			// V19.08.27 修正获取条件信息，取前两位
			String code = indexSysBaseAreaCode.getCode().substring(0,2);
			List<SysBaseAreaCode> sysbaseAreaCodeSecondList = getAreaInfoByAreaCodeAndLev("2",code);
			return sysbaseAreaCodeSecondList;
		// 根据三级的名称和等级 获取三级行政区划信息
		} else if ("3".equals(currLevel)) {
			SysBaseAreaCode secondSysBaseAreaCode = getAreaInfoByAreaNameAndLev("2", areaName);
			String secondCode = secondSysBaseAreaCode.getCode();
			secondCode = secondCode.substring(0, 4);
			
			// 由于重庆市这一个直辖市下的三级目录合并了区和县，故而加此判断
			if(secondCode == "5001") {
				secondCode = secondCode.substring(0, 3);
				List<SysBaseAreaCode> sysbaseAreaCodeThirdList = getAreaInfoByAreaCodeAndLev("3",secondCode);
				return sysbaseAreaCodeThirdList;
			} else {
				List<SysBaseAreaCode> sysbaseAreaCodeThirdList = getAreaInfoByAreaCodeAndLev("3",secondCode);
				return sysbaseAreaCodeThirdList;
			}
		// 如果传递等级不为2,3 返回为NULL
		} else {
			return null;
		}
	}
	
}