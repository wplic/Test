<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@ include file="/commons/taglibs.jsp"%>
<%@page import="org.springframework.context.ApplicationContext"%>
<%@page	import="org.springframework.web.context.support.WebApplicationContextUtils"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="com.cssweb.subscribe.pojo.TcsswebCppj"%>
<%@page import="com.cssweb.subscribe.service.TcsswebCppjService"%>
<%@page import="com.cssweb.subscribe.pojo.TcsswebUserCppj"%>
<%@page import="com.cssweb.subscribe.service.TcsswebUserCppjService"%>
<%@page import="com.cssweb.subscribe.pojo.TcsswebFwcpdy"%>
<%@page import="com.cssweb.subscribe.service.TcsswebFwcpdyService"%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>广发证券</title>
<link href="${ctx }/css/global.css" rel="stylesheet" type="text/css" />
<link href="${ctx }/css/wsyyt/wsyyt.css" rel="stylesheet" type="text/css" />
</head>
<%

    if(request.getAttribute("message")!=null&&!request.getAttribute("message").equals(""))
    {
      String message=request.getAttribute("message").toString();
      if(message.equals("1"))
      {
      %>
		<script type="text/javascript">
			alert ("您今天已经为该产品评级！") ;
			window.opener=null;
			window.open('','_self');
			window.close() ;
		</script>
	　<%
      }else if(message.equals("2")){
       %>
		<script type="text/javascript">
			alert ("您提交的数据有误！") ;
			window.opener=null;
			window.open('','_self');
			window.close() ;
		</script>
	　<%
      }else if(message.equals("0")){
      %>
		<script type="text/javascript">
			alert ("您评级成功！") ;
		</script>
	　<%
      }
    }
    String productId="";
	if(request.getParameter("productId")!=null&&!request.getParameter("productId").equals(""))
	{
	 productId=request.getParameter("productId");
	}else{
	%>
		<script type="text/javascript">
			alert ("对不起，您请求的数据有误！") ;
			window.opener=null;
			window.open('','_self');
			window.close() ;
		</script>
	<%
	}
	ServletContext st = this.getServletConfig().getServletContext();
	ApplicationContext ctx = WebApplicationContextUtils.getRequiredWebApplicationContext(st);
    List tcsswebCppjList=null;
    TcsswebCppjService tcsswebCppjService = (TcsswebCppjService)ctx.getBean("tcsswebCppjService");
    TcsswebUserCppjService tcsswebUserCppjService = (TcsswebUserCppjService)ctx.getBean("tcsswebUserCppjService");
    TcsswebFwcpdyService tcsswebFwcpdyService = (TcsswebFwcpdyService)ctx.getBean("tcsswebFwcpdyService");
    TcsswebFwcpdy tcsswebFwcpdy=null;
    if(productId!=null&&!productId.equals(""))
    tcsswebFwcpdy=tcsswebFwcpdyService.getAllTcsswebFwcpdyById(Long.valueOf(productId));
    tcsswebCppjList=tcsswebCppjService.getAllTcsswebCppj();
    int count=tcsswebUserCppjService.getCountByProductId(Long.valueOf(productId),null);//总数
    if(count==0)
    count=1;
    System.out.println("       count= "+count);
    DecimalFormat df = new DecimalFormat("0.00");
 %>
<body>
<br /><br />
<div class="pjbox">
	<h3><span></span>自助服务定阅产品--评分</h3>
    <h5><%=tcsswebFwcpdy!=null?tcsswebFwcpdy.getProductName():"" %></h5>
    <div class="cont">
    	<div class="pfbg">
    	 <form name="qForm" id="qForm" action="${ctx }/tcsswebUserCppjAtion.do?method=saveTcsswebUserCppj" method="post">
    	<table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td height="30" colspan="3">
            <%
            Long pr=null;
            if(tcsswebCppjList!=null&&tcsswebCppjList.size()>0 )
            {
              for(int i=0;i<tcsswebCppjList.size();i++)
              {
               TcsswebCppj tcsswebCppj=(TcsswebCppj)tcsswebCppjList.get(i);
               if(tcsswebCppj.getParentId()==0)
               {
                 out.print(" "+tcsswebCppj.getCerter() );
                 pr=tcsswebCppj.getId();
                 break;
               }
              }
            }
             %>
            </td>
          </tr>
          
           <%
            if(pr!=null&&pr>0&&tcsswebCppjList!=null&&tcsswebCppjList.size()>0 )
            {
              for(int i=0;i<tcsswebCppjList.size();i++)
              {
               TcsswebCppj tcsswebCppj=(TcsswebCppj)tcsswebCppjList.get(i);
               if(tcsswebCppj.getParentId()==pr.longValue())
               {
               
               int pcount=tcsswebUserCppjService.getCountByProductId(Long.valueOf(productId),tcsswebCppj.getId());
               System.out.println(tcsswebCppj.getId()+"       tcsswebCppj.getId()= "+tcsswebFwcpdy.getId());
               System.out.println(tcsswebCppj.getId()+"       pcount= "+pcount);
                 %>
	          <tr>
	            <td width="22%" height="30"><label>
	            <input name="cppjId" type="radio" id="cppjId" value="<%=tcsswebCppj.getId() %>" />
	            <%=tcsswebCppj.getCerter() %> </label></td>
	            <td width="58%"><p class="jdt01" style="width:<%=pcount*1.0/count*200 %>px;"></p></td>
	            <td width="20%"><%=df.format((pcount*1.0)/(count)*100) %>%</td>
	          </tr>
	          <tr>
	           <% }
              }
            }
         %>
        </table>
        <input type="hidden" name="productId" value="<%=tcsswebFwcpdy!=null?tcsswebFwcpdy.getId():"" %>"/>
        </form>
        </div>
        
        <p align="center" class="p10"><input name="button" class="dybtn1" type="button" value="提交" onclick="checkLogin();"/></p>
        <p class="p10">为了防止客户进行恶意评价，每天每位客户只能评价一次</p>

    </div>
</div>
<script type="text/javascript">
 function checkLogin(){
 var falg=true;
	   var loginForm=document.getElementById("qForm");
	   var dd = document.getElementsByName("cppjId");
	   for(i=0;i <dd.length;i++) { 
		  if(dd[i].checked){ 
		   falg=false;
		  } 
        }
       if(falg){
          alert("请选择产品的评级！");
          return false;
       }
       if(confirm("是否确定产品的评级?")){
		  loginForm.submit();
		}else{
		 return false;
		} 
     }
     </script>
</body>
</html>