package com.thinkgem.jeesite.modules.wm.util;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * @title 校验字符串工具类
 * @author weekly
 * @version V19.12.04
 */
public class VerifyStringUtil {

	// 校验字符串格式-ENG（包含字母）
	public final static String ENG = ".*[a-zA-Z]+.*";
	
	// 校验字符串格式-NENG（非字母）
	public final static String NENG = "[^a-z^A-Z]";
	
	// 校验字符串格式-NNUM（非数字）
	public final static String NNUM = "[^0-9]";
	
	// 校验字符串格式-NUM（包含数字）
	public final static String NUM = "[0-9]+";
	
	/**
	 * 传递字符串和指定的字符串校验格式
	 * 	校验当前字符串是否包含指定格式信息
	 * 
	 * @param str	传递字符串
	 * @param regex	校验格式
	 * @return
	 */
	public static boolean isContain(String str, String regex) {
	    Matcher m=Pattern.compile(regex).matcher(str);
	    return m.matches();
    }
	
	/**
	 * 获取非指定格式字符串信息
	 * @param str	传递字符串
	 * @param regex	校验格式
	 * @return
	 */
	public static String isObtion(String str, String regex) {
		str = str.replaceAll(regex, "");
		return str;
	}
	
	public static void main(String[] args) {
		System.out.println(isContain("42...", NENG));
		System.out.println(isObtion("fafhaof12131", NNUM));
	}
	
}
