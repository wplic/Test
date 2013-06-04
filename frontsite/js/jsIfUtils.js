String.prototype.trim = function() {  
  var m = this.match(/^\s*(\S+(\s+\S+)*)\s*$/);  
  return (m == null) ? "" : m[1];  
} 

String.prototype.isMobile = function() {  
  return (/^(?:13\d|15[0123456789])-?\d{5}(\d{3}|\*{3})$/.test(this.trim()));  
} 

function isNum(value){
	var numtype="0123456789";
	for(i=0;i<value.length;i++){
		if(numtype.indexOf(value.substring(i,i+1))<0)
			return false; 
	}
	return true;
} 

//function frameFitSelfHeight(frameId){
//	myFrameId=frameId;
//	var frameHeight=document.getElementById(frameId).contentWindow.document.body.scrollHeight;
//	if(frameHeight==0){
//		setTimeout('frameFitSelfHeight(myFrameId)',100);
//	}else{
//		document.getElementById(frameId).height = frameHeight;
//	}
//}

function frameFitSelfHeight(frameId,countNum){
	myFrameId=frameId;
	myCountNum=countNum;
	
	if(myCountNum==null || myCountNum==undefined || myCountNum<0){
		myCountNum=0;
	}
	
	myCountNum++;
	
	if(myCountNum<=20){
		document.getElementById(myFrameId).height = document.getElementById(myFrameId).contentWindow.document.body.scrollHeight;
		setTimeout('frameFitSelfHeight(myFrameId,myCountNum)',500);
	}
}
function iframeFitHeight(oIframe) {  
    try { 
        var oWin = oIframe.name ? window.frames[oIframe.name] : oIframe.contentWindow;  
        oIframe.style.height = oWin.document.body.scrollHeight + "px"; 
    } 
    catch(e){} 
} 
function frameFitSelfHeightLocal(frameId,countNum){
	myFrameIdLocal=frameId;
	myCountNumLocal=countNum;
	
	if(myCountNumLocal==null || myCountNumLocal==undefined || myCountNumLocal<0){
		myCountNumLocal=0;
	}
	
	myCountNumLocal++;
	
	if(myCountNumLocal<=20){
		document.getElementById(myFrameIdLocal).height = document.getElementById(myFrameIdLocal).contentWindow.document.body.scrollHeight;
		setTimeout('frameFitSelfHeightLocal(myFrameIdLocal,myCountNumLocal)',500);
	}
}

function frameFitSelfHeightLocal1(frameId,countNum){
	myFrameIdLocal1=frameId;
	myCountNumLocal1=countNum;
	
	if(myCountNumLocal1==null || myCountNumLocal1==undefined || myCountNumLocal1<0){
		myCountNumLocal1=0;
	}
	
	myCountNumLocal1++;
	
	if(myCountNumLocal1<=20){
		document.getElementById(myFrameIdLocal1).height = document.getElementById(myFrameIdLocal1).contentWindow.document.body.scrollHeight;
		setTimeout('frameFitSelfHeightLocal1(myFrameIdLocal1,myCountNumLocal1)',500);
	}
}

function frameFitSelfHeightLocal2(frameId,countNum){
	myFrameIdLocal2=frameId;
	myCountNumLocal2=countNum;
	
	if(myCountNumLocal2==null || myCountNumLocal2==undefined || myCountNumLocal2<0){
		myCountNumLocal2=0;
	}
	
	myCountNumLocal2++;
	
	if(myCountNumLocal2<=20){
		document.getElementById(myFrameIdLocal2).height = document.getElementById(myFrameIdLocal2).contentWindow.document.body.scrollHeight;
		setTimeout('frameFitSelfHeightLocal2(myFrameIdLocal2,myCountNumLocal2)',500);
	}
}


function trim(s) {
  var count = s.length;
  var st    = 0;       // start
  var end   = count-1; // end

  if (s == "") return s;
  while (st < count) {
    if (s.charAt(st) == " ")
      st ++;
    else
      break;
  }
  while (end > st) {
    if (s.charAt(end) == " ")
      end --;
    else
      break;
  }
  return s.substring(st,end + 1);
}