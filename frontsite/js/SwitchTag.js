function tst(id,num,str,css1,css2){
   for(var i=1;i<=num;i++){
     var idStr = str+i;
     if(id==idStr)
         eval("document.all."+idStr+".className ='"+css1+"';")
      else
         eval("document.all."+idStr+".className ='"+css2+"';")
   }
}
var $d=function(id){return document.getElementById(id);}
function SwitchNews(obj,num,sum,class1,class2)
{
 	ClearNews(obj,sum,class1,class2);
	$d("tag" + obj + num).className=class1;
	$d(obj+num).style.display = "";								
}

function ClearNews(name, num,class1,class2)
{					
	for(i=1;i<= num;i++)
	{										
		var tag=$("tag"+ name + i).className;
		if(tag==class1){
			$d("tag"+ name + i).className=class2; 
			$d(name + i).style.display="none";
		}
	}
}
