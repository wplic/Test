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
<%@page import="com.cssweb.subscribe.pojo.TcsswebFwcpcx"%>
<%@page import="com.cssweb.subscribe.service.TcsswebFwcpcxService"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="java.util.List"%>
<%@page import="com.cssweb.subscribe.service.TcsswebFwtcdySfclService"%>
<%@page	import="com.cssweb.subscribe.pojo.TcsswebFwcpcx"%>
<%@page	import="com.cssweb.subscribe.service.TcsswebFwcpcxService"%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>广发证券</title>
<link href="${ctx}/css/global.css" rel="stylesheet" type="text/css" />
<link href="${ctx}/css/wsyyt/wsyyt.css" rel="stylesheet" type="text/css" />
</head>
<%

String packageId="8";
String packageName="基础服务资讯"; 
String levelsName="";//服务身体等级名字
TcsswebFwcpcx cxx=null;
List userlist=null;
ServletContext st = this.getServletConfig().getServletContext();
ApplicationContext ctx = WebApplicationContextUtils.getRequiredWebApplicationContext(st);
DictionaryService dictionaryService = (DictionaryService)ctx.getBean("dictionaryService");
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
	        userlist=tcsswebFwcpcxService.getTcsswebFwcpcxListByAccount(tsystemWebuser.getServiceName() );
	 }else{
	 userlist=tcsswebFwcpcxService.getTcsswebFwcpcxListByAccount(tsystemWebuser.getUserName());
	 cxx=tcsswebFwcpcxService.getTcsswebFwcpcxMrListByAccount(tsystemWebuser.getUserName());
	 }
		if(userlist!=null&&userlist.size()>0)
		{
		 TcsswebFwcpcx tcsswebFwcpcx=(TcsswebFwcpcx)userlist.get(0);
		 packageId=String.valueOf(tcsswebFwcpcx.getProductId());
		 if(packageId.equals("8"))
		 packageName="基础服务资讯";
		 else if(packageId.equals("9"))
		 packageName="乐享套餐";
		 else if(packageId.equals("10"))
		 packageName="优享套餐";
		 else if(packageId.equals("11"))
		 packageName="尊享套餐";
		}
}
Boolean flag=false;
	if(cxx!=null)
	{
	  long p=cxx.getProductId();
	  if(p<Long.parseLong(packageId)){
	  flag=true;}
	}else{
	flag=true;
	}
%>
<body class="body_bg">
<jsp:include page="/share/top.jsp?nav=jgj&nav1=zzfwdypr" />
<div class="main">
  <div class="dqwz">当前位置：首页 > 网上营业厅 > 我的理财中心 &gt; <a href="${ctx }/tcsswebFwcpcxAction.do?method=getTcsswebFwcpcxListByAccount">我的管家资讯</a></div> 
<div class="wrap920">

	<P><img src="${ctx}/pic/Subscribe/dylc.jpg"  /></P>
   
    
    
    
  <div class="dybox1" id="list1">
    
    <p align="center" class="font16 bold red p10">广发证券“金管家”资讯服务产品定制申请确认表</p>
    <p class="p10 lh21">尊敬的<%=tsystemWebuser!=null&&tsystemWebuser.getServiceName()!=null?tsystemWebuser.getServiceName():"" %>:<br />
     您将退定的金管家服务套餐为金管家<span class="red"><%=packageName %></span>.
     
    <br />
      
    </p>
    <%@page import="com.cssweb.subscribe.service.TcsswebFwcpdyCmsService"%>
    <%@page import="com.cssweb.subscribe.pojo.TcsswebFwcpdyCms"%>
    <%
    TcsswebFwcpdyCmsService tcsswebFwcpdyCmsService = (TcsswebFwcpdyCmsService)ctx.getBean("tcsswebFwcpdyCmsService");
	List fList=tcsswebFwcpdyCmsService.getTcsswebFwcpMlByListByFid(48);
	
    if(packageId.equals("9")){
    List list=tcsswebFwcpcxService.getTcsswebFwcpcxListAllByPackageId(9l);//
    %>
    <table border="0" cellspacing="0" cellpadding="0" width="100%" class="tcTab">
          <tr class="bold">
            <td width="77" nowrap="nowrap" bgcolor="#f5e4d3"><p align="center">类别 </p></td>
            <td width="340" colspan="2" nowrap="nowrap" bgcolor="#f5e4d3"><p align="center">服务内容 </p></td>
          </tr>
          <tr>
            <td width="77" rowspan="2" nowrap="nowrap" class="bold"><p align="center">管家团队 </p></td>
            <td width="340" nowrap="nowrap" colspan="2"><p align="left">专人服务 </p></td>
          </tr>
          <tr>
            <td width="340" nowrap="nowrap" colspan="2"><p align="left">金管家95575人工坐席 </p></td>
          </tr>
          <tr>
            <td width="77" rowspan="1" nowrap="nowrap" class="bold"><p align="center">管家交易 </p></td>
            <td width="340" nowrap="nowrap" colspan="2"><p align="left">各类便捷的交易通道 </p></td>
          </tr>
          <tr>
            <td width="77" nowrap="nowrap" class="bold"><p align="center">管家亲情 </p></td>
            <td width="340" nowrap="nowrap" colspan="2"><p align="left">生日/节日关怀 </p></td>
          </tr>
          
          <tr>
            <td width="77" nowrap="nowrap" class="bold"><p align="center">管家资讯 </p></td>
            <td width="340"><p align="left" width="100%">
            <table width="100%" border="0">
          
      
               
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
            
            </p></td>
          </tr>
          
          
          <tr>
            <td width="77" rowspan="3" nowrap="nowrap" class="bold"><p align="center">管家增值 </p></td>
            <td width="340" nowrap="nowrap" colspan="2"><p align="left">理财产品推介会 </p></td>
          </tr>
          <tr>
            <td width="126" nowrap="nowrap"><p align="left">股民学校 </p></td>
          </tr>
          <tr>
            <td width="126" nowrap="nowrap"><p align="left">财智大讲堂 </p></td>
          </tr>
       </table>   
    <%    } 
    if(packageId.equals("10")){
    List list=tcsswebFwcpcxService.getTcsswebFwcpcxListAllByPackageId(10l);//
    %>
    <table border="0" cellspacing="0" cellpadding="0" width="100%" class="tcTab">
          <tr class="bold">
            <td width="77" nowrap="nowrap" bgcolor="#f5e4d3"><p align="center">类别 </p></td>
            <td width="340" colspan="2" nowrap="nowrap" bgcolor="#f5e4d3"><p align="center">服务内容 </p></td>
          </tr>
          <tr>
            <td width="77" rowspan="2" nowrap="nowrap" class="bold"><p align="center">管家团队 </p></td>
            <td width="340" nowrap="nowrap" colspan="2"><p align="left">专人服务 </p></td>
          </tr>
          <tr>
            <td width="340" nowrap="nowrap" colspan="2"><p align="left">金管家95575人工坐席 </p></td>
          </tr>
          <tr>
            <td width="77" rowspan="1" nowrap="nowrap" class="bold"><p align="center">管家交易 </p></td>
            <td width="340" nowrap="nowrap" colspan="2"><p align="left">各类便捷的交易通道 </p></td>
          </tr>
          <tr>
            <td width="77" nowrap="nowrap" class="bold"><p align="center">管家亲情 </p></td>
            <td width="340" nowrap="nowrap" colspan="2"><p align="left">生日/节日关怀 </p></td>
          </tr>
          
          <tr>
            <td width="77" nowrap="nowrap" class="bold"><p align="center">管家资讯 </p></td>
            <td width="340"><p align="left" width="100%">
            <table width="100%" border="0">
          
      
               
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
            
            </p></td>
          </tr>
          
          
          <tr>
            <td width="77" rowspan="3" nowrap="nowrap" class="bold"><p align="center">管家增值 </p></td>
            <td width="340" nowrap="nowrap" colspan="2"><p align="left">理财产品推介会 </p></td>
          </tr>
          <tr>
            <td width="126" nowrap="nowrap"><p align="left">股民学校 </p></td>
          </tr>
          <tr>
            <td width="126" nowrap="nowrap"><p align="left">财智大讲堂 </p></td>
          </tr>
       </table>   
    <%    } 
    
    if(packageId.equals("11")){
    List list=tcsswebFwcpcxService.getTcsswebFwcpcxListAllByPackageId(11l);//
    %>
    <table border="0" cellspacing="0" cellpadding="0" width="100%" class="tcTab">
          <tr class="bold">
            <td width="77" nowrap="nowrap" bgcolor="#f5e4d3"><p align="center">类别 </p></td>
            <td width="340" colspan="2" nowrap="nowrap" bgcolor="#f5e4d3"><p align="center">服务内容 </p></td>
          </tr>
          <tr>
            <td width="77" rowspan="2" nowrap="nowrap" class="bold"><p align="center">管家团队 </p></td>
            <td width="340" nowrap="nowrap" colspan="2"><p align="left">专人服务 </p></td>
          </tr>
          <tr>
            <td width="340" nowrap="nowrap" colspan="2"><p align="left">金管家95575人工坐席 </p></td>
          </tr>
          <tr>
            <td width="77" rowspan="1" nowrap="nowrap" class="bold"><p align="center">管家交易 </p></td>
            <td width="340" nowrap="nowrap" colspan="2"><p align="left">各类便捷的交易通道 </p></td>
          </tr>
          <tr>
            <td width="77" nowrap="nowrap" class="bold"><p align="center">管家亲情 </p></td>
            <td width="340" nowrap="nowrap" colspan="2"><p align="left">生日/节日关怀 </p></td>
          </tr>
          
          <tr>
            <td width="77" nowrap="nowrap" class="bold"><p align="center">管家资讯 </p></td>
            <td width="340"><p align="left" width="100%">
            <table width="100%" border="0">
          
      
               
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
            
            </p></td>
          </tr>
          
          
          <tr>
            <td width="77" rowspan="3" nowrap="nowrap" class="bold"><p align="center">管家增值 </p></td>
            <td width="340" nowrap="nowrap" colspan="2"><p align="left">理财产品推介会 </p></td>
          </tr>
          <tr>
            <td width="126" nowrap="nowrap"><p align="left">股民学校 </p></td>
          </tr>
          <tr>
            <td width="126" nowrap="nowrap"><p align="left">财智大讲堂 </p></td>
          </tr>
       </table>   
    <%    } %>
    
    <%if(flag){ %>
   <form name="loginForm" action="${ctx }/tcsswebFwtcdyAtion.do?method=saveTcsswebProFwcptdListMr" method="post" id="loginForm">
   <input type="hidden" name="inputValue" value="<%=cxx!=null?cxx.getProductId():"8" %>"/>
   </form>
    <p class="p10" align="center">
    <input name="dyxyb" class="dybtn1" type="button" value="同意" onclick="checkLogin();" />　
    <input name="dyqx" class="dybtn1" type="button" value="取消" onclick="checkLogin1();"/></p>
    
    <%} %>
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
         var url=${ctx }"/tcsswebFwcpcxAction.do?method=getTcsswebFwcpcxListByAccount";
	     document.location.href=url;
     }
</script>
</body>
</html>