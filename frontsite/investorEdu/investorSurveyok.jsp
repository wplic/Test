<%@ page contentType="text/html; charset=utf-8" language="java"  %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@ include file="/commons/taglibs.jsp"%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>广发证券</title>
<link href="${ctx }/css/global.css" rel="stylesheet" type="text/css" />
<link href="${ctx }/css/investorEdu/investorEdu.css" rel="stylesheet" type="text/css" />
</head>
<%
	String questionId = (String)request.getAttribute("questionId");

%>
<body>
<table width="600" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td><div class=" blank10"></div>
      <p align="center" class="mt25"><img src="${ctx }/pic/investorEdu/wjok.gif" /></p>
      <div class=" blank10"></div>
      <p align="center">
      <%if(request.getAttribute("sumstr")!=null&&!request.getAttribute("sumstr").equals("")) 
        {
         Double sumstr=(Double)request.getAttribute("sumstr");
         out.println(" 您的得分是："+sumstr);
        }
      %>
      <!-- 
        <input class="but_03" type="button" value="查看结果" onclick="location.href='${ctx }/investorEdu/investorSurveyCk.jsp?questionId='" />
      -->
      </p></td>
  </tr>
</table>


</body>
</html>