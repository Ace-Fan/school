package com.thinkgem.jeesite.wechat.pay.data;

/**
 * 生成jsapi页面调用的支付参数data
 * @author Administrator
 *
 */
public class JsAPIParaData {
     
     private String timestamp; // 时间戳
     
     private String signature; // 签名
     
     private RequestData requestData;
     
     private String paySign; // 支付签名 

	public String getTimestamp() {
		return timestamp;
	}

	public void setTimestamp(String timestamp) {
		this.timestamp = timestamp;
	}

	public String getSignature() {
		return signature;
	}

	public void setSignature(String signature) {
		this.signature = signature;
	}

	public RequestData getRequestData() {
		return requestData;
	}

	public void setRequestData(RequestData requestData) {
		this.requestData = requestData;
	}

	public String getPaySign() {
		return paySign;
	}

	public void setPaySign(String paySign) {
		this.paySign = paySign;
	}
     
     
	
}
