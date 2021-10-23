package com.thinkgem.jeesite.modules.base.util;

import java.io.InputStream;
import java.util.Iterator;
import java.util.Properties;

public class GetConfigUtil {
	/**
	 * 读取配置文件
	 * @param urlName  参数key
	 * @return
	 */
	public static String getUrlValue(String urlName) {
        String url = null;
        Properties prop = new Properties();
        try {
            ClassLoader classLoader = GetConfigUtil.class.getClassLoader();// 读取属性文件xxxxx.properties
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
}
