var completeDiv;
var inputField;
var completeBody;

function getSearchList(){
	inputField = document.getElementById("searchZqdm");      
    completeDiv = document.getElementById("popupDiv");
    completeBody = document.getElementById("completeBody");
	
	if(inputField.value=="" || inputField.value.length>6){
		clearNames();
		return ;
	}
    
    if (inputField.value.length > 0) {
        var url="/gazx.do";
		var paras="method=searchZQDMList&zqdm=" + encodeURIComponent(inputField.value);
		new Ajax.Request(url,{method:'get',parameters:paras,onSuccess:processMatchResponse,onFailure:resError});
    } else {
        clearNames();
    }
}

function processMatchResponse(ajaxRequest) {
	if(inputField.value=="" || inputField.value.length>6){
		clearNames();
		return ;
	}
	clearNames();
	
    var names=ajaxRequest.responseXML.getElementsByTagName("zqdm")
    var size = names.length;
    setOffsets();
    var row, cell, txtNode;
    for (var i = 0; i < size; i++) {
        var nextNode = names[i].firstChild.data;
        row = document.createElement("tr");
        cell = document.createElement("td");
        cell.onmouseout = function() {this.style.backgroundColor ='#FFFAFA';};
        cell.onmouseover = function() {this.style.backgroundColor ='#f4a460';};
        cell.onmousedown = function() {completeField(this);};      
        cell.className = "sousuotiao";                              
        txtNode = document.createTextNode(nextNode);
        cell.appendChild(txtNode);
        row.appendChild(cell);
        completeBody.appendChild(row);
    }
}

function setOffsets() {
    var left = calculateOffset(inputField, "offsetLeft");
    var top = calculateOffset(inputField, "offsetTop") + inputField.offsetHeight;
    completeDiv.style.border = "black 1px solid";
    completeDiv.style.left = left + "px";
    completeDiv.style.top = top + "px";
}
function calculateOffset(field, attr) {
  var offset = 0;
  while(field) {
    offset += field[attr]; 
    field = field.offsetParent;
  }
  return offset;
}

function completeField(cell) {
	inputField.value = cell.firstChild.nodeValue.split(" ")[0];
	clearNames();
}

function clearNames() {
    var ind = completeBody.childNodes.length;
    for (var i = ind - 1; i >= 0 ; i--) {
         completeBody.removeChild(completeBody.childNodes[i]);
    }
    completeDiv.style.border = "none";
}

function resError(ajaxRequest){
	alert('发送请求异常，请稍后再试！');
}

function changeF10Index2(){
	if(document.getElementById("searchZqdm").value=="代码/名称/拼音" || document.getElementById("searchZqdm").value==""){
		return ;
	}else{
		window.location.href="/FCInfo/index.jsp?typeAndzqdm="+document.getElementById("searchZqdm").value;
	}
}