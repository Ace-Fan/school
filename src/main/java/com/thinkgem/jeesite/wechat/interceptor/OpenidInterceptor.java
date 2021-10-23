package com.thinkgem.jeesite.wechat.interceptor;

import com.thinkgem.jeesite.modules.adopens.util.KeyUtil;
import com.thinkgem.jeesite.modules.adopens.util.ParaUtil;
import com.thinkgem.jeesite.wechat.annotation.IgnoreOpenId;
import com.thinkgem.jeesite.wechat.util.WeixinUtil;
import org.apache.commons.lang3.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.net.URLEncoder;
import java.util.Map;
import java.util.Set;

@Component
public class OpenidInterceptor implements HandlerInterceptor {

	private Logger logger = Logger.getLogger(OpenidInterceptor.class);
	
	
	@Override
	public void afterCompletion(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, Exception arg3)
			throws Exception {
		
	}

	@Override
	public void postHandle(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, ModelAndView arg3)
			throws Exception {
		
	}

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {

		IgnoreOpenId annotation;
		if(handler instanceof HandlerMethod) {
			annotation = ((HandlerMethod) handler).getMethodAnnotation(IgnoreOpenId.class);
		}else{
			return true;
		}

		//如果有@IgnoreOpenId，则不验证是否有openid
		if(annotation != null){
			return true;
		}
		return true;

	}

	private String doUrl(Map<String, String> map, String url) {
		StringBuilder sb = new StringBuilder();
		Set<Map.Entry<String, String>> entries = map.entrySet();
		int i = 0;
		for (Map.Entry<String, String> x : entries) {
			if (i == 0) {
				sb.append("?");
			}
			sb.append(x.getKey()).append("=").append(x.getValue());
			if (i < entries.size()-1) {
				sb.append("&");
			}
			i++;
		}
		url = url + sb.toString();
		return url;
	}
	

}
