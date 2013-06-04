/***

--------------------------------
提供数据列表翻页脚本，依赖general.js
leaf.js v1.0 By 汪学贫@2004-5
--------------------------------
setLeafEnvironment():设置翻页环境变量(依赖leaf.jsp)
leaf():跳转翻页(依赖setLeafEnvironment())
keyDown4Leaf():回车跳转翻页 for IE(依赖leaf()|leaf.jsp)

*/


/**
	@use:跳转翻页(依赖leaf.jsp)
	@function setLeafState 设置环境变量
	@param pageName 页码参数名
	@param defaultValue 当前默认的有效下一页
	@param inputName 接受输入值的input
	@param pageNum 总的页数
	@param href 目标链接
*/
var _leaf_pageName = "pageno" ;
var _leaf_defaultValue = 1 ;
var _leaf_inputName = "_leaf_topage" ;
var _leaf_pageNum = 1 ;
var _leaf_locationParam = "" ;

var obj = null ;
function setLeafEnvironment (pageName ,defaultValue ,inputName ,pageNum ,locationParam)
{
	//args = setLeafEnvironment.arguments ;
	//强制表单的method值.
	var f = document.forms[0] ;
	if (f != null)
		f.method = "post" ;

	_leaf_pageName = pageName ;
	_leaf_defaultValue = defaultValue ;
	_leaf_inputName = inputName ;
	_leaf_pageNum = pageNum ;
	_leaf_locationParam = locationParam ;

	obj = objIsNull (inputName ,1)[0] ;
	if (obj == null){
		return false ;
	}else{
		//obj.focus();
	}
}
function leaf()
{
	var pageName = _leaf_pageName ;
	var defaultValue = _leaf_defaultValue ;
	var inputName = _leaf_inputName ;
	var pageNum = _leaf_pageNum ;
	var href = _leaf_locationParam ;
	
	//校正begin
	if (isNull (inputName ,"跳转页码") == false)
	{
		hint ("跳转页码不能为空，系统自动校正为默认值") ;

		obj.value = defaultValue ;
		obj.select() ;
		//obj.focus() ;

		return false ;
	}

	var v = obj.value ;
	if (isNaN(v))
	{
		hint ("跳转页码非数字，系统自动校正为默认值") ;

		obj.value = defaultValue ;
		obj.select() ;
		//obj.focus() ;

		return false ;
	}
	
	var now = new Number(v) ;
	if (v.indexOf(".")>=0)
	{
		hint ("跳转页码非整数，系统自动取整校正") ;

		obj.value = Math.floor(now) ;
		obj.select() ;
		//obj.focus() ;

		return false ;
	}
	
	if (pageNum == 0)
	{
		hint ("零数据，不支持翻页") ;

		obj.value = pageNum ;
		obj.select() ;
		//obj.focus() ;

		return false ;
	}
	if (now<1 || now>pageNum)
	{
		if (now>pageNum) now = pageNum ;
		if (now<1) now = 1 ;
		
		hint ("跳转页码["+v+"]不符合翻页范围[1-"+pageNum+"]，系统自动校正至临近页["+now+"]");

		obj.value = now ;
		obj.select() ;
		//obj.focus() ;

		return false ;
	}
	//校正end
	
	document.location.href =  "?"+pageName+"="+now+href ;
}
/**
	@use:回车跳转翻页 for IE(依赖leaf()|leaf.jsp)

	使用document.onkeydown=keyDown4Leaf ，如引入leaf.js，便独霸onkeydown。
	所以屏蔽上述语句，修正成调用控件的obj.onkeydown，而其必须在装载控件obj后调用。
	参考leaf.jsp。
	
	1)要保证调用leaf()返回false时leaf()不重定向，追加return false
	2)要保证leaf()正常时leaf()完成重定向，追加return false ;
	综述，控制重定向，依赖return false
*/
function keyDown4Leaf() { 
	var keycode = event.keyCode ;
	if (keycode == 13)
	{
		leaf () ;
		return false ;
	}
}

/**
 * @use 校验数据载体表格是否存在
 */
function hasTable(id){
    var obj = document.all(id);
    if (obj == null){
        alert("分页组件v2.0设定的[ID="+id+"]的表格不存在,请检查属性值paging:page.tableId") ;
		return false ;
	}

	return true ;
}

function alterTableRowColor(tableId ,rowIndex ,alterColor){
	var obj = document.all(tableId) ;
	if (obj == null) return ;
	
	if (alterColor == null) return ;
	color = alterColor.split(";");
	if (color.length==1) {
		color[1] = color[0] ;
		color[0] = "" ;
	}
	//一般第一行是表头,不计算在内
	for (i=1 ;i<rowIndex+2;i++){
		var objRow = obj.rows(i) ;
		if (objRow == null) break ;
		objRow.bgColor=color[0] ;
		
		objRow = obj.rows(++i) ;
		if (objRow == null) break ;
		objRow.bgColor=color[1] ;
	}
}