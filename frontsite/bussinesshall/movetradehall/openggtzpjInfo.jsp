<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%
request.setCharacterEncoding("UTF-8");
%>
<%@ include file="/commons/taglibs.jsp"%>
<%@page import="org.springframework.context.ApplicationContext"%>
<%@page	import="org.springframework.web.context.support.WebApplicationContextUtils"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<jsp:directive.page import="com.cssweb.gazx.jrsj.service.VipgazxService" />
<jsp:directive.page import="com.cssweb.gazx.jrsj.pojo.Vipgazx"/>
<jsp:directive.page import="com.cssweb.client.pojo.TsystemWebuser"/>
<jsp:directive.page import="com.cssweb.common.dictionary.service.DictionaryService"/>
<jsp:directive.page import="com.cssweb.common.dictionary.pojo.Dictionary"/>
<%@page import="java.text.SimpleDateFormat"%>
<%@page contentType="text/html;charset=UTF-8"%>
<html>
<head>
<title>广发证券</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<link href="${contextPath}/css/global.css" rel="stylesheet" type="text/css" />
<link href="${contextPath}/css/wsyyt/wsyyt.css" rel="stylesheet" type="text/css" />

<%
		if(request.getSession().getAttribute("tsystemWebuser")!=null){
					TsystemWebuser tsystemWebuser=(TsystemWebuser)request.getSession().getAttribute("tsystemWebuser");
					if(tsystemWebuser!=null) {
					//暂时控制 体验用户不能查看金融库研究报告
					if(tsystemWebuser.getUserType()!=null&&tsystemWebuser.getUserType().equals("2"))
					{
						%>
						<script type="text/javascript">
							alert ("对不起，体验用户不能查看该研究报告！") ;
							window.opener=null;
							window.open('','_self');
							window.close() ;
						</script>
						<%
					}//完成
				}
			}	
					
	 ServletContext st = this.getServletConfig().getServletContext();
	 ApplicationContext ctx = WebApplicationContextUtils.getRequiredWebApplicationContext(st);
	 VipgazxService vipgazxService = (VipgazxService)ctx.getBean("vipgazxService");
	
   //取多少条记录
    String gpdm ="";
    if(request.getParameter("gpdm")!=null&&!request.getParameter("gpdm").equals(""))
      gpdm =request.getParameter("gpdm").trim();
    if(gpdm.equals(""))
    {
    %>
	<script type="text/javascript">
		alert ("对不起，您的请求不存在！") ;
		window.opener=null;
		window.open('','_self');
		window.close() ;
	</script>
	<%
    }
    

	List list=null;
	if(!gpdm.equals(""))
	{
	   list=vipgazxService.getJrsjGazxListGgpjByGpdm(gpdm);
	}
	
	
%>       

<script language="JavaScript" type="text/JavaScript">
var size=14;            //字体大小
function fontZoom(fontsize){    //设置字体
    size=fontsize;
    document.getElementById('ShowContent').style.fontSize=size+'px';
    document.getElementById('zhong').className='red';
    document.getElementById('da').className='';
    document.getElementById('xiao').className='';
}
function fontMax(){    //字体放大
    
    size=16
    document.getElementById('ShowContent').style.fontSize=size+'px';
    document.getElementById('zhong').className='';
    document.getElementById('da').className='red';
    document.getElementById('xiao').className='';
}
function fontMin(){    //字体缩小
    size=12;
    document.getElementById('ShowContent').style.fontSize=size+'px';
    document.getElementById('zhong').className='';
    document.getElementById('da').className='';
    document.getElementById('xiao').className='red';
}
</SCRIPT>
</head>

<body class="body_bg">
<jsp:include page="/share/top.jsp" />
<jsp:include page="/share/pdLogin.jsp" />
<div class="wjdc_box">
  <p class="wjdc"><a href="/investorEdu/investorSurvey.html"><img src="/pic/index/wzdc.jpg"/></a></p>
</div>
<div class="main">
   <div class="left_tit2">个股投资评级</div>
   <div>
  
   <p class="newstextAreatop"></p>
   <div style="word-wrap:break-word;">
<table border="1" class="lh24 center" bordercolor="#cccccc" width="100%" id="tabs12">
              
           <tr class="wisdom_tab_title">
           <td width="10%" class="tab_th1 bold">股票代码</td>
           <td width="10%" class="tab_th1 bold">股票简称</td>
           <td width="8%" class="tab_th1 bold">评级</td>
           <td width="39%" class="tab_th1 bold">报告名称</td>
           <td width="18%" class="tab_th1 bold">研究机构</td>
           <td width="15%" class="tab_th1 bold">日期</td>
          </tr>
<%
  SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
  if(list!=null&&list.size()>0 )
  {
    for(int i=0;i<list.size();i++)
    {
       Vipgazx vipgazx = (Vipgazx)list.get(i);
 %>
 <tr>
					                <td> <%=vipgazx.getGpdm() %></td>
					                <td><%=vipgazx.getGpjc() %></td>
					                <td><%=vipgazx.getBzpjmc() %></td>
					                <%
					                		String bgmc = vipgazx.getBgmc();
					                		if (bgmc != null&& !"".equals(bgmc))
					                		{
					                			if (bgmc.length() > 25)
						                		{
						                				bgmc = bgmc.substring(0,25) + "...";
						                		}
					                		}
					                		
					                		
					                 %>
					                <td>
					              <a href="/bussinesshall/movetradehall/GGtzContent.jsp?tbgibxxbId=<%=vipgazx.getTbgibxxbId() %>" target=\"_blank\">  <%=bgmc %></a>
					                </td>
					                <%
											String yjjg = (String)vipgazx.getYjjgmc();
											if (yjjg != null&& !"".equals(yjjg))
					                		{
					                			if (yjjg.length() > 10)
						                		{
						                				yjjg = yjjg.substring(0,10) + "...";
						                		}
					                		}else{
					                		yjjg="";
					                		}
					                		
									%>
					                <td><%=yjjg%></td>
					                <td><%=vipgazx.getZhxgrq()!=null?sdf.format(vipgazx.getZhxgrq()):"" %> </td>
					              </tr>
					         <%
             	    	}
             		}
             	 %>
    
             
</table>
                           </div>

			 
<p class="newstextAreabottom"></p>

</div>

</div>

<jsp:include page="/share/bottom.jsp" />
</body>
</html>
