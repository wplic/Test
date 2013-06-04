
function Struct(_key, _value) {
	this.key	= _key;
	this.value	= _value;
	this.toString = function() {
		return this.key;
	}
}

function HashMap() {
	this.map = new Array();
	this.get = function(key) {
		for (var i = 0; i < this.map.length; i++){
			if ( this.map[i].key == key )
				return this.map[i].value;
		}
		return null;
	}
	this.getValue = function(index) {
		if (this.map.length <= index)
			return null;
		return this.map[index].value;
	}
	this.put = function(key, value) {
		for (var i = 0; i < this.map.length; i++) {
			if ( this.map[i].key == key ) {
				this.map[i].value = value;
				return;
			}
		}
		this.map [this.map.length] = new Struct(key, value);
	}
	
	this.remove = function(key) {
		var v;
		for (var i = this.map.length - 1; i >= 0; i--) {
			v = this.map.pop();
			if ( v.key == key )
				continue;
			this.map.unshift(v);
		}
	}
	this.size = function(){ 
		return this.map.length;
	}

	this.isEmpty = function() {
		return (this.map.length == 0);
	}
	
	this.getKeys = function() {
		var size = this.size();
		if (size == 0)
			return null;
		var keys = new Array(size);
		for (var i = 0; i < size; i++)
			keys[i] = this.map[i].key;
		return keys;
	}
	this.getValues = function() {
		var size = this.size();
		if (size == 0)
			return null;
		var values = new Array(size);
		for (var i = 0; i < size; i++)
			values[i] = this.map[i].value;
		return values;
	}
}

function Menu(_group, _id, _name, _src){
	this.group  = _group;
	this.id		= _id;
	this.name	= _name;
	this.group	= _group;
	this.src	= _src;
	this.getName = function(){
		return this.name;
	}
	this.setSrc = function(_s){
		this.src = _s;
	}
}

//--------------------------------------------------------------------------------------------------------------

var menuTable = new HashMap();
var defaultMenu = null;
function initMenuConfigure(){
	// TOP菜单
	var temp = new Menu("gp", "gp", "股票", "gp_search_zqzc");
	menuTable.put (temp.id, temp);
	
	// 股票的子菜单
	temp = new Menu("gp", "gp_buy",    "单向申报", "/nxsyBSAction.do?method=listBuy");
	menuTable.put (temp.id, temp);
	temp = new Menu("gp", "gp_arbitrage",    "双向申报", "/nxsyBSAction.do?method=listArbitrage");
	menuTable.put (temp.id, temp);
	//temp = new Menu("gp", "gp_sale",   "股票卖出", "/nxsyBSAction.do?method=listSell");
	//menuTable.put (temp.id, temp);
	temp = new Menu("gp", "gp_cancel",   "撤单", "/nxsyCancelAction.do?method=listCancel");
	menuTable.put (temp.id, temp);
	temp = new Menu("gp", "gp_search", "当日查询", "");
	menuTable.put (temp.id, temp);
		temp = new Menu("gp", "gp_search_zqzc", "证券资产", "/nxsyQueryAction.do?method=listAsset");		
		menuTable.put (temp.id, temp);
		temp = new Menu("gp", "gp_search_drwt", "当日委托", "/nxsyQueryAction.do?method=listEntrust");
		menuTable.put (temp.id, temp);
		temp = new Menu("gp", "gp_search_drcj", "当日转换", "/nxsyQueryAction.do?method=listDeliver");
		menuTable.put (temp.id, temp);
		temp = new Menu("gp", "gp_search_zcpm", "资产排名", "/nxsyQueryAction.do?method=listRank");
		menuTable.put (temp.id, temp);
    temp = new Menu("gp", "gp_history", "历史查询", "");
	menuTable.put (temp.id, temp);
		temp = new Menu("gp", "gp_history_lswt", "历史委托", "/nxsyQueryHisAction.do?method=listHisentrust");
		menuTable.put (temp.id, temp);
		temp = new Menu("gp", "gp_history_lscj", "历史成交", "/nxsyQueryHisAction.do?method=listHisdeliver");
		menuTable.put (temp.id, temp);
		temp = new Menu("gp", "gp_history_price", "历史净值", "/nxsyQueryHisAction.do?method=listHisprice");
		menuTable.put (temp.id, temp);
		temp = new Menu("gp", "gp_stockjour", "股份流水", "/nxsyQueryHisAction.do?method=listStockjour");
		menuTable.put (temp.id, temp);
		temp = new Menu("gp", "gp_fundjour", "资金流水", "/nxsyQueryHisAction.do?method=listFundjour");
		menuTable.put (temp.id, temp);
		//temp = new Menu("gp", "gp_history_jgd", "交割单", "#ctx/stock/jgd.jsp");
		//menuTable.put (temp.id, temp);
		//temp = new Menu("gp", "gp_history_dzd", "对账单", "#ctx/stock/dzd.jsp");
		//menuTable.put (temp.id, temp);
	temp = new Menu("gp", "gp_syl", "收益率", "");
	menuTable.put (temp.id, temp);
		temp = new Menu("gp", "gp_asset_day", "日收益率", "/nxsyAssetAction.do?method=listAssetDay");
		menuTable.put (temp.id, temp);
		temp = new Menu("gp", "gp_asset_week", "周收益率", "/nxsyAssetAction.do?method=listAssetWeek");
		menuTable.put (temp.id, temp);	
		temp = new Menu("gp", "gp_asset_month", "月收益率", "/nxsyAssetAction.do?method=listAssetMonth");
		menuTable.put (temp.id, temp);	
		// 股票的子菜单gp_asset_total_order
	temp = new Menu("gp", "gp_matchinfo",    "竞赛榜单", "");
	menuTable.put (temp.id, temp);
		temp = new Menu("gp", "gp_asset_month_order", "月收益率排名", "/nxsy/web/NxsyQueryMaAction.go?function=ListMonthInfo");
		menuTable.put (temp.id, temp);	
		temp = new Menu("gp", "gp_asset_total_order", "总收益率排名", "/nxsy/web/NxsyQueryMaAction.go?function=ListTotalInfo");
		menuTable.put (temp.id, temp);
	temp = new Menu("gp", "gp_userinfo",    "资料管理", "/nxsyRegisterAction.do?method=jumpUserinfo");
	menuTable.put (temp.id, temp);
	temp = new Menu("gp", "gp_pwd",    "重置密码", "/nxsyRegisterAction.do?method=jumpPwd");
	menuTable.put (temp.id, temp);
	temp = new Menu("gp", "gp_feedback",    "问题反馈", "/nxsyCommentAction.do?method=listComment");
	menuTable.put (temp.id, temp);
	// 默认菜单
	defaultMenu = "gp_search_zqzc";
}
initMenuConfigure();
	
//--------------------------------------------------------------------------------------------------------------

function clickLeftMenu(mid){
	var m = mid.split("_");
	if(m.length==1){
		clickTopMenu(mid);
		return;
	}
	var menu = menuTable.get(mid);
	if(menu == null) return;
	if(menu.src != null && menu.src !="" && menu.src !="null"){
		top.changeMainFrameSrc(menu.src);
	}
	top.changeTopMenu(menu.group);
}

function clickTopMenu(mid){
	top.showLeftMenu(mid);
	var menu = menuTable.get(mid);
	if(menu == null) return;
	if(menu.src != null && menu.src !="" && menu.src !="null"){
		//_showMenu(menu.src);
        clickMenu(menu.src);
		//top.changeLeftMenu(menu.src);
	}
}
// 系统默认菜单
function clickDefaultMenu(){
	//_showMenu(defaultMenu);
    clickMenu(defaultMenu);
}

function _showMenu(mid){
	var m = mid.split("_");
	var len = m.length;
	if(len<1) return;
	var tempMenu = m[0];
	top.showLeftMenu(tempMenu);
	for(i=1;i<len;i++){
		tempMenu += "_"+ m[i];
		setDefault(tempMenu);
	}
}

//--------------------------------------------------------------------------------------------------------------

// 初始化菜单（同级的A标签CSS还原 && 同级LI标签下的UL隐藏）
function setDefault(objId){
	var parentUL = $(objId).parentNode.parentNode;
	var parents  = parentUL.childNodes;
	var brother  = $(objId).parentNode.childNodes;
	for(i=0;i<parents.length;i++){
		if(parents[i].tagName=='LI'){
			var tempA = parents[i].getElementsByTagName("A")[0];
            removeCss(tempA.id,'current');
            if(tempA.id==objId) continue;
			var tempUL = parents[i].getElementsByTagName("UL");
			if(tempUL.length>0)
				openSubMenu(tempUL[0],false);
		}
	}
	
	//展开同级的UL
	for(i=0;i<brother.length;i++){
		if(brother[i].tagName=='UL'){
			var temp = brother[i].style.display=="";
			openSubMenu(brother[i],!temp); 
			break;
		}
	}
	
	addCss(objId, 'current');
}
// CSS 设置
function removeCss(objId,css){
	var obj = $(objId);
	obj.className = (obj.className == css) ?  '' : obj.className.replace(' '+css, '');
	if(obj.className!='')
		obj.className = obj.className.replace(css+' ', '');
}
function addCss(objId,css){
	var obj = $(objId);
	obj.className += ' '+css;
}
// 展开子菜单
function openSubMenu(obj,open){
	obj.style.display = open ? '':'none';
}

// 单击菜单
function clickMenu(sid){
    _showMenu(sid);
    JQ("#"+sid).click();
}

function $(obj){
    if (typeof obj == 'string'){
        element = document.getElementById(obj);
    }
    return element;
}