<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<%@ include file="/commons/taglibs.jsp"%>
<%@page import="com.css.cms.category.CategoryTree"%>
<%@page import="com.css.cms.category.*"%>
<%@page import="com.css.cms.document.*"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<head>
<%
String bt="公司大事记";
CategoryTree catTree= null;
if(request.getParameter("siteName")!=null){
		catTree = CategoryFactory.getCategoryTree(request.getParameter("siteName"));
	}else{
		catTree = CategoryFactory.getCategoryTree(DocumentManager.getCmsRootName());
		
	}
String whichCat="gygf_gsdsj";
if(request.getParameter("whichCat")!=null&&!request.getParameter("whichCat").equals(""))
{
whichCat=request.getParameter("whichCat");
	CategoryNode catNode = catTree.getCategoryNode(whichCat);
	
	if(catNode!=null)
	bt=catNode.getDisplayName();
}

String nav2=whichCat;
Date datett=new Date();
SimpleDateFormat sdf=new SimpleDateFormat("yyyy");
if(request.getParameter("gygf_gsdsjdate")!=null&&!request.getParameter("gygf_gsdsjdate").equals("") )
{
 datett=sdf.parse(request.getParameter("gygf_gsdsjdate").trim());
}
String date1=sdf.format(datett);
int dtaes2=(Integer.valueOf(date1)-1);
String date2=String.valueOf(dtaes2);
int dtaes3=(Integer.valueOf(date1)-2);
String date3=String.valueOf(dtaes3);

String yfdatesks="-01-01";
String yfdatesjs="-12-30";
%>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>广发证券</title>
<link href="/css/style.css" rel="stylesheet" type="text/css" />
<link href="/css/infoCenter/infoCenter.css" rel="stylesheet" type="text/css" />
<link href="/css/global.css" rel="stylesheet" type="text/css" />
</head>
<script src="/js/setTab.js"></script>

<body>
<jsp:include page="/commons/mstop.jsp" />
<div class="main">
  <div class="dqwz">当前位置：<a href="/default.html">首页</a> - <a href="/about/aboutUs.html">关于广发</a> - <%=bt %></div>
</div>
<div class="wrap_2left">
  <!--左侧sied开始-->
  <div class="w210 fleft">
		<jsp:include page="/about/about_lmenu.jsp">
		           <jsp:param name="meun" value="<%=nav2%>"/>
		 </jsp:include>
  </div>
  <!--左侧sied结束-->
   
  <!--右侧sied开始-->
  <div class="w706 fright">
  		<div class="comtit1"><h4><%=bt %></h4></div>
    <div class="blank10"></div>
    
    
    
    <div class="blank5"></div>
    <ul class="gsyw_box2">
        	<li class="active red bold" id="tagtabs1" onmouseover="SwitchNews('tabs', 1, 3,'active red bold','white bold')"><%=date1 %></li>
            <li class=" white bold" id="tagtabs2" onmouseover="SwitchNews('tabs', 2, 3,'active red bold','white bold')"><%=date2 %></li>
            <li class=" white bold" id="tagtabs3" onmouseover="SwitchNews('tabs', 3, 3,'active red bold','white bold')"><%=date3 %></li>
            
            
            
             <li style="width: 80px;float: right;"> <input type="button" name="button2" id="button2" value="查询" class="but_01" onclick="checkLoginDate2();"/></li>
           
            <li style="width: 100px;float: right;">
            <select name="gygf_gsdsjdate" id="gygf_gsdsjdate" style="width: 100px;">
                <option value="">--请选择--</option>
                <% 
                for (int i = 2010 ; i >= 1990;i--)
      				{
      				%>
      				<option value="<%=i %>"><%=i %></option>
      				<%
      				}
                %>
               </select>
            
            </li>
            
    </ul>
 <div class="blank5"></div>
 
  <div id="tabs1">

 <table width="100%" border="0">
  <tr>
    <td valign="bottom" class="font14 goldenzi lh28">　　<%=date1 %>年重大事项</td>
  </tr>
  <tr>
   <td> 
   <jsp:include page="/about/infoContentList.jsp">
           <jsp:param name="whichCat" value="<%=whichCat%>"/>
           <jsp:param name="StartDate" value="<%=date1+yfdatesks %>"/>
           <jsp:param name="EndDate" value="<%=date1+yfdatesjs %>"/>
    	</jsp:include>
   </td>
  </tr>
  </table>
 </div>
 <div id="tabs2" style="display:none">
<table width="100%" border="0">
  <tr>
    <td valign="bottom" class="font14 goldenzi lh28">　　<%=date2 %>年重大事项</td>
  </tr>
  <tr>
   <td><jsp:include page="/about/infoContentList.jsp">
           <jsp:param name="whichCat" value="<%=whichCat%>"/>
           <jsp:param name="StartDate" value="<%=date2+yfdatesks %>"/>
           <jsp:param name="EndDate" value="<%=date2+yfdatesjs %>"/>
    	</jsp:include>
   </td>
  </tr>
  </table>
 </div>
 <div id="tabs3" style="display:none">
<table width="100%" border="0">
  <tr>
    <td valign="bottom" class="font14 goldenzi lh28">　　<%=date3 %>年重大事项</td>
  </tr>
  <tr>
   <td> 
   <jsp:include page="/about/infoContentList.jsp">
           <jsp:param name="whichCat" value="<%=whichCat%>"/>
           <jsp:param name="StartDate" value="<%=date3+yfdatesks %>"/>
           <jsp:param name="EndDate" value="<%=date3+yfdatesjs %>"/>
    	</jsp:include>
   </td>
  </tr>
  </table>
 </div>
   

    <div class="clearfloat h25"></div>
    
    
  </div>
  <!--右侧sied结束--> 
<div class="clearfloat"></div>
</div>  <div class="blank5"></div><!--清除浮动--> 
<jsp:include page="/commons/msbottom.jsp" />
</body>
<SCRIPT LANGUAGE="JavaScript">
     function checkLoginDate2(){
	   var gygf_gsdsjdate=document.getElementById("gygf_gsdsjdate").value;
	   var urls="${ctx}/about/companyEvent.jsp?1=1";
	   if(gygf_gsdsjdate!="")
	   {
	    urls=urls+"&gygf_gsdsjdate="+gygf_gsdsjdate;
	    document.location.href =urls;
	   }else{
	    alert("请您选择年份!");
	   }
    }
</SCRIPT> 
</html>