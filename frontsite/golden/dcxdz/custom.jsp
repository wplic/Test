<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@page import="java.util.*"%>
<%@page import="org.springframework.context.ApplicationContext"%>
<%@page	import="org.springframework.web.context.support.WebApplicationContextUtils"%>
<%@page	import="com.cssweb.subscribe.service.TcsswebDcxdzService"%>
<%@page	import="com.cssweb.subscribe.pojo.TcsswebDcxdetail"%>
<jsp:directive.page import="com.cssweb.client.pojo.TsystemWebuser"/>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>广发证券</title>
<link href="${ctx }/css/global.css" rel="stylesheet" type="text/css" />
<link href="${ctx }/css/wsyyt/wsyyt.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${ctx }/js/jquery.js"></script>
<script type="text/javascript">
function orderlist(obj1,obj2){
	var obj = document.getElementById(obj1);
	if(obj!=null){
		if(obj.checked){
			var cxobj = document.getElementsByName(obj2);
			if(cxobj!=null){
				var i;
		        for(i=0;i<cxobj.length;i++){
		        	cxobj[i].checked=true;
		        }
			}
		}else{
			var cxobj = document.getElementsByName(obj2);
			if(cxobj!=null){
				var i;
		        for(i=0;i<cxobj.length;i++){
		        	cxobj[i].checked=false;
		        }
			}
		}
	}	
}
function resetall(){
	var cxobj = document.getElementsByName("checkbox_cx");
	if(cxobj!=null){
		var i;
		for(i=0;i<cxobj.length;i++){
		   cxobj[i].checked=false;
		}
	}
	var cxobj1 = document.getElementsByName("checkbox_dx");
	if(cxobj1!=null){
		var i;
		for(i=0;i<cxobj1.length;i++){
		   cxobj1[i].checked=false;
		}
	}
}
function checkLoginTo()
{
        var checkbox_dx=GetRadioValue("checkbox_dx");
        var checkbox_cx=GetRadioValue("checkbox_cx");
        if((checkbox_dx==null||checkbox_dx == "") && (checkbox_cx==null||checkbox_cx == ""))
		{
		   alert("您还没请选择定制项目");
		   return;
		}
		var loginForm=document.getElementById("loginForm");
	   loginForm.submit();
}
function GetRadioValue(RadioName){
    var obj;   
    obj=document.getElementsByName(RadioName);
    if(obj!=null){
        var i;
        for(i=0;i<obj.length;i++){
            if(obj[i].checked){
                return obj[i].value;           
            }
        }
    }
    return null;
}
</script>
</head>
<%
TsystemWebuser tsystemWebuser=null;
String account = null;
String branchno = null;
if(request.getSession().getAttribute("tsystemWebuser")==null)
{
%>
<script type="text/javascript">
	var url = "/share/login.jsp";
	document.location.href=url;
</script>
<%
}
else{
	tsystemWebuser = (TsystemWebuser)request.getSession().getAttribute("tsystemWebuser");
	account= tsystemWebuser.getUserName();
	branchno = tsystemWebuser.getBranchCode();
}
ServletContext st = this.getServletConfig().getServletContext();
ApplicationContext ctx = WebApplicationContextUtils.getRequiredWebApplicationContext(st);
TcsswebDcxdzService dcxService = (TcsswebDcxdzService)ctx.getBean("tcsswebDcxdzService");
String begindate = dcxService.getCurrentDate();
request.getSession().setAttribute("begindate",begindate);
List list = null;
Map map = new HashMap();
list = dcxService.getSmsItem(account,branchno);
map = dcxService.getSmsDetail(account,branchno);
%>
<body class="body_bg">
<jsp:include page="/share/top.jsp?nav=jgj&nav1=dcxdz" />
<div class="main">
  <div class="dqwz">当前位置：首页 > 我的理财中心 > 金管家彩短信定制</div>
  <div class="blank10"></div>
    <div class="kline">
      <div class="qiebg">
      
       <div style="background:url(/pic/branches/branchtit1.jpg) no-repeat; height:25px; line-height:25px; text-indent:25px; color:#cc0000;margin-top:10px;font-size:12px;">服务介绍</div>
      <div class="p10 lh22">
        <p>　　
        
        广发证券金管家E对壹服务，是广发证券基于您的个性化需求，集合公司各类资讯产品精华的手机资讯服务，包括短信以及彩信两大产品。金管家E对壹服务为您量身定制个性化的手机资讯套餐，令您可随时随地、随手掌握唯您专属的投资理财服务。
          <br />
        </p>
      </div>
      
        <div class="p10 lh22"> <img src="/pic/sms/ede1.jpg" />
<p>　金管家E对壹彩信，荟集了广发证券总部顶级分析师及投资顾问团队的智慧结晶，每日准时为您发送精选市场资讯。产品集合了<strong>投顾市场策略、行业公司精选、广发研究速递</strong>等王牌栏目，是您投资理财的决策利器。 
          </p>
          <p><font color="#0000FF">适用对象：</font>目前仅支持中国移动、中国联通用户<br />
            <font color="#0000FF">发送频率：</font>1条/交易日，22条/月均<br />            
          </p>
          
      </div>
        <div class="p10 lh22"> 
          <p><img src="/pic/sms/ede2.jpg" />　<br />
            金管家E对壹短信，是根据您的个性化需求，随时将第一手的财经资讯传递给您，便于您及时掌控账户状况、了解市场最新动态，获取专属的第一手财经信息。</p>
          <p><font color="#0000FF">适用对象：</font>适合中国移动、中国联通以及中国电信所有用户<br />
           
          </p>
      </div>
      
      <div style="background:url(/pic/branches/branchtit1.jpg) no-repeat; height:25px; line-height:25px; text-indent:25px; color:#cc0000;margin-top:10px;font-size:12px;">服务定制</div>
<!--      
<form name="loginForm" action="${ctx }/tcsswebDcxdzAction.do?method=saveTcsswebDcxdzList" method="post" id="loginForm">
-->
<form name="loginForm" action="${ctx }/golden/dcxdz/risk.jsp" method="post" id="loginForm">
       <div class="p10 lh22">
  <%
  int flag=1;
  if(list!=null&&list.size()>0){
  	String cxstr="";
  	for(int i = 0 ;i < list.size();i++){
  		TcsswebDcxdetail item = (TcsswebDcxdetail) list.get(i);
  		cxstr = item.getItemid();
  		if(item.getProducttype()==6&& ( map==null || map.get(cxstr)==null) ){
  	%>
  <table width="100%" border="1" cellpadding="0" cellspacing="0" class="tab_cj">
  	<tr>
      <td colspan="4" height="30"><div align="center" class="red2 font14 bold">金管家E对壹彩信资费标准</div></td>
    </tr>
    <tr>
      <td width="208"><p align="center">定制项目 </p></td>
      <td width="521"><p align="center">彩信提示内容</p></td>
      <td width="52"><p align="center">元 / 月 </p></td>
      <td width="109" align="center"><input type="checkbox" name="checkboxCx" id="checkboxCx" onclick="orderlist('checkboxCx','checkbox_cx');"/>
        <label for="checkbox" style="color:#0000FF">定制</label></td>
    </tr>
  	<%
  		flag=0;
  		break;
  		}
  	}
  }
  String str = null;
  if(flag == 0){
    if(list!=null&&list.size()>0){
    	Iterator<TcsswebDcxdetail> ite = list.iterator();
    	while(ite.hasNext()){
			TcsswebDcxdetail item = ite.next();
			str = item.getItemid();
			if(item.getProducttype()==6&& ( map==null || map.get(str)==null) ){
	%>
	<tr>
      <td><p align="left"><%=item.getProductname() %></p></td>
      <td><p align="left"><%=item.getProductremark() %></p></td>
      <td><p align="center"><%=item.getProductfate() %></p></td>
      <td align="center"><input type="checkbox" name="checkbox_cx" value="<%=item.getItemid() %>"/>
        <label for="checkbox1" style="color:#0000FF">定制</label></td>
    </tr>
	<%
			}
		}
    }
    %>
  </table>
  <%} %>
  <div class="blank10"></div>
  <% 
  	int dxflag=1;
    if(list!=null&&list.size()>0){
    	Iterator<TcsswebDcxdetail> ite = list.iterator();
    	while(ite.hasNext()){
			TcsswebDcxdetail itemdx = ite.next();
			str = itemdx.getItemid();
			if(itemdx.getProducttype()!=6&& ( map==null || map.get(str)==null)){
	%>
  <table cellspacing="0" border="1" class="tab_cj" cellpadding="0">
  <tr>
    <td width="100%" colspan="5" height="30"><p align="center" class="red2 font14 bold">金管家E对壹短信服务资费标准 </p></td>
  </tr>
  <tr>
    <td width="108"><p align="center">信息类型 </p></td>
    <td width="100"><p align="center">定制项目 </p></td>
    <td width="521"><p align="center">短信提示内容 </p></td>
    <td width="52"><p align="center">元 / 月 </p></td>
    <td width="109" align="center"><input type="checkbox" name="checkboxDx" id="checkboxDx" onclick="orderlist('checkboxDx','checkbox_dx');"/>
      <label for="checkbox22" style="color:#0000FF">定制</label></td>
    </tr>
   <% 
	   			dxflag = 0;
	   			break;
   			}
   		}
   	}
   	str=null;
   	if(dxflag==0){
    if(list!=null&&list.size()>0){
    	Iterator<TcsswebDcxdetail> ite = list.iterator();
    	while(ite.hasNext()){
			TcsswebDcxdetail itemdx = ite.next();
			str = itemdx.getItemid();
			if(itemdx.getProducttype()!=6&& ( map==null || map.get(str)==null)){
	%>
	<tr>
		<td><p align="center"><%=itemdx.getItemname() %> </p></td>
		<td><p align="left"><%=itemdx.getProductname() %></p></td>
	    <td><p align="left"><%=itemdx.getProductremark() %> </p></td>
	    <td><p align="center"><%=itemdx.getProductfate() %> </p></td>
	    <td align="center"><input type="checkbox" name="checkbox_dx" value="<%=itemdx.getItemid() %>"/>
	      <label for="checkbox23" style="color:#0000FF">定制</label></td>
    </tr>
	<%
			}
		}
    }
    }
    %>
</table>
<br />
<%
if(flag==0 || dxflag==0){%>
<p class="p10" align="center">
<input name="" onclick="checkLoginTo()" class="popBtn2" type="button" value="确认定制以上服务" />&nbsp;&nbsp;
<input name="" class="dybtn1" type="button" value="重新选择" id="reset" onclick="resetall();"/>　</p>
<%} %>
<!-- <p class="p10" align="center"><input id="check" onclick="location.href='risk.jsp'" class="dybtn11" type="button" value="确认定制以上服务" />&nbsp;&nbsp;<input name="" class="dybtn1" type="button" value="重新选择" id="reset"/>　</p> -->
      </div>
</form> 
<br />
    </div>
    </div>
    

  <!--右侧sied结束--> 
  
  
  
</div>


</body>
<jsp:include page="/commons/bottom.jsp" />


</html>