package com.thinkgem.jeesite.modules.card.utils;

import java.util.Random;

/**
 * @Author Keith
 * @Date 2018/5/30 15:43
 */
public class RandomUtil {

    /**
     * 获取随机数(数字)
     * @param sum
     * @return
     */
    public static String getRandomNum(int sum) {
        String[] strs = new String[]{"0", "1", "2", "3", "4", "5", "6", "7", "8", "9"};
        Random rd = new Random();
        String str = "";
        for (int i = 0; i < sum; i++) {
            str += strs[rd.nextInt(strs.length - 1)];
        }
        return str;
    }

}
