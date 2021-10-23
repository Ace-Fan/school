package com.thinkgem.jeesite.modules.wisdom.entity.media;

import org.hibernate.validator.constraints.Length;

import com.thinkgem.jeesite.common.crud.BaseCrudEntity;
import com.thinkgem.jeesite.modules.card.utils.AESUtil;

/**
 * 图片资源管理Entity
 * @author weekly
 * @version 2019-09-18
 */
public class WisImageResource extends BaseCrudEntity {
	
	private static final long serialVersionUID = 1L;
	private String imgLimitWidth;		// 图片限定宽度
	private String imgLimitHeight;		// 图片限定高度
	private String imgLimitFormat;		// 图片限定格式
	private String imgDesc;				// 图片描述
	private String goUrl;				// 图片跳转路径
	
	private String tableName = AESUtil.AESEncode("pulsation", "wis_image_resource"); // SQL表名
	
	public WisImageResource() {
		super();
	}

	@Length(min=0, max=11, message="图片限定宽度长度必须介于 0 和 11 之间")
	public String getImgLimitWidth() {
		return imgLimitWidth;
	}

	public void setImgLimitWidth(String imgLimitWidth) {
		this.imgLimitWidth = imgLimitWidth;
	}
	
	@Length(min=0, max=11, message="图片限定高度长度必须介于 0 和 11 之间")
	public String getImgLimitHeight() {
		return imgLimitHeight;
	}

	public void setImgLimitHeight(String imgLimitHeight) {
		this.imgLimitHeight = imgLimitHeight;
	}
	
	@Length(min=0, max=100, message="图片限定格式长度必须介于 0 和 100 之间")
	public String getImgLimitFormat() {
		return imgLimitFormat;
	}

	public void setImgLimitFormat(String imgLimitFormat) {
		this.imgLimitFormat = imgLimitFormat;
	}
	
	@Length(min=0, max=100, message="图片描述长度必须介于 0 和 100 之间")
	public String getImgDesc() {
		return imgDesc;
	}

	public void setImgDesc(String imgDesc) {
		this.imgDesc = imgDesc;
	}
	
	@Length(min=0, max=200, message="图片跳转路径长度必须介于 0 和 200 之间")
	public String getGoUrl() {
		return goUrl;
	}

	public void setGoUrl(String goUrl) {
		this.goUrl = goUrl;
	}

	public String getTableName() {
		return tableName;
	}

	public void setTableName(String tableName) {
		this.tableName = tableName;
	}
	
}