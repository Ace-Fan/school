package com.thinkgem.jeesite.wechat.util;

public class CommonUtils {

	/**
	 * 过滤特殊字符
	 * @param source
	 * @return
	 */
	public static String filterEmoji(String source) {
		return source.replaceAll("[\\ud800\\udc00-\\udbff\\udfff\\ud800-\\udfff]", "*");
	}

}