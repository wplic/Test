<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>广发证券</title>
<link href="/css/style.css" rel="stylesheet" type="text/css" />
<style>
.ibtab1{ border-collapse:collapse; border-spacing:0; font-size:12px; text-align:center}
.ibtab1 td{ height:20px; line-height:20px; border:1px solid #ccc}
</style>
</head>
<% 
  String nav3="";
  String picName="IB3.jpg";
  if(request.getParameter("nav3")!=null&&!request.getParameter("nav3").equals(""))
  nav3=request.getParameter("nav3").trim();
   
   String nav3Name="法律法规";
   if(nav3.equals("ib_ggxx")){
   nav3Name="公告信息";
   picName="IB2.jpg";
   }
   if(nav3.equals("ib_cjwt")){
   nav3Name="常见问题";
   picName="IB1.jpg";
   }
   %>
<body>
<jsp:include page="/commons/mstop.jsp" />
<div class="main">
  <div class="dqwz">当前位置：首页 - 期货IB业务 - 投资者教育园地 - <%=nav3Name %></div>
</div>
<div class="wrap_2left">
  <!--左侧sied开始-->
  <div class="w210 fleft">
		<jsp:include page="FuturesIB_lmenu.jsp?nav2=ibtzzjy" />
  </div>
  <!--左侧sied结束-->
   
  <!--右侧sied开始-->
  <div class="w706 fright">
  		<div class="comtit1"><h4><%=nav3Name %></h4></div>
  		<div><img src="/pic/investorEdu/<%=picName %>" /></div>	
     <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
          <tr>
          <td valign="top">
		  <jsp:include page="/about/list.jsp">
		           <jsp:param name="whichCat" value="<%=nav3 %>"/>
		           <jsp:param name="showSize" value="60"/>
		           <jsp:param name="titleWidth" value="56"/>
		    	</jsp:include>

          </td>
            </tr>
        </table>
    <div class="clearfloat h25"></div>
  </div>
  <!--右侧sied结束--> 
  <div class="clearfloat"></div><!--清除浮动--> 
</div>
<div class="blank5"></div>
<jsp:include page="/commons/msbottom.jsp" />
</body>
</html>