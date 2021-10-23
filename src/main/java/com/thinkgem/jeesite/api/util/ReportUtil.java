package com.thinkgem.jeesite.api.util;

import java.io.IOException;

import com.thinkgem.jeesite.modules.card.utils.HttpUtils;

/**
 * 上报工具类
 */
public class ReportUtil {

	/**
	 * 上报工具类
	 * @param receivePhoneNumber 	本地电话号码	
	 * @param sendPhoneNumber		发送简讯电话号码
	 * @param content				简讯内容
	 * @param smsTime				简讯时间
	 * @throws IOException 
	 * 
	 */
	public static int report(String receivePhoneNumber, String sendPhoneNumber, String content, String receiveAppTime,
			String countryContent, String smsTime) throws IOException {
		
		System.out.println("本地电话号码："+receivePhoneNumber);
		System.out.println("发送简讯电话号码："+sendPhoneNumber);
		System.out.println("简讯内容："+content);
		System.out.println("简讯时间："+receiveAppTime);
		System.out.println("国别信息："+countryContent);
		System.out.println("APP时间："+smsTime);
		
		String reportUrl = "http://bc-vn.maxpay888.com/sms_api/sms/receive";
		
		String paramsUrl = "receive_phone_number="+receivePhoneNumber + "&send_phone_number=" +sendPhoneNumber
				+"&content="+content + "&sms_time="+receiveAppTime + "&country_content="+countryContent +"&app_time="+smsTime;
		
		System.out.println("接口请求地址reportUrl："+reportUrl);
		System.out.println("接口请求参数paramsUrl："+paramsUrl);
		
		// 调用post请求方法，返回状态为200，则上班成功
		return HttpUtils.post(reportUrl, paramsUrl);
	}

}