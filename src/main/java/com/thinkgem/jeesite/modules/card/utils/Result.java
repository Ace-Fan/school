package com.thinkgem.jeesite.modules.card.utils;

import java.math.BigDecimal;

/**
 * 信息处理
 * 
 * @author Keith
 *
 */
public class Result {

	private String msg;
	private Object data;
	private int code = -1; // -1代表失败
	private boolean isSuccess = false; // false代表调用失败
	private BigDecimal count;	
	
	public BigDecimal getCount() {
		return count;
	}
	public void setCount(BigDecimal count) {
		this.count = count;
	}
	public String getMsg() {
		return msg;
	}
	public void setMsg(String msg) {
		this.msg = msg;
	}
	public Object getData() {
		return data;
	}
	public void setData(Object data) {
		this.data = data;
	}
	public int getCode() {
		return code;
	}
	public void setCode(int code) {
		this.code = code;
	}
	public boolean isSuccess() {
		return isSuccess;
	}
	public void setSuccess(boolean isSuccess) {
		this.isSuccess = isSuccess;
	}
	@Override
	public String toString() {
		return "Result [msg=" + msg + ", data=" + data + ", code=" + code + ", isSuccess=" + isSuccess + "]";
	}
	
}
