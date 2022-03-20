<%@page import="com.example.meal_ordering_system.entity.Orders"%>
<%@ page language="java" import="java.util.*,java.text.*" pageEncoding="utf-8"%>
<%@ page import="com.example.meal_ordering_system.entity.Menus" %>
<%@ page import="com.example.meal_ordering_system.entity.Users" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
	System.out.println(basePath);
%>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta http-equiv="X-UA-Compatible" content="IE=7" />
	<title>My order</title>
	<meta content="" name=keywords />
	<meta content="" name=description />
	<link href="${pageContext.request.contextPath}/public/qiantai/css/common.css" rel="stylesheet" type="text/css" />
	<link href="${pageContext.request.contextPath}/public/qiantai/css/skin.css" rel="stylesheet" type="text/css" />
	<script src="${pageContext.request.contextPath}/public/qiantai/js/date.js" type="text/javascript"></script>
</head>

<body style='background:transparent'>
<table width="900" border="0" align="center" cellpadding="0" cellspacing="0">
	<tr>
		<td align="left" valign="top">


			<jsp:include flush="false" page="top.jsp"/>

		</td>
	</tr>
	<tr >
		<td height="50px"></td>

	</tr>

	<tr>
		<td align="center" valign="top" height="420px">

			<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
				<tr>
					<td align="left" valign="top">

						<div align="center" width="120">
							<form action="/orders/order_qiantai" name="form1" method="post">
								<table id="table1"   class="line_table" style="width: 500px;  margin: 0; padding: 0" cellSpacing="0" cellPadding="0">
									<tbody style="margin: 0; padding: 0">


									<tr >
										<td class="line_table" align="right" width="40%" ><span class="left_bt2">Search by name</span></td>
										<td class="line_table" align="left" width="60%">
											<input type="text" name="menuname" size="20">
											<input type="submit" value="Search">
										</td>
									<tr >
										<td class="line_table" align="right" width="40%" ><span class="left_bt2">Search by date</span></td>
										<td class="line_table" align="left" width="60%">
											<input type="text" name="date" size="20"  readOnly onClick="setDay(this);">
											<input type="submit" value="Search"></td>
									</tr>
									<tr >
										<td class="line_table" align="center" colspan="3" >
											<a href="/orders/ordergetall" >My order</a>&nbsp;&nbsp;&nbsp;&nbsp;
											<a href="/orders/ordergetallbydelivery?delivery=0" >Not deliver</a>&nbsp;&nbsp;&nbsp;&nbsp;
											<a href="/orders/ordergetallbydelivery?delivery=1" >Delivered</a>&nbsp;&nbsp;&nbsp;&nbsp;
										</td>
									</tr>
								</table>
							</form>
						</div>



					</td>
				</tr>
				<tr>
					<td align="left" valign="top" height="20px"></td>
				</tr>
				<tr>
					<td align="left" valign="top">


						<div align="center" >
							<table id="table2"   class="line_table" style="width: 900px; margin: 0; padding: 0" cellSpacing="0" cellPadding="0">
								<tbody style="margin: 0; padding: 0">
								<tr >
									<td class="line_table" align="center" colspan="9" >
										<span class="left_bt2">Result</span></td>
								</tr>
								<tr >
									<td class="line_table" align="center" ><span class="left_bt2">Meal</span></td>
									<td class="line_table" align="center" ><span class="left_bt2">Name</span></td>
									<td class="line_table" align="center" ><span class="left_bt2">Contact number</span></td>
									<td class="line_table" align="center" ><span class="left_bt2">Address</span></td>
									<td class="line_table" align="center" ><span class="left_bt2">Order number</span></td>
									<td class="line_table" align="center" ><span class="left_bt2">Price</span></td>
									<td class="line_table" align="center" ><span class="left_bt2">Total</span></td>
									<td class="line_table" align="center" ><span class="left_bt2">Deliver time</span></td>
									<td class="line_table" align="center" ><span class="left_bt2">Delivery</span></td>
								</tr>
									<%
							List<Orders> list = (List<Orders>) session.getAttribute("ordersearch");
							if (list != null) {
								for (int i = 0; i < list.size(); i++) {
									Orders order = list.get(i);
									Menus menus=order.getMenus();
									Users users=order.getUsers();
									String str = "";
									if (order.getDelivery() == 1) {
										str = "Yes";
									} else {
										str = "No";
									}
						%>
								<td class="line_table" align="center"  ><span class="left_txt"><%=menus.getName() %></span></td>
								<td class="line_table" align="center" ><span class="left_txt"><%=users.getRealname()%></span></td>
								<td class="line_table" align="center" ><span class="left_txt"><%=users.getPhone() %></span></td>
								<td class="line_table" align="center" ><span class="left_txt"><%=users.getAddress() %></span></td>
								<td class="line_table" align="center" ><span class="left_txt"><%=order.getMenusum() %></span></td>
								<td class="line_table" align="center" ><span class="left_txt"><%=menus.getPrice1() %></span></td>
								<td class="line_table" align="center" ><span class="left_txt"><%=order.getMenusum()*menus.getPrice1() %></span></td>
								<td class="line_table" align="center" ><span class="left_txt"><%=order.getTimes() %></span></td>
								<td class="line_table" align="center" ><span class="left_txt"><%=str %></span></td> </tr>
									<%
					   	}
					   		session.removeAttribute("ordersearch");
					   	}
					   %>


							</table>
						</div>





					</td>
				</tr>
			</table>









		</td>
	</tr>
	<tr>
		<td height="10px">&nbsp;</td>
	</tr>
	<tr>
		<td height="50px" align="center" valign="middle">

			<jsp:include flush="false" page="copyright.jsp"/>
		</td>
	</tr>

</table>



</body>
</html>
