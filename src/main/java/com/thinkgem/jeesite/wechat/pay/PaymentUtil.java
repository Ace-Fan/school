package com.thinkgem.jeesite.wechat.pay;

import com.thinkgem.jeesite.wechat.pay.data.ResponseData;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
import org.xml.sax.SAXException;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;
import java.io.*;
import java.lang.reflect.Field;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Map;


/**
 * 支付工具类
 * @author Administrator
 *
 */
public class PaymentUtil {

    public static void main(String args[]){
        BigDecimal newPrice = new BigDecimal(900.98*90/100);
        newPrice = newPrice.setScale(2, BigDecimal.ROUND_HALF_UP);
        System.out.println(newPrice.floatValue()+"==============================");
    }

    public static InputStream getStringStream(String sInputString) throws UnsupportedEncodingException {
        ByteArrayInputStream tInputStringStream = null;
        if (sInputString != null && !sInputString.trim().equals("")) {
            tInputStringStream = new ByteArrayInputStream(sInputString.getBytes("UTF-8"));
        }
        return tInputStringStream;
    }

    public static String inputStreamToString(InputStream is) throws IOException {
        ByteArrayOutputStream baos = new ByteArrayOutputStream();
        int i;
        while ((i = is.read()) != -1) {
            baos.write(i);
        }
        return baos.toString();
    }

    public static String getSign(Object o) throws IllegalAccessException {
        ArrayList<String> list = new ArrayList<String>();
        Class<? extends Object> cls = o.getClass();
        Field[] fields = cls.getDeclaredFields();
        for (Field f : fields) {
            f.setAccessible(true);
            if (f.get(o) != null && f.get(o) != "") {
                list.add(f.getName() + "=" + f.get(o) + "&");
            }
        }
        int size = list.size();
        String [] arrayToSort = list.toArray(new String[size]);
        Arrays.sort(arrayToSort, String.CASE_INSENSITIVE_ORDER);
        StringBuilder sb = new StringBuilder();
        for(int i = 0; i < size; i ++) {
            sb.append(arrayToSort[i]);
        }
        return sb.toString();
    }

    public static ResponseData getResponseData(String responseDataString) throws IOException, SAXException, ParserConfigurationException {
        Map<String,Object> map = PaymentUtil.getMapFromXML(responseDataString);
        ResponseData responseData = new ResponseData();
        responseData.setReturn_code((String)map.get("return_code"));
        responseData.setReturn_msg((String)map.get("return_msg"));
        responseData.setAppid((String)map.get("appid"));
        responseData.setMch_id((String)map.get("mch_id"));
        responseData.setDevice_info((String)map.get("device_info"));
        responseData.setNonce_str((String)map.get("nonce_str"));
        responseData.setSign((String)map.get("sign"));
        responseData.setResult_code((String)map.get("result_code"));
        responseData.setErr_code((String)map.get("err_code"));
        responseData.setErr_code_des((String)map.get("err_code_des"));
        responseData.setTrade_type((String)map.get("trade_type"));
        responseData.setPrepay_id((String)map.get("prepay_id"));
        responseData.setCode_url((String)map.get("code_url"));
        responseData.setOpenid((String)map.get("openid"));
        responseData.setIs_subscribe((String)map.get("is_subscribe"));
        responseData.setBank_type((String)map.get("bank_type"));
        responseData.setTotal_fee((String)map.get("total_fee"));
        responseData.setCoupon_fee((String)map.get("coupon_fee"));
        responseData.setFee_type((String)map.get("fee_type"));
        responseData.setTransaction_id((String)map.get("transaction_id"));
        responseData.setOut_trade_no((String)map.get("out_trade_no"));
        responseData.setAttach((String)map.get("attach"));
        responseData.setTime_end((String)map.get("time_end"));
        return responseData;
    }

    public static Map<String,Object> getMapFromXML(String xmlString) throws ParserConfigurationException, IOException, SAXException {

        //这里用Dom的方式解析回包的最主要目的是防止API新增回包字段
        DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
        DocumentBuilder builder = factory.newDocumentBuilder();
        InputStream is =  PaymentUtil.getStringStream(xmlString);
        Document document = builder.parse(is);

        //获取到document里面的全部结点
        NodeList allNodes = document.getFirstChild().getChildNodes();
        Node node;
        Map<String, Object> map = new HashMap<String, Object>();
        int i=0;
        while (i < allNodes.getLength()) {
            node = allNodes.item(i);
            if(node instanceof Element){
                map.put(node.getNodeName(),node.getTextContent());
            }
            i++;
        }
        return map;

    }
    
}

