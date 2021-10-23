//全局数据和函数
var rtmain = {
	userID: 0,
	fromUserID: 0,
	openID: "",
	storeID: 0,
	mobileNum: "",
	storeShortName: "",
	provinceID: 0,
	provinceName: "",
	cityID: 0,
	currlevel: "",
	mobileNum: "",
	cityName: "",
	countyID: 0,
	countyName: "",
	userKey: "",
	validImgKey: "",
	smsCode: "",
	fogetPassSmsCode: "",
	sex: "",
	aid: "",
	qrcodekey:"",
	regSource: "WEB",
	//ajaxServerUrl: "http://39.108.186.141:8080/cardmanager/f/", //    "http://localhost:3136/",  //
	//subpageDomainUrl: "http://39.108.186.141:8080/cardmanager/f/",

	//39.108.186.141
	ajaxServerUrl: "http://www.ynjisu.com/cardmanager/f/", //    "http://localhost:3136/",  //
	domainUrl: "http://www.ynjisu.com",
	subpageDomainUrl: "http://www.ynjisu.com/cardmanager/",

	//ajaxServerUrl: "http://192.168.1.12:8080/cardmanager/f/", //    "http://localhost:3136/",  //  
	//subpageDomainUrl: "http://192.168.1.12:8080/cardmanager/f/"

	openWin: function(pagename, levels) {
		//alert("111");
		var pageurl = "";
		var pageid = "";
		var rootPath = "";

		switch(levels) {
			case 1:
				rootPath = "";
				break;
			case 2:
				rootPath = "../";
				break;
			case 3:
				rootPath = "../../";
				break;
			default:
				rootPath = "";
				break;
		}

		switch(pagename) {

			case "AccountBook":
				pageurl = rootPath + "AccountBook.html";
				pageid = "AccountBook";
				break;
			case "main":

				pageurl = rootPath + "main.html";
				pageid = "main";
				//alert(pageurl);

				break;

			case "index":

				pageurl = rootPath + "index.html";
				pageid = "index";
				//alert(pageurl);
				break;

			case "userIndex": //我的个人中心
				pageurl = rootPath + "mine/userIndex.html";
				pageid = "userIndex";
				//alert(pageurl);
				break;

			case "mainShare": //分享
				pageurl = rootPath + "mine/sharePage.html";
				pageid = "mainShare";
				break;

			case "shareQrcode": //分享二维码
				pageurl = rootPath + "shareQrcode.html";
				pageid = "shareQrcode";
				break;

			case "agentCenter":
				//alert("1111");
				pageurl = rootPath + "mine/agentCenter.html";
				pageid = "agentCenter";
				//alert(pageurl);
				break;

			case "intelligentRepayment":
				pageurl = rootPath + "intelligentRepayment.html";
				pageid = "intelligentRepayment";
				break;

			case "accountBalance":
				pageurl = rootPath + "accountBalance.html";
				pageid = "accountBalance";
				break;

			case "incomeDetail":
				pageurl = rootPath + "incomeDetail.html";
				pageid = "incomeDetail";
				break;

			case "yetx": //余额提现
				pageurl = rootPath + "balanceWithdraw.html";
				pageid = "balanceWithdraw";
				break;

			case "txmx": //提现明细
				pageurl = rootPath + "withdrawDetail.html";
				pageid = "withdrawDetail";
				break;

			case "agentUpgrade": //升级
				pageurl = rootPath + "agentUpgrade.html";
				pageid = "agentUpgrade";
				break;

			case "userQuery": //累计用户量
				pageurl = rootPath + "userQuery.html";
				pageid = "userQuery";
				break;

			case "myTeam": //代理数量
				pageurl = rootPath + "myTeam.html";
				pageid = "myTeam";
				break;

			case "CreditCardsPlan": //还款计划
				pageurl = rootPath + "cardPlan.html";
				pageid = "cardPlan";
				break;

			case "nosubmitPlan": //未提交还款计划
				pageurl = rootPath + "nosubmitPlan.html";
				pageid = "cardPlan";
				break;

			case "repaymentList": //未提交还款计划
				pageurl = rootPath + "repaymentList.html";
				pageid = "cardPlan";
				break;

			case "userCert": //实名认证
				pageurl = rootPath + "userCert.html";
				pageid = "userCert";
				break;

			case "myCard": //我的信用卡
				pageurl = rootPath + "myCard.html";
				pageid = "myCard";
				break;

			case "setting": //设置
				pageurl = rootPath + "setting.html";
				pageid = "setting";
				break;

			case "cardBind": //添加信用卡
				pageurl = rootPath + "cardBind.html";
				pageid = "cardBind";
				break;

			case "AccountBookList":
				pageurl = rootPath + "AccountBookList.html";
				pageid = "AccountBookList";
				break;
			case "AccountBookDetail":
				pageurl = rootPath + "AccountBookDetail.html";
				pageid = "AccountBookDetail";
				break;
			case "ApplicationPage":
				pageurl = rootPath + "ApplicationPage.html";
				pageid = "ApplicationPage";
				break;
			case "Index":
				pageurl = rootPath + "Index.html";
				pageid = "Index";
				break;
			case "ShopIndex":
				pageurl = rootPath + "ShopIndex.html";
				pageid = "ShopIndex";
				break;

			case "userLogin":
				pageurl = rootPath + "userLogin.html";
				pageid = "userLogin";
				break;

			case "UserPwd":
				pageurl = rootPath + "userFoget.html";
				pageid = "UserPwd";
				break;

			case "UserReg":
				pageurl = rootPath + "userRegister.html";
				pageid = "UserReg";
				break;

			case "SharePae":
				pageurl = rootPath + "SharePae.html";
				pageid = "SharePae";
				break;
			case "ShareReg":
				pageurl = rootPath + "ShareReg.html";
				pageid = "ShareReg";
				break;
			case "shareDownload":
				pageurl = rootPath + "goDownload";
				pageid = "shareDownload";
				break;
			case "UserIndex":
				pageurl = rootPath + "User/UserIndex.html";
				pageid = "UserIndex";
				break;
			case "CreditCardsBinding":
				pageurl = rootPath + "User/CreditCardsBinding.html";
				pageid = "CreditCardsBinding";
				break;
			case "CreditCardsBindingEdit":
				pageurl = rootPath + "User/CreditCardsBindingEdit.html";
				pageid = "CreditCardsBindingEdit";
				break;
			case "CreditCardsPlan":
				pageurl = rootPath + "User/CreditCardsPlan.html";
				pageid = "CreditCardsPlan";
				break;
			case "CreditCardsPlanDate":
				pageurl = rootPath + "User/CreditCardsPlanDate.html";
				pageid = "CreditCardsPlanDate";
				break;
			case "CreditCardsPlanList":
				pageurl = rootPath + "User/CreditCardsPlanList.html";
				pageid = "CreditCardsPlanList";
				break;
			case "CreditCardsPlanListSubmit":
				pageurl = rootPath + "User/CreditCardsPlanListSubmit.html";
				pageid = "CreditCardsPlanListSubmit";
				break;
			case "UserPWDAlter":
				pageurl = rootPath + "User/UserPWDAlter.html";
				pageid = "UserPWDAlter";
				break;
			case "UserInfo":
				pageurl = rootPath + "User/UserInfo.html";
				pageid = "UserInfo";
				break;
			case "UserCertification":
				pageurl = rootPath + "User/UserCertification.html";
				pageid = "UserCertification";
				break;
			case "VersionsDetail":
				pageurl = rootPath + "User/VersionsDetail.html";
				pageid = "VersionsDetail";
				break;
			case "UserRecharge":
				pageurl = rootPath + "User/UserRecharge.html";
				pageid = "UserRecharge";
				break;
			case "UserDeposits":
				pageurl = rootPath + "User/UserDeposits.html";
				pageid = "UserDeposits";
				break;
			case "UserDepositsLog":
				pageurl = rootPath + "User/UserDepositsLog.html";
				pageid = "UserDepositsLog";
				break;
			case "CircleOfFriends":
				pageurl = rootPath + "User/CircleOfFriends.html";
				pageid = "CircleOfFriends";
				break;
			case "StoreIndex":
				pageurl = rootPath + "User/StoreIndex.html";
				pageid = "StoreIndex";
				break;
			case "StoreQRCode":
				pageurl = rootPath + "User/StoreQRCode.html";
				pageid = "StoreQRCode";
				break;
			case "StoreUpgrade":
				pageurl = rootPath + "User/StoreUpgrade.html";
				pageid = "StoreUpgrade";
				break;
			case "UserCount":
				pageurl = rootPath + "User/UserCount.html";
				pageid = "UserCount";
				break;
			case "UserCountDetail":
				pageurl = rootPath + "User/UserCountDetail.html";
				pageid = "UserCountDetail";
				break;
		}

		// alert("pageurl:"+pageurl);

		if(pageurl != "" && pageid != "") {
			//alert("ok1111");
			//  mMain.pageExtras.push("fromUserID=" + mMain.fromUserID);
			var autoShow = false;
			var aniShow = "pop-in";
			var duration = 0;
			var title = "";
			switch("android") {
				case "ios":
					duration = 300;
					break;
				case "android":
					autoShow = true;
					duration = 200;
					title = "加载中请稍候";
					break;
			}

			mui.openWindow({
				// url: (mMain.pageExtras.length > 0 ? (pageurl + "?" + mMain.pageExtras.join("&")) : pageurl),
				url: pageurl,
				id: pageid,
				styles: {
					top: 0,
					bottom: 0
				},
				extras: {},
				createNew: false,
				show: {
					autoShow: true,
					aniShow: aniShow,
					duration: duration
				},
				waiting: {
					autoShow: autoShow,
					title: title
				}
			});
		}
	},
	getRuntime: function() {
		var _run = "browser";
		if(mui.os.plus == true) {
			rtmain.regSource = "APP";
			if(mui.os.ios == true || mui.os.iphone == true || mui.os.ipad == true) {
				_run = "ios";
			} else if(mui.os.android == true) {
				_run = "android";
			}
		} else {
			var ua = navigator.userAgent.toLowerCase();
			if(ua.match(/MicroMessenger/i) != "micromessenger" && ua.match(/windows phone/i) != "windows phone") {
				_run = "browser";
			} else {
				_run = "wechat";
				rtmain.regSource = "WX";
			}
		}
		return _run;
	},
	getWXVersion: function() {
		//得到微信版本号
		var micromessenger = parseInt(userAgent.match(/micromessenger\/([\d\.]+)/)[1].toString().split('.')[0].toString());
		//alert("微信版本号:"+micromessenger);
		return micromessenger;
	}
};

//工具类函数
var rtutil = {
	validatemobile: function(mobilenum) {
		if(mobilenum.length == 0) {
			alert('请输入手机号码！');
			return false;
		}
		if(mobilenum.length != 11) {
			alert('请输入有效的手机号码！');
			return false;
		}
		var PATTERN_CHINAMOBILE = /^1(3[4-9]|5[012789]|8[23478]|4[7]|7[8])\d{8}$/; //移动号
		var PATTERN_CHINAUNICOM = /^1(3[0-2]|5[56]|8[56]|4[5]|7[6])\d{8}$/; //联通号

		var PATTERN_CHINATELECOM = /^1(3[0])|(8[019])|(7[019])\d{8}$/; //电信号  153

		if(PATTERN_CHINAUNICOM.test(mobilenum)) {
			//alert("欢迎您联通用户");
			return true;
		} else if(PATTERN_CHINAMOBILE.test(mobilenum)) {
			//alert("欢迎您移动用户");
			return true;
		} else if(PATTERN_CHINATELECOM.test(mobilenum)) {
			//alert("欢迎您电信用户");
			return true;
		} else {
			//alert("请输入正确的手机号");
			return false;
		}
	},
	trim: function(str) {
		return str.replace(/(^\s*)|(\s*$)/g, "");
	}
};