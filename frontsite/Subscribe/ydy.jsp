<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@ include file="/commons/taglibs.jsp"%>
<%@page import="java.util.List"%>
<%@page import="com.cssweb.subscribe.pojo.TcsswebFwtcdy"%>
<%@page import="com.cssweb.subscribe.pojo.TcsswebFwcpdy"%>
<%@page import="com.cssweb.subscribe.pojo.TcsswebFwcpcx"%>
<jsp:directive.page import="com.cssweb.client.pojo.TsystemWebuser"/>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>广发证券</title>
<link href="${ctx }/css/global.css" rel="stylesheet" type="text/css" />
<link href="${ctx }/css/wsyyt/wsyyt.css" rel="stylesheet" type="text/css" />
<%
TsystemWebuser tsystemWebuser=null;
	if(request.getSession().getAttribute("tsystemWebuser")!=null)
    tsystemWebuser=(TsystemWebuser)request.getSession().getAttribute("tsystemWebuser");
List list=null;
if(request.getAttribute("list")!=null)
 list=(List)request.getAttribute("list");
 
 List tcsswebFwtcdyList=(List)request.getAttribute("tcsswebFwtcdyList");
 
 List accontnotlist=(List)request.getAttribute("accontnotlist");
 %>
</head>

<body class="body_bg">
<jsp:include page="/share/top.jsp?nav=wsyyt&nav1=wdlczx" />
<div class="main">
  <div class="dqwz">当前位置：首页 > 网上营业厅 > 我的理财中心 > 我的管家资讯</div>
  <jsp:include page="/bussinesshall/movetradehall/financing_submenu.jsp">
		<jsp:param name="nav3" value="zzdysy" />
	</jsp:include>
  <div class="zzmenu">
  <img src="${ctx }/pic/Subscribe/dot1.gif" align="absmiddle" /> 
 <a href="${ctx }/tcsswebFwtcdyAtion.do?method=getTcsswebFwtcdyAll">自助定阅首页</a>
  <img src="${ctx }/pic/Subscribe/dot1.gif" align="absmiddle" />
  <a href="${ctx }/tcsswebFwcpcxAction.do?method=getFwcpcxDyprodListByAccount">
  <span class="red">已定阅专属资讯产品表</span></a>
  <img src="${ctx }/pic/Subscribe/dot1.gif" align="absmiddle" />
  <a href="${ctx }/tcsswebFwtcdyAtion.do?method=getTcsswebProFwcptdByAccounList">申请进度查询</a></div>
  
  <div class="blank10"></div>
</div>
<div class="wrap920">

	<P><img src="${ctx }/pic/Subscribe/banner4.jpg"  /></P>
    <p class="p10">尊敬的<%=tsystemWebuser!=null&&tsystemWebuser.getServiceName()!=null?tsystemWebuser.getServiceName():"" %>，您好</p>
    
    <ul class="dytag1">
        <li id="taglistt1" class="cur" onclick="SwitchNews('listt', 1, 2,'cur','')"><a href="#">您已定阅到产品<span></span></a></li>
        <li id="taglistt2" onclick="SwitchNews('listt', 2, 2,'cur','')"><a href="#">您可能适合的产品<span></span></a></li>
    </ul>
    
  <div class="dybox1" id="listt1">
    <p>对于整体的资讯产品套餐和对应资费介绍，请参考<span class="blue2"><a href="${ctx }/Subscribe/cpsm.jsp">套餐简介与定价表</a></span></p>
    <div class="blank10"></div>
      <table width="100%" border="0" cellspacing="0" cellpadding="0" class="dytab2">
  <tr class="bold font14">
    <td>产品名称                                                            </td>
    <td>产品介绍</td>
    <td>产品评价</td>
    <td></td>
  </tr>
     <%if(list!=null&&list.size()>0) {
		for(int i=0;i<list.size();i++){
			TcsswebFwcpdy tcsswebFwcpdy=(TcsswebFwcpdy)list.get(i);	
	%>
	<tr>
    <td><a href="${ctx }/Subscribe/dyFull.jsp?id=<%=tcsswebFwcpdy.getId() %>" target="_blank"><%=tcsswebFwcpdy.getProductName() %></td>
    <td class="blue2"><a href="${ctx }/Subscribe/dyFull.jsp?id=<%=tcsswebFwcpdy.getId() %>" target="_blank">查看详细 </a></td>
    <td class="blue2"><a href="${ctx }/Subscribe/evaluation.jsp?productId=<%=tcsswebFwcpdy.getId() %>" target="_blank">我要评论</a></td>
  </tr>
	<%} 
	}%>
</table>

    <p class="p10 lh22">
      您一共定阅了<span class="red"><%=list!=null&&list.size()>0?list.size():"0" %></span>种产品<br />
      如果您希望定阅更多的产品，请进入
      <a href="${ctx }/tcsswebFwtcdyAtion.do?method=getTcsswebFwtcdyAll">
      <span class="blue2">自助定阅 </span></a>或 <span class="blue2">
      <a href="#" onclick="SwitchNews('listt', 2, 2,'cur','')">
      您可能适合的产品</a> </span>，重新选择你所青睐的产品<br />
      如果您还有其他疑问，请咨询您的客户经理或者拨打我们的热线电话：95575<br />
    </p>
    </div>
    <div class="dybox1" id="listt2" style="display:none">
    <p class="lh22">下面各种产品是您目前还没有定阅，但是却可能适合您的！</p>
    <p class="lh22">对于整体的资讯产品套餐和对应资费介绍，请参考<span class="blue2"><a href="${ctx }/Subscribe/cpsm.jsp">套餐简介与定价表</a></span></p>
    <div class="blank10"></div>
  <form name="loginForm" action="${ctx}/Subscribe/dylc1.jsp" method="post" id="loginForm">
   <table width="100%" border="0" cellspacing="0" cellpadding="0" class="dytab2">
  <tr class="bold font14">
    <td>产品名称                                                            </td>
    <td>产品介绍</td>
    <td>申请</td>
  </tr>
   <%
	        if(tcsswebFwtcdyList!=null&&tcsswebFwtcdyList.size()>0)
	        {
	         for(int i=0;i<tcsswebFwtcdyList.size();i++)
	         {
	          TcsswebFwtcdy tcsswebFwtcdy=(TcsswebFwtcdy)tcsswebFwtcdyList.get(i);
	          %>
	          <tr>
			    <th>&nbsp;</th>
			    <th>&nbsp;</th>
			    <th class="bold"><%=tcsswebFwtcdy.getPackageName() %></th>
			  </tr>
			  <%
			  if(accontnotlist!=null&&accontnotlist.size()>0)
				  {
					  for(int j=0;j<accontnotlist.size();j++)
				        {
				         TcsswebFwcpcx tcsswebFwcpcx=(TcsswebFwcpcx)accontnotlist.get(j);
				         if(tcsswebFwcpcx.getPackageId()==tcsswebFwtcdy.getId()){
			   %>
			          <tr>
			          <td>
			          <a href="${ctx }/Subscribe/dyFull.jsp?id=<%=tcsswebFwcpcx.getProductId() %>" target="_blank">
			          <%=tcsswebFwcpcx.getProductName() %></td>
			          <td ><a href="${ctx }/Subscribe/dyFull.jsp?id=<%=tcsswebFwcpcx.getProductId() %>" target="_blank">查看详细</a></td>
			          <td>
			            <label>
					      <input name="input" id="<%=i %>input<%=tcsswebFwcpcx.getProductId() %>" type="checkbox" value="<%=tcsswebFwcpcx.getProductId() %>" onclick="selectldz('<%=tcsswebFwcpcx.getProductId() %>')"/>
					      定阅</label>
					      <label>
					      <input name="tyinput" id="<%=i %>tyinput<%=tcsswebFwcpcx.getProductId() %>" type="checkbox" value="<%=tcsswebFwcpcx.getProductId() %>" onclick="tyselectldz('<%=tcsswebFwcpcx.getProductId() %>')"/>
					        体验</label>
			          </td>
			          <tr>
	           <%
	            }
	           }
	          }
	         }
	        }
         %>
</table>
    <p class="p10" align="center"><input name="qddy" class="dybtn1" type="button" value="确认" onclick="checkLogin();"/>　
	<input name="czdy" class="dybtn1" type="button" value="重置" onclick="checkLoginty();"/></p>
</form>
</div>
  <div class="clearfloat"></div><!--清除浮动--> 
</div>
<jsp:include page="/share/bottom.jsp" />
<script src="/js/setTab.js"></script>
<script type="text/javascript">
var len=<%=tcsswebFwtcdyList!=null&&tcsswebFwtcdyList.size()>0?tcsswebFwtcdyList.size():0%>;
function selectldz(obj2)
	{
		for(var i=0;i<len;i++)
		{
		  if(document.getElementById(i+"input"+obj2)){
		   document.getElementById(i+"input"+obj2).checked=true;
		   if(document.getElementById(i+"input"+obj2).checked)
		    document.getElementById(i+"tyinput"+obj2).checked=false;
		  }
		}
	}
function tyselectldz(obj2)
	{
		for(var i=0;i<len;i++)
			{
			  if(document.getElementById(i+"tyinput"+obj2)){
			   document.getElementById(i+"tyinput"+obj2).checked=true;
			   if(document.getElementById(i+"tyinput"+obj2).checked)
			    document.getElementById(i+"input"+obj2).checked=false;
			  }
			}
	}
function checkLogin(){
	   var falg=true;
	   var loginForm=document.getElementById("loginForm");
	   var dd = document.getElementsByTagName("input");
	   var tydd = document.getElementsByTagName("tyinput");
	   for(i=0;i <dd.length;i++) { 
		  if(dd[i].checked){ 
		   falg=false;
		  } 
        }
        for(i=0;i <tydd.length;i++) { 
		  if(tydd[i].checked){ 
		   falg=false;
		  } 
        }
       if(falg){
          alert("请选择需要定阅的产品！");
          return false;
       }
       if(confirm("是否确定定阅的产品?")){
		  loginForm.submit();
		}else{
		 return false;
		} 
     }
     function checkLoginty(){
	     var loginForm=document.getElementById("loginForm");
	     loginForm.reset();
     }
</script>
</body>
</html>