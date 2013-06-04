function tst(id,num,str,css1,css2){
   for(var i=1;i<=num;i++){
     var idStr = str+i;
     if(id==idStr)
         eval("document.all."+idStr+".className ='"+css1+"';")
      else
         eval("document.all."+idStr+".className ='"+css2+"';")
   }
}

var whoclick=""
function font_click(obj){
 if(whoclick!=""){
    whoclick.className="";
 }
 obj.className="font-bold font-brown";
 whoclick=obj;
}

function reNextSibing(o)
{
	do {
    	o = o.nextSibling;
    } while (o && (o.nodeType != 1));
    return o;
};
function pN(o)
{
	while(document.body!=o)
	{		
		o=o.parentNode;
		o.style.display="";
	}	
}
function OnLk(ThisObj)
{
	var UlObj=document.getElementsByTagName("ul");
	if(reNextSibing(ThisObj).style.display=="none")
	{
		for(i=0;i<UlObj.length;i++)
		{
			UlObj[i].style.display="none";
		}		
		ThisObj.style.display="";
		pN(ThisObj);
		reNextSibing(ThisObj).style.display="";
	}else
	{
		reNextSibing(ThisObj).style.display="none";
	}
	
}