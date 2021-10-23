package com.thinkgem.jeesite.modules.wm.util;

/**
 * 获取最大值编号工具类
 * @author weekly
 * @version V19.08.20
 */
public class MaxCodeUtil {
	
	/**
	 * 传递编码长度，基础编码，最大值编码获取初始化编码
	 * @param codeLength	编码长度
	 * @param baseCode		基础编码
	 * @param maxCode		最大值编码
	 * @return
	 */
	public static String getInitCode(int codeLength, int baseCode, String maxCode) {
		for (int i = 0; i < codeLength-1; i++) { // 返回int型，拼接前面字符串"0"
			if (i==0) {
				maxCode = "0" + baseCode;
			} else {
				maxCode = "0" + maxCode;
			}
		}
		return maxCode;
	}
	
	/**
	 * 依据传递的最大值编码，编码长度获取自动生成的最大值编码
	 * @param maxCode		最大值编码
	 * @param codeLength	编码长度
	 * @return
	 */
	public static String getMaxCode(String maxCode, int codeLength) {
		int maxCodeInt = Integer.valueOf(maxCode);	// 最大值编码转为整形
		System.out.println(maxCodeInt);
		maxCodeInt = maxCodeInt + 1;				// 获取最大值编码-数字
		String maxCodeStr = maxCodeInt + "";		// 最大值编码-字符串
		System.out.println(maxCodeStr);
		
		int maxCodeLength = maxCodeStr.length();		// 最大值编码长度
		System.out.println(maxCodeLength);
		
		for (int i = maxCodeLength; i < codeLength; i++) { 	// 最大值编码字符串处理
			maxCodeStr = "0" + maxCodeStr;
		}
		
		maxCode = maxCodeStr;
		return maxCode;
	}
	
	/**
	 * 获取有编码的最大编码
	 * @param codeSufixLenth	后缀编码长度
	 * @param baseCode			基础编码
	 * @param maxCode			最大值编码
	 * @param codePrefix		前缀编码
	 * @return
	 */
	public static String getHasInitCode(int codeSufixLenth, int baseCode, String maxCode, String codePrefix) {
		System.out.println(codeSufixLenth+"==================================");
		System.out.println(baseCode+"=============================================");
		System.out.println(maxCode+"=============================================");
		System.out.println(codePrefix+"=============================================");
		
		for (int i = 0; i < codeSufixLenth-1; i++) { // 返回int型，拼接前面字符串"0"
			if (i==0) {
				maxCode = "0" + baseCode;
			} else {
				maxCode = "0" + maxCode;
			}
		}
		maxCode = codePrefix + maxCode; // 拼接前缀编码
		return maxCode;
	}
	
	/**
	 * 获取自动生成后缀编码
	 * @param codePrefix		前缀编码
	 * @param maxSufixStr		后缀编码
	 * @param codeSufixLenth	后缀编码长度
	 * @return
	 */
	public static String getHasMaxCode(String codePrefix, String maxSufixStr, int codeSufixLenth) {
		int maxSufixStrInt = Integer.valueOf(maxSufixStr);			// 后缀最大值编码转为整形
		maxSufixStrInt = maxSufixStrInt + 1;						// 获取最大值编码-数字
		String maxSufixStrCode = maxSufixStrInt + "";				// 最大值编码-字符串
		int maxSufixStrCodeLength = maxSufixStrCode.length();		// 后缀最大值编码长度
		
		for (int i = maxSufixStrCodeLength; i < codeSufixLenth; i++) { // 最大值编码字符串处理
			maxSufixStrCode = "0" + maxSufixStrCode;
		}
		String maxCode = codePrefix + maxSufixStrCode;
		return maxCode;
	}

	public static void main(String[] args) {
		System.out.println(getMaxCode("000001", 6));
	}
	
}
