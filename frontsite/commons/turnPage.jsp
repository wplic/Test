
<%@ page import="com.cssweb.common.util.Constants"%>
<script>

function isNumber(String){ 
    	  var Letters = "1234567890.-"; 
    	   var i;
   		   var c;
     		 for( i = 0; i < String.length; i ++ ){
              c = String.charAt( i );
   			  	 if (Letters.indexOf( c ) < 0){
    	       		 return false;
					}
    		} 
			return true;
}
function goPage(list,page) {
  document.getElementById("current_page").value=page;
  list.submit();
  return;
}
function goPageByFormName(list,page) {
  document.getElementById("current_page").value=page;
  document.getElementById(list).submit();
  return;
}
function gotoNPage(list) { 

  var page=document.getElementById("gotoPage").value;
  var totalPage=document.getElementById("pages").value;
  if(!isNumber(page)){
   alert("转到必须为数字!");
   return false;
   
  }
  if (page=="")
  {
    page=1;
    }
    if(Number(page)>Number(totalPage)){
     page=totalPage;
    }
 
  document.getElementById("current_page").value=page;
  list.submit();
  return;
}


</script>

<%
  int pagesize = 0;
  int totleCount=Integer.parseInt(request.getAttribute("totleCount") == null ? "0" : request.getAttribute("totleCount").toString());
  int currentPage=0;
  String pageC=(String)request.getAttribute("currentPage");
  String pagesizeNow = (String)request.getAttribute("pagesizeNow");
  if (pagesizeNow == null)
    {    
       pagesize = Integer.parseInt(Constants.PAGESIZE) ;
    }else{
       pagesize = Integer.parseInt(pagesizeNow);
    }  
  if(pageC==null)
  {
    currentPage=1;
   }
  else{
    currentPage=Integer.parseInt(pageC);
    }
%>

