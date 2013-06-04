
var hotkey = function(e){
	var e = window.event || e;
	var url = "";
	
	switch(e.keyCode){
	case 113: // F2
		showMenu('');
		url = "PaperBuy.jsp";
		goToFrame('mainFrame',url);
		break;
	case 114: // F3
		showMenu('');
		url = "Papersale.jsp";
		goToFrame('mainFrame',url);
		break;
	case 115: // F4
		showMenu('');
		url = "webTradeAction.do?method=searchStackDetail";
		goToFrame('mainFrame',url);
		break;
	case 117: // F6
		showMenu('');
		url = "webTradeAction.do?method=searchDealDetailToday";
		goToFrame('mainFrame',url);
		break;
	case 118: // F7
		showMenu('');
		url = "webTradeAction.do?method=searchEntrustDetailToday";
		goToFrame('mainFrame',url);
		break;
	case 119: //F8
		showMenu('');
		url = "webTradeAction.do?method=searchEntrustDetailToday&cancel=Y";
		goToFrame('mainFrame',url);
		break;
	/*
	case 116: // F5
		showMenu('');
		url = "";
		goToFrame('mainFrame',url);
		break;
	case 120: //F9
		showMenu('');
		url = "";
		goToFrame('mainFrame',url);
		break;
	*/
	default:
		return;
	}
	
	try{
		e.keyCode = 0;
	}catch(Exception){
	  	Event.stop(e);
	}finally{
		e.returnValue=false;
	}
}

function showMenu(str){
	//TODO	
}
function goToFrame(fName,url){
	window.top.frames[fName].location.href = url;
}


//Event.observe(document, 'keydown', hotkey, true);