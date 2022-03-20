<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
<head>
    <title></title>
</head>
<body>
Login fail!
${message}
<br>
<a href="<%=path%>/public/qiantai/login.jsp" rel="external nofollow" >Return</a>
</body>
</html>
