package com.thinkgem.jeesite.modules.wm.util;

/**
 * @title 字符串工具类 
 * @author weekly
 * @version V19.12.04
 */
public class StringUtil {

	/**
	 * 传递字符串和过滤字符串，获取需过滤字符串最后一个前的字符串信息
	 * @param str		传递字符串
	 * @param filter	过滤字符串
	 * @return
	 */
	public static String getLastIndexOf(String str, String filter) {
		int strs = str.lastIndexOf(filter);
		return str.substring(0,strs);
	}
	
	/**
	 * 传递字符串和过滤字符串，获取需过滤字符串最后一个后的字符串信息
	 * @param str		传递字符串
	 * @param filter	过滤字符串
	 * @return
	 */
	public static String getLastOf(String str, String filter) {
		int strs = str.lastIndexOf(filter);
		return str.substring(strs, str.length());
	}
	
	/**
	 * 将指定字符串的指定内容替换为空值
	 * @param str
	 * @param filter
	 * @return
	 */
	public static String repStr(String str, String filter) {
		str = str.replaceAll(filter, "");
		return str;
	}
	
	/**
	 * 传递字符串（以逗号隔开的多个子字符串）和需拼接的前缀信息，将前缀信息拼接上去
	 * @param str
	 * @param imgPath
	 * @return
	 */
	public static String imgRpStr (String str, String imgPath) {
		if (!"".equals(str) && str != null) {
			String res = "";
			String[] imgArr = str.split(",");
			for (int i = 0; i < imgArr.length; i++) {
				res = res + imgPath + imgArr[i] + ",";
			}
			res = res.substring(0, res.length()-1);
			str = res;
		}
		return str;
	}
	
	public static boolean checkStr (String str, String filter) {
		return str.indexOf(filter)>=0 ? true : false;
	}
	
	public static void main(String[] args) {
		System.out.println(checkStr("1123","1"));
	}
}
