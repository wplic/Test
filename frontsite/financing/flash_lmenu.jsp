<%@ page contentType="text/html; charset=utf-8" language="java"  %>
<%
String menu = request.getParameter("menu");
if(null==menu)
	menu = "1";
%>
<link href="/css/style.css" rel="stylesheet" type="text/css" />
<style>
<!--
.sidemenus{ width:198px;}
.sideblues{ color:#1e3d61; text-decoration:none}
.sideblues a{ color:#1e3d61; text-decoration:none}
.sideblues a:hover{ color:#1e3d61; font-weight:bold;text-decoration:none}
.sidemenus .links{ background:url(/pic/commons/sidemnenua.jpg) no-repeat; width:198px; height:30px; line-height:30px; text-indent:30px; display:block; text-align:left}
.sidemenus .actives{ background:url(/pic/commons/sidemnenuh.jpg); font-weight:bold; height:30px; line-height:30px; text-indent:30px; display:block ; text-align:left}
-->
</style>
<p><img src="/pic/about/siedban1.jpg" /></p>
<div class="sidemenus" >
  		<table>
          <tr>
            <td class="<%="1".equals(menu)?"actives":"links"%> sideblues"><a href="${contextPath }/financing/basicKnowledge.html">基础知识介绍 (动画)</a></td>
          </tr>
         <tr>
            <td class="<%="4".equals(menu)?"actives":"links"%> sideblues"><a href="${contextPath }/financing/basicKnowledgeFxsy.html">风险与收益 (动画)</a></td>
          </tr> 
          <tr>
            <td class="<%="2".equals(menu)?"actives":"links"%> sideblues"><a href="${contextPath }/financing/basicKnowledgeYwbllc.html">业务办理流程 (动画)</a></td>
          </tr>
          <tr>
            <td class="<%="3".equals(menu)?"actives":"links"%> sideblues"><a href="${contextPath }/financing/basicKnowledgeYwjy.html">业务交易与注意事项 (动画)</a></td>
          </tr>
          
        
		  <tr>
		    <td class="<%="6".equals(menu)?"actives":"links"%> sideblues"><a href="${contextPath }/investorEdu/investorRzrqZxDj.html">融资融券相关解读</a></td>
		  </tr>
		  <tr>
		    <td class="<%="7".equals(menu)?"actives":"links"%> sideblues"><a href="${contextPath }/investorEdu/investorRzrqZxDt.html">融资融券相关动态</a></td>
		  </tr>
        </table>
</div>


