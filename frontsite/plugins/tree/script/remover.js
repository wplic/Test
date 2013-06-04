
/**
	--------------------------------------------------------------------------------
	【remover:剥离混合数据器】v1.0 By 汪学贫@2004-8
	 (C) Copyright 2001-2004 CssWeb Tech. Co., Ltd., All Rights Reserved.
	--------------------------------------------------------------------------------


	组件【move() exists()】：
		提供不通过查询数据库判断数据是否存在而决定新增新数据|删除被移除数据.
		优势在于:
			1)转移服务器压力到客户端.
			2)避免强制删除关联数据,新增后再创建先前的关联数据.
		应用场景:
			1)select to select:"缓冲槽"设置成display:none
			2)checkbox to select:选择、取消就模拟移入、移出操作,
								 设置currentValue = value+":"+text
			3)扩展应用——翻页操作数据(checkbox to select):放于静止FRAME里.需要时,可设置frame.width=0
		相关概念:
			1)源槽、目标槽、缓冲槽:
					(1)需要排序/源数据特多(足够影响选择结果的展示)/数据源来自页面内部:source、target、buffer组成套件
					(2)不需要排序/源数据不是特多/数据源来自页面外部:source合并target(此时设置source=null),与buffer组成套件

			2)数据类型:
					0:未使用的源数据
					1:已使用的源数据(历史数据)
					2:新选择的源数据
					3:无效的源数据

			3)数据状态:
					0:selected = false
					1:selected = true

			4)数据初始状态:
					空闲源数据——state = 00(默认,可略)
					历史数据——state = 11
					新增数据——state = 21
					无效数据——state = 30
*/


/*
 * @执行剥离.select to select for source合并target
 */
function op2opBy2op(_target ,_buffer){

	var target = getObj(_target) ;
	var buffer = getObj(_buffer) ;

	//正式计算 ...
	var bufos = buffer.options ;
	var tgeos = target.options ;

	var tgelen = tgeos.length ;
	for (var i=0 ;i<tgelen ;i++){
		var tgeo = tgeos[i] ;

		var status = tgeo.state ;//前一状态
		if (status == undefined)//设置默认初始值
			status = "00" ;
		var isvalid = tgeo.selected ;//当前选择状态

		switch (status){
			case "00":
				if (isvalid)
					tgeo.state = "01" ;
				break ;
			case "01":
				if (!isvalid)
					tgeo.state = "00" ;
				break ;
			case "10"://根据设定,肯定被移入了buffer
				if (isvalid){
					tgeo.state = "11" ;
					//移出buffer,取消待删状态
					var index = exists (tgeo ,buffer) ;
					if (index >= 0)//in fact ,index >= 0!
						buffer.remove(index) ;
				}
				break ;
			case "11":
				if (!isvalid){
					tgeo.state = "10" ;
					//移入buffer,待删状态
					var _o = new Option(tgeo.text ,tgeo.value) ;
					_o.selected = true ;
					buffer.add (_o) ;
				}
				break ;
			case "20":
				if (isvalid)
					tgeo.state = "21" ;
				break ;
			case "21":
				if (!isvalid)
					tgeo.state = "20" ;
				break ;
		}
	}
}

/*
 * @执行剥离操作.select to select
 */
function op2opBy3op(){
	
}

/*
 * @执行剥离操作.checkbox to select
 *	1)source = checkbox
 *	2)把初始状态(11)储存在target.item
 */
function box2op(_source ,_target ,_buffer){
	var source = getObj(_source) ;
	var target = getObj(_target);
	var buffer = getObj(_buffer) ;

	var check = source.checked ;

	var index = source.value.indexOf(":") ;//默认每个返回值仅一个:符号！
	var tmp = new Array() ;
	var value = source.value.substring(0 ,index) ;
	var text  = source.value.substr(index+1) ;

	var o = new Option(text ,value) ;
	if (check){//选中
		
		//曾经放置于待删状态,移出buffer
		index = exists (o ,buffer) ;
		if (index > -1){
			buffer.remove (index) ;

			o.state = "11" ;//恢复储存的初始状态
		}

		//移入target
		o.selected = true ;
		target.add (o) ;
	}else{//取消
		index = exists(o ,target) ;
		var status = "00" ;

		if (index > -1){
			status = target.item(index).state ;//先取出储存的初始状态信息

			target.remove (index) ;//再移除
		}

		//如果是历史数据,则移入buffer
		if (status == "11"){
			o.selected = true ;
			buffer.add (o) ;
		}
	}
}

/*
 * @use:取消历史数据的选择状态,向服务器提交实时数据
 */
function cancel (_target)
{
	var target ;
	if (_target.constructor == String)
		target = document.all (_target) ;
	else
		target = _target ;

	var tgeos = target.options ;
	var tgelen = tgeos.length ;

	for (var i=0 ;i<tgelen ;i++){
		var tgeo = tgeos[i] ;
		var status = tgeo.state ;

		if (status == "11")
			tgeo.selected = false ;
		else
			tgeo.selected = true ;
	}
}