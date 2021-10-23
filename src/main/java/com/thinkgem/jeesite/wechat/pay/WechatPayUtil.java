package com.thinkgem.jeesite.wechat.pay;

import com.thinkgem.jeesite.wechat.config.CommonConfig;
import com.thinkgem.jeesite.wechat.pay.data.JsAPIParaData;
import com.thinkgem.jeesite.wechat.pay.data.OrderQueryData;
import com.thinkgem.jeesite.wechat.pay.data.RequestData;
import com.thinkgem.jeesite.wechat.pay.data.ResponseData;
import com.thinkgem.jeesite.wechat.pay.security.Digests;
import com.thoughtworks.xstream.XStream;
import com.thoughtworks.xstream.io.xml.DomDriver;
import com.thoughtworks.xstream.io.xml.XmlFriendlyNameCoder;
import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.client.config.RequestConfig;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.util.EntityUtils;
import org.apache.log4j.Logger;

import javax.servlet.http.HttpServletRequest;
import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.Map;
import java.util.UUID;

/**
 * 微信支付工具类
 * @author Keith
 *
 */
public class WechatPayUtil {
	
	private static Logger logger = Logger.getLogger(WechatPayUtil.class);

	/**
     * 调用统一下单API用户获得预支付id prepay_id
     * @param requestData
     * @return
     * @throws Exception
     */
    public static String sendPaymentPost(RequestData requestData) throws Exception {
        String result = null;
        String url = "https://api.mch.weixin.qq.com/pay/unifiedorder";
        HttpPost httpPost = new HttpPost(url);
        XStream xStreamForRequestPostData = new XStream(new DomDriver("UTF-8", new XmlFriendlyNameCoder("-_", "_")));
        String postDataXML = xStreamForRequestPostData.toXML(requestData);

        StringEntity postEntity = new StringEntity(postDataXML, "UTF-8");
        httpPost.addHeader("Content-Type", "text/xml");
        httpPost.setEntity(postEntity);
        RequestConfig requestConfig = RequestConfig.custom().setSocketTimeout(10000).setConnectTimeout(30000).build();
        httpPost.setConfig(requestConfig);

        logger.info("统一下单POST过去的数据是:");
        logger.info(postDataXML);
        try {
            CloseableHttpClient httpClient = HttpClients.createDefault();
            HttpResponse response = httpClient.execute(httpPost);
            HttpEntity entity = response.getEntity();
            result = EntityUtils.toString(entity, "UTF-8");
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            httpPost.abort();
        }
        logger.info("统一下单返回的数据是:");
        logger.info(result);
        return result;
    }
    
    /**
     * 获取预支付id prepay_id
     * @param requestData
     * @return
     * @throws Exception 
     */
    public static String getPrepay_id(RequestData requestData) throws Exception {
    	String responseDataString = sendPaymentPost(requestData);
    	ResponseData responseData = PaymentUtil.getResponseData(responseDataString);
        String prepay_id = null; // 预支付交易会话标识
        if (responseData != null && "SUCCESS".equals(responseData.getReturn_code()) && "SUCCESS".equals(responseData.getResult_code()) ) {
            prepay_id = responseData.getPrepay_id();
        }
        return prepay_id;
    }
    
    /**
     * 生成jsapi页面调用的支付参数并签名
     * @param request
     * @param requestData
     * @param apiKey
     * @param prepay_id
     * @return
     */
    public static JsAPIParaData generatePaySign(HttpServletRequest request, RequestData requestData, String apiKey, String prepay_id, String ticket) {
    	JsAPIParaData obj = new JsAPIParaData();
        String timestamp = String.valueOf(new Date().getTime() / 1000);
        String url = request.getRequestURL().toString() + "?" + request.getQueryString();
        String result = "jsapi_ticket=" + ticket + "&noncestr=" + requestData.getNonce_str() + "&timestamp=" + timestamp + "&url=" + url;
        String signature = Digests.sha1(result);
        String paySignString = "appId=" + requestData.getAppid() + "&nonceStr=" + requestData.getNonce_str() + "&package=prepay_id=" + prepay_id
                + "&signType=MD5" + "&timeStamp=" + timestamp + "&key="+ apiKey;
        String paySign = Digests.md5(paySignString).toUpperCase();
        obj.setTimestamp(timestamp);
        obj.setSignature(signature);
        obj.setRequestData(requestData);
        obj.setPaySign(paySign);
        return obj;
    }
    
    
    /**
     * 封装RequestData
     * @return
     * @throws IllegalAccessException 
     */
    public static RequestData packRequestData(Map<String, Object> para) throws Exception {
    	//微信支付
        RequestData requestData = new RequestData();
        requestData.setAppid((String)para.get("appid"));                 //公众账号ID (是)
        requestData.setMch_id((String)para.get("mch_id"));                //商户号  (是)
        requestData.setDevice_info("WEB");  // 设备号  自定义参数，可以为终端设备号(门店号或收银设备ID)，PC网页或公众号内支付可以传"WEB"  (否)
        requestData.setNonce_str(UUID.randomUUID().toString().replace("-", ""));  //随机字符串  (是)
        requestData.setSign_type("MD5");// 签名类型 (否)
        requestData.setBody("破笼球场");                   //商品描述  (是)
        requestData.setDetail(""); // 商品详情  (否)
        requestData.setAttach(""); // 附加数据 (否)
        requestData.setOut_trade_no((String)para.get("out_trade_no"));           //商户订单号  (是)
        requestData.setFee_type("CNY"); // 标价币种 默认:CNY (否)
//        requestData.setTotal_fee((int) ( ((BigDecimal)para.get("total_fee")).multiply(new BigDecimal("100")).floatValue() )); //标价金额<订单总金额，单位：分>暂时未1分 (是)
        requestData.setTotal_fee( ((BigDecimal)para.get("total_fee")).intValue()); //标价金额<订单总金额，单位：分>暂时未1分 (是)
        requestData.setSpbill_create_ip((String)para.get("spbill_create_ip"));    //终端IP (是)
        
        Calendar calendar = Calendar.getInstance ();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
        requestData.setTime_start(sdf.format(calendar.getTime())); // 交易起始时间 (否)
        calendar.add (Calendar.SECOND, CommonConfig.ORDER_TIME_OUT_SET); // 15分钟后
        requestData.setTime_expire(sdf.format(calendar.getTime())); // 交易结束时间	 (否)
        
        requestData.setGoods_tag(""); // 商品标记, 使用代金券或立减优惠功能时需要的参数  (否)
        
        requestData.setNotify_url((String)para.get("notify_url"));//通知地址 <付款成功后回调通知地址>(不能带参数，所以在下面的Attach中带参数) (是)
        
        requestData.setTrade_type("JSAPI");                          // 交易类型<取值如下：JSAPI，NATIVE，APP等> (是) 
        requestData.setProduct_id(""); // 商品ID trade_type=NATIVE时（即扫码支付），此参数必传。此参数为二维码中包含的商品ID，商户自行定义  (否)
        requestData.setLimit_pay(""); // 指定支付方式, 上传此参数no_credit--可限制用户不能使用信用卡支付 (否)
        requestData.setOpenid((String)para.get("openid"));                //用户标识
        
        String StringSign = PaymentUtil.getSign(requestData);
        String sign = Digests.md5(StringSign + "key="+(String)para.get("apiKey")).toUpperCase();
        requestData.setSign(sign); // 签名,通过签名算法计算得出的签名值 (是)
        
        return requestData;
    }
    
    
    
    /**
     * 封装RequestData
     * @param para 参数Map
     * appid 公众账号ID
     * mch_id 商户号
     * out_trade_no 商户订单号
     * apiKey apiKey
     * @return
     * @throws IllegalAccessException 
     */
    public static OrderQueryData packOrderQueryData(Map<String, Object> para) throws Exception {
    	//微信支付
    	OrderQueryData data = new OrderQueryData();
    	data.setAppid((String)para.get("appid"));                 //公众账号ID (是)
    	data.setMch_id((String)para.get("mch_id"));                //商户号  (是)
    	data.setNonce_str(UUID.randomUUID().toString().replace("-", ""));  //随机字符串  (是)
    	data.setSign_type("MD5");// 签名类型 (否)
    	data.setOut_trade_no((String)para.get("out_trade_no"));           //商户订单号  (是)
    	
        String StringSign = PaymentUtil.getSign(data);
        String sign = Digests.md5(StringSign + "key="+(String)para.get("apiKey")).toUpperCase();
        data.setSign(sign); // 签名,通过签名算法计算得出的签名值 (是)
        
        return data;
    }
	
    
    /**
     * 查询微信支付订单（用于检测本系统的支付订单是否发起过支付，如发起过，则返回success，则需要变更支付订单号后再次发起支付）
     * @param para
     * @return
     * @throws Exception 
     */
    public static String payQuery(Map<String, Object> para) throws Exception {
    	OrderQueryData data = packOrderQueryData(para);
    	String result = null;
        String url = "https://api.mch.weixin.qq.com/pay/orderquery";
        HttpPost httpPost = new HttpPost(url);
        XStream xStreamForRequestPostData = new XStream(new DomDriver("UTF-8", new XmlFriendlyNameCoder("-_", "_")));
        
//        Map<String, Object> map = new HashMap<String, Object>();
//        map.put("appid", requestData.getAppid());
//        map.put("mch_id", requestData.getMch_id());
//        map.put("transaction_id", ""); // 微信订单id，暂时没用到
//        map.put("out_trade_no", requestData.getOut_trade_no()); 
//        map.put("nonce_str", requestData.getNonce_str()); 
//        map.put("sign", requestData.getSign()); 
//        map.put("sign_type", requestData.getSign_type()); 
        String postDataXML = xStreamForRequestPostData.toXML(data);
        StringEntity postEntity = new StringEntity(postDataXML, "UTF-8");
        httpPost.addHeader("Content-Type", "text/xml");
        httpPost.setEntity(postEntity);
        RequestConfig requestConfig = RequestConfig.custom().setSocketTimeout(10000).setConnectTimeout(30000).build();
        httpPost.setConfig(requestConfig);

        logger.info("查询订单POST过去的数据是:");
        logger.info(postDataXML);
        try {
            CloseableHttpClient httpClient = HttpClients.createDefault();
            HttpResponse response = httpClient.execute(httpPost);
            HttpEntity entity = response.getEntity();
            result = EntityUtils.toString(entity, "UTF-8");
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            httpPost.abort();
        }
        logger.info("查询订单返回的数据是:");
        logger.info(result);
        return result;
    }
    
    /**
     * 检测微信支付订单（用于检测本系统的支付订单是否发起过支付，如发起过，则返回true，则需要变更支付订单号后再次发起支付）
     * @param para
     * @return
     * @throws Exception 
     */
    public static boolean orderIsSubmit(Map<String, Object> para) throws Exception {
    	String responseDataString = payQuery(para);
    	ResponseData responseData = PaymentUtil.getResponseData(responseDataString);
        if (responseData != null && "SUCCESS".equals(responseData.getReturn_code()) && "SUCCESS".equals(responseData.getResult_code()) ) {
            return true;
        }
    	return false;
    }
}
