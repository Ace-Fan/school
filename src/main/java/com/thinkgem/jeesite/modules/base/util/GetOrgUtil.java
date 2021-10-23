package com.thinkgem.jeesite.modules.base.util;

import java.io.InputStream;
import java.util.Iterator;
import java.util.Properties;

/**
 * @title 配件文件
 * @author weekly
 * @version V19.09.19
 */
public class GetOrgUtil {

	/**
	 * 读取配置文件
	 * @param urlName  参数key
	 * @return
	 */
	public static String getUrlValue(String urlName) {
        String url = null;
        Properties prop = new Properties();
        try {
            ClassLoader classLoader = GetOrgUtil.class.getClassLoader();// 读取属性文件xxxxx.properties
            InputStream in = classLoader.getResourceAsStream("school.properties");
            prop.load(in); /// 加载属性列表
            Iterator<String> it = prop.stringPropertyNames().iterator();
            while (it.hasNext()) {
                if (it.next().equals(urlName)) {
                    url = prop.getProperty(urlName);
                }
            }
            in.close();
        } catch (Exception e) {
            
        }
        return url;
    }
	
	/**
	 * 从字符串中取出数字
	 * @param str
	 * @return
	 */
	public static String strTakeNum (String str) {
		str=str.trim();
		String str2="";
		if(str != null && !"".equals(str)){
			for(int i=0;i<str.length();i++){
				if(str.charAt(i)>=48 && str.charAt(i)<=57){
					str2+=str.charAt(i);
				}
			}
		}
		return str2;
	}
}
