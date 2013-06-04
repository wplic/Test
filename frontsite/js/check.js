
function checknumber(string){ 
   var Letters = "1234567890"; 
   var i; 
   var c; 
   for( i = 0; i < string.length; i ++ ){ 
	c = string.charAt( i ); 
	if((Letters.indexOf( c ) ==-1)||(c.indexOf('-')!= -1)){ 
    	return true; 
		} 
   	} 
   return false; 
}


function checkIDCard (str) 
{ 
var isIDCard1 = new Object();
var isIDCard2 = new Object();

isIDCard1=/^[1-9]\d{7}((0\d)|(1[0-2]))(([0|1|2]\d)|3[0-1])\d{3}$/; 


isIDCard2=/^[1-9]\d{5}[1-9]\d{3}((0\d)|(1[0-2]))(([0|1|2]\d)|3[0-1])((\d{4})|\d{3}[A-Z])$/; 

	if (isIDCard1.test(str)||isIDCard2.test(str))
		{    
			return true;
	}else{
	
	return false;
	}
}  

function checkEmail(email){
	var pattern =/^([a-zA-Z0-9_\-\.\+]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([a-zA-Z0-9\-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
	return pattern.test(email);     
  }

function checkImg(file){
	var fileHZName=document.getElementById(file).value.match(/\.[a-zA-Z]+$/);
	
	if(fileHZName==".png" || fileHZName==".jpg" || fileHZName==".gif" || fileHZName==".PNG" || fileHZName==".JPG" || fileHZName==".GIF" ){
	 	return true;
	 }else{
	 	return false;
	}
}



