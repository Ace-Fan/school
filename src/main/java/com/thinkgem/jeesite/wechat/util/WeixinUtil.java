package com.thinkgem.jeesite.wechat.util;


import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.thinkgem.jeesite.wechat.vo.Token;

import javax.net.ssl.HttpsURLConnection;
import javax.net.ssl.SSLContext;
import javax.net.ssl.SSLSocketFactory;
import javax.net.ssl.TrustManager;
import java.io.*;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.security.KeyManagementException;
import java.security.NoSuchAlgorithmException;
import java.security.NoSuchProviderException;

/**
 * 发送https请求的通用工具类
 * 
 * @author jack
 * @version 1.0
 *
 */
public class WeixinUtil {

	/**
	 * 发送https请求
	 *
	 * @param requestUrl
	 * @param requestMethod
	 * @param outputStr
	 * @return
	 */
	public static JSONObject httpsRequest(String requestUrl, String requestMethod, String outputStr) {
		JSONObject jsonObject = null;
		// 创建SSLContext对象，并使用我们指定的信任管理器初始化
		TrustManager[] tm = { new MyX509TrustManager() };
		// 安全套接字的上下文
		SSLContext sslContext;
		try {
			sslContext = SSLContext.getInstance("SSL", "SunJSSE");
			sslContext.init(null, tm, new java.security.SecureRandom());
			// 从上述SSLContext对象中得到SSLSocketFactory对象
			SSLSocketFactory ssf = sslContext.getSocketFactory();
			// 建立连接
			URL url = new URL(requestUrl);
			// 打开连接
			HttpsURLConnection conn = (HttpsURLConnection) url.openConnection();
			conn.setSSLSocketFactory(ssf);
			conn.setDoInput(true);
			conn.setDoOutput(true);
			conn.setUseCaches(false);
			// 设置请求方式
			conn.setRequestMethod(requestMethod);
			if (null != outputStr) {
				OutputStream outputStream = conn.getOutputStream();
				outputStream.write(outputStr.getBytes("UTF-8"));
				outputStream.close();
			}
			// 从输入流中获取返回的内容
			InputStream inputStream = conn.getInputStream();
			InputStreamReader reader = new InputStreamReader(inputStream, "utf-8");
			BufferedReader bufferReader = new BufferedReader(reader);
			String str = null;
			StringBuffer buffer = new StringBuffer();
			while ((str = bufferReader.readLine()) != null) {
				buffer.append(str);
			}
			bufferReader.close();
			reader.close();
			inputStream.close();
			conn.disconnect();
			jsonObject = JSONObject.parseObject(buffer.toString());
		} catch (NoSuchAlgorithmException | NoSuchProviderException e) {
			e.printStackTrace();
		} catch (KeyManagementException e) {
			e.printStackTrace();
		} catch (MalformedURLException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return jsonObject;
	}

	/**
	 * 
	 * 获取接口访问凭证 token
	 * 
	 * @param appid
	 * @param appSecret
	 * @return
	 */
	public static Token getToken(String appid, String appSecret) {
		final String token_url = "https://api.weixin.qq.com/cgi-bin/token?grant_type=client_credential&appid=APPID&secret=APPSECRET";;
		Token token = null;
		// APPID&secret=APPSECRET
		// 将请求路径中的APPID和APPSECRET替换调
		String requestUrl = token_url.replace("APPID", appid).replace("APPSECRET", appSecret);
		// 返回json对象
		JSONObject jsonObject = httpsRequest(requestUrl, "GET", null);
		if (null != jsonObject) {
			token = new Token();
			// 从json对象中获取access_token和expires_in
			token.setAccess_token(jsonObject.getString("access_token"));
			token.setExpires_in(jsonObject.getString("expires_in"));
		}
		return token;
	}

	/**
	 * 根据内容类型来判断返回文件的扩展名
	 * 
	 * @param contentType
	 *            内容类型
	 * @return
	 */
	public static String getFileExt(String contentType) {
		String fileExt = "";
		System.out.println("contentType:" + contentType);
		if ("image/jpeg".equals(contentType))
			fileExt = ".jpg";
		else if ("audio/mpeg".equals(contentType))
			fileExt = ".mp3";
		else if ("audio/amr".equals(contentType))
			fileExt = ".amr";
		else if ("video/mp4".equals(contentType))
			fileExt = ".mp4";
		else if ("video/mpeg4".equals(contentType))
			fileExt = ".mp4";
		return fileExt;
	}

	/**
	 * URL编码（utf-8）
	 * 
	 * @param source
	 * @return
	 */
	public static String urlEncodeUTF8(String source) {
		String result = source;
		try {
			result = java.net.URLEncoder.encode(source, "utf-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		return result;
	}
	
	/**
	 * 获取openid
	 * @param code
	 * @return
	 * @throws Exception
	 */
    public static String getOepnid(String code, String appid, String appsecret) throws Exception {
        String openid = null;
        String urlToken="https://api.weixin.qq.com/sns/oauth2/access_token?appid="+appid+"&secret="+appsecret+"&code="+code+"&grant_type=authorization_code";
        try {
            URL url = new URL(urlToken);
            HttpURLConnection connection = (HttpURLConnection) url.openConnection();
            connection.setConnectTimeout(5000);
            connection.setRequestMethod("GET");
            connection.connect();
            if (connection.getResponseCode() == HttpURLConnection.HTTP_OK) {
                BufferedReader reader = new BufferedReader(new InputStreamReader(connection.getInputStream()));
                JSONArray array = JSONArray.parseArray("["+reader.readLine()+"]");
                JSONObject jsonObject = array.getJSONObject(0);
                if(jsonObject.get("openid")!=null){
                    openid = (String)jsonObject.get("openid");
                }
                reader.close();
            }
            connection.disconnect();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return openid;
    }
    
    /**
     * Auth2.0方式获取code
     * @param appid
     * @param redirectURL
     * @param stateParameter
     * @param scopePrivate
     * @return
     */
    public static String generateAuth20URL(String appid, String redirectURL, String stateParameter, boolean scopePrivate){
        String redirect_uri = redirectURL;
        String scope = scopePrivate ? "snsapi_base" : "snsapi_userinfo";
        String state = stateParameter;
        String url = "https://open.weixin.qq.com/connect/oauth2/authorize?appid="+appid+"&redirect_uri="+redirect_uri+"&response_type=code&scope="+scope+"&state="+state+"#wechat_redirect";
        return url;
    }
    

	
	
	/**
     * 获得JsapiTicket
     * @param access_token
     * @return
     * @throws Exception
     */
    public static String getTicket(String access_token) throws Exception {
        String ticket = null;
        String urlTicket = "https://api.weixin.qq.com/cgi-bin/ticket/getticket?access_token=" + access_token + "&type=jsapi";
        try {
            URL url = new URL(urlTicket);
            HttpURLConnection connection = (HttpURLConnection) url.openConnection();
            connection.setConnectTimeout(5000);
            connection.setRequestMethod("GET");
            connection.connect();
            if (connection.getResponseCode() == HttpURLConnection.HTTP_OK) {
                BufferedReader reader = new BufferedReader(new InputStreamReader(connection.getInputStream()));
                JSONArray array = JSONArray.parseArray("["+reader.readLine()+"]");
                JSONObject jsonObject = array.getJSONObject(0);
                if(jsonObject.get("ticket")!=null){
                    ticket = (String)jsonObject.get("ticket");
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
