<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<jsp:directive.page import="java.util.List"/>
<%@ include file="/commons/taglibs.jsp"%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>广发证券</title>
<link href="/css/global.css" rel="stylesheet" type="text/css" />
<link href="/css/infoCenter/infoCenter.css" rel="stylesheet" type="text/css" />

</head>

<body class="body_bg">
<jsp:include page="/commons/top.jsp?nav=zxzx" />
<div class="main">
  <div class="dqwz">当前位置：首页 > 资讯中心 > 基金个股</div>
</div>
<div class="wrap_2left">
  <!--左侧sied开始-->
  <div class="w210 fleft ptb9">  
  <div class="iptvside_top"></div>
  <div class="iptvside_mid">
	  <jsp:include page="/f10/fund/fundF10_lmenu.jsp">
			<jsp:param name="menu" value="2" />
	  </jsp:include>
  </div>
  <div class="iptvside_bot"></div>
  </div>
  <!--左侧sied结束-->
   
  <!--右侧sied开始-->
<div class="w706 fright"> 
   <!--右侧个股价格开始-->
  <div class="ggxx"><!--右侧个股价格结束-->
 <div class="left_tit2">
   <jsp:include flush="true" page="/f10/fund/FundCodeSearch.jsp"></jsp:include>
 </div> 
<div class="blank5"></div>
<div class="f10_tab03 textcenter">
	<span class="red font14 bold ml32">${fundShortName }</span>
    <span class="font14 ml10">(${fundCode })</span>
    <span class="ml20"></span>
</div>
<div class="blank5"></div>
<div>
  <table width="100%" border="0">
    <tr>
      <td class="font14 bold lh30 font_st red">·基金持有人</td>
      <td align="right">
       <html:form action="/fund.do?method=getFundHolder" method="post" styleId="fundForm">
            <html:select property="fundHolderDate" styleId="fundHolderDate" onchange="document.getElementById('fundForm').submit();">
              	<html:options collection="dateList" property="fundHolderDateString"
								labelProperty="fundHolderDateString" />
								<%List list = (List)request.getAttribute("dateList");
				  if(list==null || list.size()==0){
				  %>
				  <html:option value="">=请选择=</html:option>
				  <%
				  } 
				 %>
              </html:select>
       </html:form>       
      </td>
    </tr>
  </table>
</div>
<table border="1" class="lh24 center" bordercolor="#cccccc" width="100%" id="tabs11">
  <tr>
    <td width="24%" class="tab_th1 bold">持有人名称</td>
    <td width="28%" class="tab_th1 bold">持有份额</td>
    <td width="24%" class="tab_th1 bold">持有比例</td>
    <td width="24%" class="tab_th1 bold">发生日期</td>
    </tr>
     <c:forEach items="${fundHolderList }" var="bean">
        	<tr>
          <td>${bean.fundHolderName}</td>
          <td>${bean.holderCount }</td>
          <td>${bean.holderProportion}%</td>
          <td><bean:write name="bean" property="fundHolderDate" format="yyyy-MM-dd"/></td>
        </tr>
              
     </c:forEach>
</table>
  </div> 
  </div>
  <!--右侧sied结束--> 
  <div class="clearfloat"></div><!--清除浮动--> 
</div>
<jsp:include page="/share/bottom.jsp" />
<script src="/js/setTab.js"></script>
</body>
</html>