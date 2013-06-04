<%@ page contentType="text/html; charset=utf-8" language="java"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<jsp:directive.page import="org.apache.commons.lang.StringUtils"/>
<jsp:directive.page import="org.springframework.context.ApplicationContext"/>
<jsp:directive.page import="org.springframework.web.context.support.WebApplicationContextUtils"/>
<jsp:directive.page import="com.cssweb.common.dictionary.pojo.Dictionary"/>
<jsp:directive.page import="com.cssweb.common.dictionary.service.DictionaryService"/>
<jsp:directive.page import="java.util.List"/>
<jsp:directive.page import="java.util.HashMap"/>
<jsp:directive.page import="java.util.Map"/>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>广发证券</title>
<link href="/css/style.css" rel="stylesheet" type="text/css" />
<link href="/css/assetManage/assetManage.css" rel="stylesheet" type="text/css" />
</head>
<%
    Map map=new HashMap();
	String li_code="";//理财产品 参数
	if(request.getParameter("li_code")!=null&&!request.getParameter("li_code").equals(""))
	li_code=request.getParameter("li_code").trim();
	String li_name="";//定义的标题ID
	if(request.getParameter("li_name")!=null&&!request.getParameter("li_name").equals(""))
	li_name=request.getParameter("li_name").trim();

 	//取字典表数据
	ApplicationContext ctx = WebApplicationContextUtils.getRequiredWebApplicationContext(this.getServletConfig().getServletContext());	
	DictionaryService dictionaryService=(DictionaryService)ctx.getBean("dictionaryService");	
	if(li_code!=null&&!li_code.equals("")){
	List dicCplbList = dictionaryService.getDictionaryByParentKeyCode(li_code);
	if(dicCplbList!=null && dicCplbList.size()>0){
		for(int i=0;i<dicCplbList.size();i++){
			Dictionary dictionary=(Dictionary)dicCplbList.get(i);
			map.put(dictionary.getKeyName(),dictionary.getKeyCode());
			//System.out.println("['"+dictionary.getKeyName() +"','"+dictionary.getKeyCode()+"'],");
		}
	 }
	}
	String doc_id=(String)map.get(li_name);
	//System.out.println(map+"           "+doc_id);
	if(doc_id==null){
		%>
		<script type="text/javascript">
			alert('对不起，您请求的文章不存在！');
			window.opener=null;
			window.open('','_self');
			window.close() ;
		</script>
	<%
	}else{
	%>
		<script type="text/javascript">
		document.location.href="${ctx}/commons/infoList.jsp?docId=<%=doc_id%>";
		</script>
	<%
	}
%>
<body>

</body>
</html>
</html>