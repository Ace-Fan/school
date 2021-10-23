package com.thinkgem.jeesite.modules.wm.util;

import java.text.DecimalFormat;

import org.gavaghan.geodesy.Ellipsoid;
import org.gavaghan.geodesy.GeodeticCalculator;
import org.gavaghan.geodesy.GeodeticCurve;
import org.gavaghan.geodesy.GlobalCoordinates;

public class MapUtil {
	
	public static void main(String[] args) {
		GlobalCoordinates source = new GlobalCoordinates(29.490295, 106.486654);
		GlobalCoordinates target = new GlobalCoordinates(29.615467, 106.581515);

		double meter1 = getDistanceMeter(source, target, Ellipsoid.Sphere);
		double meter2 = getDistanceMeter(source, target, Ellipsoid.WGS84);
		
		String meter3 = getDistanceMeterFormat(source, target, Ellipsoid.Sphere);

		System.out.println("Sphere坐标系计算结果：" + meter1 + "米");
		System.out.println("WGS84坐标系计算结果：" + meter2 + "米");  // 与百度地图存在误差
		
		System.out.println("Sphere坐标系计算结果-小数格式化：" + meter3 + "米");  // 与百度地图存在误差
	}
	
	/**
	 * 四舍五入精确到小数点后两位
	 * @param d	传递小数
	 * @return
	 */
    public static String formatDouble(double d) {
        DecimalFormat df = new DecimalFormat("#.00");
        return df.format(d);
    }

	public static double getDistanceMeter(GlobalCoordinates gpsFrom, GlobalCoordinates gpsTo, Ellipsoid ellipsoid) {
		GeodeticCurve geoCurve = new GeodeticCalculator().calculateGeodeticCurve(ellipsoid, gpsFrom, gpsTo);
		return geoCurve.getEllipsoidalDistance();
	}
	
	public static String getDistanceMeterFormat(GlobalCoordinates gpsFrom, GlobalCoordinates gpsTo, Ellipsoid ellipsoid) {
		GeodeticCurve geoCurve = new GeodeticCalculator().calculateGeodeticCurve(ellipsoid, gpsFrom, gpsTo);
		return formatDouble(geoCurve.getEllipsoidalDistance());
	}
}