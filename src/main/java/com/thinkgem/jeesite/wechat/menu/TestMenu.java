package com.thinkgem.jeesite.wechat.menu;


import com.thinkgem.jeesite.wechat.util.WeixinUtil;
import com.thinkgem.jeesite.wechat.vo.Token;

/**
 * 测试如何创建菜单
 * 
 * @author jack
 * @version 1.0
 *
 */
public class TestMenu {
	/**
	 * 
	 * 构建菜单数据
	 * 
	 * @return
	 */
	public static Menu generateMenuData() {
		// 构建二级菜单
		ViewButton bt1 = new ViewButton();

		bt1.setName("附近球场");
		bt1.setType("view");
		bt1.setUrl("http://www.rongtongedu.com/api/wechat/ballField/toNearBallField.shtml");

		ViewButton bt2 = new ViewButton();
		bt2.setName("球场预定");
		bt2.setType("view");
		bt2.setUrl("http://www.rongtongedu.com/api/wechat/ballField/toReserveBallField.shtml");
		
		ViewButton bt7 = new ViewButton();
		bt7.setName("赛事报名");
		bt7.setType("view");
		bt7.setUrl("http://www.rongtongedu.com/api/wechat/match/toMatchInfo.shtml");

		ViewButton bt3 = new ViewButton();
		bt3.setName("视频");
		bt3.setType("view");
//		bt3.setUrl("http://www.rongtongedu.com/api/wechat/video/toVideoList.shtml");
		bt3.setUrl("http://www.rongtongedu.com/api/wechat/video/toVideoListWithType.shtml");
		
		
		ViewButton bt4 = new ViewButton();
		bt4.setName("个人中心");
		bt4.setType("view");
		bt4.setUrl("http://www.rongtongedu.com/api/wechat/user/toUserCenter.shtml");
		
		ViewButton bt5 = new ViewButton();
		bt5.setName("粤为商城");
		bt5.setType("view");
		bt5.setUrl("http://www.qq.com");
		
		ViewButton bt6 = new ViewButton();
		bt6.setName("关于");
		bt6.setType("view");
		bt6.setUrl("http://www.rongtongedu.com/api/wechat/about/info.shtml");

		// 构建一级菜单
		ComplexButton mainBtn1 = new ComplexButton();
		mainBtn1.setName("球场");
		mainBtn1.setSub_button(new Button[] { bt1, bt2, bt7 });// ,bt4,bt5
		
		// 构建一级菜单
		ComplexButton mainBtn3 = new ComplexButton();
		mainBtn3.setName("更多信息");
		mainBtn3.setSub_button(new Button[] { bt4, bt5, bt6 });// ,bt4,bt5

		Menu menu = new Menu();
		menu.setButton(new Button[] { mainBtn1, bt3, mainBtn3 });

		return menu;
	}

	/**
	 * 开始生成
	 * 
	 * @param args
	 */
	public static void main(String[] args) {
		
		String appid = "22";
		String appSecret = "222";

		// 获取token
		Token token = WeixinUtil.getToken(appid, appSecret);
		System.out.println("token:" + token);
		boolean result = false;
		if (null != token) {
			result = MenuUtil.createMenu(generateMenuData(), token.getAccess_token());
			if (result) {
				System.out.println("创建菜单成功!");
			}
		}

		// MenuUtil.createMenu(generateMenuData(),
		// "s6OZnJFdzbVpwihxx8-MnM7Pw1_KiLX27ghkTMfxKdbwLGmFS7CWbKXsZ8V00CoSExqKWzQNgLHcGZ_QgzQirDYx7pIJUFq4vLT5_Ezt9nmzmanNjdbK8dAhy0FsUHJ_CGBiAIAXBW");

	}
}
