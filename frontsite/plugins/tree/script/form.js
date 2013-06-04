/**

-----------------------------
提供表单控制脚本(支持对象数组)，依赖general.js,number.js
form.js v1.0 By 汪学贫@2004-5
-----------------------------
*/


/*
	@use:设置全部ckeckbox状态
	@param obj:欲控制的checkbox对象/对象名
	@param state:目标状态
	@return int
*/
function induceCkbox (_obj ,state)
{
	var obj = objIsNull(_obj) ;
	if (obj == null)
		return 0 ;

	if (state == null) state = true ;

	var k = 0 ;	
	for (var i=0 ;i<obj.length ;i++)
	{
		obj[i].checked = state ;
		k++ ;
	}

	hint ("命中目标"+k+"个" ,"_STATUS") ;

	return k ;
}

/*
	@use:判断ckeckbox是否空选
	@param objc:欲控制的checkbox对象/对象名
	@return boolean
*/
function hasChecked (_obj)
{
	var obj = objIsNull(_obj) ;
	if (obj == null)
		return false ;

	for (var i=0 ;i<obj.length ;i++)
	{
		if (obj[i].checked == true)
			return true ;
	}

	hint ("请选择欲操作的项") ;
	return false ;
}

/*
	@use:设置全部option状态
	@param objs:欲控制的select对象
	@param state:目标状态
	@return int
*/
function induceOption(_obj ,state)
{	
	var obj = objIsNull (_obj) ;
	if (obj == null)
		return 0 ;

	if (state == null) state = true ;
	
	var k = 0 ;
	var len = obj.length ;
	for (var i=0;i<len ;i++ )
	{
		var o = obj[i] ;
		o.selected = state ;
		k++ ;
	}

	hint ("命中目标"+k+"个" ,"_STATUS") ;

	return k ;
}

/*
	@use:判断select是否空选
	@param obj:欲控制的select对象/对象名
	@return boolean
*/
function hasOption (_obj)
{
	var obj = objIsNull(_obj) ;
	if (obj == null)
		return false ;

	var len = obj.length ;
	for (var i=0;i<len ;i++ )
	{
		var o = obj[i] ;
		if (o.selected == true)
			return true ;
	}
	
	hint ("请选择欲操作的项") ;
	return false ;
}

/*
	@use:复制源select的option到目标select
	@param source:
	@param target:
*/
function copyOption(_source ,_target)
{
	var source = getObj (_source) ;
	var target = getObj (_target) ;
	if (source == null || target == null)
		return ;

	var sourceNowIndex = source.selectedIndex ;
	if (sourceNowIndex == -1)
		return ;
	var sourceNowOption = source.item(sourceNowIndex) ;
	

	var targetNowIndex = target.selectedIndex ;
	if (targetNowIndex == -1)//自然在最后伸展
		targetNowIndex = target.length - 1 ;
	
	var copyer = document.createElement("Option") ;//or new Option()
	copyer.value = sourceNowOption.value ;
	copyer.text = sourceNowOption.text ;
	//是否存在
	if (existOption(copyer ,target)==true)
		return ;

	target.options.add (copyer ,targetNowIndex+1) ;
	sourceNowOption.selected = false ;

	copyOption (_source ,_target) ;
}

/*
	@use:改变option's index
	@param target:作用的select
	@param mode:方向(up|down)
*/
function moveOption (target ,mode)
{
	if (target == null)
		return ;

	var targetNowIndex = target.selectedIndex ;
	if (targetNowIndex == -1)
		return ;
	var targetNowOption = target.item(targetNowIndex) ;
	var tmpOption = targetNowOption ;

	if (mode == "up")
	{
		if (targetNowIndex>0)
		{
			var tmpOption = target.item(targetNowIndex - 1) ;
			target.remove (targetNowIndex - 1) ;
			target.options.add (tmpOption ,targetNowIndex) ;
		}
	}
	else if (mode == "down")
	{
		if (targetNowIndex<target.length-1)
		{
			var tmpOption = target.item(targetNowIndex + 1) ;
			target.remove (targetNowIndex+1) ;
			target.options.add (tmpOption ,targetNowIndex) ;
		}
	}
}

/*
	@use:判断option是否存在.若存在,则终止执行
*/
function existOption (op ,target)
{
	if (target == null)
		return ;
	
	if (target.contains(op) == true){
		hint ("数据["+op.text+"]已经存在") ;
		return true ;
	}
	
	return false ;
}

/**
	@use:移除some option,返回新的对象
*/
function removeOptions (_obj)
{
	var obj = getObj(_obj) ;
	if (obj == null)
		return ;

	var index = obj.selectedIndex ;
	while (index > -1){
		obj.remove (index) ;

		obj = document.all(obj.name) ;
		index = obj.selectedIndex ;
	}

	return obj ;
}

/**
	@use:移除the option,返回新的对象,索引值不变
*/
function removeOption (_obj ,index)
{
	var obj = getObj(_obj) ;
	if (obj == null)
		return ;

	obj.remove (index) ;

	obj = document.all(obj.name) ;

	return obj ;
}

/*
 * @use:屏蔽option操作
 */
function disabled(obj ,hint){

}

/**
 * @use:屏蔽select操作
 * 初始化时,设置 if option.selected = true ,then option.state = 1
 * if option.selected = false ,then option.state is undefined
 */
function readonly (obj ,hint)
{
	if (obj == null) return ;
	var len = obj.options.length ;
	for (var i=0 ;i<len ;i++){
		var o = obj.options[i] ;
		if (o.state == undefined)//false
			o.selected = false ;
		else//true
			o.selected = true ;
	}
}

/*
	@use:E-mail校验
	@param obj:E-mail接收控件
*/
function checkEmail(_obj)
{
	var obj = objIsNull (_obj) ;

	if (obj == null)
		return false ;
	
	for (var i=0; i<obj.length;i++ )
	{
		var v = obj[i].value ;
		var re = /^[_|a-z]{1,}[_|a-z|0-9]*@[_|a-z|0-9]{1,}\.[_\a-z|0-9]{1,}/ig ;
		if (re.exec(v)==null)
		{
			hint ("Email["+v+"]格式不匹配\n\r"+
					"  1)用户名以小写字母(a-z)或下划线(_)开头\n\r"+
					"  2)用户名由下划线或小写字母或数字(0-9)组成\n\r"+
					"  3)域名正确\n\r"+
					"如：yourname@xxx.com" ,"_ALERT") ;
			
			//input局部调用时：仅仅对直接调用有强制约束非空，其他的仅起光标定位提示作用。
			//document全局调用时：如，表单提交时校验，对象数组均被强制校验
			obj[i].select() ;
			obj[i].focus() ;

			return false ;
		}
	}
}

/*
	@use:校验textarea容量 by onPropertyChange()
*/
function checkArea (objName ,len)
{
	var obj = document.all(objName) ;
	if (obj == null)
		return ;
	if (obj.value.length>len)
	{
		hint('字数超出上限'+len);
		obj.value = obj.value.substring(0 ,len) ;
	}
}