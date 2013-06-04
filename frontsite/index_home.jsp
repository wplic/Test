<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html; charset=utf-8" language="java" %>
<%@page import="java.util.List"%>
<style type="text/css">
<!--
.STYLE1 {color: #006600}
-->
#lovexin12,#lovexin14webcall{
width:120px;
height:550px;
}
</style>
<script type="text/javascript">	
							lastScrollY=10; 
							function heartBeatwebcall(){ 
							var diffY; 
							if (document.documentElement && document.documentElement.scrollTop) 
							diffY = document.documentElement.scrollTop; 
							else if (document.body) 
							diffY = document.body.scrollTop 
							else 
							{/*Netscape stuff*/} 
							
							//alert(diffY); 
							percent=.1*(diffY-lastScrollY); 
							if(percent>0)percent=Math.ceil(percent); 
							else percent=Math.floor(percent); 
							//document.getElementById("lovexin12").style.top=parseInt(document.getElementById ("lovexin12").style.top)+percent+"px"; 
							document.getElementById("lovexin14webcall").style.top=parseInt(document.getElementById ("lovexin14webcall").style.top)+percent+"px"; 
							lastScrollY=lastScrollY+percent; 
							}
					        // lovexin14webcall="<DIV id=\"lovexin14webcall\" style='left:2px;POSITION:absolute;TOP:120px;'><div style=\"width:29px;\"><img border=\"0\" src=\"pic/kfimg/kfbar_01.gif\" alt=\"\" /><a href=\"#\"><img border=\"0\" src=\"pic/kfimg/kfbar_02.gif\" alt=\"在线客服\" /></a><a href=\"#\" onClick=\"openWindowwebcall('webcall_home.jsp',560,680)\"><img border=\"0\" src=\"pic/kfimg/kfbar_03.gif\" alt=\"客户经理\" /></a><a href=\"#\"><img border=\"0\" src=\"pic/kfimg/kfbar_04.gif\" alt=\"咨询专家\" /></a><img border=\"0\" src=\"pic/kfimg/kfbar_05.gif\" /></div></div>" 
					        lovexin14webcall="<DIV id=\"lovexin14webcall\" style='left:2px;POSITION:absolute;TOP:120px;'><div style=\"width:29px;\"><img border=\"0\" src=\"pic/kfimg/kfbar_01.gif\" /> <a href=\"#\" onClick=\"openWindowwebcall('webcall_home.jsp',560,680)\"><img border=\"0\" src=\"pic/kfimg/kfbar_03.gif\" alt=\"客户经理\" /></a><img border=\"0\" src=\"pic/kfimg/kfbar_05.gif\" /></div></div>" 
							document.write(lovexin14webcall); 
							window.setInterval("heartBeatwebcall()",1); 
</script>

<script type="text/javascript">
function openWindowwebcall(url,height,width){
	window.open(url,'_blank','height='+ height +',width='+width+',toolbar=no,location=no,directories=no,menubar=no,scrollbars=no,resizable=no,status=no,top=100,left=200');
}
</script>