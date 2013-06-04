var completeDiv5;
var inputField5;
var completeBody5;

function getSearchList5(){
	inputField5 = document.getElementById("searchZqdm5");      
    completeDiv5 = document.getElementById("popupDiv5");
    completeBody5 = document.getElementById("completeBody5");
	
	if(inputField5.value=="" || inputField5.value.length>6){
		clearNames5();
		return ;
	}
    
    if (inputField5.value.length > 0) {
        var url="/gazx.do";
		var paras="method=searchZQDMListUseSms&zqdm=" + encodeURIComponent(inputField5.value);
		new Ajax.Request(url,{method:'get',parameters:paras,onSuccess:processMatchResponse,onFailure:resError5});
    } else {
        clearNames5();
    }
}

function processMatchResponse(ajaxRequest) {
	if(inputField5.value=="" || inputField5.value.length>6){
		clearNames5();
		return ;
	}
	clearNames5();
	
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
        completeBody5.appendChild(row);
    }
}

function setOffsets() {
    var left = calculateOffset(inputField5, "offsetLeft");
    var top = calculateOffset(inputField5, "offsetTop") + inputField5.offsetHeight;
    completeDiv5.style.border = "black 1px solid";
    completeDiv5.style.left = left + "px";
    completeDiv5.style.top = top + "px";
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
	inputField5.value = cell.firstChild.nodeValue.split(" ")[0];
	clearNames5();
}

function clearNames5() {
    var ind = completeBody5.childNodes.length;
    for (var i = ind - 1; i >= 0 ; i--) {
         completeBody5.removeChild(completeBody5.childNodes[i]);
    }
    completeDiv5.style.border = "none";
}

function resError5(ajaxRequest){
	alert('发送请求异常，请稍后再试！');
}
