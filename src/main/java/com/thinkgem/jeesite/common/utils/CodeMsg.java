package com.thinkgem.jeesite.common.utils;

/**
 * 
 * @ClassName:  CodeMsg   
 * @Description:错误码及异常信息常量
 * @author:  zhenhua
 * @date:   2018年10月30日 下午5:04:24   
 *     
 * @Copyright: 2018 jjtm Inc. All rights reserved.
 */
public class CodeMsg {
	private int code;
	private String msg;
	// 按照模块定义CodeMsg
	// 通用异常
	public static CodeMsg SUCCESS = new CodeMsg(0,"success");
	public static CodeMsg SERVER_EXCEPTION = new CodeMsg(500100,"服务端异常");
	public static CodeMsg PARAMETER_ISNULL = new CodeMsg(500101,"输入参数为空");
	// 业务异常
	public static CodeMsg USER_NOT_EXSIST = new CodeMsg(500102,"用户不存在"); 
	public static CodeMsg ONLINE_USER_OVER = new CodeMsg(500103,"在线用户数超出允许登录的最大用户限制。"); 
	public static CodeMsg SESSION_NOT_EXSIST =  new CodeMsg(500104,"不存在离线session数据");
	public static CodeMsg NOT_FIND_DATA = new CodeMsg(500105,"无数据");
	public CodeMsg(int code, String msg) {
		this.code = code;
		this.msg = msg;
	}
	public int getCode() {
		return code;
	}
	public void setCode(int code) {
		this.code = code;
	}
	public String getMsg() {
		return msg;
	}
	public void setMsg(String msg) {
		this.msg = msg;
	}
}
