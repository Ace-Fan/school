package com.thinkgem.jeesite.wechat.annotation;

import java.lang.annotation.*;

/**
 * 忽略openid检查
 * @author Keith
 * @date 2017-8-19 15:41
 */
@Target(ElementType.METHOD)
@Retention(RetentionPolicy.RUNTIME)
@Documented
public @interface IgnoreOpenId {

}
