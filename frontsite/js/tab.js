function tst(id,num,str,css1,css2){
   for(var i=1;i<=num;i++){
     var idStr = str+i;
     if(id==idStr)
         eval("document.getElementById('"+idStr+"').className ='"+css1+"';")
      else
         eval("document.getElementById('"+idStr+"').className ='"+css2+"';")
   }
}

var $a=function(id){return document.getElementById(id);}
function SwitchNews(obj,num,sum,class1,class2)
{
	ClearNews(obj,sum,class1,class2);
	$a("tag" + obj + num).className=class1;
	$a(obj+num).style.display = "";								
}
function SwitchNewsBlog(obj,num,sum,class1,class2)
{
	
 	ClearNews(obj,sum,class1,class2);
	$a("tag" + obj + num).className=class1;
	$a("tag" + obj+num).style.display = "";								
}

function ClearNews(name, num,class1,class2)
{					
	for(i=1;i<= num;i++)
	{										
		var tag=$a("tag"+ name + i).className;
		if(tag==class1){
			$a("tag"+ name + i).className=class2; 
			$a(name + i).style.display="none";
		}
	}
}

function SwitchNews2(name,num,suffix,sum)
{
 	ClearNews2(name,suffix,sum);
	$a("tag" + name + num).style.display = "none";
	$a("tag" + name + num + suffix).style.display = "";
	$a(name + num).style.display = "";
						
}
function ClearNews2(name,suffix,num)
{					
	for(i=1;i<= num;i++)
	{	
		$a("tag" + name + i).style.display="";
		$a("tag" + name + i + suffix).style.display="none";
		$a(name + i).style.display="none";
	}
}

function checkAlert(){
   alert("网站此栏目正在建设中，有不便之处敬请谅解！！！");
   return false;
}

function SwitchNews3(obj,num,sum,class11,class12,obj2,sum2,class21,class22,obj3,sum3,class31,class32)
{
 	ClearStyle(obj,sum,class11,class12,obj2,sum2,class21,class22,obj3,sum3,class31,class32);
	$a("tag" + obj + num).className=class11;
	$a(obj+num).style.display = "";								
}
function EventForMouseOut(name,num,class11,class12,name2, num2,class21,class22,name3, num3,class31,class32)
{
	//alert("fddddddddddddd");
	for(i=1;i<= num;i++)
	{										
		var tag=$a("tag"+ name + i).className;  
		if(tag==class11){
			$a("tag"+ name + i).className=class12; 
			$a(name + i).style.display="none";
		}
	}
		for(i=1;i<= num2;i++)
	{										
		var tag=$a("tag"+ name2 + i).className;   
		if(tag==class21){
			$a("tag"+ name2 + i).className=class22; 
			$a(name2 + i).style.display="none";
		}
	}
		for(i=1;i<= num3;i++)
	{										
		var tag=$a("tag"+ name3 + i).className;
		if(tag==class31){
			$a("tag"+ name3 + i).className=class32; 
			$a(name3 + i).style.display="none";
		}
	}						
}

function ClearStyle(name,num,class11,class12,name2, num2,class21,class22,name3, num3,class31,class32)
{					
	for(i=1;i<= num;i++)
	{										
		var tag=$a("tag"+ name + i).className;  
		if(tag==class11){
			$a("tag"+ name + i).className=class12; 
			$a(name + i).style.display="none";
		}
	}
		for(i=1;i<= num2;i++)
	{										
		var tag=$a("tag"+ name2 + i).className;
		if(tag==class21){
			$a("tag"+ name2 + i).className=class22; 
			$a(name2 + i).style.display="none";
		}
	}
		for(i=1;i<= num3;i++)
	{										
		var tag=$a("tag"+ name3 + i).className;
		if(tag==class31){
			$a("tag"+ name3 + i).className=class32; 
			$a(name3 + i).style.display="none";
		}
	}
}
//end 新加
