<%@ page contentType="text/html; charset=utf-8" language="java"  %>
<jsp:directive.page import="org.springframework.context.ApplicationContext"/>
<jsp:directive.page import="org.springframework.web.context.support.WebApplicationContextUtils"/>
<jsp:directive.page import="java.util.List"/>
<jsp:directive.page import="org.apache.commons.lang.StringUtils"/>
<%request.setCharacterEncoding("UTF-8");%>
<jsp:directive.page import="java.text.SimpleDateFormat"/>
<jsp:directive.page import="com.cssweb.gazxQz.pojo.Qzdqtx"/>
<jsp:directive.page import="com.cssweb.gazxQz.service.QzdqdxService"/>
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


  QzdqdxService qzdqdxService=(QzdqdxService)ctx.getBean("qzdqdxService");
  List list=qzdqdxService.getQzdqtx(0, 8);
 %>
 
    <ul class="info_tab1">
       		<li class="active red">到期提醒</li>
        </ul>
     <div class="blank5"></div>
<table width="95%" class="lh24 bg_ff center tabbott01" border="0" cellspacing="0" cellpadding="0" align="center">
          <tr>
            <th class="intab_th1">权证名称</th>
            <th class="intab_th1">权证类别</th>
            <th class="intab_th1">存续终止日</th>
          </tr>
       <%
	       if(list!=null&&list.size()>0) {
            	SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
		        for(int i=0;i<list.size();i++){
			    Qzdqtx qzdqtx = (Qzdqtx)list.get(i);
			%>
              <tr>
                <td><%=qzdqtx.getQzjc() %></td>
                <td class="red"><%=qzdqtx.getQzlb() %></td>
                <td class="red"><%=sdf.format(qzdqtx.getQzcxzzr())%></td>
              </tr>
              <%}} %>
         </table>     
</html>