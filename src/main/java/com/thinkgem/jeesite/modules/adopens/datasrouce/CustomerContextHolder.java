package com.thinkgem.jeesite.modules.adopens.datasrouce;

import org.apache.commons.lang3.StringUtils;

/**
 * Created by Administrator on 2017/4/25.
 */
public class CustomerContextHolder {
    public static final String DATA_SOURCE = "dataSource";
    public static final String DATA_SOURCE2 = "dataSource2";
    //用ThreadLocal来设置当前线程使用哪个dataSource
    private static final ThreadLocal<String> contextHolder = new ThreadLocal<String>();

    public static void setCustomerType(String customerType) {
        contextHolder.set(customerType);
    }

    public static String getCustomerType() {
        String dataSource = contextHolder.get();
        if (StringUtils.isEmpty(dataSource)) {
            return DATA_SOURCE2;
        } else {
            return dataSource;
        }
    }

    public static void clearCustomerType() {
        contextHolder.remove();
    }
}
