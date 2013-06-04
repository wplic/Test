//判断是否是NetScape浏览器,true:是
ns4 = (document.layers)? true:false

//判断是否是IE,true:是
ie4 = (document.all)? true:false

function init()
{
    if (ns4) block = document.blockDiv
    if (ie4) block = blockDiv.style
    /*这里定义了一个函数，初始化对象block，在NS中，对CSS对象的表示方法是：
    document.blockdiv.propertyname,这里blockdiv是您可以任意定义的名称,
    在IE中， 表示方法是：blockdiv.style.propertyname。上面的代码是针对两
     种浏览器用不同的格式定义对象block,从而确保了在两种浏览器下都能正常显示
    */
}


// 取通过URL传过来的参数 (格式如 ?Param1=Value1&Param2=Value2)
function getUrlParams()
{
    var urlParams = new Object() ;
    var aParams = document.location.search.substr(1).split('&') ;
    for (i = 0; i < aParams.length; i++)
    {
        var aParam = aParams[i].split('=') ;
        urlParams[aParam[0]] = aParam[1];
    }
    return urlParams;
}

/**
根据id，返回对应的对象
**/
function $(id)
{
    return document.getElementById(id);
}

/**
  为 Array 类增加一个 max 方法
**/
Array.prototype.max = function()
{
    var i, max = this[0];

    for (i = 1; i < this.length; i++)
    {
        if (max < this[i])
            max = this[i];
    }

    return max;
}

/**
 为字符串增加trim方法
**/
String.prototype.trim = function()
{
    // 用正则表达式将前后空格用空字符串替代。
    return this.replace(/(^\s*)|(\s*$)/g, "");
}
String.prototype.ltrim = function()
{
	// 用正则表达式将前空格用空字符串替代。
    return this.replace(/(^\s*)/g, "");
}
String.prototype.rtrim = function()
{
	// 用正则表达式将后空格用空字符串替代。
    return this.replace(/(\s*$)/g, "");
}

/**
   执行正则表达式
**/
function executeExp(re, s)
{
    return re.test(s);
}

/**
  判断是否是字母、数字或者为空
**/
function isAlphaNumeric(strValue)
{
    // 只能是 A-Z a-z 0-9 之间的字母数字 或者为空
    return executeExp(/^\w*$/gi, strValue);
}

/**
  判断是否是正确的日期，格式为2003-12-12
**/
function isDate(strValue)
{
    if (isEmpty(strValue)) return true;

    if (!executeExp(/^\d{4}-[01]?\d-[0-3]?\d$/g, strValue)) return false;

    var arr = strValue.split("-");
    var year = arr[0];
    var month = arr[1];
    var day = arr[2];

    // 1 <= 月份 <= 12，1 <= 日期 <= 31
    if (!( ( 1 <= month ) && ( 12 >= month ) && ( 31 >= day ) && ( 1 <= day ) ))
        return false;

    // 润年检查
    if (!( ( year % 4 ) == 0 ) && ( month == 2) && ( day == 29 ))
        return false;

    // 7月以前的双月每月不超过30天
    if (( month <= 7 ) && ( ( month % 2 ) == 0 ) && ( day >= 31 ))
        return false;

    // 8月以后的单月每月不超过30天
    if (( month >= 8) && ( ( month % 2 ) == 1) && ( day >= 31 ))
        return false;

    // 2月最多29天
    if (( month == 2) && ( day >= 30 ))
        return false;

    return true;
}

/**
  判断是否是正确的Email
**/
function isEmail(strValue)
{
    if (isEmpty(strValue)) return true;

    var pattern = /^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+(\.[a-zA-Z0-9_-])+/;
    return executeExp(pattern, strValue);

}
/**
	判断是否为中文
**/
function isCnAndEn(strValue)
{
	if (isEmpty(strValue)) return true;
	
	var pattern = /^[u4E00-u9FA5]+$/;
	
	return executeExp(pattern, strValue);
}

/**
* 判断是否为中文、英文、字母或_
*/
function isCnAndEnNumeric(strValue)
{
	var  pattern = /^[_0-9a-zA-Z\u4e00-\u9fa5]+$/;  
	return executeExp(pattern, strValue);
}

/**
  判断字符串是否为空
**/
function isEmpty(strValue)
{
    if (strValue == null || strValue == "")
        return true;
    else
        return false;
}


/**
  判断是否为数字
**/
function isNumeric(strValue)
{
	if (isEmpty(strValue)) return true;
    return executeExp(/^[0-9]+$/, strValue);
}


/**
  判断是否为浮点数（不带正负号）
**/
function isNumberFloat(strValue)
{
    if (isEmpty(strValue)) return true;
    return executeExp(/^\d+(\.\d+)?$/, strValue);
    //return (!isNaN(parseFloat(strValue))) ? true : false;
}


/**
  判断是否是货币
**/
function isMoney(strValue)
{
    if (isEmpty(strValue)) return true;
    return executeExp(/^[+-]?\d+(,\d{3})*(\.\d+)?$/g, strValue);
}


/**
  判断是否为手机号码
**/
function isMobile(strValue)
{
    if (isEmpty(strValue)) return true;
    return executeExp(/^(13|15|18)\d{9}$/, strValue);
}
function isMobile2(Str)
{  if (isEmpty(Str)) return true;
//   return executeExp(/^\d*$/g, Str);
   if(Str.length!=11)
    return false;

}
/**
  判断是否为电话
**/
function isPhone(strValue)
{
    if (isEmpty(strValue)) return true;
    //return executeExp(/(^\(\d{3,5}\)\d{6,8}(-\d{2,8})?$)|(^\d+-\d+$)|(^(130|131|132|133|134|135|136|137|138|139|158|159)\d{8}$)/g, strValue);
	//东莞证券要求手机号码只验证11位数字就行了
	return executeExp(/(^\(\d{3,5}\)\d{6,8}(-\d{2,8})?$)|(^\d+-\d+$)|(^\d{11}$)/g, strValue);
}

/**
  判断是否为邮政编码
**/
function isPostalCode(strValue)
{    if (isEmpty(strValue)) return true;
    return executeExp(/(^$)|(^\d{6}$)/gi, strValue)
}

/**
  判断是否为合法的URL
**/
function isURL(strValue)
{
    if (isEmpty(strValue)) return true;
    var pattern = /^(http|https|ftp):\/\/(\w+\.)+[a-z]{2,3}(\/\w+)*(\/\w+\.\w+)*(\?\w+=\w*(&\w+=\w*)*)*/gi;
    return executeExp(pattern, strValue);
}


//比较，compare(1,'<=10')将返回true，第一个参数为要比较的数字，第二个参数支持>、=、<、<=、>=
function compare(l, strParam)
{
    var ml;
    // 要判断的长度
    var co;
    // 比较符

    // 判断是否为<=、>=
    if (strParam.indexOf('<=') != -1 || strParam.indexOf('>=') != -1)
    {
        ml = parseInt(strParam.substr(2));
        cp = strParam.substr(0, 1);
    }
    else
    {
        ml = parseInt(strParam.substr(1));
        cp = strParam.charAt(0);
    }

    switch (cp)
            {
        case '<' :
            if (l >= ml) return false;
            break;
        case '=' :
            if (l != ml) return false;
            break;
        case '>' :
            if (l <= ml) return false;
            break;
        case '<=' :
            if (l > ml) return false;
            break;
        case '>=' :
            if (l < ml) return false;
            break;
        default :
            return false
    }

    return true;
}

//检查字符的长度
function checkStrLength(strValue, strParam)
{
    //if( isEmpty( strValue ) )	return true; // 此处注释掉，空字符串同样要检查

    // 参数形如：L<10, L=5, L>117, L<=10, L>=10
    if (strParam.charAt(0) != 'L')    return false;

    return compare(strValue.length, strParam.substr(1));
}


/**
  添加getBytesLength方法，用于得到字节数。中文为2个字节
**/
String.prototype.getBytesLength = function()
{
    var cArr = this.match(/[^\x00-\xff]/ig);
    return this.length + (cArr == null ? 0 : cArr.length);
}

//检查字符的长度，使用字节数来检测，即1个中文当作2个字节
function checkStrLengthOfBytes(strValue, strParam)
{
    //if( isEmpty( strValue ) )	return true; // 此处注释掉，空字符串同样要检查

    // 参数形如：L<10, L=5, L>117
    if (strParam.charAt(0) != 'L')    return false;

    return compare(strValue.getBytesLength(), strParam.substr(1));
}

/**
 * 检查文件扩展名
 * @param fileName 文件名
 * @param allowedName 允许的扩展名，以|分开，如"jpg|gif"代表允许.jpg和.gif文件。"*"和""（空字符串）代表不允许所有。如果该文件无扩展名，返回true
 */
function checkFileExtendName(fileName, allowedName)
{
    if (allowedName == null || allowedName == "" || allowedName == "*" ||
        fileName == null || fileName == "" || fileName.indexOf(".") == -1)
    {
        return true;
    }

    var realFileName = "";
    if (fileName.indexOf("\\") != -1)
    { // 如果包含路径名
        realFileName = fileName.substr(fileName.lastIndexOf("\\") + 1, fileName.length);
    }
    else if (fileName.indexOf("/") != -1)
    { // 如果包含路径名（for Unix）
        realFileName = fileName.substr(fileName.lastIndexOf("/") + 1, fileName.length);
    }
    else
    { // 无路径名
        realFileName = fileName;
    }

    if (realFileName.indexOf(".") == -1)
    {
        return true;
    }

    var extendName = realFileName.substr(realFileName.lastIndexOf(".") + 1, realFileName.length);

    var extendNames = allowedName.split("|");
    //alert("文件名：" + realFileName + " 扩展名：" + extendName + " " + extendNames);

    for (var i = 0; i < extendNames.length; i++)
    {
        if (extendName.toLowerCase() == extendNames[i].toLowerCase())
        {
            return true;
        }
    }

    return false;
}

/**
  检查字符的长度，使用字节数来检测，即1个中文当作2个字节
**/
function validStrLengthOfBytes(objName, strDescription, strParam)
{
    var strMsg = "";
    if (!isElementExist(objName))
    {
        strMsg = strDescription + " 对象不存在";
        window.alert(strMsg);
        return;
    }
    var strValue = getElement(objName).value.trim();

    if (!checkStrLengthOfBytes(strValue, strParam))
    {
        strMsg = '"' + strDescription + '" 长度不正确，必需为' + strParam + '（注意1个中文为2个字节长度）\n';
    }

    return strMsg;
}


/**
  判断各种类型的入口函数
**/
function checkValid(objName, strDescription, strType)
{
    var strMsg = "";
    if (isElementExist(objName))
    {
        var strValue = getElement(objName).value.trim();
        switch (strType)
                {
            case "Date" :    // 日期
                if (!isDate(strValue))
                    strMsg = '【' + strDescription + '】 格式错误，请输入正确的日期格式，如1970-1-1\n';
                break;

            case "AlphaNumeric" :    // 字母数字
                if (!isAlphaNumeric(strValue))
                    strMsg = '【' + strDescription + '】 格式错误，请输入字母或数字！\n';
                break;

            case "NotEmpty" :    // 不许空值
                if (isEmpty(strValue))
                    strMsg = '【' + strDescription + '】 不能为空！\n';
                break;

            case "Email" :    // 电子邮件
                if (!isEmail(strValue))
                    strMsg = '【' + strDescription + '】 格式错误，请输入正确的邮件格式\n';
                break;

            case "Money" :    //货币
                if (!isMoney(strValue))
                    strMsg = '【' + strDescription + '】 格式错误，请输入正确的货币格式\n';
                break;

            case "Numeric" :    //数字
                if (!isNumeric(strValue))
                    strMsg = '【' + strDescription + '】 格式错误，请输入数字！\n';
                break;

            case "NumberFloat" :    //浮点数
                if (!isNumberFloat(strValue))
                    strMsg = '【' + strDescription + '】 格式错误，请输入浮点数！\n';
                break;

            case "Mobile" :    // 手机号码
                if (!isMobile(strValue))
                    strMsg = '【' + strDescription + '】 格式错误，请输入正确的手机号码\n';
                break;

            case "Phone" :    // 电话
				if (isNumeric(strValue))
				{
					if(strValue.length == 8)
					{
						strValue = "0769-"+strValue;
						getElement(objName).value = strValue;
					}
				} 	
                if (!isPhone(strValue))
                    strMsg = '【' + strDescription + '】 格式错误，正确电话格式为:0769-88888888\n';
                break;

            case "PostalCode" :    // 邮政编码
                if (!isPostalCode(strValue))
                    strMsg = '【' + strDescription + '】 格式错误，请输入6位数字！\n';
                break;

            case "URL" :    // URL
                if (!isURL(strValue))
                    strMsg = '【' + strDescription + '】 格式错误，请输入正确的URL格式！\n';
                break;

            default :    // 其他
                strMsg = '错误的 【' + strDescription + '】 类型 "' + strType + '" 不能识别！\n';
                break;
        }
    }
    else
    {
        strMsg = '【' + strDescription + "】 对象不存在\n";
    }

    return strMsg;
}


/**
  链接转向
**/
function goToURL(url)
{
    window.location = url;
}

//判断用户是否选择了要操作的记录，如果是
//则自动提交表单
//form:表单名称
//action:要进行的操作
//listName:多选field字称
function listCheck(formName, action, listName, msg)
{
    var flag = 0;
    var form = document.all(formName);

    if (form == null)
        return false;

    if (action == '')
        return false;

    if (listName == '')
        return false;

    var field = document.all(listName);

    if (field.length == null)    //处理可能只有一条记录的Bug
    {
        if (field.checked == true)
        {
            flag = 1;
        }
    }
    else
    {
        for (i = 0; i < field.length; i++)
        {
            if (field[i].disabled != true)
            {
                if (field[i].checked == true)
                {
                    flag = 1;
                }
            }
        }
    }

    if (flag == 1)
    {
        document.all("function").value = action;
        if (window.confirm("你确定要[" + msg + "]吗？"))
        {
            form.submit();
            return true;
        }
        else
        {
            return false;
        }
    }
    else
    {
        alert("请选择记录！");
        return false;
    }

    return false;
}

/**
  弹出确认窗口
**/
function _confirm(msg)
{
    return window.confirm("你确定要" + msg + "吗？");
}

/**
  根据指定的名称，判断元素是否存在
**/
function isElementExist(name)
{
    var objArray = document.getElementsByName(name);
    if (objArray != null && objArray.length > 0)
    {
        return true;
    }
    return false;
}

/**
  根据指定的名称，返回特定的元素，若不存在，则返回null
**/
function getElement(name)
{
    var objArray = document.getElementsByName(name);
    if (objArray != null && objArray.length > 0)
    {
        return objArray[0];
    }
    return null;
}

/**
  根据指定的名称，返回特定的元素数组
**/
function getElements(name)
{
    var objArray = document.getElementsByName(name);
    return objArray;
}

/**
  根据指定的名称，判断特定的元素是否是数组
**/
function elementIsArray(name)
{
    var objArray = document.getElementsByName(name);
    if (objArray != null && objArray.length > 1)
    {
        return true;
    }
    return false;
}

/**
  字段是否为空
**/
function checkEmpty(field)
{
    if (isElementExist(field))
    {
        if (getElement(field).value.trim() == "")
            return true;
    }
    return false;
}

/**
  根据ID得到对应的对象
**/  
function getObject(id)
{
    return document.getElementById(id);
}
//屏蔽右键
oncontextmenu = "window.event.returnValue=false";

/**
  刷新当前窗口
**/
function refresh()
{
    document.location.reload();
}

/**
  打开新窗口
**/
function openWin(url, width, height)
{
    if (url == '')
        return;
     var l=(screen.width-width)/2;
     var t=(screen.height-height)/2;
    var winOption = "toolbar=no,location=no,directories=no,status=no,menubar=no,scrollbars=no,resizable=yes,left=50,top=50,width=" + width + ",height=" + height+",top="+ t +",left="+l;
    window.open(url,'Bank_Help',winOption);
    return;
}

/**
  打开新窗口,带滚动条
**/
function openWinWithScroll(url, width, height)
{
    if (url == '')
        return;
    var winOption = "toolbar=no,location=no,directories=no,status=no,menubar=no,scrollbars=yes,resizable=yes,left=50,top=50,width=" + width + ",height=" + height;
    window.open(url, '', winOption);
    return;
}

/**
 以最大化方式打开新窗口
**/
function openMaxWindow(url)
{
    if (url == '')
        return;
    var winOption = "toolbar=no,location=no,directories=no,status=no,menubar=no,scrollbars=no,resizable=yes,fullscreen=0";
    var win = window.open(url, '', winOption);
    win.moveTo(0, 0)
    win.resizeTo(screen.availWidth, screen.availHeight)
    return win;
}

/**
  以最大化方式打开新窗口，并且带滚动条
**/
function openMaxWindowWithScroll(url)
{
    if (url == '')
        return;
    var winOption = "toolbar=no,location=no,directories=no,status=no,menubar=no,scrollbars=yes,resizable=yes,fullscreen=0";
    var win = window.open(url, '', winOption);
    win.moveTo(0, 0)
    win.resizeTo(screen.availWidth, screen.availHeight)
    return win;
}

/**
  以最大化方式打开新窗口，并且带滚动条，还可以命名
**/
function openMaxNamedWindowWithScroll(url, windowName)
{
    if (url == '')
        return;
    var winOption = "toolbar=no,location=no,directories=no,status=no,menubar=no,scrollbars=yes,resizable=yes,fullscreen=0";
    var win = window.open(url, windowName, winOption);
    win.moveTo(0, 0)
    win.resizeTo(screen.availWidth, screen.availHeight)
    return win;
}

/**
  打开对话框
**/
function openDialog(url, width, height)
{
    return window.showModalDialog(url, window, 'dialogHeight: ' + height + 'px; dialogWidth: ' + width + 'px;edge: Raised; center: Yes; help: Yes;scroll:no; resizable: no; status: no;');
}

/**
  打开对话框，并且带滚动条
**/
function openDialogWithScroll(url, width, height)
{
    return window.showModalDialog(url, window, 'dialogHeight: ' + height + 'px; dialogWidth: ' + width + 'px;edge: Raised; center: Yes; help: Yes;scroll:auto; resizable: no; status: no;');
}

function openUploadFileDialog(fieldObj)
{
    if(fieldObj)
    {
        if(fieldObj.tagName == "INPUT" && fieldObj.type=="text")
        {
          return window.showModalDialog("upload/upload.jsp",fieldObj,'dialogHeight: 80px; dialogWidth: 350px;edge: Raised; center: Yes; help: no;scroll:no; resizable: no; status: no;')
        }
    }
    alert("接收上传文件路径的对象不是一个输入域");
}

function openDeleteFileDialog(fieldObj)
{
    if(fieldObj)
    {
        if(fieldObj.value.length == 0)
        {
            alert("您还没有上传文件");
            return;
        }
        var url = "upload/delete.jsp?filePath=" + fieldObj.value;
        return window.showModalDialog(url,fieldObj,'dialogHeight: 80px; dialogWidth: 350px;edge: Raised; center: Yes; help: no;scroll:no; resizable: no; status: no;')
    }
}

//键盘触发器
function isKeyTrigger(e,keyCode){
    var argv = isKeyTrigger.arguments;
    var argc = isKeyTrigger.arguments.length;
    var bCtrl = false;
    if(argc > 2){
        // 如果存在第3个传入参数,则作为是否判断按下ctrl键标志
        bCtrl = argv[2];
    }
    var bAlt = false;
    if(argc > 3){
        // 如果存在第4个传入参数,则作为是否判断按下ctrl键标志
        bAlt = argv[3];
    }

    var nav4 = window.Event ? true : false;

    if(typeof e == 'undefined') {
        e = event;
    }

    if( bCtrl &&
        !((typeof e.ctrlKey != 'undefined') ?
            e.ctrlKey : e.modifiers & Event.CONTROL_MASK > 0)){
        return false;
    }
    if( bAlt &&
        !((typeof e.altKey != 'undefined') ?
            e.altKey : e.modifiers & Event.ALT_MASK > 0)){
        return false;
    }
    var whichCode = 0;
    if (nav4) whichCode = e.which;
    else if (e.type == "keypress" || e.type == "keydown")
        whichCode = e.keyCode;
    else whichCode = e.button;

    return (whichCode == keyCode);
}




//电话号码验证
function CheckPhone(phone)
{
	//验证电话号码手机号码，包含153，159号段
	if (phone=="")
	{
		return false;
	}
	
	if (phone != "")
	{
		if(phone.length < 6 || phone.length >8) return false;
		var numberValidate = /^\d*$/g;
		if(!numberValidate.test(phone))return false;
		var p1 = /^(([0\+]\d{2,3}-)?(0\d{2,3})-)?(\d{7,8})(-(\d{3,}))?$/;
		var me = false;
		if (p1.test(phone))
			me=true;
		if (!me)
		{
			phone='';
			return false;
		}
	}
	return true;
}


/**
  根据xml文档对象得到指定tag的文本值
*/
function getXmlTagText(xmlobj,tagName)
{  
    if(document.all)
    {
      if(xmlobj.getElementsByTagName(tagName)[0])
        return xmlobj.getElementsByTagName(tagName)[0].childNodes[0].text;
      else
        return "";
    }
    else
    {
      if(xmlobj.getElementsByTagName(tagName)[0])
        return xmlobj.getElementsByTagName(tagName)[0].childNodes[0].nodeValue;
      else
        return "";
    }
}

    function setSelect(obj,value)
	{
		for(var i = 0;i < obj.length;i++)
		{
			
			if(obj[i].value == value)
			{
				
				obj[i].selected = true;
				break;
			}
		}
	}
	
	function setRadio(obj,value)
	{
		for(var i = 0;i < obj.length;i++)
		{
			if(obj[i].value == value)
			{
				obj[i].checked = true;
				break;
			}
		}
	}

/**
 *	功能描述:显示切换
 *  使用示例:
 *           
 *	author:zjd 
 *  date:  2009-12-14
 */
 function display_type_switch(arrow_id,type){

	  var _o =getObject(arrow_id);
       if(type=="none")
	   {//屏蔽
		   _o.style.display = "none";
	   }
	   else if(type=="block")
	   {//显示
		   _o.style.display = "block"; 
	   }
 }

 
/**
 *功能描述:带运算符比较数字
 *使用示例:
 *        var a=2;
 *        var b=3;
 *        调用函数compareNumberWithOperate(a,b,"<=");返回true;
 *        异常情况： 
 *         var a="abc";
 *         var b=9;
 *        调用函数compareNumberWithOperate(a,b,"<=");返回true;因为变量a不是数字，但是函数取a默认为0
 * author:zjd
 * date:  2009-12-15
 **/
function compareNumberWithOperate(fPara,sPara,operatePara)
{
     if(isNaN(fPara))  fPara=0;
     if(isNaN(sPara))  sPara=0;
      switch (operatePara)
            {
        case '<' :
            if (Number(fPara) < Number(sPara)) return true;
            break;
        case '=' :
            if (Number(fPara) == Number(sPara)) return true;
            break;
        case '>' :
            if (Number(fPara) > Number(sPara)) return true;
            break;
        case '<=' :
            if (Number(fPara) <= Number(sPara)) return true;
            break;
        case '>=' :
            if (Number(fPara) >= Number(sPara)) return true;
            break;
        default :
            return false;
    }
    return false;
}
/**
 *功能描述:获取数字值,如果异常返回null
 * author:zjd
 * date:  2009-12-15
 **/
function getNumber(value)
{
 if(isNaN(value)) return null;
 return parseFloat(value);
}
/**
 *功能描述:数字运算函数,如果异常返回null
 *使用示例:
 *        var a=2;
 *        var b=3;
 *        调用函数numberOperate(a,b,"+");返回5;
 *        异常情况： 
 *         var a="abc";
 *         var b=9;
 *        调用函数numberOperate(a,b,"/");返回null;因为变量a不是数字
 * author:zjd
 * date:  2009-12-15
 **/
function numberOperate(fPara,sPara,operatePara){
     if(isNaN(fPara))  fPara=null;
     if(isNaN(sPara))  sPara=null;

	 if(fPara==null||sPara==null)
	   return null;
     
      switch (operatePara)
       {
        case '+' :
              return getNumber(fPara) + getNumber(sPara);
            break;
        case '-' :
              return getNumber(fPara) - getNumber(sPara);
            break;
        case '*' :
            return getNumber(fPara) * getNumber(sPara);
            break;
        case '/' :
			if(getNumber(sPara)==0)
			  return null;
		    else 
              return getNumber(fPara) / getNumber(sPara);
            break;
        default :
            return null;
		}
		return null;
}
	