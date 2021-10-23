package com.thinkgem.jeesite.wechat.menu;


import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.thinkgem.jeesite.wechat.util.WeixinUtil;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * 创建菜单
 * 
 * @author jack
 * @version 1.0
 *
 */
public class MenuUtil {

	private static Logger logger = LoggerFactory.getLogger(MenuUtil.class);

	// 创建菜单接口
	public static final String MENU_CREATE_URL = "https://api.weixin.qq.com/cgi-bin/menu/create?access_token=ACCESS_TOKEN";

	/**
	 * 创建菜单
	 * 
	 * @param menu
	 * @param access_token
	 * @return
	 */
	public static boolean createMenu(Menu menu, String access_token) {
		boolean result = false;

		String url = MENU_CREATE_URL.replace("ACCESS_TOKEN", access_token);

		// 将菜单对象转换为json数据

		String jsonMenu = JSON.toJSONString(menu);

		logger.info("待创建菜单对象的json格式串为:" + jsonMenu);

		JSONObject jsonObj = WeixinUtil.httpsRequest(url, "POST", jsonMenu);

		if (null != jsonObj) {
			int errorCode = jsonObj.getInteger("errcode");
			String errorMsg = jsonObj.getString("errmsg");
			logger.debug("errorCode:" + errorCode);
			logger.debug("errorMsg:" + errorMsg);

			if (0 == errorCode) {
				result = true;
			} else {
				result = false;
			}
		}

		return result;
	}
}
