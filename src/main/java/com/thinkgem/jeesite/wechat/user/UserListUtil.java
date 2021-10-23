package com.thinkgem.jeesite.wechat.user;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONException;
import com.alibaba.fastjson.JSONObject;
import com.thinkgem.jeesite.wechat.util.WeixinUtil;
import com.thinkgem.jeesite.wechat.vo.UserInfo;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;


/**
 * 获取用户列表的实用工具类
 *
 * @author jack
 * @version 1.0
 */
public class UserListUtil {

    private static Logger logger = LoggerFactory.getLogger(UserListUtil.class);

    /**
     * @param accessToken:token
     * @param nextOpenId:拉取的openId
     * @return
     */
    public static UserList getUserList(String accessToken, String nextOpenId) {
        //返回值的对象
        UserList weixinUserList = null;
        if (null == nextOpenId) {
            nextOpenId = "";
        }
        //获取用户列表接口
        String requestUrl = "https://api.weixin.qq.com/cgi-bin/user/get?access_token=ACCESS_TOKEN&next_openid=NEXT_OPENID";

        //替换成具体的参数
        requestUrl = requestUrl.replace("ACCESS_TOKEN", accessToken).replace("NEXT_OPENID", nextOpenId);

        //调用接口，发送https请求
        //http请求
        JSONObject jsonObject = WeixinUtil.httpsRequest(requestUrl, "GET", null);

        if (null != jsonObject) {
            try {
                weixinUserList = new UserList();
                weixinUserList.setTotal(jsonObject.getInteger("total"));
                weixinUserList.setCount(jsonObject.getInteger("count"));
                weixinUserList.setNextOpenId(jsonObject.getString("next_openid"));
                JSONObject dataObject = (JSONObject) jsonObject.get("data");
                //讲json数组转为list集合
                weixinUserList.setOpenIdList(JSONArray.parseArray(JSONArray.toJSONString(dataObject.getJSONArray("openid")), String.class));

            } catch (JSONException e) {
                e.printStackTrace();
            }
        }
        return weixinUserList;
    }



    /**
     * 4.获取用户详细信息
     *
     * @param accessToken
     * @param openid
     * @param language
     * @return
     */
    public static UserInfo getUserInfo(String accessToken, String openid, String language) {
        //请求路径
        String requestUrl = "https://api.weixin.qq.com/cgi-bin/user/info?access_token=ACCESS_TOKEN&openid=OPENID&lang=LANGUAGE";
        requestUrl = requestUrl.replace("ACCESS_TOKEN", accessToken).replace("OPENID", openid).replace("LANGUAGE", language);

        // 获取用户的基本信息
        JSONObject jsonObject = WeixinUtil.httpsRequest(requestUrl, "GET", null);
        UserInfo userInfo = null;
        if (null != jsonObject) {
            try {
                userInfo = new UserInfo();
                userInfo.setSubscribe(jsonObject.getInteger("subscribe"));
                userInfo.setOpenid(jsonObject.getString("openid"));
                userInfo.setNickname(jsonObject.getString("nickname"));
                userInfo.setSex(jsonObject.getInteger("sex"));
                userInfo.setLanguage(jsonObject.getString("language"));
                userInfo.setCity(jsonObject.getString("city"));
                userInfo.setCountry(jsonObject.getString("country"));
                userInfo.setProvince(jsonObject.getString("province"));
                userInfo.setHeadimgurl(jsonObject.getString("headimgurl"));
                userInfo.setSubscribe_time(jsonObject.getInteger("subscribe_time"));
                userInfo.setUnionid(jsonObject.getString("unionid"));
            } catch (JSONException e) {
                if (0 == userInfo.getSubscribe()) {
                    logger.debug("用户已经取消关注了...");
                } else {
                    int errorCode = jsonObject.getInteger("errcode");
                    String errorMsg = jsonObject.getString("errmsg");
                    logger.debug("错误代码:"+errorCode+"，错误信息:"+errorMsg);
                }
            }
        }
        return userInfo;
    }
}
