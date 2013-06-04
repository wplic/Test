function selectCfh(id)
{
	document.getElementById("cjh").src = "pic/index/cjh_a.jpg";
	document.getElementById("czh").src = "pic/index/czh_a.jpg";
	document.getElementById("cfh").src = "pic/index/cfh_a.jpg";

	
	document.getElementById("cjh_con").style.display = "none";
	document.getElementById("czh_con").style.display = "none";
	document.getElementById("cfh_con").style.display = "none";

	
	if(id == "cjh"){
		document.getElementById(id).src = "pic/index/cjh_hov.jpg";
		document.getElementById("cjh_con").style.display = "block";
	}
	
	if(id == "czh"){
		document.getElementById(id).src = "pic/index/czh_hov.jpg";
		document.getElementById("czh_con").style.display = "block";
	}
	
	if(id == "cfh"){
		document.getElementById(id).src = "pic/index/cfh_hov.jpg";
		document.getElementById("cfh_con").style.display = "block";
	}
			
} 