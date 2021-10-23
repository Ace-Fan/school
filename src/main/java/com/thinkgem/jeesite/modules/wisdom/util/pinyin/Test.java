package com.thinkgem.jeesite.modules.wisdom.util.pinyin;

public class Test {
	public static void main(String[] args) throws PinyinException {
		String pinyinName = "你好";
		// 获取简称
		String name = PinyinHelper.getShortPinyin(pinyinName);
		// 获取全拼
		String nameStr = PinyinHelper.getFullPinyin(pinyinName);
		
		System.out.println(name);
		System.out.println(nameStr);
	}
}
