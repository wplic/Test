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
<HEAD>
<TITLE>广发证券</TITLE>
</HEAD>
<!-- 以下为iframe高度自适应代码 -->
<SCRIPT LANGUAGE="JavaScript">
function f_frameStyleResize(targObj){
 var targWin = targObj.parent.document.all[targObj.name];
 if(targWin != null) {
  var HeightValue = targObj.document.body.scrollHeight
 if(HeightValue < 500){HeightValue = 500} 
  targWin.style.pixelHeight = HeightValue;
 }
}
function f_iframeResize(){
 bLoadComplete = true; f_frameStyleResize(self);
}
var bLoadComplete = false;
window.onload = f_iframeResize;
</SCRIPT>
<body>  
<%
List gzList=(List)request.getAttribute("gzList");
SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
%>
 <table border="1" class="lh24 center" bordercolor="#cccccc" width="100%" id="tabs11">
      <form action="/zqsyph.do?method=getGzsyphList" method="post" id="corpForm" name="corpForm">	
              <tr class="wisdom_tab_title">
                <td width="10%" class="tab_th1 bold">债券代码</td>
                <td width="20%" class="tab_th1 bold">债券名称</td>
                <td width="20%" class="tab_th1 bold">价格</td>
                <td width="20%" class="tab_th1 bold">单利收益率</td>
                <td width="20%" class="tab_th1 bold">复利收益率</td>
                <td width="10%" class="tab_th1 bold">发生日期</td>
              </tr>
              <%if(gzList!=null&&gzList.size()>0){ 
                   for(int i=0;i<gzList.size();i++){
                   Zqsyph zqsyph=(Zqsyph)gzList.get(i);
              
              %>
              <tr <%=i%2==0?"":"class='bg_ec'" %>>
                <td ><%=zqsyph.getZqdm() %></td>
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