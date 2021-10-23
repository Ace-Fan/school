package com.thinkgem.jeesite.wechat.qrcode;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;

/**
 * Created by Administrator on 2017/12/5.
 */
public class QrcodeUtil {


    public String getTicket(String token) throws Exception {
        String urlTicket = "https://api.weixin.qq.com/cgi-bin/qrcode/create?access_token=" + token;
        String ticket = null;
        try {
            URL url = new URL(urlTicket);
            HttpURLConnection connection = (HttpURLConnection) url.openConnection();
            connection.setConnectTimeout(5000);
            connection.setRequestMethod("POST");
            connection.setDoOutput(true);
            connection.setDoInput(true);
            connection.setUseCaches(false);
            connection.setInstanceFollowRedirects(true);
            connection.setRequestProperty("Content-Type", "application/x-www-form-urlencoded");
            connection.connect();

            DataOutputStream out = new DataOutputStream(connection.getOutputStream());
            JSONObject sceneIdObj = new JSONObject();
            sceneIdObj.put("scene_id", "ZMCN_CER_ID_1");

            JSONObject sceneObj = new JSONObject();
            sceneIdObj.put("scene", sceneIdObj.toString());

            JSONObject obj = new JSONObject();
//            obj.element("expire_seconds", 1800);              //临时二维码
//            obj.element("action_name", "QR_SCENE");           //临时二维码
            obj.put("action_name", "QR_LIMIT_SCENE");   //长久二维码
            obj.put("action_info", sceneObj.toString());

            out.writeBytes(obj.toString());
            out.flush();
            out.close();
            if (connection.getResponseCode() == HttpURLConnection.HTTP_OK) {
                BufferedReader reader = new BufferedReader(new InputStreamReader(connection.getInputStream()));
                JSONArray array = JSONArray.parseArray("[" + reader.readLine() + "]");
                JSONObject jsonObject = array.getJSONObject(0);
                if (jsonObject.get("ticket") != null) {
                    ticket = (String) jsonObject.get("ticket");
                }
                reader.close();
            }
            connection.disconnect();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return ticket;
    }

}
