
function GetOSInfo(){
    var _pf = navigator.platform;  
    if(_pf == "Win32" || _pf == "Windows")  
    {     
    	return 'Windows';
    }else if(_pf == "Mac68K" || _pf == "MacPPC" || _pf == "Macintosh")  
    {  
        return "Mac";             
    }else if(_pf == "X11")  
    {  
        return "Unix";    
    }else if(String(_pf).indexOf("Linux") > -1)  
    {  
        return "Linux";   
    }else  
    {  
        return "Unknow";      
    }         
} 
function Browser(){
	var UA = navigator.userAgent.toLowerCase();				
	return  (UA.indexOf('msie')>-1) ? UA.split('; ')[1].split(' ').join('/') :
		(UA.indexOf('chrome')>-1) ? ('chrome' + UA.split('chrome')[1]).split(' ')[0] :
		(UA.indexOf('firefox')>-1) ? 'firefox' + UA.split('firefox')[1] :
		(UA.indexOf('safari')>-1) ? 'safari' + UA.split('safari')[1] : 
		(UA.indexOf('opera')>-1) ? UA.split(' ')[0] : UA;
}

function dlActiveX(p, version) {
    //IE内核浏览器有两种方式更新、firefox只有下载EXE安装
    //1、通过 codeBase="update.CAB#version=1,1,0,5"控制版本信息，直接页面更新
    //2、通过下载exe下载更新，请确定使用哪种方式更新
    if (p == 1) {
        //IE内核
        if (confirm("您安装的安全控件版本有更新，请确定是否更新?")) {
            //document.getElementById("passwdId").innerHTML = "<a href=\"images/setup.exe\" target=\"_blank\">安全控件更新下载</a>";
            document.getElementById("passwdId").innerHTML = "<OBJECT ID=\"Tiyun\" codeBase=\"https://trade.gf.com.cn/images/update.CAB#version="+version+"\" CLASSID=\"CLSID:64B153E8-7C79-43e2-B7B8-C571E18FE027\" width=98 height=24><PARAM name=\"Width\" value=\"1800\"><PARAM name=\"EditStyle\" value=\"Convex\"><PARAM name=\"ProtectColor\" value=\"#0000FF\"><PARAM name=\"UnProtectColor\" value=\"#00FF00\"><PARAM name=\"EditBkgColor\" value=\"#ffffff\"></OBJECT>";
        }

    } else if (p == 2) {
        //firefox 内核
        if (confirm("您安装的安全控件版本有更新，请确定是否更新?")) {
            document.getElementById("passwdId").innerHTML = "<a href=\"https://trade.gf.com.cn/images/update.exe\" target=\"_blank\">安全控件更新下载</a>";
        }
        //IE内核安装
    } else if (p == 3) {
        document.getElementById("passwdId").innerHTML = "<a href=\"https://trade.gf.com.cn/images/setup.exe\" target=\"_blank\">安全控件下载</a>";
    } else if (p == 4) {
        document.getElementById("passwdId").innerHTML = "<a href=\"https://trade.gf.com.cn/images/setup.exe\" target=\"_blank\">安全控件下载</a>";
    } else {
    }

}

String.prototype.trim = function() {
    return (this.replace(/^[\s\xA0]+/, "").replace(/[\s\xA0]+$/, ""));
};

var TiYunActiveX;
//页面加载初始化加载函数
function onLoadLogin() {
	var appBrowerName = window.navigator.appName;
	//IE内核浏览器
	if ((appBrowerName.indexOf("Microsoft Internet Explorer") > -1)
			|| (appBrowerName.indexOf("Maxthon") > -1)) {

		if (document.getElementById('passwdId') != 'undefined') {
			//document.getElementById('password').style.
			//alert(/tttt/);
			// 设置加密选项
			document.getElementById("isActive").value = "1";
			//屏蔽默认登陆框
			document.getElementById("Spanpwd").style.display = "none";
			//设置控件密码框		
			//第一次控件加载，不加入版本信息
			try {
				document.getElementById("passwdId").innerHTML = "<OBJECT ID=\"Tiyun\" codeBase=\"update.CAB\" CLASSID=\"CLSID:64B153E8-7C79-43e2-B7B8-C571E18FE027\" width=110 height=25><PARAM name=\"Width\" value=\"3000\"><PARAM name=\"EditStyle\" value=\"Convex\"><PARAM name=\"PasswordMaxLen\" value=\"8\"><PARAM name=\"ProtectColor\" value=\"#FFFFFF\"><PARAM name=\"UnProtectColor\" value=\"#FFFFFF\"><PARAM name=\"EditBkgColor\" value=\"#ffffff\"><PARAM name=\"PasswordMaxLen\" value=\"8\"></OBJECT>";
				//document.getElementById("authcodeid").innerHTML = "<OBJECT ID=\"authcode\" codeBase=\"update.CAB\" CLASSID=\"CLSID:64B153E8-7C79-43e2-B7B8-C571E18FE027\" width=125 height=25><PARAM name=\"Width\" value=\"2500\"><PARAM name=\"EditStyle\" value=\"Convex\"><PARAM name=\"PasswordMaxLen\" value=\"8\"><PARAM name=\"ProtectColor\" value=\"#FFFFFF\"><PARAM name=\"UnProtectColor\" value=\"#FFFFFF\"><PARAM name=\"EditBkgColor\" value=\"#ffffff\"><PARAM name=\"PasswordMaxLen\" value=\"8\"></OBJECT>";
			} catch (e) {

			}
			CheckActiveX("IE");

		}
		//火狐、opera浏览器
	} else{
		document.getElementById("isActive").value = "1";
		document.getElementById("Spanpwd").style.display = "none";
		document.getElementById("passwdId").innerHTML = "<embed id=\"Tiyun\" name=\"Tiyun\" type=\"application/mozilla-npGF-plugin\" width=\"110\" height=\"25\">";
		//document.getElementById("authcodeid").innerHTML = "<embed id=\"authcode\" name=\"Tiyun\" type=\"application/mozilla-npGF-plugin\" width=\"105\" height=\"25\">";
		//
		//document.getElementById('Tiyun').SetPassMaxLen(6);
		
			try {
				document.getElementById('Tiyun').SetPassMaxLen(9);
				//document.getElementById('authcode').SetPassMaxLen(9);
			} catch (e) {

			}
			
		var userAgent = navigator.userAgent.toLowerCase();
		//Chrome/safari浏览器
		if (userAgent.indexOf("chrome") > -1 ||userAgent.indexOf("applewebkit")>-1) {
			
			CheckActiveX("Chrome");
		} else {
			//firefox、opera浏览器
			CheckActiveX("FIREFOX");
		}
		//关闭控件输入保护
		//document.getElementById("Tiyun").SetProtectType(0);
	}
}

//版本更新检测,type 1为IE内核浏览器，2为firefox、opera浏览器
function CheckActiveX(type) {
	//当前控件版本，通过该版本数字，控制控件升级
	var curVersion = 1501;
	
	//IE检查
	if (type == "IE") {
		try {
			// 1.查找控件是否安装
			TiYunActiveX = new ActiveXObject("npGF.Tiyun.1");

			try {
				//检测版本号

				//2.控件是否已经显示（已经显示在页面）
				var pwdActiveX = document.getElementById("Tiyun");

				var dllVersion = pwdActiveX.GetDllVersion();

				dllVersion = dllVersion.replace(/, /ig, "");
				//测试  
				//dllVersion = 1000;
				//比较当前版本号
				if (parseInt(dllVersion) < curVersion) {
					dlActiveX(1, curVersion);
					return false;
				}
			} catch (e) {
				//为1,0,0,1老版本，提示升级(没有获取版本号的方法，因此异常)
				dlActiveX(1, curVersion);
				return false;
			}
		} catch (e) {
			//1.去查找下载的控件(控件未安装或者被禁用)
			dlActiveX(3, curVersion);
			return false;
			//检测firefox、Opera浏览器
		}
	} else if (type == "FIREFOX") {
		try {
			//查看是否有FIREFOX插件
			var pluginType = window.navigator.mimeTypes["application/mozilla-npGF-plugin"];
			if (pluginType) {
				//查看该插件是否激活
				var plugin = pluginType.enabledPlugin;
				if (plugin) {
					try {
						var pwdActiveX = document.getElementById("Tiyun");
						var dllVersion = pwdActiveX.GetDllVersion();
						//alert(dllVersion);
						dllVersion = dllVersion.replace(/, /ig, "");
						//比较当前版本号
						if (parseInt(dllVersion) < curVersion) {
							dlActiveX(2, curVersion);
							return false;
						}

					} catch (e) {
						//老版本提示升级(没有获取版本号的方法，因此异常)
						// dlActiveX(2,curVersion);
						return false;
					}
				} else {
					//插件被禁用
					alert("插件已被禁用，请手动启用插件");
				}
			} else {
				//没有安装插件，需要下载安装包
				dlActiveX(4, curVersion);
			}
		} catch (e) {
			//没有安装插件，需要下载安装包
			dlActiveX(4, curVersion);
		}
		//Chrome浏览器
	} else if (type == "Chrome") {
		try {
			var pwdActiveX = document.getElementById("Tiyun");
			var dllVersion = pwdActiveX.GetDllVersion();
			dllVersion = dllVersion.replace(/, /ig, "");
			//比较当前版本号
			if (parseInt(dllVersion) < curVersion) {
				dlActiveX(2, curVersion);
				return false;
			}

		} catch (e) {
			//没有安装控件
			dlActiveX(4, curVersion);
			return false;
		}
	}
	return true;
}

$(document).ready(function () {
    //Onload();
    var os = GetOSInfo();
    if (os == "Windows") {
        onLoadLogin();
    }
    else {
        alert("交易用户暂不支持非windows登录！");
    }
});

