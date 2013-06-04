<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*"   %>
<jsp:directive.page import="org.springframework.context.ApplicationContext"/>
<jsp:directive.page import="org.springframework.web.context.support.WebApplicationContextUtils"/>
<jsp:directive.page import="com.cssweb.question.service.QuestionService"/>
<jsp:directive.page import="java.util.List"/>
<%@ include file="/commons/taglibs.jsp"%>
<%
	ServletContext sc = this.getServletConfig().getServletContext();
	ApplicationContext ctx = WebApplicationContextUtils.getRequiredWebApplicationContext(sc);
	QuestionService service = (QuestionService)ctx.getBean("question");
	List list = service.getQuestionList("question_rczp",1, 10);
	pageContext.setAttribute("list",list);
 %>
<div class="rtit1"><a href="faqMore.jsp">常见问题解答</a></div>
        <div class="bg_ff ptb6 ribor3">
        <marquee scrollamount="3" direction="up" onmouseover="this.stop()" onmouseout="this.start()" height="200">
          <table width="93%" align="center" class="lh20 fcenter">
          <c:forEach items="${list }" var="bean">
          	<tr>
              <td width="13" valign="top"><img src="/pic/stockResearch/dot-hjt.gif" /></td>
              <td><a href="${contextPath }/question.do?method=getHrQuestionList&nav=cjwt">${bean.question } </a></td>
            </tr>
            <tr>
              <td colspan="2" class="list_bline02" height="10"></td>
            </tr>
          </c:forEach>
            
          </table>
          </marquee>
        </div>