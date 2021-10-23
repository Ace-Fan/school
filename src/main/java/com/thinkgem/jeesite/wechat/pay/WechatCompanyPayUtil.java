package com.thinkgem.jeesite.wechat.pay;

import com.thinkgem.jeesite.wechat.pay.data.CompanyPayRequestData;
import com.thinkgem.jeesite.wechat.pay.security.Digests;
import com.thoughtworks.xstream.XStream;
import com.thoughtworks.xstream.io.xml.DomDriver;
import com.thoughtworks.xstream.io.xml.XmlFriendlyNameCoder;
import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.client.config.RequestConfig;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.conn.ssl.SSLConnectionSocketFactory;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.ssl.SSLContexts;
import org.apache.http.util.EntityUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.stereotype.Component;

import javax.net.ssl.SSLContext;
import java.io.File;
import java.io.FileInputStream;
import java.security.KeyStore;
import java.util.Map;

/**
 * 微信支付工具类
 * @author Keith
 *
 */
@Component
@PropertySource(value = {"classpath:school.properties"})
public class WechatCompanyPayUtil {
	
	private static Logger logger = Logger.getLogger(WechatCompanyPayUtil.class);

    @Value(value="${certPath}")
	private String certPath;

    /**
     * 企业付款
     * @return
     */
    public static String sendPaymentPostByCompany(CompanyPayRequestData data) throws Exception {
        String result = null;
        String url = "https://api.mch.weixin.qq.com/mmpaymkttransfers/promotion/transfers";

        //指定读取证书格式为PKCS12
        KeyStore keyStore = KeyStore.getInstance("PKCS12");
        //读取本机存放的PKCS12证书文件

        String os = System.getProperty("os.name").toLowerCase();
        String path;
        if (os.indexOf("linux")>=0) {
            path = "/disk2/cb_server/webadmin/cert/apiclient_cert.p12";
        } else {
            path = "E:/cert/apiclient_cert.p12";
        }
        FileInputStream instream = new FileInputStream(new File(path));
        try {
        //指定PKCS12的密码(商户ID)
            keyStore.load(instream, data.getMchid().toCharArray());
        } finally {
            instream.close();
        }
        SSLContext sslcontext = SSLContexts.custom()
                .loadKeyMaterial(keyStore, data.getMchid().toCharArray()).build();
        //指定TLS版本
        SSLConnectionSocketFactory sslsf = new SSLConnectionSocketFactory(
                sslcontext,new String[] { "TLSv1" },null,
                SSLConnectionSocketFactory.BROWSER_COMPATIBLE_HOSTNAME_VERIFIER);
        //设置httpclient的SSLSocketFactory
        CloseableHttpClient httpclient = HttpClients.custom()
                .setSSLSocketFactory(sslsf)
                .build();

        HttpPost httpPost = new HttpPost(url);
        XStream xStreamForRequestPostData = new XStream(new DomDriver("UTF-8", new XmlFriendlyNameCoder("-_", "_")));
        String postDataXML = xStreamForRequestPostData.toXML(data);

        StringEntity postEntity = new StringEntity(postDataXML, "UTF-8");
        httpPost.addHeader("Content-Type", "text/xml");
        httpPost.setEntity(postEntity);
        RequestConfig requestConfig = RequestConfig.custom().setSocketTimeout(10000).setConnectTimeout(30000).build();
        httpPost.setConfig(requestConfig);

        logger.info("企业付款POST过去的数据是:");
        logger.info(postDataXML);
        try {
            HttpResponse response = httpclient.execute(httpPost);
            HttpEntity entity = response.getEntity();
            result = EntityUtils.toString(entity, "UTF-8");
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            httpPost.abort();
        }
        logger.info("企业付款返回的数据是:");
        logger.info(result);

        return result;
    }



    public static String pay(Map<String, Object> para) throws Exception {
        CompanyPayRequestData data = new CompanyPayRequestData();
        data.setMch_appid((String)para.get("mch_appid"));
        data.setMchid((String)para.get("mchid"));
        data.setNonce_str((String)para.get("nonce_str"));
        data.setPartner_trade_no((String)para.get("partner_trade_no"));
        data.setOpenid((String)para.get("openid"));
        data.setCheck_name((String)para.get("check_name")); //NO_CHECK：不校验真实姓名 FORCE_CHECK：强校验真实姓名
        data.setAmount(Integer.valueOf((String)para.get("amount")));
        data.setDesc((String)para.get("desc"));
        data.setSpbill_create_ip((String)para.get("spbill_create_ip"));
        String apikey = (String)para.get("apikey");

        String stringSign = PaymentUtil.getSign(data);
        String sign = Digests.md5(stringSign+"key="+apikey).toUpperCase();
        data.setSign(sign);
        return WechatCompanyPayUtil.sendPaymentPostByCompany(data);
    }

}
