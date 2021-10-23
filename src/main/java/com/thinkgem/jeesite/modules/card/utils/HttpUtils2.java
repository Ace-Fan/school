package com.thinkgem.jeesite.modules.card.utils;

import java.io.IOException;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import org.apache.http.HttpEntity;
import org.apache.http.NameValuePair;
import org.apache.http.ParseException;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.message.BasicNameValuePair;
import org.apache.http.util.EntityUtils;

public class HttpUtils2 {

	/**
	 * 表单提交-post请求
	 * 
	 * @param url
	 *            请求URL地址 eg:http://bc-vn.maxpay888.com/sms_api/sms/receive
	 * @param params
	 *            请求参数MAP集合
	 */
	public static int postParams(String url, Map<String, String> params) {
		// 获取连接客户端工具
		CloseableHttpClient httpClient = HttpClients.createDefault();

		String entityStr = null;
		CloseableHttpResponse response = null;

		int ret = -1;

		try {
			// 创建POST请求对象
			HttpPost httpPost = new HttpPost(url);

			/*
			 * 添加请求参数
			 */
			// 创建请求参数
			List<NameValuePair> list = new LinkedList<>();

			for (String key : params.keySet()) {
				System.out.println("key:" + key + " value:" + params.get(key));
				System.out.println("======================");

				/* qparams.add(new BasicNameValuePair(key, params.get(key))); */
				list.add(new BasicNameValuePair(key, params.get(key)));
			}

			// 使用URL实体转换工具
			UrlEncodedFormEntity entityParam = new UrlEncodedFormEntity(list, "UTF-8");
			httpPost.setEntity(entityParam);

			/*
			 * 添加请求头信息
			 */
			// 浏览器表示
			// httpPost.addHeader("User-Agent", "Mozilla/5.0 (Windows; U; Windows NT 5.1;
			// en-US; rv:1.7.6)");
			// 传输的类型
			httpPost.addHeader("Content-Type", "application/x-www-form-urlencoded");

			// 执行请求
			response = httpClient.execute(httpPost);
			ret = response.getStatusLine().getStatusCode();
			// 获得响应的实体对象
			HttpEntity entity = response.getEntity();
			// 使用Apache提供的工具类进行转换成字符串
			entityStr = EntityUtils.toString(entity, "UTF-8");

		} catch (ClientProtocolException e) {
			System.err.println("Http协议出现问题");
			e.printStackTrace();
		} catch (ParseException e) {
			System.err.println("解析错误");
			e.printStackTrace();
		} catch (IOException e) {
			System.err.println("IO异常");
			e.printStackTrace();
		} finally {
			// 释放连接
			if (null != response) {
				try {
					response.close();
					httpClient.close();
				} catch (IOException e) {
					System.err.println("释放连接出错");
					e.printStackTrace();
				}
			}
		}

		// 打印响应内容
		System.out.println(entityStr);

		return ret;
	}

	public static void main(String[] args) {

		String url = "http://bc-vn.maxpay888.com/sms_api/sms/receive";
		
		Map<String, String> params = new HashMap<String, String>();
		params.put("receive_phone_number", "15974158911");
		params.put("send_phone_number", "15974158911");
		params.put("content", "出太阳了");
		params.put("sms_time", "2019-07-18 15:35:42");
		params.put("country_content", "#CN#中国");
		params.put("app_time", "2019-07-18 15:35:52");
		
		int ret=postParams(url,params);
		System.out.println("ret:"+ret);

	}
}