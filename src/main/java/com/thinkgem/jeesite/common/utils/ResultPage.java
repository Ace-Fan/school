package com.thinkgem.jeesite.common.utils;

import com.thinkgem.jeesite.modules.base.util.GetOrgUtil;

/**
 * 
 * @ClassName: Result
 * @Description:TODO 控制器返回结果集
 * @author: zhenhua
 * @date: 2018年10月30日 下午3:56:03
 * 
 * @param <T>
 * @Copyright: 2018 jjtm Inc. All rights reserved.
 */
public class ResultPage<T> {

	private Integer code; // 校验码
	private String msg; // 响应信息
	private Integer count; // 数据记录数
	private T data; // 数据集
	
	// 获取服务器的url
	public static String imgUrl = GetOrgUtil.getUrlValue("imgServerPath");
	// 获取接口的url
	public static String interfaceUrl = GetOrgUtil.getUrlValue("interfacePath");
	
	/**
	 * 
	 * @Title: success @Description: 成功时调用 @param: @param data 数据集 @param: @param
	 *         count 数据记录数 @param: @return @return: Result<T> @throws
	 */
	public static <T> ResultPage<T> success(Integer count, T data) {
		return new ResultPage<T>(count, data);
	}

	public static <T> ResultPage<T> success(T data) {
		return new ResultPage<T>(data);
	}

	/**
	 * 
	 * @Title: success @Description: 成功时调用(不需要传递参数时) @param: @return @return:
	 *         Result<T> @throws
	 */
	@SuppressWarnings("unchecked")
	public static <T> ResultPage<T> success() {
		return (ResultPage<T>) success(0, "");
	}

	/**
	 * 
	 * @Title: error @Description: 失败时调用 @param: @param cm @param: @return @return:
	 *         Result<T> @throws
	 */
	public static <T> ResultPage<T> error(CodeMsg cm) {
		return new ResultPage<T>(cm);
	}

	public Integer getCode() {
		return code;
	}

	public void setCode(Integer code) {
		this.code = code;
	}

	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}

	public Integer getCount() {
		return count;
	}

	public void setCount(Integer count) {
		this.count = count;
	}

	public T getData() {
		return data;
	}

	public void setData(T data) {
		this.data = data;
	}

	private ResultPage(CodeMsg cm) {
		if (cm == null) {
			return;
		}
		this.code = cm.getCode();
		this.msg = cm.getMsg();
	}

	private ResultPage(Integer count, T data) {
		this.code = 0;
		this.msg = "成功";
		this.count = count;
		this.data = data;
	}

	private ResultPage(T data) {
		this.code = 200;
		this.msg = "成功";
		this.data = data;
	}

	@Override
	public String toString() {
		return "CodeMsg [code=" + code + ", msg=" + msg + ", count=" + count + ", data=" + data + "]";
	}

	/**
	 * 除去拼接的逗号
	 * 
	 * @param imgsUrl
	 * @return String
	 */
	public static String imgsString(String imgsUrl) {
		String caseImage = "";
		if (imgsUrl != null) {
			// 定义一个数组用于接受图片字符串
			String[] case_image_arr = imgsUrl.split(",");
			for (int i = 0; i < case_image_arr.length; i++) {
				// 判断是否有多余的逗号
				if (!"".equals(case_image_arr[i])) {
					// 判断caseImage是否为空
					if ("".equals(caseImage)) {
						caseImage = case_image_arr[i];
					} else {
						caseImage = caseImage + "," + case_image_arr[i];
					}
				}
			}
		}
		return caseImage;
	}

	
	/**
	 * 分割图片地址
	 * 
	 * @param imgsUrl
	 * @return List
	 */
	public static String imgsList(String imgsUrl) {
		String caseImage = "";
		if (imgsUrl != null) {
			// 定义一个数组用于接受图片字符串
			String[] case_image_arr = imgsUrl.split(",");
			for (int i = 0; i < case_image_arr.length; i++) {
				if (!"".equals(case_image_arr[i])) {
					if (i == 0) {
						caseImage = caseImage + imgUrl + case_image_arr[i];
					} else {
						caseImage = caseImage + "," + imgUrl + case_image_arr[i];
					}
				}
			}
		}
		return caseImage;
	}

}
