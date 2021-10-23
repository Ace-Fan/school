package com.thinkgem.jeesite.modules.wm.util;

import java.util.Random;

import com.aliyuncs.DefaultAcsClient;
import com.aliyuncs.IAcsClient;
import com.aliyuncs.dysmsapi.model.v20170525.SendSmsRequest;
import com.aliyuncs.dysmsapi.model.v20170525.SendSmsResponse;
import com.aliyuncs.exceptions.ClientException;
import com.aliyuncs.profile.DefaultProfile;
import com.aliyuncs.profile.IClientProfile;

/**
 * @title 阿里云短信推送接口
 * @author weekly
 * @version V19.12.08
 */
public class AliYunSmsUtil {
	
	// 产品名称:云通信短信API产品,开发者无需替换
	static final String product = "Dysmsapi";
	// 产品域名,开发者无需替换
	static final String domain = "dysmsapi.aliyuncs.com";

	// TODO 此处需要替换成开发者自己的AK(在阿里云访问控制台寻找)
	static final String accessKeyId = "LTAIaL0T268mQmDX"; // TODO 改这里
	static final String accessKeySecret = "MGW3y8f5s3Hw51EedBzzEmEbONCdtE"; // TODO 改这里

	public static SendSmsResponse sendSms(String telephone, String code) throws ClientException {

		// 可自助调整超时时间
		System.setProperty("sun.net.client.defaultConnectTimeout", "10000");
		System.setProperty("sun.net.client.defaultReadTimeout", "10000");

		// 初始化acsClient,暂不支持region化
		IClientProfile profile = DefaultProfile.getProfile("cn-hangzhou", accessKeyId, accessKeySecret);
		DefaultProfile.addEndpoint("cn-hangzhou", "cn-hangzhou", product, domain);
		IAcsClient acsClient = new DefaultAcsClient(profile);

		// 组装请求对象-具体描述见控制台-文档部分内容
		SendSmsRequest request = new SendSmsRequest();
		// 必填:待发送手机号
		request.setPhoneNumbers(telephone);
		// 必填:短信签名-可在短信控制台中找到
		request.setSignName("水牛师傅"); // TODO 改这里
		// 必填:短信模板-可在短信控制台中找到
		request.setTemplateCode("SMS_180050364"); // TODO 改这里
		// 可选:模板中的变量替换JSON串,如模板内容为"亲爱的用户,您的验证码为${code}"时,此处的值为
		request.setTemplateParam("{\"code\":\"" + code + "\"}");

		// 选填-上行短信扩展码(无特殊需求用户请忽略此字段)
		// request.setSmsUpExtendCode("90997");

		// 可选:outId为提供给业务方扩展字段,最终在短信回执消息中将此值带回给调用者
		request.setOutId("yourOutId");

		// hint 此处可能会抛出异常，注意catch
		SendSmsResponse sendSmsResponse = acsClient.getAcsResponse(request);
		if (sendSmsResponse.getCode() != null && sendSmsResponse.getCode().equals("OK")) {
			System.out.println("短信发送成功！");
		} else {
			System.out.println("短信发送失败！");
		}
		return sendSmsResponse;
	}

	/*
	 * 定义一个获取随机验证码的方法：getCode();
	 */
	public static String getCode(int n) {
//		String string = "0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ";//保存数字0-9 和 大小写字母
		String string = "0123456789";
		char[] ch = new char[n]; //声明一个字符数组对象ch 保存 验证码
		for (int i = 0; i < n; i++) {
			Random random = new Random();//创建一个新的随机数生成器
			int index = random.nextInt(string.length());//返回[0,string.length)范围的int值    作用：保存下标
			ch[i] = string.charAt(index);//charAt() : 返回指定索引处的 char 值   ==》保存到字符数组对象ch里面
		}
		//将char数组类型转换为String类型保存到result
		//String result = new String(ch);//方法一：直接使用构造方法      String(char[] value) ：分配一个新的 String，使其表示字符数组参数中当前包含的字符序列。
		String result = String.valueOf(ch);//方法二： String方法   valueOf(char c) ：返回 char 参数的字符串表示形式。
		return result;
	}
	
	
	/**
	 * 阿里云传递手机号、生成编码、生成模板签名、生成模板名称发送短信
	 * @param telephone		手机号
	 * @param code			生成编码
	 * @param signName		生成模板签名
	 * @param smsModel		生成模板名
	 * @return
	 * @throws ClientException
	 */
	public static SendSmsResponse sendSms(String telephone, String code, String signName, String smsModel) throws ClientException {

		// 可自助调整超时时间
		System.setProperty("sun.net.client.defaultConnectTimeout", "10000");
		System.setProperty("sun.net.client.defaultReadTimeout", "10000");

		// 初始化acsClient,暂不支持region化
		IClientProfile profile = DefaultProfile.getProfile("cn-hangzhou", accessKeyId, accessKeySecret);
		DefaultProfile.addEndpoint("cn-hangzhou", "cn-hangzhou", product, domain);
		IAcsClient acsClient = new DefaultAcsClient(profile);

		// 组装请求对象-具体描述见控制台-文档部分内容
		SendSmsRequest request = new SendSmsRequest();
		// 必填:待发送手机号
		request.setPhoneNumbers(telephone);
		// 必填:短信签名-可在短信控制台中找到
		request.setSignName(signName); // TODO 改这里
		// 必填:短信模板-可在短信控制台中找到
		request.setTemplateCode(smsModel); // TODO 改这里
		// 可选:模板中的变量替换JSON串,如模板内容为"亲爱的用户,您的验证码为${code}"时,此处的值为
		request.setTemplateParam("{\"code\":\"" + code + "\"}");

		// 选填-上行短信扩展码(无特殊需求用户请忽略此字段)
		// request.setSmsUpExtendCode("90997");

		// 可选:outId为提供给业务方扩展字段,最终在短信回执消息中将此值带回给调用者
		request.setOutId("yourOutId");

		// hint 此处可能会抛出异常，注意catch
		SendSmsResponse sendSmsResponse = acsClient.getAcsResponse(request);
		if (sendSmsResponse.getCode() != null && sendSmsResponse.getCode().equals("OK")) {
			System.out.println("短信发送成功！");
		} else {
			System.out.println("短信发送失败！");
		}
		return sendSmsResponse;
	}
	
	// 以下为测试代码，随机生成验证码
	private static int newcode;

	public static int getNewcode() {
		return newcode;
	}

	public static void setNewcode() {
		newcode = (int) (Math.random() * 9999) + 100; // 每次调用生成一次四位数的随机数
	}

	public static void main(String[] args) throws Exception {
		setNewcode();
		String code = Integer.toString(getNewcode());
//		SendSmsResponse sendSms = sendSms("15570870075", code);// 填写你需要测试的手机号码
//		SendSmsResponse sendSms = sendSms("18934270299", code);// 填写你需要测试的手机号码
		
		SendSmsResponse sendSms = sendSms("15570870075", code, "水牛用户", "SMS_180050363");// 填写你需要测试的手机号码
		System.out.println("短信接口返回的数据----------------");
		System.out.println("Code=" + sendSms.getCode());
		System.out.println("Message=" + sendSms.getMessage());
		System.out.println("RequestId=" + sendSms.getRequestId());
		System.out.println("BizId=" + sendSms.getBizId());

	}

}
