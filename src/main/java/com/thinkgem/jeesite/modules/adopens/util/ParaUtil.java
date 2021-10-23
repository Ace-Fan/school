package com.thinkgem.jeesite.modules.adopens.util;

import com.thinkgem.jeesite.common.utils.StringUtils;

import javax.servlet.http.HttpServletRequest;
import java.lang.reflect.Field;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;

/**
 * 参数工具类
 *
 */
public class ParaUtil {
	
	
	public static Map<String, String> packParaMap(HttpServletRequest request)  {
		Map<String, String> map = new HashMap<String, String>();
		Enumeration<String> e = request.getParameterNames();
		if (e.hasMoreElements()) {
			while (e.hasMoreElements()) {
				String name = e.nextElement();
				String[] values = request.getParameterValues(name);
				if (values.length == 1) {
					map.put(name, values[0]);
				}
				else {
					StringBuffer sb = new StringBuffer();
					for (int i=0; i<values.length; i++) {
						if (i > 0)
							sb.append(",");
						sb.append(values[i]);
					}
					map.put(name, sb.toString());
				}
			}
		}
		return map;
	}

	public static <T> T packEntityByMap(Map<String, String> map, T t) throws InvocationTargetException, IllegalAccessException {
		if (null != map && null != t) {
			Field[] fs = t.getClass().getDeclaredFields(); //得到类中的所有属性集合
			if (null != fs && fs.length > 0) {
				Field f;
				String proName;
				Method getM; // get方法
				Method setM; // set方法
				String mapValue;
				SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
				SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy-MM-dd");
				for (int i=0;i<fs.length;i++) {
					f = fs[i];
					if (null != f) {
						f.setAccessible(true); //设置些属性是可以访问的
						proName = f.getName();
						if (StringUtils.isNotBlank(proName)) {
							mapValue = map.get(proName);
							if (null != mapValue) {
								// 首字母大写
								char[] ch = proName.toCharArray();
								if (ch[0] >= 'a' && ch[0] <= 'z') {
									ch[0] = (char) (ch[0] - 32);
								}
								proName = new String(ch);

								// 设置值
								try {
									getM = t.getClass().getMethod("get" + proName);
									Class<?> c = getM.getReturnType();
									setM = t.getClass().getMethod("set" + proName, c);
									switch (c.getSimpleName()) {
										case "String":
											setM.invoke(t, mapValue);
											break;
										case "Date":
											if (StringUtils.isNotBlank(mapValue)) {
												try {
													setM.invoke(t, sdf1.parse(mapValue));
												} catch (ParseException e) {
													try {
														setM.invoke(t, sdf2.parse(mapValue));
													} catch (ParseException e2) {
														System.out.println("属性["+proName+"]在packEntityByMap时日期转换格式[yyyy-MM-dd]时出错，当前参数值["+mapValue+"]");
														continue;
													}
													System.out.println("属性["+proName+"]在packEntityByMap时日期转换格式[yyyy-MM-dd HH:mm:ss]时出错，当前参数值["+mapValue+"]");
												}
											}
											break;
									}
								} catch (NoSuchMethodException e) {
									System.out.println("属性["+proName+"]在packEntityByMap时未找到，继续向下查找");
								}
							}
						}
					}
				}
			}
		}
		return t;
	}
	
	
}
