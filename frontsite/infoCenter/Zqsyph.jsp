<%@ page contentType="text/html; charset=utf-8" language="java"  %>
<jsp:directive.page import="org.springframework.context.ApplicationContext"/>
<jsp:directive.page import="org.springframework.web.context.support.WebApplicationContextUtils"/>
<jsp:directive.page import="com.cssweb.hq.service.ZqsyphService"/>
<jsp:directive.page import="java.util.List"/>
<jsp:directive.page import="com.cssweb.hq.pojo.Zqsyph"/>
<jsp:directive.page import="java.text.SimpleDateFormat"/>
<script src="/js/setTab.js"></script>
      
      <%
        ServletContext st = this.getServletConfig().getServletContext();
        ApplicationContext ctx = WebApplicationContextUtils.getRequiredWebApplicationContext(st);
        ZqsyphService zqsyphService=(ZqsyphService)ctx.getBean("zqsyphService");
        
        List gzList=zqsyphService.getZqsyphgz(0,12);
        List qyzList=zqsyphService.getZqsyphqz(0,12);
        String fsrq_gz="";
        String fsrq_qz="";
        SimpleDateFormat sdf=new SimpleDateFormat("yy-MM-dd");
      
       %>
      
      
        <ul class="info_tab1">
       		<li class="active red" id="tagtabs1" onmouseover="SwitchNews('tabs', 1, 2,'active red','link white')">国债排行榜</li>
            <li class="link white" id="tagtabs2" onmouseover="SwitchNews('tabs', 2, 2,'active red','link white')"><a href="#">企债排行榜</a></li>
        </ul>
        <div class="blank5"></div>
           <table width="97%" class="lh24 bg_ff center font_st tabbott01" border="0" cellspacing="0" cellpadding="0" align="center" id="tabs1">
		      <tr>
		        <th class="intab_th1">债券名称</th>
		        <th class="intab_th1">收益率</th>
		      </tr>
            
            <%if(gzList!=null&&gzList.size()>0){
                 for(int i=0;i<gzList.size();i++){
                     Zqsyph zqsyph=(Zqsyph)gzList.get(i);
                     if(zqsyph.getFsrq()!=null){
                         fsrq_gz=sdf.format(zqsyph.getFsrq());
                     }
             %>
            <tr>
              <td><%=zqsyph.getZqjc() %></td>
              <td><%=zqsyph.getDlsyl() %></td>
            </tr>
            <%}
            }
            %>
             <tr>
              <td>&nbsp;<%=fsrq_gz %></td>
              <td><a href="/infoCenter/gzsyphb.jsp?whichCat=gzsyphb">更多...</a></td>
            </tr>
          </table>
          <table width="97%" class="lh24 bg_ff center font_st tabbott01" border="0" cellspacing="0" cellpadding="0" align="center" id="tabs2" style="display:none">
	      <tr>
	        <th class="intab_th1">债券名称</th>
	        <th class="intab_th1">收益率</th>
	      </tr>
       <%if(qyzList!=null&&qyzList.size()>0){
                 for(int i=0;i<qyzList.size();i++){
                     Zqsyph zqsyph=(Zqsyph)qyzList.get(i);
                      if(zqsyph.getFsrq()!=null){
                         fsrq_qz=sdf.format(zqsyph.getFsrq());
                     }
             %>
            <tr>
              <td><a href="#"><%=zqsyph.getZqjc() %></a></td>
              <td><%=zqsyph.getDlsyl() %></td>
            </tr>
              <%}
              }
              %>
              <tr>
              <td>&nbsp;<%=fsrq_gz %></td>
              <td><a href="/infoCenter/gzsyphb.jsp?whichCat=qzsyphb">更多...</a></td>
            </tr>
          </table>