<%@ page contentType="text/html; charset=utf-8" language="java"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
  <!-- 访问departmentAction 用于加载相关信息 -->
<jsp:include page="${contextPath }/sz/departmentManagerAction.do?op=getAllDepartmentManager"></jsp:include>

    
    <div class="mnr_sevice">客户经理</div>
    <div class="mnr_svebox">
   
        <c:forEach items="${departmentManagers}" var="departmentManager" varStatus="status">
        
        
        
        <div class="mnr_sevone" <c:if test="${status.last}"> style="border-bottom:none;"</c:if>>
             <dl>
                <dt>
                
                <img src="${contextPath}/sz/createUserImage.jsp?mpic=${departmentManager.id}" width="66" height="97" />
                </dt>
                
                <dd>
                    <h1>${departmentManager.name}</h1>
                    电话：<span style="font-size:11px;">${departmentManager.phone}</span><br /> 	
                    手机：<span style="font-size:11px;">${departmentManager.mobile}</span><br />
                    <div style="height:10px;"></div>
                    <a target=blank href=http://wpa.qq.com/msgrd?V=1&Uin=${departmentManager.qq }&Exe=QQ&Site=im.qq.com&Menu=No>
				<img border="0" SRC=http://wpa.qq.com/pa?p=1:${departmentManager.qq }:1 alt="给我发消息"></a><br/>
				<!-- <span>${departmentManager.qq }</span><br /> -->
                <!--  <a href="${ctx}/branchcomp/sz/yuye.jsp"><img src="${contextPath }/images/branchcomp/zixun_btn.jpg" width="55" height="19" /></a>--> 
                	
                </dd>
             </dl>
             
        </div>
        </c:forEach>
        
        
        
         
    </div>