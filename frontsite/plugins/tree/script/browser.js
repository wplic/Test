/**

	--------------------------------
	提供浏览器处理脚本，依赖general.js,remover.js
	browser.js v1.0 By 汪学贫@2004-6
	--------------------------------

	geBrowser():获取站点资源器返回结果，填充目标对象
*/

var objText ;//for text
var objValue ;//for text/list
var bufValue ;//for delete.list

var textId ;
var valueId ;

var mode ;
/*
 *@use:获取返回(并刷新)结果,约定返回值格式=value:text
 *@param explorer
 *@param type
 *@param textId
 *@param valueId
 *@param mode
 *@param script,暂支持std
	pro:1)保留历史数据/再选数据,提供二次操作的机会
		2)父、子窗口可互操作数据
	std:1)仅子窗口控制父窗口数据
 *@param width
 *@param height
 */
function getBrowser (explorer ,type ,textId ,valueId ,mode ,script ,width ,height)
{
	var len = arguments.length ;
	if (len >8)
		return ;

	this.textId = textId ;
	this.valueId = valueId ;
	this.mode = mode ;
	//自定义子窗口宽、高
	if (len <= 6)
		width = 500 ;
	if (isNaN(width) || (""+width).indexOf(".")>=0)
		width = 500 ;
	if (len <= 7)
		height = 460 ;
	if (isNaN(height) || (""+height).indexOf(".")>=0)
		height = 460 ;
	
	objText = document.all (textId) ;
	objValue = document.all (valueId) ;
	bufValue = document.all(valueId+"Buffer") ;

	//检查所需域是否存在 ...
	if (objText == null && objValue == null || bufValue == null){
		hint ("对象不存在") ;
		return ;
	}

	var values = window.showModalDialog (
					explorer
					,window //传递父窗口对象
					,'dialogWidth:'+width+'px;dialogHeight:'+height+'px;'+
					 'center:yes;help:no;resizable:no;status:no;scroll:auto'
				 ) ;

	//values是配对送给父页面的,其名值对以符号:界分,格式=ID:TITLE
	if (values == null){
		//如果有历史数据,则证明取消了所有,恢复不选状态
		if (type == "list"){
			var objlen = objValue.options.length ;
			for (var i=0;i<objlen ;i++ ){
				var _o = objValue.options[i];
				if (_o.state == "11"){//历史数据移入缓冲器
					var o = new Option();
					o.text = _o.text ;
					o.value = _o.value ;
					bufValue.add(o) ;
				}

				//移出接受器
				objValue.remove(0);
				objlen = objValue.options.length ;
			}
		}

		return ;
	}

	///////////////////////////////////处理返回值///////////////////////////
	//1:list
	if (type == "list"){
		initList(values) ;
	}
	//2:text
	if (type == "text"){
		initText(values ,mode) ;
	}
}

function initList(values){
	//1.1.1筛选出删除的历史数据/取消的新增数据
	//1.1.2恢复被删除的历史数据/取消的新增数据
	deleting (values) ;

	//1.2筛选出新增部分
	adding (values) ;
}

function deleting(values){
	var objlen = objValue.length ;
	for (var i=0 ;i<objlen ;i++){//source.options ;state.charAt(0)=1/2
		//标识删除的添加到${valueId}Buffer容器,由服务器端负责读取
		if (isdel(i ,values)){
			i = del(i) ;

			//del()后,可能已变更
			objlen = objValue.length ;
		}
	}
}

function adding(values){
	var len = values.length ;
	for (var i=0 ;i<len ;i++){
		var index = values[i].indexOf(":") ;//默认每个返回值仅一个:符号！
		var tmpValue = values[i].substring(0 ,index) ;
		var tmpText = values[i].substr(index+1) ;
		if (tmpValue == "")
			continue ;

		
		var o = new Option (tmpText ,tmpValue) ;

		index = exists(o ,objValue) ;
		if (index < 0){
			//如果不在接收器,则为新增
			o.setAttribute ("state" ,"21") ;			
		}else{
			//如果在接收器,移出;并标记上state=11/21,移入
			var _o = objValue.options[index] ;
			objValue.remove(index) ;
			objValue = document.all(valueId) ;

			o.setAttribute("state" ,_o.state);
		}

		index = exists(o ,bufValue) ;
		if (index >=0)
		{
			//如果在缓冲器,移出;并标记上state=11,移入
			bufValue.remove(index);
			bufValue = document.all(valueId+"Buffer") ;

			o.setAttribute("state" ,"11");
		}

		objValue.add (o) ;
	}
}

function isdel(objindex ,values){
	var len = values.length ;

	var objo = objValue.options[objindex] ;
	var status = objo.state ;

	var remove = true ;

	for (var j=0 ;j<len ;j++){//values.options
		var o = values[j] ;
		var index = o.indexOf(":") ;//默认每个返回值仅一个:符号！
		var tmp = o.substring(0 ,index) ;
		
		//也许还存在
		if (objo.value == tmp){
			remove = false ;
			break ;
		}
	}

	return remove ;
}

function del (objindex){
	var objo = objValue.options[objindex] ;
	var status = objo.state ;

	//1.1.1标上待删除标记——历史数据
	if (status == "11"){//并处于选择状态,即未曾移入buffer
		//取消选择状态
		if (exists(objo ,bufValue) < 0){//in fact ,index < 0!
			var tmpo = new Option (objo.text ,objo.value) ;
			tmpo.selected = true ;
			tmpo.state = "11" ;
			bufValue.add (tmpo) ;//移入buffer

			//重新赋值
			bufValue = document.all(valueId+"Buffer") ;
		}
	}

	//并移出
	objValue.remove(objindex) ;

	//重新赋值
	objValue = document.all(valueId) ;
	objindex = objindex - 1 ;

	return objindex ;
}

function initText(values){
	//获取新的名值对
	var index = values[0].indexOf(":") ;//默认每个返回值仅一个:符号！
	var tmpValue = values[0].substring(0 ,index) ;
	var tmpText = values[0].substr(index+1) ;
	
	//储存旧的名值对
	var value = objValue.value ;
	var text = objText.value ;

	var len = bufValue.length ;
	if (len == 0){//可能存储历史值或仅给文本框赋值
		if (value != "" && value != tmpValue){
			var __o = new Option(text ,value) ;
			if (exists(__o ,bufValue) < 0){
				__o.selected = true ;
				bufValue.add (__o,0) ;
			}
		}
	}else if (len == 1){//已经存储了历史值
		var ov = bufValue[0].value ;
		if (tmpValue == ov){//若恢复,则移出buffer
			bufValue.remove (0) ;
		}
	}else//默认max(buffer.length)=1
		alert ("数据剥离错误,请与管理员联系") ;

	if (value != tmpValue){//如果更新了,则...
		objValue.value = tmpValue ;
		objText.value = tmpText ;

		if (mode == "refresh"){
			var href = getUrl(location.href ,valueId+";"+textId+";pageno") ;
			location.href = href 
							+ (href.indexOf("?")>=0?"":"?") + valueId+"=" + tmpValue
							+ "&" + textId + "=" + tmpText ;
		}
	}
}