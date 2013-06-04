<%@page contentType="text/html;charset=UTF-8"%>
<%@page import="java.util.*"%>

<%@taglib uri="/tags/css-tree" prefix="tree"%>

<html>
<head>
<title></title>
<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
<link href="/plugins/tree/skins/default/styles/general.css" rel="stylesheet" type="text/css">
</head>
<%
	String valueId = request.getParameter ("valueId") ;
	String provider = request.getParameter ("provider") ;

	String type = request.getParameter ("type") ;
	if (type == null) type = "radio" ;

	String _leafOnly = request.getParameter ("leafOnly") ;
	boolean leafOnly = false ;
	if ("true".equals(_leafOnly)) leafOnly = true ;

	//默认值设定false,@see TreeExplorerTag#rtChildCount
	String _rtChildCount = request.getParameter ("rtChildCount") ;
	boolean rtChildCount = false ;
	if ("true".equals(_rtChildCount)) rtChildCount = true ;

	String maxDeep = request.getParameter ("maxDeep") ;
	//if (maxDeep == null) maxDeep = "-1" ;

	String leafIcon = request.getParameter ("leafIcon") ;
	//if (leafIcon == null) leafIcon = "leaf.gif" ;

	String loadMode = request.getParameter ("loadMode") ;
	if (loadMode == null) loadMode = "static" ;
	//if (loadMode == null) loadMode = "dynamic" ;

	String path = request.getParameter ("path") ;

	Hashtable key = (Hashtable)session.getAttribute("_tree_win_key_"+valueId) ;
	if (key == null)
		key = new Hashtable() ;
	Vector licence = (Vector)session.getAttribute("_tree_win_licence_"+valueId) ;

	//动态加载时,提供id键值给TreeXProvider实例
	String _id = request.getParameter ("id") ;
	long id = 0 ;
	if ("dynamic".equals(loadMode) && _id != null){
		try{
			id = Long.parseLong (_id) ;
		}catch(Exception e){
			throw new Exception ("节点id["+_id+"]错误") ;
		}
		key.put ("id" ,new Long(id)) ;
	}
	//动态加载时,提供name可选键值给TreeXProvider实例
	String name = request.getParameter ("name") ;
	if (name != null)
		key.put ("name" ,name) ;
	//for 显示声明加载方式,override 配置参数,but 不是所有的需要,这里仅为了适于通用
	key.put ("loadMode" ,loadMode) ;

	//以上参数,需要作为刷新参数,并且动态加载时,需要记忆(利用默认值,简化参数)
	String outerparams = "provider="+provider
						+ "&valueId="+ valueId
						+ (!"radio".equals(type)?"&type="+ type:"")
						+ ("dynamic".equals(loadMode)?"&loadMode="+loadMode:"")
						+ (leafOnly?"&leafOnly="+leafOnly:"")
						+ (leafIcon != null?"&leafIcon="+leafIcon:"")
						+ (rtChildCount?"rtChildCount="+_rtChildCount:"")
						+ (maxDeep != null?"maxDeep="+maxDeep:"")
						+ (path != null?"&path="+path:"") ;
%>
<base target="_self"/><!--防止链接新开窗口-->
<body class="gray-scrollbar" topMargin="0px" leftMargin="0px"
	onkeydown="if (event.keyCode==116){_reload.click();}">
<a id="_reload" href="?<%= outerparams%>" style="display:none">reload...</a>
<table border="0" cellspacing="0" cellpadding="6">
<form name="browser" method="post">
  <tr>
    <td valign="top">
	<tree:explorer provider="<%= provider%>" mode="<%= loadMode%>" rtChildCount="<%= rtChildCount%>" rootText="根节点" key="<%= key%>" licence="<%= licence%>" hasRoot="true" hasLeaf="true" leafOnly="<%= leafOnly%>">
		<tree:node id="node" type="com.css.framework.model.TreeNode" hasIcon="true" path="<%= path%>" divTag="true" leafIcon="<%= leafIcon%>">
			<tree:input type="<%= type%>" name="<%= valueId%>" show="<%= node.getChildName()%>"/>
		</tree:node>
	</tree:explorer>
	</td>
  </tr>
</form>
</table>
<script>
	var w = window.dialogArguments ;//寄生在参数里的父窗口对象
	var data = w.document.all('<%= valueId%>') ;//from window.opener
	w = null ;
	reload(data ,"<%= valueId%>");
</script>
</body>
</html>