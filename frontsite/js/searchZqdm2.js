var completeDiv2;
var inputField2;
var completeBody2;

function getSearchList2(){
	inputField2 = document.getElementById("searchZqdm2");      
    completeDiv2 = document.getElementById("popupDiv2");
    completeBody2 = document.getElementById("completeBody2");
	
	if(inputField2.value=="" || inputField2.value.length>6){
		clearNames2();
		return ;
	}
    
    if (inputField2.value.length > 0) {
        var url2="/gazx.do";
		var paras2="method=searchZQDMList&zqdm=" + encodeURIComponent(inputField2.value);
		//var paras2="method=searchZQDMListUseSms&zqdm=" + encodeURIComponent(inputField2.value);
		new Ajax.Request(url2,{method:'get',parameters:paras2,onSuccess:processMatchResponse2,onFailure:resError2});
    } else {
        clearNames2();
    }
}
function getSearchListSms(){
	inputField2 = document.getElementById("stockCode4");      
    completeDiv2 = document.getElementById("popupDiv4");
    completeBody2 = document.getElementById("completeBody4");
	
	if(inputField2.value=="" || inputField2.value.length>6){
		clearNames2();
		return ;
	}
    
    if (inputField2.value.length > 0) {
        var url2="/gazx.do";
		//var paras2="method=searchZQDMList&zqdm=" + encodeURIComponent(inputField2.value);
		var paras2="method=searchZQDMListUseSms&zqdm=" + encodeURIComponent(inputField2.value);
		new Ajax.Request(url2,{method:'get',parameters:paras2,onSuccess:processMatchResponse2,onFailure:resError2});
    } else {
        clearNames2();
    }
}
function getSearchListSmsYj(){
	inputField2 = document.getElementById("stockCodeyj");      
    completeDiv2 = document.getElementById("popupDivyj");
    completeBody2 = document.getElementById("completeBodyyj");
	
	if(inputField2.value=="" || inputField2.value.length>6){
		clearNames2();
		return ;
	}
    
    if (inputField2.value.length > 0) {
        var url2="/gazx.do";
		//var paras2="method=searchZQDMList&zqdm=" + encodeURIComponent(inputField2.value);
		var paras2="method=searchZQDMListUseSms&zqdm=" + encodeURIComponent(inputField2.value);
		new Ajax.Request(url2,{method:'get',parameters:paras2,onSuccess:processMatchResponse2,onFailure:resError2});
    } else {
        clearNames2();
    }
}

function processMatchResponse2(ajaxRequest) {
	if(inputField2.value=="" || inputField2.value.length>6){
		clearNames2();
		return ;
	}
	clearNames2();
	
    var names2=ajaxRequest.responseXML.getElementsByTagName("zqdm")
    var size2 = names2.length;
    setOffsets2();
    var row2, cell2, txtNode2;
    for (var i = 0; i < size2; i++) {
        var nextNode2 = names2[i].firstChild.data;
        row2 = document.createElement("tr");
        cell2 = document.createElement("td");
        cell2.onmouseout = function() {this.style.backgroundColor ='#FFFAFA';};
        cell2.onmouseover = function() {this.style.backgroundColor ='#f4a460';};
        cell2.onmousedown = function() {completeField2(this);};      
        cell2.className = "sousuotiao";                              
        txtNode2 = document.createTextNode(nextNode2);
        cell2.appendChild(txtNode2);
        row2.appendChild(cell2);
        completeBody2.appendChild(row2);
    }
}

function setOffsets2() {
    var left = calculateOffset2(inputField2, "offsetLeft");
    var top = calculateOffset2(inputField2, "offsetTop") + inputField2.offsetHeight;
    completeDiv2.style.border = "black 1px solid";
    completeDiv2.style.left = left + "px";
    completeDiv2.style.top = top + "px";
}
function calculateOffset2(field, attr) {
  var offset = 0;
  while(field) {
    offset += field[attr]; 
    field = field.offsetParent;
  }
  return offset;
}

function completeField2(cell) {
	inputField2.value = cell.firstChild.nodeValue.split(" ")[0];
	clearNames2();
}

function clearNames2() {
    var ind = completeBody2.childNodes.length;
    for (var i = ind - 1; i >= 0 ; i--) {
         completeBody2.removeChild(completeBody2.childNodes[i]);
    }
    completeDiv2.style.border = "none";
}

function resError2(ajaxRequest){
	alert('åéè¯·æ±å¼å¸¸ï¼è¯·ç¨ååè¯ï¼');
}

function changeF10Index(){
	if(document.getElementById("searchZqdm2").value=="代码/名称/拼音" || document.getElementById("searchZqdm2").value==""){
		return ;
	}else{
		window.location.href="/FCInfo/index.jsp?typeAndzqdm="+document.getElementById("searchZqdm2").value;
	}
}