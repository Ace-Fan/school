package com.thinkgem.jeesite.modules.wm.util;

import java.text.ParsePosition;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

/**
 * @title 将Date类型转化为String类型
 * @author weekly
 * @version V19.09.18
 */
public class DateUtil {
	
	// 日期格式-YMD（年-月-日）
	public final static String YMD = "yyyy-MM-dd";
	
	// 日期格式-YMDHMS（年-月-日 时:分:秒）
	public final static String YMDHMS = "yyyy-MM-dd HH:mm:ss";
	
	// 日期格式-HMS（时:分:秒）
	public final static String HMS = "HH:mm:ss";
	
	// 日期格式-HM（时:分）
	public final static String HM = "HH:mm";
	
	// 日期格式-YMDHMSH（X年X月X日 时:分:秒）
	public final static String YMDHMSH = "yyyy年MM月dd日 HH:mm:ss";
	
	/**
	 * 日期格式化
	 * @param date	日期
	 * @param fmt	格式参数
	 * @return
	 */
	public static String dateFormat(Date date, String fmt) {
		SimpleDateFormat sdf = new SimpleDateFormat(fmt);
		return sdf.format(date);
	}
	
	/**
	 * 时间字符串转为指定格式的日期
	 * @param dateStr	时间字符串
	 * @param fmt		指定格式
	 * @return
	 */
	public static Date dateStrFormat(String dateStr, String fmt) {
		SimpleDateFormat formatter = new SimpleDateFormat(fmt);
		ParsePosition pos = new ParsePosition(0);
		Date strtodate = formatter.parse(dateStr, pos);
		return strtodate;
	}
	
	/**
	 * @title 判断当前日期是否在指定区间时间范围内
	 * @param nowTime   当前时间	
	 * @param startTime	开始时间
	 * @param endTime   结束时间
	 * @return 
	 */
	public static boolean isCurrentScopeDate(Date nowTime, Date startTime, Date endTime) {
        if (nowTime.getTime() == startTime.getTime()
                || nowTime.getTime() == endTime.getTime()) {
            return true;
        }

        Calendar date = Calendar.getInstance();
        date.setTime(nowTime);

        Calendar begin = Calendar.getInstance();
        begin.setTime(startTime);

        Calendar end = Calendar.getInstance();
        end.setTime(endTime);

        if (date.after(begin) && date.before(end)) {
            return true;
        } else {
            return false;
        }
    }
	
}
