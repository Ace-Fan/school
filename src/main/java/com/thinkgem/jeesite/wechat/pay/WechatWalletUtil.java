package com.thinkgem.jeesite.wechat.pay;

import com.thinkgem.jeesite.wechat.pay.data.WalletRequestData;
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

import javax.net.ssl.SSLContext;
import java.io.File;
import java.io.FileInputStream;
import java.security.KeyStore;
import java.util.Map;

/**
 * 微信红包工具类
 * @author Keith
 *
 */
public class WechatWalletUtil {
	
	private static Logger logger = Logger.getLogger(WechatWalletUtil.class);

    /**
     * 发送普通红包
     * @return
     */
    public static String sendPaymentPostByCompany(WalletRequestData data) throws Exception {
        String result = null;
        String url = "https://api.mch.weixin.qq.com/mmpaymkttransfers/sendredpack";

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
            keyStore.load(instream, data.getMch_id().toCharArray());
        } finally {
            instream.close();
        }
        SSLContext sslcontext = SSLContexts.custom()
                .loadKeyMaterial(keyStore, data.getMch_id().toCharArray()).build();
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

        logger.info("发送普通红包POST过去的数据是:");
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
        logger.info("发送普通红包返回的数据是:");
        logger.info(result);

        return result;
    }



    public static String pay(Map<String, String> para) throws Exception {
        WalletRequestData data = new WalletRequestData();

        data.setNonce_str(para.get("nonce_str"));
        data.setMch_billno(para.get("mch_billno"));
        data.setMch_id(para.get("mch_id"));
        data.setWxappid(para.get("wxappid"));
        data.setSend_name(para.get("send_name"));
        data.setRe_openid(para.get("re_openid"));
        data.setTotal_amount(Integer.parseInt(para.get("total_amount")));
        data.setTotal_num(Integer.parseInt(para.get("total_num")));
        data.setWishing(para.get("wishing"));
        data.setClient_ip(para.get("client_ip"));
        data.setAct_name(para.get("act_name"));
        data.setRemark(para.get("remark"));
        data.setScene_id(para.get("scene_id"));
        data.setRisk_info(para.get("risk_info"));
        data.setConsume_mch_id(para.get("consume_mch_id"));

        String apikey = (String)para.get("apikey");
        String stringSign = PaymentUtil.getSign(data);
        String sign = Digests.md5(stringSign+"key="+apikey).toUpperCase();
        data.setSign(sign);
        return WechatWalletUtil.sendPaymentPostByCompany(data);
    }

}
