package com.thinkgem.jeesite.modules.base.entity;

/**
 * @title 上传文件服务器返回对象
 * @author weekly
 * @version V19.09.18
 */
public class FileUploadRes {
	
	private String success;			// 成功状态
	private String message;			// 返回信息
	private String code;			// 状态编码
	private String timestamp;		// 返回时间戳
	private String result;			// 返回结果
	public String getSuccess() {
		return success;
	}
	public void setSuccess(String success) {
		this.success = success;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public String getTimestamp() {
		return timestamp;
	}
	public void setTimestamp(String timestamp) {
		this.timestamp = timestamp;
	}
	public String getResult() {
		return result;
	}
	public void setResult(String result) {
		this.result = result;
	}
	@Override
	public String toString() {
		return "FileUploadRes [success=" + success + ", message=" + message + ", code=" + code + ", timestamp="
				+ timestamp + ", result=" + result + "]";
	}
	
}
