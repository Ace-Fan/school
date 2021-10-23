package com.thinkgem.jeesite.modules.adopens.interceptor;

import com.thinkgem.jeesite.wechat.util.WeixinUtil;
import org.apache.commons.lang3.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.net.URLEncoder;

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
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object arg2) throws Exception {
        String url = request.getRequestURL().toString();
        String queryString = request.getQueryString();
        if (StringUtils.isNoneBlank(queryString)) {
        	url += "?" +  queryString;
        }
		logger.info("openid拦截器中请求的url："+url);
        String code = request.getParameter("code");
        String openid = request.getParameter("openid");
		return true;
	}
	

}
