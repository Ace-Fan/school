package com.thinkgem.jeesite.modules.wm.util;

import com.github.binarywang.java.emoji.EmojiConverter;

/**
 * emojiUril 表情工具类
 * @author Administrator
 *
 */
public class EmojiUtil {

	private EmojiConverter emojiConverter = EmojiConverter.getInstance();

	/**
	 * 将emojiStr转为 带有表情的字符
	 * 
	 * @param emojiStr
	 * @return
	 */
	public String emojiConverterUnicodeStr(String emojiStr) {
		String result = emojiConverter.toUnicode(emojiStr);
		return result;
	}

	/**
	 * 带有表情的字符串转换为编码
	 * 
	 * @param str
	 * @return
	 */
	public String emojiConverterToAlias(String str) {
		String result = emojiConverter.toAlias(str);
		return result;
	}

}
