function selectlShow(obj1,obj2,obj3,obj4)
{
	var obj1 = document.getElementById(obj1);
	var obj2 = document.getElementById(obj2);
	
	var temp = obj2.style.display;
	if(temp == "none")
	{
		obj2.style.display = "";
		obj1.className = obj3;
	}
	else
	{
		obj2.style.display = "none";
		obj1.className = obj4;
	}
}