<%request.setCharacterEncoding("UTF-8");%>
<jsp:directive.page import="java.text.SimpleDateFormat"/>
<jsp:directive.page import="com.cssweb.hq.pojo.Zqsyph"/>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@page import="com.cssweb.common.util.PageUtil"%>
<%@ include file="/commons/turnPage.jsp"%>
<jsp:directive.page import="java.util.List"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<link href="/css/global.css" rel="stylesheet" type="text/css" />
<link href="/css/infoCenter/infoCenter.css" rel="stylesheet" type="text/css" />
<body>  
<%
List qzList=(List)request.getAttribute("qzList");
SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
%>
 
 
 
 <table border="1" class="lh24 center" bordercolor="#cccccc" width="100%" id="tabs12">
          <form action="/zqsyph.do?method=getQzsyphList" method="post" id="corpForm" name="corpForm">
          <tr class="wisdom_tab_title">
                <td width="10%" class="tab_th1 bold">债券代码</td>
                <td width="20%" class="tab_th1 bold">债券名称</td>
                <td width="20%" class="tab_th1 bold">价格</td>
                <td width="20%" class="tab_th1 bold">单利收益率</td>
                <td width="20%" class="tab_th1 bold">复利收益率</td>
                <td width="10%" class="tab_th1 bold">发生日期</td>
              </tr>	
              <%if(qzList!=null&&qzList.size()>0){ 
                   for(int i=0;i<qzList.size();i++){
                   Zqsyph zqsyph=(Zqsyph)qzList.get(i);
              
              %>
              <tr <%=i%2==0?"":"class='bg_ec'" %>>
                <td><%=zqsyph.getZqdm() %></td>
                <td><%=zqsyph.getZqjc() %></td>
                <td><%=zqsyph.getJg() %></td>
                <td><%=zqsyph.getDlsyl() %></td>
                <td><%=zqsyph.getFlsyl() %></td>
                <td><%=sdf.format(zqsyph.getFsrq()) %></td>
              </tr>
             <%}} %>
	          				
				<table width="55%" border="0" cellspacing="0" cellpadding="0" align="center">
	              <tr>
	                <td height="35" class="tdr"><%=PageUtil.pagination("corpForm",totleCount, currentPage, pagesize)%></td>
	              </tr>
	            </table>
             </form>
    </table>  
    
    </body> 
</html>