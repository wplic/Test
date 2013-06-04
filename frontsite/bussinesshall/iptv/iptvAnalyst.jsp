<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*"   %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@page import="java.util.List"%>
<%@ include file="/commons/taglibs.jsp"%>
<%@page import="java.util.List"%>
<%@page import="com.cssweb.complaints.pojo.Complaints"%>
<%@page import="com.cssweb.complaints.service.ComplaintsService"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>广发证券</title>
<link href="${ctx}/css/global.css" rel="stylesheet" type="text/css" />
<link href="${ctx}/css/wsyyt/wsyyt.css" rel="stylesheet" type="text/css" />
<script type="text/javascript">
 	function SwitchAnalyst(i,count){
 		  for(var j=1;j<=count;j++)
 		  {
	 		   if(i==j)
	 		   {
	 		    document.getElementById("analyst"+j).style.display="";
	 		   }
	 		   else
	 		   {
	 		   document.getElementById("analyst"+j).style.display="none";
	 		   }
 		  }
 	}
 	
 </script>
</head>
<%
	List list=null;
	if(request.getAttribute("list")!=null)
	list=(List)request.getAttribute("list");
%>
<body class="body_bg">
<jsp:include page="/share/top.jsp" />
<div class="wjdc_box">
  <p class="wjdc"><a href="/investorEdu/investorSurvey.html"><img src="/pic/index/wzdc.jpg"/></a></p>
</div>
<div class="main">
  <div class="dqwz">当前位置：<a href="${ctx }/index.jsp?nav=index">首页</a> &gt; <a href="${ctx }/bussinesshall/index.jsp?nav=wsyyt">网上营业厅</a> &gt; <a href="${ctx }/bussinesshall/iptv/iptv.jsp?nav=wsyyt&nav1=iptvsp">GFTV</a> &gt; 投资顾问风采</div>
</div>
<div class="wrap_2left">
  <!--左侧sied开始-->
  <div class="w210 fleft ptb9">  
  <div class="iptvside_top"></div>
    <div class="iptvside_mid">
        <jsp:include page="iptv_lmenu.jsp" />
    </div>
    <div class="iptvside_bot"></div>
  </div>
  <!--左侧sied结束-->
   
  <!--右侧sied开始--> 
  <div class="w706 fright">
  		<div class="left_tit2">投资顾问风采</div>
  		<div class="fxs_01">
        	<div style="height:50px"></div>
        	<div class="fxs_marq">
        	<marquee scrollamount="4" onmouseover="this.stop()" onmouseout="this.start()" width="637">
        	<%
        	  if(list!=null&&list.size()>0)
        	  {
        	    for(int i=0;i<list.size();i++)
        	    {
        	      Complaints comp=(Complaints)list.get(i);
        	       %>
        	       <a href="#" onclick="SwitchAnalyst(<%=i+1 %> ,<%=list.size() %>)"><img src="${ctx}/share/showUploadImage.jsp?id=<%=comp.getPhotoId() %>" width="95" height="119" alt="无相片"/></a>
        	       <%
        	    }
        	  }
        	 %>
        	</marquee></div>
        </div>
        <div class="fxs_02">
        <%
        	  if(list!=null&&list.size()>0)
        	  {
        	    for(int i=0;i<list.size();i++)
        	    {
        	      Complaints comp=(Complaints)list.get(i);
        	   %>
           <table id="analyst<%=i+1 %>" width="88%" border="0" align="center" class="mt15" <%=i==0?"":"style='display:none'" %>>
            <tr>
              <td width="26%">&nbsp;</td>
              <td width="56%" class="font_blk20 red"><%=comp.getName() %><br/><br/></td>
              <td width="18%">&nbsp;</td>
            </tr>
            <tr>
              <td align="center">
              <img src="${ctx}/share/showUploadImage.jsp?id=<%=comp.getPhotoId() %>" width="131" height="163" alt="无相片"/>
              </td>
              <td class="lh21" style=" text-indent:25px" valign="top">
              <%=comp.getRemark() %>
              </td>
              <td>&nbsp;</td>
            </tr>
          </table>
          	       <%
        	    }
        	  }
        	 %>
        </div>
  </div>
   <!--右侧sied结束--> 
    <div class="clearfloat"></div><!--清除浮动--> 
</div>
<jsp:include page="/share/bottom.jsp" />

</body>
</html>