<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<body onclick="javascript:showStockDiv(0);">
	<script type="text/javascript" src="${ctx }/commons/js/ajax.js"></script>
	<script language="javascript" type="text/javascript">function $(id){
  return document.getElementById(id);
}
String.prototype.trim = function()
{
    // 用正则表达式将前后空格用空字符串替代。
    return this.replace(/(^\s*)|(\s*$)/g, "");
}
var zq_selected_index=0;
var zq_select_value;
var zq_is_show = false;
var zq_data;
var ctrlName="stock_keyword"; //数据填入框
var ctrlDiv="stk_div_list"; //证券显示div

/*初始控件和div的名称*/
function initCtrl(cName,cDiv)
{
   ctrlName=cName;
   ctrlDiv=cDiv;
}


/*当鼠标滑过div时选中*/
function divMouseOver(row){
	row.className="onover";
}

/*当鼠标滑出div时不选*/
function divMouseOut(row){
	row.className="onout";
}

/*当点击div中选中的行时搜索文本框写入数字*/
function divMouseClick(data) {
	document.getElementById(ctrlName).value=data;
}

function createStockDiv(responseText){
  if(responseText==""){
    return ;
  }
  zq_data=eval("("+responseText+")");
  var html="<table width=\"100%\" border=\"0\"  cellpadding=\"0\" cellspacing=\"0\" ><tr bgcolor=\"#E77410\"><td>代码</td><td >简称</td></tr>";
  for(var i=0;i<zq_data.length;i++){
    html+="<tr onmouseover='divMouseOver(this)' onmouseout='divMouseOut(this)' onclick=divMouseClick('"+zq_data[i].zqdm+"') ><td>"+zq_data[i].zqdm+"</td>";
    html+="<td>"+zq_data[i].zqjc+"</td></tr>";
  }
  html+="</table>";
  $(ctrlDiv).innerHTML=html;
  if(!zq_is_show){
       showStockDiv(1);

  }
}

function  getPostion(obj,type)
{
	var distance=0;

	while(obj.offsetParent!=null)
	{

		distance+=obj[type];
		obj=obj.offsetParent;
	}
	return distance;
}

function startinginitData(evt)
{
	 keyDown();
     var e=((evt)?(evt):(window.event));
	 if(e.keyCode==38)//up
	 {
	 	zq_selected_index--;
		 return false;
	 }else if(e.keyCode==40)//down
	 {
		zq_selected_index++;
		return false;
	 }
	 else if(e.keyCode==13)//Enter
	 {
		 if(zq_is_show)
		 {
			 if(zq_selected_index>0)
			 {
			 	var selectedtr= $(ctrlDiv).getElementsByTagName("tr");
				if(!selectedtr[zq_selected_index]) return;
    			var  sobject=$(ctrlName);
	 			if(sobject&&zq_data[zq_selected_index-1])
	 				sobject.value = zq_data[zq_selected_index-1].zqdm;
   		 		showStockDiv(0);
			 }
		 }

	 }
}
function sendStockMsg(keyword,evt){
  var keyvalue = keyword.trim();
  if(keyvalue!=""){
   var e=((evt)?(evt):(window.event));
   if(keyvalue!=zq_select_value&&e.keyCode!=13){
     asynCall("${ctx }/jsStockAction.do?method=list&stock_keyword="+keyword,createStockDiv);
     zq_select_value=keyvalue;
   }else{
     if(!$(ctrlDiv)) return false;
			var selectedtr= $(ctrlDiv).getElementsByTagName("tr");
			var lenx=selectedtr.length;
			if(selectedtr)
			{
				if(zq_selected_index>(lenx -1))
				{
					zq_selected_index=1;
				}
				else if(zq_selected_index<1)
				{
					zq_selected_index=(lenx - 1);
				}
				if(zq_is_show)
				{
					for(var j=1;j<lenx;j++)
					{
						if(j!=zq_selected_index)
						{
							selectedtr[j].className="onout";
						}
						else
						{
							selectedtr[j].className="onover";
						}
					}
				}
			}
   }
  }else{
    showStockDiv(0);
  }

}

function showStockDiv(type)
{
  var obj=$(ctrlDiv);
  if(type==0)
  {
    obj.style.display="none";
    zq_is_show = false;
    zq_selected_index=0;
  }
  else
  {
     var  sobject=$(ctrlName);


     obj.style.left=getPostion(sobject,"offsetLeft")+"px";
     obj.style.top=(getPostion(sobject,"offsetTop") +sobject.offsetHeight+1)+ "px";
     obj.style.display="block";
     zq_is_show = true;
    }

}

/*
	搜索股票
*/
function searchStock() {
	var stock = document.getElementById(ctrlName);
	if(stock.value==""||stock.value=='股票代码/拼音简称') {
		alert('股票代码/拼音简称不能为空！')
		return;
	}
	if(zq_is_show==true) {
		return;
	}
	var url = '${ctxPath }/cgi-bin/finance/Finance?function=DistinctStock&gpdm='+stock.value;
	window.open(url,'_blank');
}

/*
	当回车时进行查询
*/
function keyDown()
{
    
}
</script>