package com.thinkgem.jeesite.wechat.message;

import java.lang.reflect.Field;
import java.util.HashMap;
import java.util.Map;

import com.thoughtworks.xstream.XStream;
import com.thoughtworks.xstream.io.xml.DomDriver;
import com.thoughtworks.xstream.io.xml.XmlFriendlyNameCoder;

public class RequestReplyMessage {

    private String ToUserName;            //接收方帐号（收到的OpenID）
    private String FromUserName;           //开发者微信号
    private long CreateTime;      //消息创建时间 （整型）
    private String MsgType = "text";        //text
    private String Content;             //回复的消息内容

    public String getToUserName() {
        return ToUserName;
    }

    public void setToUserName(String toUserName) {
        ToUserName = toUserName;
    }

    public String getFromUserName() {
        return FromUserName;
    }

    public void setFromUserName(String fromUserName) {
        FromUserName = fromUserName;
    }

    public long getCreateTime() {
        return CreateTime;
    }

    public void setCreateTime(long createTime) {
        CreateTime = createTime;
    }

    public String getMsgType() {
        return MsgType;
    }

    public void setMsgType(String msgType) {
        MsgType = msgType;
    }

    public String getContent() {
        return Content;
    }

    public void setContent(String content) {
        Content = content;
    }

    public Map<String,Object> toMap(){
        Map<String,Object> map = new HashMap<String, Object>();
        Field[] fields = this.getClass().getDeclaredFields();
        for (Field field : fields) {
            Object obj;
            try {
                obj = field.get(this);
                if(obj!=null){
                    map.put(field.getName(), obj);
                }
            } catch (IllegalArgumentException e) {
                e.printStackTrace();
            } catch (IllegalAccessException e) {
                e.printStackTrace();
            }
        }
        return map;
    }

    public static void main(String args[]){
        RequestReplyMessage requestData = new RequestReplyMessage();
        requestData.setToUserName("aaa");
        requestData.setContent("bbb");
        requestData.setCreateTime(System.currentTimeMillis());
        requestData.setFromUserName("ffff");
        XStream xStreamForRequestPostData = new XStream(new DomDriver("UTF-8", new XmlFriendlyNameCoder("-_", "_")));
        String postDataXML = xStreamForRequestPostData.toXML(requestData);
        System.out.println(postDataXML);
        System.out.println(postDataXML.replaceAll("com.rongtongtec.weishop.web.message.RequestReplyMessage", "xml"));


    }

}
