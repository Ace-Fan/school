package com.thinkgem.jeesite.wechat.menu;

/**
 * VIEW类型按钮
 * 
 * @author jack
 * @version 1.0
 *
 */
public class ViewButton extends Button {
	// 按钮类型
	private String type;

	// 菜单跳转路径
	private String url;

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

}
