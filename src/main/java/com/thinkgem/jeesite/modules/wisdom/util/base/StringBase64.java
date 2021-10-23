package com.thinkgem.jeesite.modules.wisdom.util.base;

import java.util.Base64;

import sun.misc.BASE64Decoder;
import sun.misc.BASE64Encoder;

/**
 * @title BASE64 加密解密
 * @author weekly
 * @version V19.09.22
 */
@SuppressWarnings("restriction")
public class StringBase64 {

	 /**
     * BASE64解密
     * @throws Exception
     */
    public static byte[] decryptBASE64(String key) throws Exception {
        return (new BASE64Decoder()).decodeBuffer(key);
    }
 
    /**
     * BASE64加密
     */
    public static String encryptBASE64(byte[] key) throws Exception {
        return (new BASE64Encoder()).encodeBuffer(key);
    }
    
    /**
     * BASE64加密解密
     */
    public static void enAndDeCode(String str) throws Exception {
        String data = encryptBASE64(str.getBytes());
        System.out.println("sun.misc.BASE64 加密后：" + data);
 
        byte[] byteArray = decryptBASE64(data);
        System.out.println("sun.misc.BASE64 解密后：" + new String(byteArray));
    }
    
    /**
     * Base64
     *
     */
    public static void base64(String str) {
        byte[] bytes = str.getBytes();
 
        //Base64 加密
        String encoded = Base64.getEncoder().encodeToString(bytes);
        System.out.println("Base 64 加密后：" + encoded);
 
        //Base64 解密
        byte[] decoded = Base64.getDecoder().decode(encoded);
 
        String decodeStr = new String(decoded);
        System.out.println("Base 64 解密后：" + decodeStr);
 
        System.out.println();
    }
	
}
