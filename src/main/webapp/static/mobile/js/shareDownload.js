var rt = {
    version:"",
    runtime:rtmain.getRuntime(),
    btnAndroid:document.getElementById("btnAndroidDownload"),
    btnIos:document.getElementById("btnIosDownload"),
    lblVersionDes:document.getElementById("lblVersionDes"),
    ifExcute: 1,
   
    openWin: function (targetpage, validlogin) {
        if (targetpage != "") {
            if (validlogin == 0) { 
            	rtmain.openWin(targetpage, 1); 
            }
            else {
                if (rtmain.userID == 0) {
                	rtmain.openWin("userLogin", 0);
                }
                else {
                	rtmain.openWin(targetpage, 1); 
                }
            }
        }
    },
    getVersion: function () {
    	//alert(rt.runtime);
    	
    	var url = rtmain.ajaxServerUrl+"api/userApi/getAppTypeList";
 
        mui.getJSON((rtmain.ajaxServerUrl + "api/userApi/getAppTypeList"), {
            //appType: rt.runtime
            appType: "android"
        }, function (res) {
            if (res.code == 1) {
                lblVersionDes.innerHTML = "当前版本：" + res.data.appVer;
                
                var appname=res.data.fileName;
                var downUrl = rtmain.domainUrl+res.data.fileUrl;
                var mask = mui.createMask();
               // alert("downUrl:"+downUrl);
                rt.btnAndroid.addEventListener("tap", function (e) {
                    switch ("browser") {
                        case "browser": {
                            window.location = downUrl;
                        } break;

                        case "ios": {
                            mui.alert("请点击“IOS版下载”");
                        } break;

                        case "wechat": {
                            mui.alert("请点击右上角复制链接到浏览器中下载");
                        } break;

                        default: {
                            mask.show();
                        } break;
                    }
                });

                rt.btnIos.addEventListener("tap", function (e) {
                    switch (rt.runtime) {
                        case "browser": {
                            mui.alert("AppStore正在抓紧审核中，敬请期待！");
                        } break;

                        case "android": {
                            mui.alert("请点击“Android版下载”");
                        } break;

                        case "wechat": {
                            mui.alert("请点击右上角复制链接到浏览器中下载");
                        } break;

                        default: {
                            mui.alert("AppStore正在抓紧审核中，敬请期待！");
                        } break;
                    }
                });
            }
        });
    },  
    init: function () {
        mui.init();
        rt.getVersion();
        
        mui.plusReady(function () {
            plus.runtime.getProperty(plus.runtime.appid, function (inf) {
                rt.version = inf.version;
                rt.getVersion();
            });
        });
    }
};
rt.init();
