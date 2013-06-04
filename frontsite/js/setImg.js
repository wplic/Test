function selectImg(id)
{
	document.getElementById("xjimg1").style.border = "1px solid #d2d2d2";
	document.getElementById("xjimg1").style.padding = "2px";
	document.getElementById("xjimg1").style.background = "#ffffff";
	
	document.getElementById("xjimg2").style.border = "1px solid #d2d2d2";
	document.getElementById("xjimg2").style.padding = "2px";
	document.getElementById("xjimg2").style.background = "#ffffff";
	
	document.getElementById("xjimg3").style.border = "1px solid #d2d2d2";
	document.getElementById("xjimg3").style.padding = "2px";
	document.getElementById("xjimg3").style.background = "#ffffff";
	
	document.getElementById("xjimg4").style.border = "1px solid #d2d2d2";
	document.getElementById("xjimg4").style.padding = "2px";
	document.getElementById("xjimg4").style.background = "#ffffff";


	if(id == "xjimg1"){
		document.getElementById("xjimg1").style.border = "2px solid #cc0202";
		document.getElementById("xjimg1").style.padding = "1px";
	}else if(id == "xjimg2"){
		document.getElementById("xjimg2").style.border = "2px solid #cc0202";
		document.getElementById("xjimg2").style.padding = "1px";
	}else if(id == "xjimg3"){
		document.getElementById("xjimg3").style.border = "2px solid #cc0202";
		document.getElementById("xjimg3").style.padding = "1px";
	}else{
		document.getElementById("xjimg4").style.border = "2px solid #cc0202";
		document.getElementById("xjimg4").style.padding = "1px";
	}
			
} 