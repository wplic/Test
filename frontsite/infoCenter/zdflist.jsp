 <%@ page contentType="text/html; charset=utf-8" language="java"  %>
<jsp:directive.page import="org.springframework.context.ApplicationContext"/>
<jsp:directive.page import="org.springframework.web.context.support.WebApplicationContextUtils"/>
<jsp:directive.page import="java.util.List"/>
<jsp:directive.page import="java.text.DecimalFormat"/>
<jsp:directive.page import="com.cssweb.hq.service.MarketService"/>
<jsp:directive.page import="com.cssweb.hq.pojo.RealTimeMarket"/>


 <% 
	String type=request.getParameter("type");
	String zd=request.getParameter("zd");
	String num=request.getParameter("num");
	
	ServletContext st = this.getServletConfig().getServletContext();
	ApplicationContext ctx = WebApplicationContextUtils.getRequiredWebApplicationContext(st);
	MarketService marketService = (MarketService)ctx.getBean("marketService");
	List list=marketService.getShareHq(zd,Integer.parseInt(num)); 
	
	DecimalFormat df2=new DecimalFormat("#0.00");
%>

      <tr>
        <td class="intab_th1">序号</td>
        <td class="intab_th1">名称</td>
        <td class="intab_th1">最新价</td>
        <td class="intab_th1">涨跌幅</td>
      </tr>
     <%
     		int tmp = 1;
     		if (list != null && list.size() > 0)
     		{
	     		for (int i = 0 ; i < list.size() ; i++ )
	     		{
	     				 RealTimeMarket market = (RealTimeMarket)list.get(i);
	     				%>
	     						<tr>
							        <td><%=tmp %></td>
							        <td><%=market.getZqjc() %></td>
							        <td class="red"><%=market.getZjcj() %></td>
							        <%if(zd.equals("涨")){
							        	%><td class="red">
							        		
							        	<%
							        	}else{
							        	 %>
							        	 	<td >
							        	 <%
							        	 }%><%=df2.format(((market.getZjcj().doubleValue()-market.getZrsp().doubleValue())/market.getZrsp().doubleValue())*100)+"%"%> </td>
							    </tr>
	     				<%
	     				tmp ++ ;
	     		}
     		}
      %>   
 