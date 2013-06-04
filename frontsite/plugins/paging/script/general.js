/**

--------------------------------
提供系统级脚本，为其他模块享用
general.js v1.0 By 汪学贫@2004-5
--------------------------------

*/


/*
	@use:设定提示方式,默认是window.status
	@param mode：目前系统支持的方式（alert|window.status）
*/
var _HINT_MODE = "_STATUS" ;
function setHintMode (mode)
{
	if (mode=="_ALERT" || mode=="_STATUS")
		_HINT_MODE = mode ;
}
/*
	@use:信息提示(提示方式支持全局设定和局部设定)
	@param info:消息体
	@param mode:如果参数省略，默认全局设定；传入约定参数值，启用局部设定，完成后恢复默认全局设置
*/
function hint (info ,mode)
{
	var _HINT_MODE_TEMP = _HINT_MODE ;
	if (mode != null)//局部设定，参考[form.js].checkEmail()
		setHintMode (mode) ;
	
	if (_HINT_MODE == "_ALERT")
		alert (info) ;
	if (_HINT_MODE == "_STATUS")
		window.status = info ;
	
	//恢复默认全局设置
	_HINT_MODE = _HINT_MODE_TEMP ;
}

/*
	@use:判断必填项是否为空(支持对象数组,不支持select|checkbox)
	@param objName:对象名
	@param objTag:欲控制对象的标签
*/
function isNull (_obj ,objTag ,defValue)
{
	var obj = objIsNull (_obj) ;
	if (obj == null)
		return false ;
	
	if (objTag == null || objTag == "")
		objTag = "光标所在处" ;
	
	if (defValue == null) defValue = "" ;
	for (var i=0; i<obj.length;i++ )
	{
		if (obj[i].value == defValue)
		{
			hint ("["+objTag+"]不能为空") ;
			//input调用时：仅仅对直接调用有强制约束非空，其他的仅起光标定位提示作用。
			//document全局调用时：如，表单提交时校验，对象数组均被强制校验
			obj[i].focus() ;
			return false ;
		}
	}
}

/*
	@use:判断对象是否存在，返回对象数组
	@param obj:对象/对象名(限于第一个form)
	@适用范围：obj.length != obj.property.length，否则返回的对象数组可能不是所期望的
			如判断的select对象存在唯一，而不是多个时，此时得到的数组是select.options[]；
			又如判断的form对象存在唯一，而不是多个时，此时得到的数组是form.elements[]
			此时,适合调用objIsNullByObj()
*/
function objIsNull (_obj)
{
	var obj = getObj (_obj) ;

	return obj2Array (obj) ;
}

/*
 * @use:判断传入参数,统一成对象输出
 */
function getObj(_obj){
	var obj ;

	if (_obj.constructor == String)
		obj = eval ("document.all('"+_obj+"')") ;
	else
		obj = _obj ;

	return obj ;
}

/*
	@use:转换对象成数组形式,如果obj.length == obj.property.length,则得到obj.property
	@param obj:对象
*/
function obj2Array (_obj)
{
	if (_obj == null){
		hint ("对象不存在") ;
		return null ;
	}
	var obj = new Array();//强制对象数组

	if (_obj.length){
		var k = _obj.length ; 
		for (var i=0;i<k ;i++ ){
			obj.push (_obj[i]) ;
		}
	}
	else{
		obj.push (_obj) ;
	}
	
	if (obj.length == 0)
		return null ;

	return obj ;
}

/*
 * @use:判断数据在scope范围是否存在.
 *      返回存在值的索引,若不存在,返回-1
 */
function exists (o ,scope)
{
	var index = -1 ;
	var len = scope.length ;

	for (var i=0;i<len ;i++ )
	{
		var _o = scope[i] ;
		if (o.value == _o.value)
			return i ;
	}

	return index ;
}

/*
	@use:window.status初始化
*/
document.onkeypress = _init_status ;
document.onmousedown = _init_status ;
function _init_status(){
	window.status = "" ;
}