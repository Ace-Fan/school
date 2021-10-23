package com.thinkgem.jeesite.wechat.menu;

/**
 * 复合菜单(作为子菜单的数据结构使用)
 * 
 * @author jack
 * @version 1.0
 *
 */
public class ComplexButton extends Button {
	// 子菜单对象数组
	private Button[] sub_button;

	public Button[] getSub_button() {
		return sub_button;
	}

	public void setSub_button(Button[] sub_button) {
		this.sub_button = sub_button;
	}
}
