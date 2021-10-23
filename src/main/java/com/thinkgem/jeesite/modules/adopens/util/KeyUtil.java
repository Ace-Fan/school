package com.thinkgem.jeesite.modules.adopens.util;

import java.util.UUID;

/**
 * Created by Administrator on 2017/4/11.
 */
public class KeyUtil {
    public static String genKey() {
        return UUID.randomUUID().toString().replaceAll("-", "");
    }
}
