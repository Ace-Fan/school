/**  
 * All rights Reserved, Designed By jjtm
 * @Title:  AESUtil.java   
 * @Package com.thinkgem.jeesite.modules.mch.utils   
 * @Description:    TODO(用一句话描述该文件做什么)   
 * @author: Administrator    
 * @date:   2018年11月2日 下午1:55:19   
 * @version V1.0 
 * @Copyright: 2018 jjtm Inc. All rights reserved. 
 */
package com.thinkgem.jeesite.modules.card.utils;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import java.security.SecureRandom;

import javax.crypto.BadPaddingException;
import javax.crypto.Cipher;
import javax.crypto.IllegalBlockSizeException;
import javax.crypto.KeyGenerator;
import javax.crypto.NoSuchPaddingException;
import javax.crypto.SecretKey;
import javax.crypto.spec.SecretKeySpec;

import sun.misc.BASE64Decoder;
import sun.misc.BASE64Encoder;

/**   
 * @ClassName:  AESUtil   
 * @Description:TODO(这里用一句话描述这个类的作用)   
 * @author:  Derk
 * @date:   2018年11月2日 下午1:55:19   
 *     
 * @Copyright: 2018 jjtm Inc. All rights reserved.  
 */
@SuppressWarnings("restriction")
public class AESUtil {
	
	// 加密
	public static String AESEncode(String encodeRules, String content)
	  {
	    try
	    {
	      KeyGenerator keygen = KeyGenerator.getInstance("AES");
	      SecureRandom random = SecureRandom.getInstance("SHA1PRNG");
	      random.setSeed(encodeRules.getBytes());

	      keygen.init(128, random);

	      SecretKey original_key = keygen.generateKey();

	      byte[] raw = original_key.getEncoded();

	      SecretKey key = new SecretKeySpec(raw, "AES");

	      Cipher cipher = Cipher.getInstance("AES");

	      cipher.init(1, key);

	      byte[] byte_encode = content.getBytes("utf-8");

	      byte[] byte_AES = cipher.doFinal(byte_encode);

	      String AES_encode = new String(new BASE64Encoder().encode(byte_AES));

	      return AES_encode;
	    } catch (NoSuchAlgorithmException e) {
	      e.printStackTrace();
	    } catch (NoSuchPaddingException e) {
	      e.printStackTrace();
	    } catch (InvalidKeyException e) {
	      e.printStackTrace();
	    } catch (IllegalBlockSizeException e) {
	      e.printStackTrace();
	    } catch (BadPaddingException e) {
	      e.printStackTrace();
	    } catch (UnsupportedEncodingException e) {
	      e.printStackTrace();
	    }

	    return null;
	  }
		
	// 解密
	  public static String AESDncode(String encodeRules, String content)
	  {
	    try
	    {
	      KeyGenerator keygen = KeyGenerator.getInstance("AES");
	      SecureRandom random = SecureRandom.getInstance("SHA1PRNG");
	      random.setSeed(encodeRules.getBytes());

	      keygen.init(128, random);

	      SecretKey original_key = keygen.generateKey();

	      byte[] raw = original_key.getEncoded();

	      SecretKey key = new SecretKeySpec(raw, "AES");

	      Cipher cipher = Cipher.getInstance("AES");

	      cipher.init(2, key);

	      byte[] byte_content = new BASE64Decoder().decodeBuffer(content);

	      byte[] byte_decode = cipher.doFinal(byte_content);
	      String AES_decode = new String(byte_decode, "utf-8");
	      return AES_decode;
	    } catch (NoSuchAlgorithmException e) {
	      e.printStackTrace();
	    } catch (NoSuchPaddingException e) {
	      e.printStackTrace();
	    } catch (InvalidKeyException e) {
	      e.printStackTrace();
	    } catch (IOException e) {
	      e.printStackTrace();
	    } catch (IllegalBlockSizeException e) {
	      e.printStackTrace();
	    } catch (BadPaddingException e) {
	      e.printStackTrace();
	    }

	    return null;
	  }

	  public static String AESDncode2(String content, String encodeRules)
	  {
	    try
	    {
	      KeyGenerator keygen = KeyGenerator.getInstance("AES");

	      SecureRandom random = SecureRandom.getInstance("SHA1PRNG");
	      random.setSeed(encodeRules.getBytes());

	      keygen.init(128, random);

	      SecretKey original_key = keygen.generateKey();

	      byte[] raw = original_key.getEncoded();

	      SecretKey key = new SecretKeySpec(raw, "AES");

	      Cipher cipher = Cipher.getInstance("AES");

	      cipher.init(2, key);

	      byte[] byte_content = new BASE64Decoder().decodeBuffer(content);

	      byte[] byte_decode = cipher.doFinal(byte_content);
	      String AES_decode = new String(byte_decode, "utf-8");
	      return AES_decode;
	    } catch (NoSuchAlgorithmException e) {
	      e.printStackTrace();
	    } catch (NoSuchPaddingException e) {
	      e.printStackTrace();
	    } catch (InvalidKeyException e) {
	      e.printStackTrace();
	    } catch (IOException e) {
	      e.printStackTrace();
	    } catch (IllegalBlockSizeException e) {
	      e.printStackTrace();
	    } catch (BadPaddingException e) {
	      e.printStackTrace();
	    }

	    return null;
	  }

	 /* public static void main(String[] args) {
	    AESUtil se = new AESUtil();
	    Scanner scanner = new Scanner(System.in);

	    System.out.println("使用AES对称加密，请输入加密的规则");
	    String encodeRules = scanner.next();
	    System.out.println("请输入要加密的内容:");
	    String content = scanner.next();
	    System.out.println("根据输入的规则" + encodeRules + "加密后的密文是:" + AESEncode(encodeRules, content));

	    System.out.println("使用AES对称解密，请输入加密的规则：(须与加密相同)");
	    encodeRules = scanner.next();
	    System.out.println("请输入要解密的内容（密文）:");
	    content = scanner.next();
	    System.out.println("根据输入的规则" + encodeRules + "解密后的明文是:" + AESDncode(encodeRules, content));
	  }*/
}
