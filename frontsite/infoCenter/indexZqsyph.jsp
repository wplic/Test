<%@ page contentType="text/html; charset=utf-8" language="java"  %>
<jsp:directive.page import="org.springframework.context.ApplicationContext"/>
<jsp:directive.page import="org.springframework.web.context.support.WebApplicationContextUtils"/>
<jsp:directive.page import="com.cssweb.hq.service.ZqsyphService"/>
<jsp:directive.page import="java.util.List"/>
<jsp:directive.page import="com.cssweb.hq.pojo.Zqsyph"/>
<jsp:directive.page import="java.text.SimpleDateFormat"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title></title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<link href="/css/news.css" rel="stylesheet" type="text/css"/>
</head>

      
      <%
        ServletContext st = this.getServletConfig().getServletContext();
        ApplicationContext ctx = WebApplicationContextUtils.getRequiredWebApplicationContext(st);
        ZqsyphService zqsyphService=(ZqsyphService)ctx.getBean("zqsyphService");
        
        List gzList=zqsyphService.getZqsyphgz(0,7);
        List qyzList=zqsyphService.getZqsyphqz(0,7);
        String fsrq_gz="";
        String fsrq_qz="";
       %>
      
      
        <div class="tabsL01">
   	      	<h2 class="active red" id="tagtabs111" onmouseover="SwitchNews('tabs11', 1, 2,'active red','')"><a href="#">国债排行榜</a></h2>
            <h2 id="tagtabs112" onmouseover="SwitchNews('tabs11', 2, 2,'active red','')"><a href="#">企债排行榜</a></h2>
    	</div>
       <div class="tabsLcon01">
          <table width="97%" class="lh24 bg_ff center font_st tabbott01" border="0" cellspacing="0" cellpadding="0" align="center" id="tabs111">
            <tr>
              <th class="intab_th1">债券名称</th>
              <th class="intab_th1">收益率</th>
            </tr>
               
            <%if(gzList!=null&&gzList.size()>0){
                 for(int i=0;i<gzList.size();i++){
                     Zqsyph zqsyph=(Zqsyph)gzList.get(i);
             %>
            <tr>
              <td><%=zqsyph.getZqjc() %></td>
              <td><%=zqsyph.getDlsyl() %></td>
            </tr>
            <%}
            }
            %>
             
          </table>
          <table width="97%" class="lh24 bg_ff center font_st tabbott01" border="0" cellspacing="0" cellpadding="0" align="center" id="tabs112" style="display:none">
            <tr>
              <th class="intab_th1">债券名称</th>
              <th class="intab_th1">收益率</th>
            </tr>
              <%if(qyzList!=null&&qyzList.size()>0){
                 for(int i=0;i<qyzList.size();i++){
                     Zqsyph zqsyph=(Zqsyph)qyzList.get(i);
             %>
            <tr>
              <td><%=zqsyph.getZqjc() %></td>
              <td><%=zqsyph.getDlsyl() %></td>
            </tr>
              <%}
              }
              %>
          </table>
  </div>        
 </html>