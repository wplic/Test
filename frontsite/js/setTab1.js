var $s=function(id){return document.getElementById(id);}
function SwitchNews(obj,num,sum,class1,class2)
{
 	ClearNews(obj,sum,class1,class2);
	$s("tag" + obj + num).className=class1;
	$s(obj+num).style.display = "";								
}
function hidden(obj,num,sum)
{
 	ClearNews(obj,sum);
	$s(obj+num).style.display = "none";								
}
function ClearNews(name,num,class1,class2)
{					
	for(i=1;i<= num;i++)
	{										
		var tag=$s("tag"+ name + i).className;
		if(tag==class1){
			$s("tag"+ name + i).className=class2; 
			$s(name + i).style.display="none";
		}
	}
}

function showMenua(menuID,index) {
	$s(menuID).style.display=(index==0?"none":"block");
}

<!-- 选项卡更多切换 -->

function clearBlock(allnum,name){

	for(i=1 ; i<=allnum ; i++){

		document.getElementById(name + i).style.display="none";

	}

}

function changeBlock(num,allnum,name){

	clearBlock(allnum,name)

	document.getElementById(name+num).style.display="block";

}