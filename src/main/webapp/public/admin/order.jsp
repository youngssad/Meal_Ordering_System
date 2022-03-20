<%@page import="com.example.meal_ordering_system.entity.Orders "%>
<%@page import="java.util.*"%>
<%@ page import="com.example.meal_ordering_system.service.OrdersService" %>
<%@ page import="com.example.meal_ordering_system.service.impl.OrdersServiceImpl" %>
<%@ page import="com.example.meal_ordering_system.entity.Users" %>
<%@ page import="com.example.meal_ordering_system.entity.Menus" %>
<%@ page import="com.example.meal_ordering_system.entity.Pages" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
	<link href="../public/admin/css/skin.css" rel="stylesheet" type="text/css" />
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
</head>

<body class="body">

<table width="100%" height="1" border="0" cellpadding="0"
	   cellspacing="0">
	<tr>
		<td width="17" valign="top" background="../public/admin/images/mail_leftbg.gif"><img
				src="../public/admin/images/left-top-right.gif" width="17" height="29" /></td>
		<td valign="top" background="../public/admin/images/content-bg.gif"><table
				width="100%" height="31" border="0" cellpadding="0" cellspacing="0"
				class="left_topbg" id="table2">
			<tr>
				<td height="31"><div class="titlebt">Order Information</div></td>
			</tr>
		</table></td>
		<td width="16" valign="top" background="../public/admin/images/mail_rightbg.gif"><img
				src="../public/admin/images/nav-right-bg.gif" width="16" height="29" /></td>
	</tr>
	<tr>
		<td valign="middle" background="../public/admin/images/mail_leftbg.gif">&nbsp;</td>
		<td valign="top" bgcolor="#F7F8F9">


			<div align="center">
				<table id="table2" class="line_table"
					   style="width: 100%; margin: 0; padding: 0" cellSpacing="0"
					   cellPadding="0">
					<tbody style="margin: 0; padding: 0">
					<tr>
						<td class="line_table" align="center" colspan="12"><span
								class="left_bt2">Order information</span></td>
					</tr>
					<tr>
						<td class="line_table" align="center"><span
								class="left_bt2">User ID</span></td>
						<td class="line_table" align="center"><span
								class="left_bt2">Name</span></td>
						<td class="line_table" align="center"><span
								class="left_bt2">Contact</span></td>
						<td class="line_table" align="center"><span
								class="left_bt2">Address</span></td>
						<td class="line_table" align="center"><span
								class="left_bt2">Menu</span></td>
						<td class="line_table" align="center"><span
								class="left_bt2">Order number</span></td>
						<td class="line_table" align="center"><span
								class="left_bt2">Price</span></td>
						<td class="line_table" align="center"><span
								class="left_bt2">Total</span></td>
						<td class="line_table" align="center"><span
								class="left_bt2">Order time</span></td>
						<td class="line_table" align="center"><span
								class="left_bt2">Delivery</span></td>
						<td class="line_table" align="center" colspan="2"><span
								class="left_bt2">Confirm order</span></td>

					</tr>

						<%
								int currentpage=1;
								String str;
								Pages pages=(Pages) request.getAttribute("pages");
								str=pages.getCurrentpage();
								if(str!=null||str!=""){
									currentpage=Integer.parseInt(str);
								}
							    OrdersService od=new OrdersServiceImpl();
							    List<Orders> list=(List<Orders>) request.getAttribute("list");
							    System.out.println(list);
							    for(int i=0;i<list.size();i++){
									Orders order=list.get(i);
									Users users=order.getUsers();
									Menus menus=order.getMenus();
							%>
					<tr>
						<td class="line_table" align="center"><span
								class="left_txt"><%=order.getUserid() %></span></td>
						<td class="line_table" align="center"><span
								class="left_txt"><%=users.getRealname() %></span></td>
						<td class="line_table" align="center"><span
								class="left_txt"><%=users.getPhone() %></span></td>
						<td class="line_table" align="center"><span
								class="left_txt"><%=users.getAddress()%></span></td>
						<td class="line_table" align="center"><span
								class="left_txt"><%=menus.getName()%></span></td>
						<td class="line_table" align="center"><span
								class="left_txt"><%=order.getMenusum()%></span></td>
						<td class="line_table" align="center"><span
								class="left_txt"><%=menus.getPrice1() %></span></td>
						<td class="line_table" align="center"><span
								class="left_txt"><%=order.getMenusum()*menus.getPrice1() %></span></td>
						<td class="line_table" align="center"><span
								class="left_txt"><%=order.getTimes()%></span></td>
						<%
							str="";
							if(order.getDelivery()==1){
								str="Yes";
						%>
						<td class="line_table" align="center"><span
								class="left_txt"><%=str%></span></td>
						<td class="line_table" align="center" colspan="2"><span
								class="left_txt">&nbsp;</span></td>
						<%
						}else{
							str="否";
						%>
						<td class="line_table" align="center"><span
								class="left_txt"><%=str%></span></td>

						<td class="line_table" align="center"><a
								href="OrderComfirm?id=<%=order.getId() %>&reqtype=delivery">Confirm</a></td>
						<td class="line_table" align="center"><a
								href="OrderComfirm?id=<%=order.getId()%>&reqtype=del">Cancel</a></td>
						<%} %>
					</tr>
						<%} %>
					<tr>
						<td class="line_table" align="center" colspan="12" height="20">
								<span class="left_bt2">Page<%=pages.getCurrentpage()%>
										&nbsp;&nbsp;Total<%=pages.getTotalPageCount()%>
								</span>&nbsp;&nbsp;
							<a href="ordergetall?currentpage=1&s=first">[First Page]</a>
							<a href="ordergetall?currentpage=<%=pages.getTotalPageCount()%>&s=last">[Final Page]</a>&nbsp;&nbsp;
							<a href="ordergetall?currentpage=<%=Integer.parseInt(pages.getCurrentpage())-1%>&s=up">[Previous]</a>
							<a href="ordergetall?currentpage=<%=Integer.parseInt(pages.getCurrentpage())+1%>&s=down">[Next]</a>

						</td>
					</tr>

				</table>
			</div>




		</td>
		<td background="images/mail_rightbg.gif">&nbsp;</td>
	</tr>
	<tr>
		<td valign="bottom" background="images/mail_leftbg.gif"><img
				src="images/buttom_left2.gif" width="17" height="17" /></td>
		<td background="images/buttom_bgs.gif"><img
				src="images/buttom_bgs.gif" width="17" height="17"></td>
		<td valign="bottom" background="images/mail_rightbg.gif"><img
				src="images/buttom_right2.gif" width="16" height="17" /></td>
	</tr>
</table>
</body>
</html>