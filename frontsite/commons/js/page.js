function toPage(page) {
		document.getElementById("pageNumber").value=page;
		document.forms.searchForm.submit(); //使用此方法时候，注意form表单里不能再存submit的按钮
	}


function checkPage(totalPages)
{
	//var totalPages = ${page.totalPages};
    if(document.getElementById("jump").value > totalPages) {
      	alert("您输入的页码超出范围，请重新输入！");
        document.getElementById("jump").focus();
        return false;
	} 
    else if(document.getElementById("jump").value < 1) {
     	alert("您输入的页码超出范围，请重新输入！");
        document.getElementById("jump").focus();
        return false;
 	} 
    else 
    {
    	toPage(document.getElementById("jump").value);
    }
}