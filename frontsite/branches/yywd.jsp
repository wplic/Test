<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*"   %>
<%@page import="java.util.List"%>
<%@page import="org.springframework.context.ApplicationContext"%>

<%@page import="org.springframework.web.context.support.WebApplicationContextUtils"%>
<%@page import="com.cssweb.common.dictionary.service.DictionaryService"%>
<%@page import="com.cssweb.common.dictionary.pojo.Dictionary"%>
<%@page import="com.cssweb.systemset.service.BranchManagerService"%>
<%@page import="com.cssweb.systemset.pojo.Branch"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%
		ServletContext st = this.getServletConfig().getServletContext();
		ApplicationContext ctx = WebApplicationContextUtils.getRequiredWebApplicationContext(st);
		DictionaryService dictionaryService = (DictionaryService)ctx.getBean("dictionaryService");
		List provinceList =	dictionaryService.getDictionaryByParentKeyCode("province");
		
		
		BranchManagerService branchManagerService =(BranchManagerService)ctx.getBean("branchManagerService");
		List provinceList1 =	 branchManagerService.getProvince();
		//江苏营业部
		List jsList = branchManagerService.getCityByProvince("江苏") ;
		
		//安徽
		List ahList = branchManagerService.getCityByProvince("安徽");
		
		//湖北
		List hbList = branchManagerService.getCityByProvince("湖北");
		
		//广东
		List gdList = branchManagerService.getCityByProvince("广东");
		
		//黑龙江
		List hrjList = branchManagerService.getCityByProvince("黑龙江");
		
		//吉林
		List gjList = branchManagerService.getCityByProvince("吉林");
		
		//辽宁
		List glList = branchManagerService.getCityByProvince("辽宁");
		
		//北京
		List bjList = branchManagerService.getCityByProvince("北京");
		
		//天津
		List tjList = branchManagerService.getCityByProvince("天津");
		//河北
		List hbList1 =	branchManagerService.getCityByProvince("河北");
		
		//山东
		List sdList = branchManagerService.getCityByProvince("山东");
		
		//山西
		List sxList = branchManagerService.getCityByProvince("山西");
		//河南
		List hlList = branchManagerService.getCityByProvince("河南");
		
		//陕西
		List sxyybList = branchManagerService.getCityByProvince("陕西");
		
		//甘肃
		List gsList = branchManagerService.getCityByProvince("甘肃");
		
		//新疆
		List xjList = branchManagerService.getCityByProvince("新疆");
		
		//上海
		List shList = branchManagerService.getCityByProvince("上海");
		//重庆
		List cqList = branchManagerService.getCityByProvince("重庆");
		
		//四川
		List scList =  branchManagerService.getCityByProvince("四川");
		
		// 湖南
		List hnList = branchManagerService.getCityByProvince("湖南");
		
		// 浙江
		List zjList = branchManagerService.getCityByProvince("浙江");
		
		// 江西
		List jxList = branchManagerService.getCityByProvince("江西");
		
		//福建
		List fjList =  branchManagerService.getCityByProvince("福建");
		
		//贵州
		List gzList = branchManagerService.getCityByProvince("贵州");
		//云南
		List ynList = branchManagerService.getCityByProvince("云南");
		//广西
		List gxList = branchManagerService.getCityByProvince("广西");
		
		//海南
		List hnList1 = branchManagerService.getCityByProvince("海南");
 %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>广发证券</title>
<link href="/css/global.css" rel="stylesheet" type="text/css" />
<link href="/css/branches/branches.css" rel="stylesheet" type="text/css" />
</head>

<body class="body_bg">
<jsp:include page="${contextPath }/share/top.jsp" />
<div class="main">
  <div class="dqwz">当前位置：<a href="${contextPath }/index.jsp?nav=index">首页</a> &gt; <a  href="${contextPath }/branches/index.jsp?nav=grgf">分支机构</a> &gt; 营业网点</div>
</div>
  <div class="yywd_box">
  <div id="yywdcon">
    <div class="left_tit2">营业网点</div>
    <div class="blank10"></div> 
	<div class="serchbg">
		<form action="${contextPath }/branchManagerAdminAction.do?method=getBranchList&nav=grgf&nav1=yywd" id="branchForm" name="branchForm" method="post">
		 <table width="99%" border="0" align="center" cellpadding="0" cellspacing="0">
	    <tr>
	      <td align="left" width="11%">营业部查询：</td>
	     
	      <td align="left" width="15%"> <select name="areaName" style="this.width:180px" id="areaName">
                <option value="">--请选择--</option>
                <%
                		if (provinceList1 != null && provinceList1.size() > 0)
                		{
                				for (int i = 0 ; i < provinceList1.size();i++)
                				{
                					Branch branch1 =(Branch)provinceList1.get(i);
                					%>
	                						 <option   value="<%= branch1.getProvince() %>"><%= branch1.getProvince() %></option>
	                				<%	 
	                			}
                				
                		}
                 %>
                
              </select></td>
	      <td  width="30%" align="left"><input type="submit" name="button" id="button" class="but_01" value="提交" /></td>
	      <td align="right" ><a href="${contextPath }/branchManagerAdminAction.do?method=getBranchList&nav=grgf&nav1=yywd" target="_blank"><img align="absmiddle" src="/pic/branches/fzlist.gif" /></a></td>
        </tr>
      </table>
	    </form> 
    </div>
    <div class="blank10"></div>
    <p align="center">
    <img src="/pic/branches/map.jpg" border="0" usemap="#Map" />
      <map name="Map" id="Map">
        <area shape="rect" coords="337,328,374,345" href="#" alt="广东" id="tagtabs1" onclick="SwitchNews('tabs', 1, 27,'','')" /><!--1-->
        <area shape="rect" coords="429,60,469,77" href="#" alt="黑龙江" id="tagtabs2" onclick="SwitchNews('tabs', 2, 27,'','')" /><!--2-->
        <area shape="rect" coords="420,96,459,110" href="#" alt="吉林" id="tagtabs3" onclick="SwitchNews('tabs', 3, 27,'','')" /><!--3-->
        <area shape="rect" coords="398,120,431,139" href="#" alt="辽宁" id="tagtabs4" onclick="SwitchNews('tabs', 4, 27,'','')" /><!--4-->
        <area shape="rect" coords="361,139,393,153" href="#" alt="北京" id="tagtabs5" onclick="SwitchNews('tabs', 5, 27,'','')" /><!--5-->
        <area shape="rect" coords="367,154,400,168" href="#" alt="天津" id="tagtabs6" onclick="SwitchNews('tabs', 6, 27,'','')" /><!--6-->
        <area shape="rect" coords="342,168,370,181" href="#" alt="河北" id="tagtabs7" onclick="SwitchNews('tabs', 7, 27,'','')" /><!--7-->
        <area shape="rect" coords="369,181,399,194" href="#" alt="山东" id="tagtabs8" onclick="SwitchNews('tabs', 8, 27,'','')" /><!--8-->
        <area shape="rect" coords="312,183,340,198" href="#" alt="山西" id="tagtabs9" onclick="SwitchNews('tabs', 9, 27,'','')" /><!--9-->
        <area shape="rect" coords="389,215,421,230" href="#" alt="江苏" id="tagtabs10" onclick="SwitchNews('tabs', 10, 27,'','')" /><!--10-->
        <area shape="rect" coords="317,216,351,232" href="#" alt="河南" id="tagtabs11" onclick="SwitchNews('tabs', 11, 27,'','')" /><!--11-->
        <area shape="rect" coords="278,213,311,230" href="#" alt="陕西" id="tagtabs12" onclick="SwitchNews('tabs', 12, 27,'','')" /><!--12-->
        <area shape="rect" coords="173,141,209,160" href="#" alt="甘肃" id="tagtabs13" onclick="SwitchNews('tabs', 13, 27,'','')"/><!--13-->
        <area shape="rect" coords="87,94,123,110" href="#" alt="新疆" id="tagtabs14" onclick="SwitchNews('tabs', 14, 27,'','')" /><!--14-->
        <area shape="rect" coords="413,236,446,251" href="#" alt="上海" id="tagtabs15" onclick="SwitchNews('tabs', 15, 27,'','')" /><!--15-->
        <area shape="rect" coords="366,243,394,259" href="#" alt="安徽" id="tagtabs16" onclick="SwitchNews('tabs', 16, 27,'','')" /><!--16-->
        <area shape="rect" coords="319,246,348,263" href="#" alt="湖北" id="tagtabs17" onclick="SwitchNews('tabs', 17, 27,'','')" /><!--17-->
        <area shape="rect" coords="273,260,301,278" href="#" alt="重庆" id="tagtabs18" onclick="SwitchNews('tabs', 18, 27,'','')" /><!--18-->
        <area shape="rect" coords="220,252,255,268" href="#" alt="四川" id="tagtabs19" onclick="SwitchNews('tabs', 19, 27,'','')" /><!--19-->
        <area shape="rect" coords="309,274,339,292" href="#" alt="湖南" id="tagtabs20" onclick="SwitchNews('tabs', 20, 27,'','')" /><!--20-->
        <area shape="rect" coords="393,262,423,279" href="#" alt="浙江" id="tagtabs21" onclick="SwitchNews('tabs', 21, 27,'','')" /><!--21-->
        <area shape="rect" coords="353,280,381,298" href="#" alt="江西" id="tagtabs22" onclick="SwitchNews('tabs', 22, 27,'','')" /><!--22-->
        <area shape="rect" coords="381,298,411,312" href="#" alt="福建" id="tagtabs23" onclick="SwitchNews('tabs', 23, 27,'','')" /><!--23-->
        <area shape="rect" coords="273,298,303,315" href="#" alt="贵州" id="tagtabs24" onclick="SwitchNews('tabs', 24, 27,'','')" /><!--24-->
        <area shape="rect" coords="201,315,239,331" href="#" alt="云南" id="tagtabs25" onclick="SwitchNews('tabs', 25, 27,'','')"/><!--25-->
        <area shape="rect" coords="285,328,323,346" href="#" alt="广西" id="tagtabs26" onclick="SwitchNews('tabs', 26, 27,'','')" /><!--26-->
        <area shape="rect" coords="311,379,348,395" href="#" alt="海南" id="tagtabs27" onclick="SwitchNews('tabs', 27, 27,'','')" /><!--27-->
      </map>
    </p>
  </div>
  <div id="yywdside">
    <div class="bcolor pd6">
      <table width="100%" border="0" class="tab_sdgd" id="tabs1">
        <tr>
          <td class="pl10 plr13 thtt"><p class="red bold" >广东营业部</p></td>
        </tr>
        <tr>
          <td class="bcolor_white pd6">
          <div style=" height:200px; overflow: auto">
          <table width="100%" border="0" class="lh25 textleft font_st">
          	<%
          			if (gdList != null)
          			{
          					for (int i = 0; i < gdList.size(); i ++)
          					{
          						Branch branch	=(Branch)gdList.get(i);
          							%>
          								<tr>
							              <td><span class="font_a8">·</span><a href="#" onclick="yywdPhone('<%=branch.getId() %>');"><%= branch.getBranchName() %></a></td>
							            </tr>
          							<%
          					}
          			}
          	 %>
            
          </table>
          </div>
          </td>
        </tr>
      </table>
      
      <table width="100%" border="0" class="tab_sdgd" id="tabs2" style="display:none">
      	<tr>
          <td class="pl10 plr13 thtt"><p class="red bold" >黑龙江营业部</p></td>
        </tr>
        <tr>
          <td class="bcolor_white pd6">
          <div style=" height:200px; overflow: auto">
          <table width="100%" border="0" class="lh25 textleft font_st">
          <%
          			if (hrjList != null)
          			{
          					for (int i = 0; i < hrjList.size(); i ++)
          					{
          						Branch branch	=(Branch)hrjList.get(i);
          							%>
          								<tr>
							              <td><span class="font_a8">·</span><a href="#" onclick="yywdPhone('<%=branch.getId() %>');"><%= branch.getBranchName() %></a></td>
							            </tr>
          							<%
          					}
          			}
          	 %>
           
          </table>
          </div>
          </td>
        </tr>
      </table>
      
      <table width="100%" border="0" class="tab_sdgd" id="tabs3" style="display:none">
        <tr>
          <td class="pl10 plr13 thtt"><p class="red bold" >吉林营业部</p></td>
        </tr>
        <tr>
          <td class="bcolor_white pd6">
          <div style=" height:200px; overflow: auto">
          <table width="100%" border="0" class="lh25 textleft font_st">
          	 <%
          			if (gjList != null)
          			{
          					for (int i = 0; i < gjList.size(); i ++)
          					{
          						Branch branch	=(Branch)gjList.get(i);
          							%>
          									 <tr>
							              <td><span class="font_a8">·</span><a href="#" onclick="yywdPhone('<%=branch.getId() %>');"><%= branch.getBranchName() %></a></td>
							            </tr>
          							<%
          					}
          			}
          	 %>
          
          </table>
          </div>
          </td>
        </tr>
      </table>
      
      <table width="100%" border="0" class="tab_sdgd" id="tabs4" style="display:none">
        <tr>
          <td class="pl10 plr13 thtt"><p class="red bold" >辽宁营业部</p></td>
        </tr>
        <tr>
          <td class="bcolor_white pd6">
          <div style=" height:200px; overflow: auto">
          <table width="100%" border="0" class="lh25 textleft font_st">
            <%
            		if (glList != null)
            		{
            				for (int i = 0 ; i < glList.size();i ++)
            				{
            						Branch  branch =(Branch)glList.get(i);
            						%>
            								<tr>
								              <td><span class="font_a8">·</span><a href="#" onclick="yywdPhone('<%=branch.getId() %>');"><%=branch.getBranchName() %></a></td>
								            </tr>
            						<%
            				}
            		}
             %>
           </table>
          </div>
          </td>
        </tr>
      </table>
      
      <table width="100%" border="0" class="tab_sdgd" id="tabs5" style="display:none">
        <tr>
          <td class="pl10 plr13 thtt"><p class="red bold" >北京营业部</p></td>
        </tr>
       
        <tr>
          <td class="bcolor_white pd6">
          <div style=" height:200px; overflow: auto">
          <table width="100%" border="0" class="lh25 textleft font_st">
           <%
        		if (bjList != null)
        		{
        				for (int i = 0; i < bjList.size(); i++)
        				{
        						Branch branch = (Branch)bjList.get(i);
        						%>
        							 <tr>
						              <td><span class="font_a8">·</span><a href="#" onclick="yywdPhone('<%=branch.getId() %>');"><%= branch.getBranchName() %></a></td>
						            </tr>
        						<%
        				}
        		}
         %>
        </table>
          </div>
          </td>
        </tr>
      </table>
      
      <table width="100%" border="0" class="tab_sdgd" id="tabs6" style="display:none">
        <tr>
          <td class="pl10 plr13 thtt"><p class="red bold" >天津营业部</p></td>
        </tr>
        <tr>
          <td class="bcolor_white pd6">
          <div style=" height:200px; overflow: auto">
          <table width="100%" border="0" class="lh25 textleft font_st">
          	<%
        		if (tjList != null)
        		{
        				for (int i = 0; i < tjList.size(); i++)
        				{
        						Branch branch = (Branch)tjList.get(i);
        						%>
        							 <tr>
						              <td><span class="font_a8">·</span><a href="#" onclick="yywdPhone('<%=branch.getId() %>');"><%= branch.getBranchName() %></a></td>
						            </tr>
        						<%
        				}
        		}
         %>
          </table>
          </div>
          </td>
        </tr>
      </table>
      
      <table width="100%" border="0" class="tab_sdgd" id="tabs7" style="display:none">
        <tr>
          <td class="pl10 plr13 thtt"><p class="red bold" >河北营业部</p></td>
        </tr>
        <tr>
          <td class="bcolor_white pd6">
          <div style=" height:200px; overflow: auto">
          <table width="100%" border="0" class="lh25 textleft font_st">
          <%
          		if (hbList1 != null)
          		{
          				for (int i = 0; i < hbList1.size() ; i++)
          				{
          					Branch branch = (Branch)hbList1.get(i);
          					%>
          						<tr>
					              <td><span class="font_a8">·</span><a href="#" onclick="yywdPhone('<%=branch.getId() %>');"><%= branch.getBranchName() %></a></td>
					            </tr>
          					<%
          				}
          		}
           %>
         </table>
          </div>
          </td>
        </tr>
      </table>
      
      <table width="100%" border="0" class="tab_sdgd" id="tabs8" style="display:none">
        <tr>
          <td class="pl10 plr13 thtt"><p class="red bold" >山东营业部</p></td>
        </tr>
        <tr>
          <td class="bcolor_white pd6">
          <div style=" height:200px; overflow: auto">
          <table width="100%" border="0" class="lh25 textleft font_st">
            <%
            		if (sdList != null)
            		{
            				for ( int i = 0 ; i < sdList.size() ; i ++)
            				{
            						Branch branch =	(Branch)sdList.get(i);
            						%>
            							<tr>
							              <td><span class="font_a8">·</span><a href="#" onclick="yywdPhone('<%=branch.getId() %>');"><%=branch.getBranchName()  %></a></td>
							            </tr>	
            						<%
            				}
            		}
             %>
           
          </table>
          </div>
          </td>
        </tr>
      </table>
      
      <table width="100%" border="0" class="tab_sdgd" id="tabs9" style="display:none">
        <tr>
          <td class="pl10 plr13 thtt"><p class="red bold" >山西营业部</p></td>
        </tr>
        <tr>
          <td class="bcolor_white pd6">
          <div style=" height:200px; overflow: auto">
          <table width="100%" border="0" class="lh25 textleft font_st">
          	<%
          			if (sxList != null)
          			{
          					for (int i = 0; i < sxList.size() ; i ++)
          					{
          						Branch branch  =	(Branch)sxList.get(i);
          						%>
          								<tr>
							              <td><span class="font_a8">·</span><a href="#" onclick="yywdPhone('<%=branch.getId() %>');"><%= branch.getBranchName() %></a></td>
							            </tr>
          						<%
          					}
          			}
          	 %>
            
          </table>
          </div>
          </td>
        </tr>
      </table>
      
      <table width="100%" border="0" class="tab_sdgd" id="tabs10" style="display:none">
        <tr>
          <td class="pl10 plr13 thtt"><p class="red bold" >江苏营业部</p></td>
        </tr>
        <tr>
          <td class="bcolor_white pd6">
          <div style=" height:200px; overflow: auto">
          <table width="100%" border="0" class="lh25 textleft font_st">
          	<%
          			if (jsList != null)
          			{
          					for (int i = 0; i < jsList.size() ; i ++)
          					{
          						 Branch branch =	(Branch)jsList.get(i);
          						 %>
          						 		<tr>
							              <td><span class="font_a8">·</span><a href="#" onclick="yywdPhone('<%=branch.getId() %>');"><%=branch.getBranchName() %></a></td>
							            </tr>
          						 <%
          					}
          			}
          	 %>
           
          </table>
          </div>
          </td>
        </tr>
      </table>
      
      <table width="100%" border="0" class="tab_sdgd" id="tabs11" style="display:none">
        <tr>
          <td class="pl10 plr13 thtt"><p class="red bold" >河南营业部</p></td>
        </tr>
        <tr>
          <td class="bcolor_white pd6">
          <div style=" height:200px; overflow: auto">
          <table width="100%" border="0" class="lh25 textleft font_st">
          	<%
          			if (hlList != null)
          			{
          					for (int i = 0; i < hlList.size() ; i ++)
          					{
          							Branch branch = (Branch)hlList.get(i);
          							%>
          									<tr>
								              <td><span class="font_a8">·</span><a href="#" onclick="yywdPhone('<%=branch.getId() %>');"><%= branch.getBranchName() %></a></td>
								            </tr>
          							<%
          					}
          			}
          	 %>
            
          </table>
          </div>
          </td>
        </tr>
      </table>
      
      <table width="100%" border="0" class="tab_sdgd" id="tabs12" style="display:none">
        <tr>
          <td class="pl10 plr13 thtt"><p class="red bold" >陕西营业部</p></td>
        </tr>
        <tr>
          <td class="bcolor_white pd6">
          <div style=" height:200px; overflow: auto">
          <table width="100%" border="0" class="lh25 textleft font_st">
          	<%
          			if (sxyybList != null )
          			{
          				for (int i = 0 ; i < sxyybList.size(); i ++)
          				{
          						Branch branch =(Branch)sxyybList.get(i);
          						%>
          								 <tr>
							              <td><span class="font_a8">·</span><a href="#" onclick="yywdPhone('<%=branch.getId() %>');"><%= branch.getBranchName() %></a></td>
							            </tr>
          						<%
          				}
          			}
          	 %>
          </table>
          </div>
          </td>
        </tr>
      </table>
      
      <table width="100%" border="0" class="tab_sdgd" id="tabs13" style="display:none">
        <tr>
          <td class="pl10 plr13 thtt"><p class="red bold" >甘肃营业部</p></td>
        </tr>
        <tr>
          <td class="bcolor_white pd6">
          <div style=" height:200px; overflow: auto">
          <table width="100%" border="0" class="lh25 textleft font_st">
          	<%
          			if (gsList != null)
          			{
          					for (int i = 0 ; i < gsList.size(); i++)
          					{
          							Branch branch = (Branch)gsList.get(i);
          							%>
          									 <tr>
								              <td><span class="font_a8">·</span><a href="#" onclick="yywdPhone('<%=branch.getId() %>');"><%= branch.getBranchName() %></a></td>
								            </tr>
          							<%
          					}
          			}
          	 %>
           
          </table>
          </div>
          </td>
        </tr>
      </table>
      
      <table width="100%" border="0" class="tab_sdgd" id="tabs14" style="display:none">
        <tr>
          <td class="pl10 plr13 thtt"><p class="red bold" >新疆营业部</p></td>
        </tr>
        <tr>
          <td class="bcolor_white pd6">
          <div style=" height:200px; overflow: auto">
          <table width="100%" border="0" class="lh25 textleft font_st">
          	<%
          		if (xjList != null)
          		{
          				for (int i = 0; i < xjList.size() ; i ++)
          				{
          						Branch branch = (Branch)xjList.get(i);
          						%>
          						<tr>
					              <td><span class="font_a8">·</span><a href="#" onclick="yywdPhone('<%=branch.getId() %>');"><%= branch.getBranchName() %></a></td>
					            </tr>
          						<%
          				}
          		}
           	%>
           
          </table>
          </div>
          </td>
        </tr>
      </table>
      
      <table width="100%" border="0" class="tab_sdgd" id="tabs15" style="display:none">
        <tr>
          <td class="pl10 plr13 thtt"><p class="red bold" >上海营业部</p></td>
        </tr>
        <tr>
          <td class="bcolor_white pd6">
          <div style=" height:200px; overflow: auto">
          <table width="100%" border="0" class="lh25 textleft font_st">
          	<%
          			if (shList != null)
          			{
          					for (int i = 0; i < shList.size() ; i ++)
          					{
          							Branch branch = (Branch)shList.get(i);
          							%>
          								 <tr>
							              <td><span class="font_a8">·</span><a href="#" onclick="yywdPhone('<%=branch.getId() %>');"><%=branch.getBranchName() %></a></td>
							            </tr>
          							<%
          					}
          			}
          	 %>
           
          </table>
          </div>
          </td>
        </tr>
      </table>
      
      <table width="100%" border="0" class="tab_sdgd" id="tabs16" style="display:none">
        <tr>
          <td class="pl10 plr13 thtt"><p class="red bold" >安徽营业部</p></td>
        </tr>
        <tr>
          <td class="bcolor_white pd6">
          <div style=" height:200px; overflow: auto">
          <table width="100%" border="0" class="lh25 textleft font_st">
          	<%
          			if (ahList != null)
          			{
          					for (int i = 0; i < ahList.size() ; i++)
          					{
          						Branch	branch =	(Branch)ahList.get(i);
          						%>
          								 <tr>
							              <td><span class="font_a8">·</span><a href="#" onclick="yywdPhone('<%=branch.getId() %>');"><%= branch.getBranchName() %></a></td>
							            </tr>
          						<%
          					}
          			}
          	 %>
           
          </table>
          </div>
          </td>
        </tr>
      </table>
      
      <table width="100%" border="0" class="tab_sdgd" id="tabs17" style="display:none">
        <tr>
          <td class="pl10 plr13 thtt"><p class="red bold" >湖北营业部</p></td>
        </tr>
        <tr>
          <td class="bcolor_white pd6">
          <div style=" height:200px; overflow: auto">
          <table width="100%" border="0" class="lh25 textleft font_st">
          	<%
          			if (hbList != null )
          			{
          					for (int i = 0; i < hbList.size() ; i ++)
          					{
          							Branch branch =(Branch)hbList.get(i);
          							%>
          									<tr>
								              <td><span class="font_a8">·</span><a href="#" onclick="yywdPhone('<%=branch.getId() %>');"><%=branch.getBranchName() %></a></td>
								            </tr>
          							<%
          					}
          			}
          	 %>
            
          </table>
          </div>
          </td>
        </tr>
      </table>
      
      <table width="100%" border="0" class="tab_sdgd" id="tabs18" style="display:none">
        <tr>
          <td class="pl10 plr13 thtt"><p class="red bold" >重庆营业部</p></td>
        </tr>
        <tr>
          <td class="bcolor_white pd6">
          <div style=" height:200px; overflow: auto">
          <table width="100%" border="0" class="lh25 textleft font_st">
          	<%
          			if (cqList != null)
          			{
          					for (int i = 0; i < cqList.size() ; i++)
          					{
          						Branch branch =	(Branch)cqList.get(i);
          						%>
          								<tr>
							              <td><span class="font_a8">·</span><a href="#" onclick="yywdPhone('<%=branch.getId() %>');"><%= branch.getBranchName() %></a></td>
							            </tr>
          						<%
          					}
          			}
          	 %>
          </table>
          </div>
          </td>
        </tr>
      </table>
      
      <table width="100%" border="0" class="tab_sdgd" id="tabs19" style="display:none">
        <tr>
          <td class="pl10 plr13 thtt"><p class="red bold" >四川营业部</p></td>
        </tr>
        <tr>
          <td class="bcolor_white pd6">
          <div style=" height:200px; overflow: auto">
          <table width="100%" border="0" class="lh25 textleft font_st">
          	<%
          			if (scList != null)
          			{
          					for (int i = 0; i < scList.size() ; i ++)
          					{
          							Branch branch = (Branch)scList.get(i);
          							%>
          								<tr>
							              <td><span class="font_a8">·</span><a href="#" onclick="yywdPhone('<%=branch.getId() %>');"><%= branch.getBranchName() %></a></td>
							            </tr>
          							<%
          					}
          			}
          	 %>
            
          </table>
          </div>
          </td>
        </tr>
      </table>
      
      <table width="100%" border="0" class="tab_sdgd" id="tabs20" style="display:none">
        <tr>
          <td class="pl10 plr13 thtt"><p class="red bold" >湖南营业部</p></td>
        </tr>
        <tr>
          <td class="bcolor_white pd6">
          <div style=" height:200px; overflow: auto">
          <table width="100%" border="0" class="lh25 textleft font_st">
          	<%
          			if (hnList != null)
          			{
          					for (int i = 0; i < hnList.size() ; i ++)
          					{
          						   Branch branch  =	(Branch)hnList.get(i);
          						   %>
          						   		<tr>
							              <td><span class="font_a8">·</span><a href="#" onclick="yywdPhone('<%=branch.getId() %>');"><%= branch.getBranchName() %></a></td>
							            </tr>
          						   <%
          					}
          			}
          	 %>
          </table>
          </div>
          </td>
        </tr>
      </table>
      
      <table width="100%" border="0" class="tab_sdgd" id="tabs21" style="display:none">
        <tr>
          <td class="pl10 plr13 thtt"><p class="red bold" >浙江营业部</p></td>
        </tr>
        <tr>
          <td class="bcolor_white pd6">
          <div style=" height:200px; overflow: auto">
          <table width="100%" border="0" class="lh25 textleft font_st">
          	<%
          			if ( zjList != null)
          			{
          					for (int i = 0; i < zjList.size() ; i++)
          					{
          							Branch branch = (Branch)zjList.get(i);
          							%>
          								<tr>
							              <td><span class="font_a8">·</span><a href="#" onclick="yywdPhone('<%=branch.getId() %>');"><%= branch.getBranchName() %></a></td>
							            </tr>
          							<%
          					}
          			}
          	 %>
           
          </table>
          </div>
          </td>
        </tr>
      </table>
      
      <table width="100%" border="0" class="tab_sdgd" id="tabs22" style="display:none">
        <tr>
          <td class="pl10 plr13 thtt"><p class="red bold" >江西营业部</p></td>
        </tr>
        <tr>
          <td class="bcolor_white pd6">
          <div style=" height:200px; overflow: auto">
          <table width="100%" border="0" class="lh25 textleft font_st">
          	<%
          			if (jxList != null)
          			{
          					for (int i = 0 ; i < jxList.size() ; i ++)
          					{
          						Branch branch  =	(Branch)jxList.get(i);
          						%>
          								<tr>
							              <td><span class="font_a8">·</span><a href="#" onclick="yywdPhone('<%=branch.getId() %>');"><%= branch.getBranchName() %></a></td>
							            </tr>
          						<%
          					}
          			}
          	 %>
            
          </table>
          </div>
          </td>
        </tr>
      </table>
      
      <table width="100%" border="0" class="tab_sdgd" id="tabs23" style="display:none">
        <tr>
          <td class="pl10 plr13 thtt"><p class="red bold" >福建营业部</p></td>
        </tr>
        <tr>
          <td class="bcolor_white pd6">
          <div style=" height:200px; overflow: auto">
          <table width="100%" border="0" class="lh25 textleft font_st">
          	<%
          			if (fjList != null)
          			{
          					for (int i = 0; i < fjList.size() ; i ++)
          					{
          							Branch branch = (Branch)fjList.get(i);
          							%>
          									<tr>
								              <td><span class="font_a8">·</span><a href="#" onclick="yywdPhone('<%=branch.getId() %>');"><%= branch.getBranchName() %></a></td>
								            </tr>
          							<%
          					}
          			}
          	 %>
          
          </table>
          </div>
          </td>
        </tr>
      </table>
      
      <table width="100%" border="0" class="tab_sdgd" id="tabs24" style="display:none">
        <tr>
          <td class="pl10 plr13 thtt"><p class="red bold" >贵州营业部</p></td>
        </tr>
        <tr>
          <td class="bcolor_white pd6">
          <div style=" height:200px; overflow: auto">
          <table width="100%" border="0" class="lh25 textleft font_st">
          	<%
					if (gzList != null)
					{
							for (int i = 0; i < gzList.size() ; i ++)
							{
								Branch branch =	(Branch)gzList.get(i);
								%>
										<tr>
							              <td><span class="font_a8">·</span><a href="#" onclick="yywdPhone('<%=branch.getId() %>');"><%= branch.getBranchName() %></a></td>
							            </tr>
								<%
							}
					}          			
			%>
            
          </table>
          </div>
          </td>
        </tr>
      </table>
      
      <table width="100%" border="0" class="tab_sdgd" id="tabs25" style="display:none">
        <tr>
          <td class="pl10 plr13 thtt"><p class="red bold" >云南营业部</p></td>
        </tr>
        <tr>
          <td class="bcolor_white pd6">
          <div style=" height:200px; overflow: auto">
          <table width="100%" border="0" class="lh25 textleft font_st">
          <%
          		if (ynList != null )
          		{
          				for (int i =0; i < ynList.size() ; i ++)
          				{
          						Branch branch = (Branch)ynList.get(i);
          						%>
          								<tr>
							              <td><span class="font_a8">·</span><a href="#" onclick="yywdPhone('<%=branch.getId() %>');"><%= branch.getBranchName() %></a></td>
							            </tr>
          						<%
          				}
          		}
           %>
            
          </table>
          </div>
          </td>
        </tr>
      </table>
      
      <table width="100%" border="0" class="tab_sdgd" id="tabs26" style="display:none">
        <tr>
          <td class="pl10 plr13 thtt"><p class="red bold" >广西营业部</p></td>
        </tr>
        <tr>
          <td class="bcolor_white pd6">
          <div style=" height:200px; overflow: auto">
          <table width="100%" border="0" class="lh25 textleft font_st">
          	<%
          			if (gxList != null)
          			{
          					for (int i = 0; i < gxList.size() ; i ++)
          					{
          							Branch branch = (Branch)gxList.get(i);
          							%>
          								<tr>
							              <td><span class="font_a8">·</span><a href="#" onclick="yywdPhone('<%=branch.getId() %>');"><%= branch.getBranchName() %></a></td>
							            </tr>
          							<%
          					}
          			}
          	 %>
            
          </table>
          </div>
          </td>
        </tr>
      </table>
      
      <table width="100%" border="0" class="tab_sdgd" id="tabs27" style="display:none">
        <tr>
          <td class="pl10 plr13 thtt"><p class="red bold" >海南营业部</p></td>
        </tr>
        <tr>
          <td class="bcolor_white pd6">
          <div style=" height:200px; overflow: auto">
          <table width="100%" border="0" class="lh25 textleft font_st">
          	<%
          			if (hnList1 != null)
          			{
          				for (int i = 0; i < hnList1.size() ; i++)
          				{
          					Branch branch	= (Branch)hnList1.get(i);
          					%>
          							<tr>
						              <td><span class="font_a8">·</span><a href="#" onclick="yywdPhone('<%=branch.getId() %>');"><%= branch.getBranchName() %></a></td>
						            </tr>
          					<%
          				}
          			}
          	 %>
          </table>
          </div>
          </td>
        </tr>
      </table>
      
      
      
      
      
      <div class="blank5"></div>
    <iframe target="_blank" id="yywPhone" name="yywPhone"  marginWidth="0" marginHeight="0" src="${contextPath }/branches/yywdPhone.jsp?id=0"
						frameBorder="0" noresize width="100%" scrolling="no"></iframe>
    </div>
  </div>
  <div class="clear"></div>
</div>

<jsp:include page="${contextPath }/share/bottom.jsp" />
<script src="/js/setTab.js"></script>
<SCRIPT LANGUAGE="JavaScript">

function yywdPhone(id)
{
 var url="${ctx }/branches/yywdPhone.jsp?id="+id;
 document.getElementById("yywPhone").src=url;
 
 var infoUrl = "${contextPath}/branchManagerAction.do?method=getBranchInfoById&id="+id;
 window.open(infoUrl);
 
}
</SCRIPT>
</body>
</html>