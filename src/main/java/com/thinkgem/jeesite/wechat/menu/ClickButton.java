package com.thinkgem.jeesite.wechat.menu;

/**
 * 
 * 
 * @author jack
 * @version 1.0
 *
 */
public class ClickButton extends Button {
	// 按钮类型
	private String type;

	// 按钮key
	private String key;

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getKey() {
		return key;
	}

	public void setKey(String key) {
		this.key = key;
	}
}
