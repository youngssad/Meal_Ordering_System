<%@page import="com.example.meal_ordering_system.entity.Admin"%>
<%@page import="java.util.*"%>
<%@ page language="java" pageEncoding="utf-8"%>
<html>
<title>Online order System- Page Management</title>
<meta http-equiv="Content-Type" content="text/html;charset=utf-8">
<link href="css/top.css" rel="stylesheet" type="text/css">

</head>
<body leftmargin="0" topmargin="0">
	<%
		Admin admin = (Admin) session.getAttribute("admin_session");
		String name = "";
		if (admin == null) {
			name = "admin";
		} else {
			name = admin.getName();
		}
	%>
	<div id="maindiv">
		<div id="logodiv"></div>
		<div id="exitdiv">
			<a href="/admin/logout"><img src="${pageContext.request.contextPath}/public/admin/images/out.gif" alt="Safe Logout" ></a>
		</div>
		<div id="textdiv">
			Manager：<strong><%=name%></strong> Thank you for using this system！
		</div>
	</div>
</body>
</html>