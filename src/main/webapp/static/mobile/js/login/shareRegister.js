var rt = {
	txtMobileNum: document.getElementById("txtMobileNum"), //手机号码
	txtValidImg: document.getElementById("txtValidImg"), //图形验证码
	txtValidSms: document.getElementById("txtValidSms"), //短信验证码

	txtPrimitivePass: document.getElementById("txtPrimitivePass"), //原密码
	txtConfirmPass: document.getElementById("txtConfirmPass"), //确认密码

	imgValidCode: document.getElementById("imgValidCode"), //获取图像验证码的对象

	idValidSms: document.getElementById("idValidSms"), //获取短信验证码的按钮对象

	regBtn: document.getElementById("regBtn"), //获取注册按钮的对象
	
	qrcodekey: document.getElementById("qrcodekey"), //获取注册按钮的对象

	downloadinstallBtn: document.getElementById("downloadinstall"), //下载安装

	
	ifExcute1: 1,
	
	openWin: function (targetpage, validlogin) {
        if (targetpage != "") {
            if (validlogin == 0) { rtmain.openWin(targetpage, 1); }
            else {
                if (rtmain.userID == 0) { rtmain.openWin("UserLogin", 0); }
                else { rtmain.openWin(targetpage, 1); }
            }
        }
    },
    //窗口传递参数
    openWinWithParameter:function(targetpage, validlogin,os)
    {
    	 if (targetpage != "") 
    	 {
             if (validlogin == 0) 
             { 
            	 var pageurl = "goDownload";
 				 var pageid = "goDownload";
 				
            	 mui.openWindow({
     				
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
          }
    },
	userRegister: function() {
		var mobileNum = txtMobileNum.value;

		var validImg = txtValidImg.value;

		var validSms = txtValidSms.value;

		var primitivePass = txtPrimitivePass.value;

		var confirmPass = txtConfirmPass.value;
		
		var passQrcaodeKey = rt.qrcodekey.value;
		
	//alert("passQrcaodeKey:"+passQrcaodeKey);
		if(passQrcaodeKey==""){
			mui.alert("非法注册!");
			qrcodekey.focus();
			return;
		}

		if(mobileNum == "") {
			mui.alert("请填写手机号码!");
			txtMobileNum.focus();
			return;
		}

		if(validImg == "") {
			mui.alert("图形验证码不能为空!");
			txtValidImg.focus();
			return;
		}

		if(validSms == "") {
			mui.alert("短信验证码不能为空!");
			txtValidSms.focus();
			return;
		}

		if(primitivePass == "") {
			mui.alert("密码不能为空!");
			txtPrimitivePass.focus();
			return;
		}

		if(confirmPass == "") {
			mui.alert("确认密码不能为空!");
			txtConfirmPass.focus();
			return;
		}

		if(primitivePass != confirmPass) {
			mui.alert("两次密码输入不一致，请重输!");
			txtConfirmPass.focus();
			return;
		}

		//先根据key获取文字图形验证码;

		if(rtmain.validImgKey != "") {
			var url = rtmain.ajaxServerUrl + "api/userApi/getTxtCaptcha?key=" + rtmain.validImgKey;
			//alert(url);
			mui.getJSON(url, function(res) {
				//alert("res:"+res.data);
				//图形验证码输入正确否？
				if(validImg != res.data) {
					alert("图形验证码码输入不正确，请重输!");
					imgValidCode.focus();
					return;
				}

				//短信验证码输入正确否?
				if(validSms != rtmain.smsCode) {
					alert("短信验证码输入不正确，请重输!");
					idValidSms.focus();
					return;
				}
				var o = rtmain.ajaxServerUrl + "api/userApi/register";
				//alert("oooo:"+o);
				
				mui.getJSON((rtmain.ajaxServerUrl + "api/userApi/register"), {
					mobileNum: encodeURI(mobileNum),
					key: encodeURI(rtmain.validImgKey),
					inputYzm: encodeURI(validImg),
					smsYzm: encodeURI(validSms),
					loginPass: encodeURI(primitivePass),
					checkLoginpass: encodeURI(confirmPass),
					qrcodeKey: passQrcaodeKey
				}, function(res) {
					if(res.code == 1) {
						/*
						mui.alert("注册成功!",function(){
							rtmain.openWin("index", 0);
						});*/
						
						mui.alert(res.msg, function () {
                            rt.openWin("shareDownload", 0);
							
                        });
                        
					} else {
						mui.alert(res.msg);
					}
				});

			});
		}
		//http://39.108.186.141:8080/cardmanager/f/api/userApi/register?mobileNum=17347502680&key=123&inputYzm=4567&smsYzm=1788&loginPass=123456&checkLoginPass=123456
	},
	getSmsCode: function() {
		//alert("获取短信验证码");
	if (rt.ifExcute1 == 1) {
		var mobileNum = txtMobileNum.value;
		if(mobileNum == "") {
			mui.alert("手机号码不能为空!");
			txtMobileNum.focus();
			return;
		}

		rt.ifExcute1 = 0;
		
		mui.getJSON((rtmain.ajaxServerUrl + "api/userApi/getRegisterSmsCode?mobileNum=" + mobileNum), function(res) {
			if(res.code == 1){
					rtmain.smsCode = res.data;
					
					
					var _times = 30;
		            var _timer = setInterval(function () {
		                if (_times == 1) {
		                                rt.ifExcute1 = 1;
		                                clearInterval(_timer);
		                                rt.idValidSms.innerText = "获取短信验证码";
		                            } else {
		                                _times--;
		                                rt.idValidSms.innerText = (_times + '秒后再获取');
		                            }
		                        }, 1000);            
             } else {
                    mui.alert(res.msg);
                    rt.ifExcute1 = 1;
            }          
			
		});
	}

	},
	generateImgYzm:function(){
			mui.getJSON((rtmain.ajaxServerUrl + "api/userApi/generateCaptcha"), function(res) {
			rtmain.validImgKey = res.data;
			if(rtmain.validImgKey != "") {
					var yzmUrl = (rtmain.ajaxServerUrl + "api/userApi/captcha.jpg?key=" + rtmain.validImgKey);
					rt.imgValidCode.setAttribute("src", yzmUrl);
				}
			});
	},
	generateCaptcha:function(){
		var url =rtmain.ajaxServerUrl + "api/userApi/generateCaptcha";
		//alert(url);
		mui.getJSON((url), function(res) {
			//alert(res.data);
			rtmain.validImgKey = res.data;
			
			if(rtmain.validImgKey != "") {

				//图形验证码事件监听
				rt.imgValidCode.setAttribute("src", rtmain.ajaxServerUrl + "api/userApi/captcha.jpg?key=" + rtmain.validImgKey);

//				rt.imgValidCode.addEventListener("tap", function() {				
//					alert("ok");	
//					var yzmUrl = (rtmain.ajaxServerUrl + "api/userApi/captcha.jpg?key=" + rtmain.validImgKey);
//
//					rt.imgValidCode.setAttribute("src", yzmUrl);
//
//				});
				
			}
		});

	},
	init: function() {
		mui.init();
		//产生key插入到数据库
		

		//页面初始进来产生图形验证码
		rt.generateCaptcha();
		
		rt.imgValidCode.addEventListener("tap", function() {
			rt.generateImgYzm();
		});
		
		//用户注册按钮事件监听
		rt.regBtn.addEventListener("tap", function() {
			rt.userRegister();
		});
		
		rt.downloadinstallBtn.addEventListener("tap", function() {
			 rt.openWin("shareDownload", 0);
		});

		//短信验证码事件监听
		//http://192.168.1.153:8080/cardmanager/f/api/userApi/getRegisterSmsCode?mobileNum=15974158911

		rt.idValidSms.addEventListener("tap", function() {
			rt.getSmsCode();
		});

		rt.txtMobileNum.addEventListener("blur", function() {
			if(rt.txtMobileNum.value != "") {
//				if(rtutil.validatemobile(rt.txtMobileNum.value)) {
//					
					//调用检查该手机号码是否注册过
					
					//http://localhost:8080/cardmanager/f/api/userApi/checkRegisterPhone?mobileNum=173475026810
					
					mui.getJSON((rtmain.ajaxServerUrl + "api/userApi/checkRegisterPhone"),  {
					mobileNum: encodeURI(txtMobileNum.value)

				},function(res) {
						
						if(res.code !=1 ){
							mui.alert("该手机号码已经注册过，请更换手机号码并注册!");
							txtMobileNum.focus();
							return;
						}else{
							//mui.alert("可以注册!");
						}
					});
					
					
//				} else {
//					mui.alert("请输入正确的手机号码!");
//					txtMobileNum.focus();
//					return;
//					
//				}
			}
		});
	}
};

rt.init();