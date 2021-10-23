package com.thinkgem.jeesite.modules.wisdom.util.base;

public class StringUtil {

	/**
	 * 传递字符串和过滤最后一个的字符串，获取过滤后的字符串
	 * @param str
	 * @param filter
	 * @return
	 */
	public static String getLastIndexOf(String str, String filter) {
		int strs = str.lastIndexOf(filter);
		return str.substring(0,strs);
	}
}
