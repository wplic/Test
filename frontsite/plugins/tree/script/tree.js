//是否允许加载
var isOn = true ;

/*
 * 更换节点状态皮肤
 */
function doSkin(id ,mode ,path ,params)
{
	if (!isOn)
		return ;

	isAppend = false ;
	
	var e = window.event.srcElement ;
	if (e == null)
		return ;
	var sube = e.nextSibling ;

	if (e.tagName=="IMG"){
		
		var parent = e.parentElement ;//document.all (node_${id}) ;
		var divs = parent.childNodes;

		var len = 0 ;
		if (divs != null) len = divs.length ;

		var eSrc = e.src ;
		var subeSrc = sube.src ;
		var state = parent.getAttribute("state") ;
		var load = parent.getAttribute("load") ;

		//动态加载
		if (mode == "dynamic" && load == "false"){

			isOn = false ;
			document.body.style.cursor = "wait" ;

			loadNode(id ,path ,params) ;
			parent.setAttribute ("load" ,"true") ;
		}
		
		if (state == 1){//已展开
			e.src = eSrc.replace("minus.gif" ,"plus.gif") ;
			if (sube != null)
				sube.src = subeSrc.replace("open.gif" ,"close.gif") ;
			
			parent.setAttribute("state" ,2) ;
			//雪藏所有DIV孩子
			for (var i=0 ;i<len ;i++)
			{
				var div = divs[i] ;
				if (div.tagName == "DIV"){
					div.style.display = "none" ;
					//break ;
				}
			}
		}else if(state == 2){//已收缩
			e.src = eSrc.replace("plus.gif" ,"minus.gif") ;
			if (sube != null)
				sube.src = subeSrc.replace("close.gif" ,"open.gif") ;
			
			parent.setAttribute("state" ,1) ;
			//暴露所有DIV孩子
			for (var i=0 ;i<len ;i++)
			{
				var div = divs[i] ;
				if (div.tagName == "DIV"){
					div.style.display = "block" ;
					//break ;
				}
			}
		}else{
			alert ("节点状态错误") ;
		}
	}
}

/*
 * 动态加载节点时,追加节点的孩子部分.
 * 考虑网络数据传输的延时,每隔500ms,读取数据一次,直至数据全部到达客户端
 */
var intervalId = -1 ;
var bodylen = 0 ;
function loadNode(id ,path ,params)
{
	var obj = document.all("_dynamic_tree") ;
	obj.href = params ;

	obj.click() ;

	intervalId = setInterval("getNode('"+id+"' ,'"+path+"')" ,500);
}

/*
 * 动态加载节点时,获取节点的孩子部分
 */
function getNode(id ,path)
{
	var target = document.frames("_dynamic_tree_target");
	if (target == null)
		return ;

	var targetBody = target.document.all("_tree_body_"+path) ;
	if (targetBody == null)
		return ;

	var body  = targetBody.innerHTML ;
	if (body != null)
	{
		var _bodylen = body.length ;

		if (bodylen == _bodylen){//如果长度恒定,则表示数据已经全部到位
			clearInterval(intervalId);
			appendNode (id ,body);

			//清空数据,减小客户端压力
			body = "" ;
			targetBody.innerHTML = "" ;
			bodylen = 0 ;
		}
		else//否则,继续探测
			bodylen = _bodylen ;

		return ;
	}
}

/*
 * 动态加载节点时,附加节点的孩子部分
 */
function appendNode(id ,body)
{
	//判断父节点是否存在
	var obj = document.all ("children_"+id) ;
	if (obj == null) return ;
	if (trim(body) != "")
		obj.innerHTML = obj.innerHTML + body ;

	document.body.style.cursor = "auto" ;
	isOn = true ;
}

var _intervalId = -1 ;
/**
 * 动态加载时,由客户端模拟连续调用脚本doSkin(),展开、可视节点,以记忆树形
 * 结合_appendNode()完成
 */
function _doSkin (path ,loadMode){
	if (path == null || path == "" || loadMode != "dynamic") 
		return ;
	
	//可能path包含其他信息,过滤获取数字id,重组path
	var paths = path.split ("/") ;
	var len = 0 ;
	if (paths != null) len = paths.length ;
	path = "" ;//置零初始化
	for (var i=0 ;i<len ;i++){
		if (isNaN(paths[i]))
			continue ;

		path = path + paths[i] + "/" ;
	}
	_appendNode(0 ,path) ;
}

function _appendNode(j ,path){
	var paths = path.split ("/") ;
	var len = 0 ;
	if (paths != null) len = paths.length ;

	for (var i=j ;i<len-1 ;i++){
		var obj = document.all ("controller_"+paths[i]) ;
		if (obj != null){ 
			obj.click() ;
			//clearInterval (_intervalId) ;
		}
		else 
			_intervalId = setInterval("_appendNode("+i+" ,'"+path+"')" ,500);

		if (i == len -1) clearInterval (_intervalId) ;
	}
}

/*
 * @use:设置节点选择时,处于高显亮状态
 */
var rightNow = null ;
function setLightColor(){
	var e = window.event.srcElement ;
	if(e.className == "_lightColor"){
		if(rightNow != null)
		{
			rightNow.style.background="WHITE";
			rightNow.style.color="BLACK"; 
		}
		rightNow = e ;
		rightNow.style.background="DARKBLUE";
		rightNow.style.color="WHITE";
	}
}

/*
 * @use:选择父节点,正向感应子节点
 * 结合checkParent()支持反相感应父节点
 */
function checkChildren(obj){
	
	if (obj == null) 
		return ;

	var cked = obj.checked ;

	//checkParent (obj.name ,obj.parentId ,cked) ;

	var e = window.event.srcElement ;
	var sube = null ;
	while (true){
		sube = e.nextSibling ;
		if (sube == null)
			return ;
		if (sube.tagName == "DIV")
			break ;
		e = sube ;
	}
	
	if (sube == null)
		return ;

	var len = 0 ;
	var checkboxs = sube.getElementsByTagName ("INPUT") ;
	if (checkboxs != null)
		len = checkboxs.length ;

	for (var i=0 ;i<len ;i++)
	{
		var checkbox = checkboxs[i] ;
		if (checkbox.state == "30")//父节点或失效节点
			checkbox.checked = false ;
		else
			checkbox.checked = cked ;
	}
}
/**
 * @use:字节点反相感应父节点
 */
function checkParent(name ,parentId ,cked){
	var objParent = document.all (parentId) ;
	if (objParent == null){
		var hasCked = hasChecked("children_") ;//根节点孩子块

		var objRoot = document.all (name+"_") ;
		objRoot.checked = hasCked ;

		return ;
	}

	if (cked){
		if (objParent.state != "30")
			objParent.checked = cked ;
	}else{
		var divId = parentId.replace(name+"_","children_") ;//获取孩子DIV块
		
		var hasCked = hasChecked (divId) ;
		if (!hasCked)
			objParent.checked = cked ;
	}
	
	checkParent (name ,objParent.parentId ,cked) ;
}
/**
 * @use:探测DIV标签里是否有已选择的checkbox
 */
function hasChecked(divId){
	var objDiv = document.all (divId) ;
	if (objDiv == null)
		return false;

	var len = 0 ;
	var checkboxs = objDiv.getElementsByTagName ("INPUT") ;
	if (checkboxs != null)
		len = checkboxs.length ;
	var hasCked = false ;
	for (var i=0 ;i<len ;i++){
		if (checkboxs[i].checked == true){
			hasCked = true ;
			break ;
		}
	}

	return hasCked ;
}

/*
 * @use:回显历史数据、再选数据 for checkbox/radio
 * @param data 相关数据,可能来自window.opener(text/select内容)或parent.rightFrame(select内容)
 */
function reload(data ,name){
	objp = data ;
	objp = obj2Array (objp) ;
	//子窗口域
	var objc = document.all (name) ;
	objc = obj2Array (objc) ;

	if (objp != null && objc != null){
		var lenp = objp.length ;
		var lenc = objc.length ;

		for (var i=0 ;i<lenp ;i++){
			var _valuep = objp[i].value ;
			var status = objp[i].state ;

			if (_valuep == "" //排除无效节点(e.g. 根节点)
				//|| objp[i].selected == false //排除被取消的新增数据 //for sinolife 存在的即有效
				)
				continue ;
			
			for (var j=0 ;j<lenc ;j++){
				var _valuec = "\""+objc[j].value ;
				if (_valuec.indexOf("\""+_valuep+":")>=0){
					if (status != undefined)
						objc[j].state = status ;
					objc[j].checked = true ;
				}
			}
		}
	}
}

function setBrowser(valueId){
	var _obj = parent.mainFrame.document.all(valueId) ;
	var obj = obj2Array (_obj) ;
	if (obj == null)
		return null ;
	var param = new Array() ;

	var len = obj.length ;
	
	var j = 0 ;
	for (var i=0 ;i<len ;i++){
		if (obj[i].checked == true){// && obj[i].state == undefined 允许返回父节点
			param[j] = obj[i].value ;
			j++ ;
		}
	}
	if (j == 0)
		param = null ;//父窗口停止往下执行任务的标识
	
	parent.returnValue = param ;

	window.close();
}

//初始化时,把window.opener的数据赋值给${valueId}Buffer
function init_liketree(type ,valueId){
	if (type == "radio")
		return ;

	//else
	var obj = document.all(valueId+'Target');
	var objBuf = document.all (valueId+'Buffer') ;
	
	var w = window.dialogArguments ;//寄生在参数里的父窗口对象
	var data = w.document.all(valueId) ;//from window.opener

	//初始化${valueId}Buffer
	var objp = obj2Array (data) ;

	for (var i=0 ;i<objp.length ;i++){
		if (objp[i].text == "")
			continue ;

		var select = objp[i].selected ;
		var status = objp[i].state ;
		/*
		if (select == false){
			if (status == "10"){//被标记待删除状态,移入buffer
				var bufo = new Option(objp[i].text ,objp[i].value) ;
				bufo.selected = true ;
				objBuf.add (bufo) ;
			}
			continue ;
		}*/

		var o = new Option(objp[i].text ,objp[i].value) ;
		o.selected = true ;
		o.state = status ;//储存初始状态
		obj.add (o) ;
	}
}

//把rightFrame.${valueId}的数据回显
function reload_liketree(valueId){
	var obj = parent.rightFrame.document.all(valueId+'Target') ;
	//因为obj是从外页面获取
	//这种和页面加载同步执行的函数,存在延时的问题,可能无法及时获取对象
	if (obj == null){
		setTimeout("reload_liketree('"+valueId+"')" ,20) ;
		return;
	}

	reload(obj ,valueId);//回显数据
}

function setBrowser_liketree(type ,valueId){
	var param = new Array() ;

	if (type == "radio"){
		var _obj = parent.mainFrame.document.all (valueId) ;
		var obj = obj2Array(_obj) ;
		if (obj == null)
			return ;
		var len = obj.length ;
		var j = 0 ;
		for (var i=0 ;i<len ;i++){
			if (obj[i].checked == true){
				param[0] = obj[i].value ;
				j++ ;
				break ;
			}
		}

		if (j == 0)
			param = null ;//父窗口停止往下执行任务的标识
	
		parent.returnValue = param ;

		window.close();
		
		return ;
	}
	
	//else
	var _obj = document.all(valueId+'Target') ;
	var obj = obj2Array (_obj) ;
	if (obj == null)
		return null ;

	var len = obj.length ;
	var j = 0 ;
	for (var i=0 ;i<len ;i++){
		if (obj[i].selected == true){// && obj[i].state == undefined 允许返回父节点
			param[j] = obj[i].value+":"+obj[i].text ;
			j++ ;
		}
	}
	if (j == 0)
		param = null ;//父窗口停止往下执行任务的标识
	
	parent.returnValue = param ;

	window.close();
}


var bakIndex = 0 ;
/**
 * @use:tree.option 单选时,备份当前选择的索引,以备恢复
 */
function backIndex(index){
	if (index >0)
		gotoIndex = index ;
}
/**
 * @use:tree.option 校验/跳转
 */
function goto(name ,mode ,multiple){
	var obj = document.all (name) ;
	if (obj == null)
		return ;
	
	var os = obj.options ;
	var len = os.length ;
	for (var i=0 ;i<len ;i++){
		var o = os[i] ;
		var status = o.state ;
		if (status == "30" && o.selected == true){
			o.selected = false ;

			alert ("您无权操作数据项["+trim(o.show)+"]") ;

			if (multiple == false)
				obj.options[bakIndex].selected = true ;

			return ;
		}
	}

	if (mode == "refresh"){
		var href = getUrl(location.href ,name+";pageno") ;
		location.href = href 
						+ (href.indexOf("?")>=0?"":"?") + name+"="+obj.options[obj.selectedIndex].value ;
	}
}

/*
 */
function distribute(type){
	window.status = "暂时没有实现" ;
}