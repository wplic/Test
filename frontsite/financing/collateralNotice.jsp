<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%request.setCharacterEncoding("UTF-8");%>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@page import="org.springframework.context.ApplicationContext"%>
<%@page import="org.springframework.web.context.support.WebApplicationContextUtils"%>
<%@page import="com.cssweb.rzrq.service.AssureService"%>
<%@page import="com.cssweb.rzrq.pojo.Assure"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="java.util.List"%>
<%@ include file="/commons/taglibs.jsp"%>
<%@ include file="/commons/turnPage.jsp"%>
<%@page import="com.cssweb.common.util.PageUtil"%>
<%@page import="java.util.Date"%>

<%
	ServletContext st = this.getServletConfig().getServletContext();
	ApplicationContext ctx = WebApplicationContextUtils.getRequiredWebApplicationContext(st);
	AssureService assureService  = (AssureService)ctx.getBean("assureService");
	Assure assure = (Assure)assureService.getAssureNewStartDate();
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy年MM月dd日");
	SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-MM-dd");
	DecimalFormat mdf = new DecimalFormat("#0.00");
	String startDate=request.getParameter("startDate")==null?"":request.getParameter("startDate");
	String ishz=request.getParameter("ishz")==null?"":request.getParameter("ishz");
	String gpdm=request.getParameter("gpdm")==null?"":request.getParameter("gpdm");
	//System.out.println("---------开始时间----------"+startDate);
	List<Assure> assureList =	null;
	if (request.getAttribute("assureList") != null)
	{
	//	assureList =	assureService.getAssureByStartDate(sdf1.format(assure.getStartDate()));
		assureList =	(List)request.getAttribute("assureList");
	}
	
	
 %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>广发证券</title>
<link href="/css/style.css" rel="stylesheet" type="text/css" />
<script src="${contextPath }/financing/My97DatePicker/WdatePicker.js" type="text/javascript"></script>

</head>
<body>
<jsp:include page="/commons/mstop.jsp" />
<form action="${contextPath }/assureAction.do?method=getAssureFrontList" id="assureForm" name="assureForm" method="post">
<div class="main">
  <div class="dqwz">当前位置：<a href="/default.html">首页</a> - <a href="/financing/index.html"> 融资融券</a> - <a href="/financing/rateNoticeLl.html">公告信息</a> - 担保证券</div>
</div>
<div class="wrap_2left">
  <!--左侧sied开始-->
  <div class="w210 fleft">
		<jsp:include page="/financing/notice_lmenu.jsp?menu=dbp" />
         <div class="blank5"></div>
  </div>
  <!--左侧sied结束-->
   
  <!--中侧sied开始-->
  <div class="w706 fright">
  		<div class="comtit1"><h4>担保证券公告</h4></div>
    <div class="blank10"></div>
    <table width="96%" align="center">
<jsp:include page="/financing/indexTitles.jsp">
           <jsp:param name="whichCat" value="zqzlhzsl"/>
    	</jsp:include>

  <tr>
    <td>
    <h3 class="dbzqggTitle">可充抵保证金有价证券品种及其折算率表</h3>
    <table width="100%" border="1" bordercolor="#CCCCCC" class="lh25 mtb10 textcenter fcenter">
     
        <tr>
        <td colspan="4">      
        <table>
          <tr>
            <td width="25%">证券分类：<select name="ishz" id="ishz" style="width:100px" onchange="checkLogin();">
                    <option value="">全部</option>
                    <option value="1" ${ishz==1?'selected':''} >沪深300</option>
                    <option value="0" ${ishz==0?'selected':''}>其他</option>
              </select></td>
            <td width="11%">证券代码：</td>
            <td width="12%">
            <c:choose><c:when test="${gpdm!=null }">
             <input type="text" name="gpdm" id="gpdm" value="${gpdm }" class="input108" maxlength="8" onkeyup="value=value.replace(/[^0-9]/g,'')"
                  onkeydown="if(event.keyCode==13){return checkStock();}"
             />
  								</c:when>
  								<c:otherwise>
               <input type="text" name="gpdm" id="gpdm" class="input108" maxlength="8" onkeyup="value=value.replace(/[^0-9]/g,'')"
                  onkeydown="if(event.keyCode==13){return checkStock();}"
             />
							</c:otherwise>
  								</c:choose>
            </td>          
        
            <td width="10%">
                       生效时间：</td>
                        <td width="12%" >
                        <c:choose><c:when test="${startDate!=null }">
                                       <input class="Wdate" name="startDate" id="startDate" type="text" value="${startDate }" onClick="WdatePicker()"> 
  								</c:when>
  								<c:otherwise>
               <input class="Wdate" name="startDate" id="startDate" type="text" value="" onClick="WdatePicker()"> 
							</c:otherwise>
  								</c:choose>
            </td>
            <td width="2%">
            <a href="#" onclick="return checkStock();">
            <input type="button" name="button1" id="button1" value="查询" class="but_01" />
            </a>
            </td>
            <td width="2%"></td>
            <td width="2%">
              <a href="#" onclick="return checkStockQb();">
              <input type="button" name="buttonqb" id="buttonqb" value="全部" class="but_01" />
              </a>
            </td>
          </tr>          
        </table>
      </td>
        </tr>
        <tr>        
        </tr>
      <tr class="rrtab_tt bold">
        <td>证券代码</td>
        <td>证券名称</td>
        <td>折算率</td>
        <td>生效日期</td>
      </tr>
      <%
      		if (assureList != null)
      		{
      				for (int i = 0 ; i < assureList.size(); i ++)
      				{
      					Assure assure1 =	(Assure)assureList.get(i);
      					%>
      						<tr class="zqpzzslb">
						        <td><%=(assure1.getCode() == null?"":assure1.getCode()) %></td>
						        <td ><%=(assure1.getName() == null?"":assure1.getName()) %></td>
						        <td ><%=(assure1.getConvertRate() == null?"":mdf.format(assure1.getConvertRate()) ) %></td>
						        <td width="30%"><%=(assure1.getStartDate() == null?"":sdf.format(assure1.getStartDate()) ) %></td>
						      </tr>	
      					<%
      				}
      		}
       %>
      <tr>
      		<td colspan="3" align="right" ><%=PageUtil.pagination("window.assureForm",totleCount, currentPage, pagesize)%></td>
      </tr>
    </table></td>
  </tr>
 
  <tr>
    <td class="lh25">特此公告。</td>
  </tr>
  <tr>
    <td align="right" class="lh25">广发证券股份有限公司<br />
 <jsp:include page="/financing/indexTitleUpdateTime.jsp">
		<jsp:param name="whichCat" value="zqzlhzsl"/>
	</jsp:include></td>
  </tr>
  <tr>
    <td class="cuxuxian lh25">&nbsp;</td>
  </tr>
  <tr>
    <td align="right">
    </td>
  </tr>
</table>

    <div class="clearfloat h15"></div>
  </div>
  <!--中侧sied结束--> 
   
  <div class="clearfloat"></div><!--清除浮动--> 
</div>
    <div class="blank5"></div>
</form>    

<jsp:include page="/commons/msbottom.jsp" />
</body>
<SCRIPT LANGUAGE="JavaScript">

     function checkLogin(){
      var assureForm =document.getElementById("assureForm");
      var ishz=document.getElementById("ishz").value;
      var url="${contextPath }/assureAction.do?method=getAssureFrontList&ishz="+ishz;
      document.location.href=url;
     }
     
     function  checkStock(){
          var stockId = document.getElementById("gpdm").value;
          var startDate = document.getElementById("startDate").value;
          
 		  document.location.href="${contextPath }/assureAction.do?method=getAssureFrontList&gpdm="+stockId+"&startDate="+startDate;
 	}
 	 function  checkStockQb(){
 		  document.location.href="${contextPath }/assureAction.do?method=getAssureFrontList";
 	}
</SCRIPT> 
</html>