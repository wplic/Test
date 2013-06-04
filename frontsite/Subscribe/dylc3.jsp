<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@ include file="/commons/taglibs.jsp"%>
<%@page import="org.springframework.context.ApplicationContext"%>
<%@page	import="org.springframework.web.context.support.WebApplicationContextUtils"%>
<%@page import="com.cssweb.subscribe.pojo.TcsswebFwtcdy"%>
<%@page import="com.cssweb.subscribe.service.TcsswebFwtcdyService"%>
<jsp:directive.page import="com.cssweb.client.pojo.TsystemWebuser"/>
<%@page	import="com.cssweb.common.dictionary.service.DictionaryService"%>
<%@page	import="com.cssweb.common.dictionary.pojo.Dictionary"%>
<%@page import="com.cssweb.subscribe.pojo.TcsswebFwcpysl"%>
<%@page import="com.cssweb.subscribe.service.TcsswebFwcpyslService"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="com.cssweb.subscribe.service.TcsswebFwtcdySfclService"%>
<%@page	import="com.cssweb.subscribe.pojo.TcsswebFwcpcx"%>
<%@page	import="com.cssweb.subscribe.service.TcsswebFwcpcxService"%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>广发证券</title>
<link href="${ctx}/css/global.css" rel="stylesheet" type="text/css" />
<link href="${ctx}/css/wsyyt/wsyyt.css" rel="stylesheet" type="text/css" />
</head>
<jsp:directive.page import="com.cssweb.common.web.filter.SqlInjectValidate"/>
<%
 SqlInjectValidate sqlInjectValidate = SqlInjectValidate.getSqlInjectValidate();
String ids="";
if(request.getParameter("id")!=null&&!request.getParameter("id").equals(""))
{
 if(sqlInjectValidate.vakidateSqlStringForLength(request.getParameter("id"),10)){
					response.sendRedirect(request.getContextPath() +"/commons/error2.jsp");
					return;
				 }
 if(sqlInjectValidate.vakidateSqlIfIngter(request.getParameter("id"))){
					response.sendRedirect(request.getContextPath() +"/commons/error2.jsp");
					return;
				 }				 
 ids=request.getParameter("id");
}else{
%>
	<script type="text/javascript">
		alert ("对不起，您操作有误！") ;
		window.opener=null;window.close();
	</script>
<%
}
String levelsName="";
String packageName="";
String packageNameOriginal= "";
String inputValue ="";
TcsswebFwcpysl tcsswebFwcpysl=null;
ServletContext st = this.getServletConfig().getServletContext();
ApplicationContext ctx = WebApplicationContextUtils.getRequiredWebApplicationContext(st);
DictionaryService dictionaryService = (DictionaryService)ctx.getBean("dictionaryService");
TcsswebFwcpyslService tcsswebFwcpyslService = (TcsswebFwcpyslService)ctx.getBean("tcsswebFwcpyslService");
TcsswebFwcpcxService tcsswebFwcpcxService = (TcsswebFwcpcxService)ctx.getBean("tcsswebFwcpcxService");

TsystemWebuser tsystemWebuser=null;
	if(request.getSession().getAttribute("tsystemWebuser")!=null)
	{
	tsystemWebuser=(TsystemWebuser)request.getSession().getAttribute("tsystemWebuser");
	if(tsystemWebuser.getLevel()!=null && !tsystemWebuser.getLevel().equals(""))
	 {
	    Dictionary dict = dictionaryService.getDictionaryByParentKeyCodeAndDesc("fwzl",tsystemWebuser.getLevel());
	    levelsName = dict == null ? "" : dict.getKeyName();
	 }
	 if (tsystemWebuser.getUserType().endsWith("2")) {
	        levelsName = "体验";
	 }
	 if(!ids.equals("")){
	   Map map=new HashMap();
	   map.put("id",Long.parseLong(ids));
	  tcsswebFwcpysl=tcsswebFwcpyslService.getTcsswebFwcpyslById(map);
	  }
		if(tcsswebFwcpysl!=null)
		{
		 inputValue = String.valueOf(tcsswebFwcpysl.getProductIdApplyfor());
		 String packageId=String.valueOf(tcsswebFwcpysl.getProductIdApplyfor());
		 if(packageId.equals("8"))
		 packageName="基础服务资讯";
		 else if(packageId.equals("9"))
		 packageName="乐享套餐";
		 else if(packageId.equals("10"))
		 packageName="优享套餐";
		 else if(packageId.equals("11"))
		 packageName="尊享套餐";
		 
		 String packageIdOriginal=String.valueOf(tcsswebFwcpysl.getProductIdOriginal());
		 if(packageIdOriginal.equals("8"))
		 packageNameOriginal="基础服务资讯";
		 else if(packageIdOriginal.equals("9"))
		 packageNameOriginal="乐享套餐";
		 else if(packageIdOriginal.equals("10"))
		 packageNameOriginal="优享套餐";
		 else if(packageIdOriginal.equals("11"))
		 packageNameOriginal="尊享套餐";
		}
} 
String lxdh = "";
	if(request.getParameter("lxdh")!=null&&!request.getParameter("lxdh").equals("")){
	lxdh=request.getParameter("lxdh");
	}

if(inputValue==null||inputValue.equals("")||inputValue.equals("null"))
{
%>
	<script type="text/javascript">
		alert ("对不起，您请求有误！") ;
		document.location.href="${ctx}/tcsswebFwcpcxAction.do?method=getTcsswebFwcpcxListByAccount";
	</script>
<%
}
%>
<body class="body_bg">
<jsp:include page="/share/top.jsp?nav=jgj&nav1=zzfwdypr" />
<div class="main">
  <div class="dqwz">当前位置：首页 > 网上营业厅 > 我的理财中心 &gt; <a href="${ctx }/tcsswebFwcpcxAction.do?method=getTcsswebFwcpcxListByAccount">我的管家资讯</a></div> 
<div class="wrap920">

	<P><img src="${ctx}/pic/Subscribe/dylc.jpg"  /></P>    
  <div class="dybox1" id="list1">
  
	 <p class="p10 lh21">尊敬的<%=tsystemWebuser!=null&&tsystemWebuser.getServiceName()!=null?tsystemWebuser.getServiceName():"" %>:<br />
	恭喜您已经成功
	<%
	if(tcsswebFwcpysl!=null)
	{
	//if( tcsswebFwcpysl.getProductIdApplyfor()<tcsswebFwcpysl.getProductIdOriginal())
	//out.print("退定");
	//else
	//out.print("定制");
		 if( tcsswebFwcpysl.getProductIdApplyfor()<tcsswebFwcpysl.getProductIdOriginal()){
		
			if(tcsswebFwcpysl.getProductIdApplyfor()!=8){
				out.print("定制了"+packageName);
			}else{
				out.print("退定了"+packageNameOriginal);
			}
		
		}else{
		out.print("定制了"+packageName);
		}
	}
	 %>

	。确认后，我们将在两个交易日后通过
	<a href="${ctx }/tcsswebFwcpcxAction.do?method=getTcsswebFwcpcxListByAccount">
	<span class="red">
	广发网</span></a>
	或
	<a href="${ctx }/bussinesshall/softDownload.html">
	<span class="red">
	网上交易系统</span></a>为您配送
	<% if(!inputValue.equals("8")){%>
	如下<%=packageName %>
	<%} %>
	资讯产品。<br/>
	<% if(!inputValue.equals("8")){%>
    <p align="center" class="font16 bold red p10">广发证券“金管家”资讯套餐
    <%
	if(tcsswebFwcpysl!=null)
	{
	//if( tcsswebFwcpysl.getProductIdApplyfor()<tcsswebFwcpysl.getProductIdOriginal())
	//out.print("退定");
	//else
	//out.print("定制");
	}
	 %>
    定制申请确认表</p>
    </p>
    <%@page import="com.cssweb.subscribe.service.TcsswebFwcpdyCmsService"%>
    <%@page import="com.cssweb.subscribe.pojo.TcsswebFwcpdyCms"%>
    <%
    TcsswebFwcpdyCmsService tcsswebFwcpdyCmsService = (TcsswebFwcpdyCmsService)ctx.getBean("tcsswebFwcpdyCmsService");
	List fList=tcsswebFwcpdyCmsService.getTcsswebFwcpMlByListByFid(48);
	
    if(inputValue.equals("9")){
    List list=tcsswebFwcpcxService.getTcsswebFwcpcxListAllByPackageId(9l);//
    %>
    <table border="0" cellspacing="0" cellpadding="0" width="100%" class="tcTab">  
           <tr class="bold">
            <td width="77" nowrap="nowrap" bgcolor="#f5e4d3"><p align="center">类别 </p></td>
            <td width="340" colspan="2" nowrap="nowrap" bgcolor="#f5e4d3"><p align="center">服务内容 </p></td>
          </tr>
        	<%
        	 if(fList!=null&&fList.size()>0)
        	 {
        	  for(int p=0;p<fList.size();p++ )
        	  {
        	    List tp=null;
        	    TcsswebFwcpdyCms c1=(TcsswebFwcpdyCms)fList.get(p);
        	    tp= tcsswebFwcpdyCmsService.getTcsswebFwcpMlByListByFid(c1.getId());
        	    String cpflName=c1!=null?c1.getName():"";
        	    %>
		            <% 
		            if(tp!=null&&tp.size()>0){
		            
		            
		            %>
		           
		            
		            <tr>
		            <td width="30%" class="bold">
		             <%=cpflName %></td>  <td ><table width="100%" border="0">
		                  <%
		                  for(int k=0;k<tp.size();k++ )
        	                  {
        	                     TcsswebFwcpdyCms c2=(TcsswebFwcpdyCms)tp.get(k);
        	                      %>
        	                        
 
		            <tr><td class="bold">
        	                      <%=c2!=null?c2.getName():"" %> </td>  
		                           

        	                      <%
        	                       if(list!=null&&list.size()>0)
							        	  {
							        	 %>
							              <td>
							            <%for(int i=0;i<list.size();i++ ) {
							             TcsswebFwcpcx tcsswebFwcpcx=(TcsswebFwcpcx)list.get(i);
							             if(tcsswebFwcpcx.getCpml()!=null&&c2.getId()!=null&&tcsswebFwcpcx.getCpml().intValue()==c2.getId().intValue())
							             {
							            %>
							            <table width="100%" ><tr><td>
							        
							            <%=tcsswebFwcpcx.getProductName() %>
							         </td></tr></table>
							            <%} }%>
							          </td>
			        	               <%}
        	                      }
        	                  %><%
        	                 
				              if(list!=null&&list.size()>0)
				        	  {
					        	 %>
					            
					            <%for(int i=0;i<list.size();i++ ) {
					            TcsswebFwcpcx tcsswebFwcpcx=(TcsswebFwcpcx)list.get(i);
					            if(tcsswebFwcpcx.getCpml()!=null&&c1.getId()!=null&&tcsswebFwcpcx.getCpml().intValue()==c1.getId().intValue())
							     {
					            %>
					         <tr>
		            <td colspan=2>
					           <%=tcsswebFwcpcx.getProductName() %>
					         </td>  </tr>
					            <%} }%>
					           </table></td>
	        	               <%}
		            }else{
		            %>
		            <tr>
		            <td width="30%" class="bold">
		          <%=cpflName %></td>  <td ><table width="100%" border="0">
		            <%
		             if(list!=null&&list.size()>0)
				        	  {
				        	 %>
				             
				            
				            <%for(int i=0;i<list.size();i++ ) {
				            TcsswebFwcpcx tcsswebFwcpcx=(TcsswebFwcpcx)list.get(i);
					         if(tcsswebFwcpcx.getCpml()!=null&&c1.getId()!=null&&tcsswebFwcpcx.getCpml().intValue()==c1.getId().intValue()){
				            %>
				            
				          <tr>
		             <td colspan=2>  
				            <%=tcsswebFwcpcx.getProductName() %> 
				             </td>  </tr>
				            <%} }%>
				            
        	               <%}%>
		            </table></td>
		            <%} %>
		            
        	    <%
        	    }
        	 }
        	 %>
         
            </table>
           
    <%    } 
    if(inputValue.equals("10")){
    List list=tcsswebFwcpcxService.getTcsswebFwcpcxListAllByPackageId(10l);//
    %>
    <table border="0" cellspacing="0" cellpadding="0" width="100%" class="tcTab">  
           <tr class="bold">
            <td width="77" nowrap="nowrap" bgcolor="#f5e4d3"><p align="center">类别 </p></td>
            <td width="340" colspan="2" nowrap="nowrap" bgcolor="#f5e4d3"><p align="center">服务内容 </p></td>
          </tr>
        	<%
        	 if(fList!=null&&fList.size()>0)
        	 {
        	  for(int p=0;p<fList.size();p++ )
        	  {
        	    List tp=null;
        	    TcsswebFwcpdyCms c1=(TcsswebFwcpdyCms)fList.get(p);
        	    tp= tcsswebFwcpdyCmsService.getTcsswebFwcpMlByListByFid(c1.getId());
        	    String cpflName=c1!=null?c1.getName():"";
        	    %>
		            <% 
		            if(tp!=null&&tp.size()>0){
		            
		            
		            %>
		           
		            
		            <tr>
		            <td width="30%" class="bold">
		             <%=cpflName %></td>  <td ><table width="100%" border="0">
		                  <%
		                  for(int k=0;k<tp.size();k++ )
        	                  {
        	                     TcsswebFwcpdyCms c2=(TcsswebFwcpdyCms)tp.get(k);
        	                      %>
        	                        
 
		            <tr><td class="bold">
        	                      <%=c2!=null?c2.getName():"" %> </td>  
		                           

        	                      <%
        	                       if(list!=null&&list.size()>0)
							        	  {
							        	 %>
							              <td>
							            <%for(int i=0;i<list.size();i++ ) {
							             TcsswebFwcpcx tcsswebFwcpcx=(TcsswebFwcpcx)list.get(i);
							             if(tcsswebFwcpcx.getCpml()!=null&&c2.getId()!=null&&tcsswebFwcpcx.getCpml().intValue()==c2.getId().intValue())
							             {
							            %>
							            <table width="100%" ><tr><td>
							        
							            <%=tcsswebFwcpcx.getProductName() %>
							         </td></tr></table>
							            <%} }%>
							          </td>
			        	               <%}
        	                      }
        	                  %><%
        	                 
				              if(list!=null&&list.size()>0)
				        	  {
					        	 %>
					            
					            <%for(int i=0;i<list.size();i++ ) {
					            TcsswebFwcpcx tcsswebFwcpcx=(TcsswebFwcpcx)list.get(i);
					            if(tcsswebFwcpcx.getCpml()!=null&&c1.getId()!=null&&tcsswebFwcpcx.getCpml().intValue()==c1.getId().intValue())
							     {
					            %>
					         <tr>
		            <td colspan=2>
					           <%=tcsswebFwcpcx.getProductName() %>
					         </td>  </tr>
					            <%} }%>
					           </table></td>
	        	               <%}
		            }else{
		            %>
		            <tr>
		            <td width="30%" class="bold">
		          <%=cpflName %></td>  <td ><table width="100%" border="0">
		            <%
		             if(list!=null&&list.size()>0)
				        	  {
				        	 %>
				             
				            
				            <%for(int i=0;i<list.size();i++ ) {
				            TcsswebFwcpcx tcsswebFwcpcx=(TcsswebFwcpcx)list.get(i);
					         if(tcsswebFwcpcx.getCpml()!=null&&c1.getId()!=null&&tcsswebFwcpcx.getCpml().intValue()==c1.getId().intValue()){
				            %>
				            
				          <tr>
		             <td colspan=2>  
				            <%=tcsswebFwcpcx.getProductName() %> 
				             </td>  </tr>
				            <%} }%>
				            
        	               <%}%>
		            </table></td>
		            <%} %>
		            
        	    <%
        	    }
        	 }
        	 %>
         
            </table>
    <%    } 
    
    if(inputValue.equals("11")){
    List list=tcsswebFwcpcxService.getTcsswebFwcpcxListAllByPackageId(11l);//
    %>
   <table border="0" cellspacing="0" cellpadding="0" width="100%" class="tcTab">  
           <tr class="bold">
            <td width="77" nowrap="nowrap" bgcolor="#f5e4d3"><p align="center">类别 </p></td>
            <td width="340" colspan="2" nowrap="nowrap" bgcolor="#f5e4d3"><p align="center">服务内容 </p></td>
          </tr>
        	<%
        	 if(fList!=null&&fList.size()>0)
        	 {
        	  for(int p=0;p<fList.size();p++ )
        	  {
        	    List tp=null;
        	    TcsswebFwcpdyCms c1=(TcsswebFwcpdyCms)fList.get(p);
        	    tp= tcsswebFwcpdyCmsService.getTcsswebFwcpMlByListByFid(c1.getId());
        	    String cpflName=c1!=null?c1.getName():"";
        	    %>
		            <% 
		            if(tp!=null&&tp.size()>0){
		            
		            
		            %>
		           
		            
		            <tr>
		            <td width="30%" class="bold">
		             <%=cpflName %></td>  <td ><table width="100%" border="0">
		                  <%
		                  for(int k=0;k<tp.size();k++ )
        	                  {
        	                     TcsswebFwcpdyCms c2=(TcsswebFwcpdyCms)tp.get(k);
        	                      %>
        	                        
 
		            <tr><td class="bold">
        	                      <%=c2!=null?c2.getName():"" %> </td>  
		                           

        	                      <%
        	                       if(list!=null&&list.size()>0)
							        	  {
							        	 %>
							              <td>
							            <%for(int i=0;i<list.size();i++ ) {
							             TcsswebFwcpcx tcsswebFwcpcx=(TcsswebFwcpcx)list.get(i);
							             if(tcsswebFwcpcx.getCpml()!=null&&c2.getId()!=null&&tcsswebFwcpcx.getCpml().intValue()==c2.getId().intValue())
							             {
							            %>
							            <table width="100%" ><tr><td>
							        
							            <%=tcsswebFwcpcx.getProductName() %>
							         </td></tr></table>
							            <%} }%>
							          </td>
			        	               <%}
        	                      }
        	                  %><%
        	                 
				              if(list!=null&&list.size()>0)
				        	  {
					        	 %>
					            
					            <%for(int i=0;i<list.size();i++ ) {
					            TcsswebFwcpcx tcsswebFwcpcx=(TcsswebFwcpcx)list.get(i);
					            if(tcsswebFwcpcx.getCpml()!=null&&c1.getId()!=null&&tcsswebFwcpcx.getCpml().intValue()==c1.getId().intValue())
							     {
					            %>
					         <tr>
		            <td colspan=2>
					           <%=tcsswebFwcpcx.getProductName() %>
					         </td>  </tr>
					            <%} }%>
					           </table></td>
	        	               <%}
		            }else{
		            %>
		            <tr>
		            <td width="30%" class="bold">
		          <%=cpflName %></td>  <td ><table width="100%" border="0">
		            <%
		             if(list!=null&&list.size()>0)
				        	  {
				        	 %>
				             
				            
				            <%for(int i=0;i<list.size();i++ ) {
				            TcsswebFwcpcx tcsswebFwcpcx=(TcsswebFwcpcx)list.get(i);
					         if(tcsswebFwcpcx.getCpml()!=null&&c1.getId()!=null&&tcsswebFwcpcx.getCpml().intValue()==c1.getId().intValue()){
				            %>
				            
				          <tr>
		             <td colspan=2>  
				            <%=tcsswebFwcpcx.getProductName() %> 
				             </td>  </tr>
				            <%} }%>
				            
        	               <%}%>
		            </table></td>
		            <%} %>
		            
        	    <%
        	    }
        	 }
        	 %>
         
            </table> 
    <%    } }%>
    <br/>
    
	
    请确认您已阅读并知晓 <a href="${ctx }/Subscribe/dylc1.jsp" target="_blank">
    <span class="red" >“风险揭示及免责申明”</span></a>内容，
    自愿申请金管家资讯套餐，
    <%
    if(tcsswebFwcpysl!=null)
    {
     String dzqyjl=tcsswebFwcpysl.getDzhyjl();
     if(dzqyjl!=null&&!dzqyjl.equals(""))
     {
     out.print("同意自本定制申请生效的次交易日起交易佣金费率设置为：<span class='red bold'><font size='4'>"+dzqyjl+"‰</font></span>" );
     }else{
     out.print("本次定制申请为免费赠送" );
     }
    }
    
    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
     %>
     。<br/>
    点击“确认”，您的定制申请将生效，若您不同意，可点击“取消”，则您的定制申请将被取消。</p>

		                                      <p class="p10" align="right"> 广发证券股份有限公司</p>
		                                      <p class="p10" align="right"><%=sdf.format(new Date()) %></p>

    
  <form name="loginForm" action="${ctx }/tcsswebFwtcdyAtion.do?method=sqTcsswebProFwcptdList" method="post" id="loginForm">
   <input type="hidden" name="id" value="<%=ids %>"/>
   </form>
    <p class="p10" align="center">
    <input name="dyxyb" class="dybtn1" type="button" value="确认" onclick="checkLogin();" />　
    <input name="dyqx" class="dybtn1" type="button" value="取消" onclick="checkLogin1();"/></p>
  </div>
  
  <div class="clearfloat"></div><!--清除浮动--> 
</div>
<jsp:include page="/share/bottom.jsp" />
<script type="text/javascript">
 function checkLogin(){
	   var loginForm=document.getElementById("loginForm");
		  loginForm.submit();
     }
     function checkLogin1(){
         var url=${ctx }"/tcsswebFwtcdyAtion.do?method=tdqTcsswebProFwcptdList&id="+<%=ids %>;
	     document.location.href=url;
     }
</script>
</body>
</html>