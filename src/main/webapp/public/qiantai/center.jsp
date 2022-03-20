<%@ page language="java" import="java.util.*,java.text.*" pageEncoding="utf-8"%>
<%@ page import="com.example.meal_ordering_system.entity.Users" %>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>User center</title>
<meta content="" name=keywords />
<meta content="" name=description />
<link href="${pageContext.request.contextPath}/public/qiantai/css/common.css" rel="stylesheet" type="text/css" />

</head>


<script type="text/javascript" src="${pageContext.request.contextPath}/public/qiantai/js/common.js"></script>

   <script language="JavaScript">
		function check11()
			{
				
				if (document.form1.name.value == "" ) 
				{
					alert("Username cant be empty!");
					document.form1.name.focus();
					return false;
				}
				if (document.form1.pwd.value == ""  )  
				{
					alert("Password cant be empty!");
					document.form1.pwd.focus();
					return false;
				}
				if (document.form1.qpwd.value == ""  )  
				{
					alert("Confirm username cant be empty!");
					document.form1.qpwd.focus();
					return false;
				}
				if (document.form1.qpwd.value != document.form1.pwd.value  )  
				{
					alert("password doesnt match!");
					document.form1.qpwd.focus();
					return false;
				}
				if (document.form1.realname.value == ""  )  
				{
					alert("Name cant be empty!");
					document.form1.realname.focus();
					return false;
				}
				if (document.form1.age.value == ""  )  
				{
					alert("Age cant be empty!");
					document.form1.age.focus();
					return false;
				}
				if (document.form1.card.value == ""  )  
				{
					alert("ID cant be empty!");
					document.form1.card.focus();
					return false;
				}
				if (document.form1.address.value == ""  )  
				{
					alert("Address cant be empty!");
					document.form1.address.focus();
					return false;
				}
				if (document.form1.phone.value == ""  )  
				{
					alert("Phone number cant be empty!");
					document.form1.phone.focus();
					return false;
				}
				if (document.form1.email.value == ""  )  
				{
					alert("Email cant be empty!");
					document.form1.email.focus();
					return false;
				}
				if (document.form1.code.value == ""  )  
				{
					alert("Postcode cant be empty!");
					document.form1.code.focus();
					return false;
				}
			}
</script>



<body style='background:transparent'>
<table width="900" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td align="left" valign="top">
  
    
  <jsp:include flush="false" page="top.jsp"/>
    
    </td>
  </tr>
  <tr >
  <td height="20"></td>
  
</tr>
  
  <tr>
    <td align="center" valign="center" height="450">

		<input type="hidden" value="${user_session}">
    
 <form action="/users/update" name="form1" method="post" onSubmit="return check11()">
  
<%
  	Users user = (Users)session.getAttribute("user_session");
%>


  <div align="center"><br>
  <table border="1" cellspacing="0" bordercolorlight="#C0C0C0" bordercolordark="#C0C0C0" width="700">
				<tr>
					<td colspan="3" align="center" bordercolorlight="#C0C0C0" bordercolordark="#C0C0C0" height="25">
						<font color="#666666">Please enter user information</font>
					</td>
				</tr>
				<tr>
					<td bordercolorlight="#C0C0C0" bordercolordark="#C0C0C0" height="25" align="right">
						<font color="#996633">Username：</font>
					</td>
					<td bordercolorlight="#C0C0C0" bordercolordark="#C0C0C0" height="25" align="left">
						<font color="red"><%=user.getName()%></font>
					</td>
					<td bordercolorlight="#C0C0C0" bordercolordark="#C0C0C0" height="25" align="left" >
						<font color="red">&nbsp;* </font>Username
					</td>
				</tr>
				<tr>
					<td bordercolorlight="#C0C0C0" bordercolordark="#C0C0C0" height="25" align="right">
						<font color="#996633">Password：</font>
					</td>
					<td bordercolorlight="#C0C0C0" bordercolordark="#C0C0C0" height="25" align="left">
						<input class="input7" type="password" name="pwd" value="<%=user.getPwd() %>"/>
					</td>
					<td bordercolorlight="#C0C0C0" bordercolordark="#C0C0C0" height="25" align="left">
						<font color="red">&nbsp;* </font>length6-15,character and number only
					</td>
				</tr>				
				<tr>
					<td bordercolorlight="#C0C0C0" bordercolordark="#C0C0C0" height="25" align="right">
						<font color="#996633">Password：</font>
					</td>
					<td bordercolorlight="#C0C0C0" bordercolordark="#C0C0C0" height="25" align="left">
						<input class="input7" type="password" name="qpwd" value="<%=user.getPwd()%>"/>
					</td>
					<td bordercolorlight="#C0C0C0" bordercolordark="#C0C0C0" height="25" align="left">
						<font color="red">&nbsp;* </font>Please enter again
					</td>
				</tr>
				<tr>
					<td bordercolorlight="#C0C0C0" bordercolordark="#C0C0C0" height="25" align="right">
						<font color="#996633">Name：</font>
					</td>
					<td bordercolorlight="#C0C0C0" bordercolordark="#C0C0C0" height="25" align="left">
						<input class="input7" type="text" name="realname" value="<%=user.getRealname()%>"/>
					</td>
					<td bordercolorlight="#C0C0C0" bordercolordark="#C0C0C0" height="25" align="left">
						<font color="red">&nbsp;* </font>Please enter name
					</td>
				</tr>
				<tr>
					<td bordercolorlight="#C0C0C0" bordercolordark="#C0C0C0" height="25" align="right">
						<font color="#996633">Gender：</font>
					</td>
					<td  bordercolorlight="#C0C0C0" bordercolordark="#C0C0C0" height="25" align="left">
						<%
						
						if(user.getSex().equals("Male")){
						
						%>
						<font color="red">Male</font>
						<%
						}else{
						%>
						<font color="red">Female</font>
						<%} %>
						
					</td>
					<td bordercolorlight="#C0C0C0" bordercolordark="#C0C0C0" height="25" align="left">
						<font color="red">&nbsp;* </font>Please enter your information
					</td>
				</tr>
				<tr>
					<td bordercolorlight="#C0C0C0" bordercolordark="#C0C0C0" height="25" align="right">
						<font color="#996633">Age：</font>
					</td>
					<td bordercolorlight="#C0C0C0" bordercolordark="#C0C0C0" height="25" align="left">
						<input class="input7" type="text" name="age" value="<%=user.getAge()%>"/>
					</td>
					<td bordercolorlight="#C0C0C0" bordercolordark="#C0C0C0" height="25" align="left">
						<font color="red">&nbsp;* </font>Please enter your age
					</td>
				</tr>
				<tr>
					<td bordercolorlight="#C0C0C0" bordercolordark="#C0C0C0" height="25" align="right">
						<font color="#996633">ID：</font>
					</td>
					<td bordercolorlight="#C0C0C0" bordercolordark="#C0C0C0" height="25" align="left">
						<input class="input7" type="text" name="card" value="<%=user.getCard()%>"/>
					</td>
					<td bordercolorlight="#C0C0C0" bordercolordark="#C0C0C0" height="25" align="left">
						<font color="red">&nbsp;* </font>Please enter your ID
					</td>
				</tr>
				<tr>
					<td bordercolorlight="#C0C0C0" bordercolordark="#C0C0C0" height="25" align="right">
						<font color="#996633">Address：</font>
					</td>
					<td bordercolorlight="#C0C0C0" bordercolordark="#C0C0C0" height="25" align="left">
						<input class="input7" type="text" name="address" value="<%=user.getAddress()%>"/>
					</td>
					<td bordercolorlight="#C0C0C0" bordercolordark="#C0C0C0" height="25" align="left">
						<font color="red">&nbsp;* </font>Please enter your information
					</td>
				</tr>
				<tr>
					<td bordercolorlight="#C0C0C0" bordercolordark="#C0C0C0" height="25" align="right">
						<font color="#996633">Phone number：</font>
					</td>
					<td bordercolorlight="#C0C0C0" bordercolordark="#C0C0C0" height="25" align="left">
						<input class="input7" type="text" name="phone" value="<%=user.getPhone()%>"/>
					</td>
					<td bordercolorlight="#C0C0C0" bordercolordark="#C0C0C0" height="25" align="left">
						<font color="red">&nbsp;* </font>Please enter your information </td>
				</tr>
				<tr>
					<td bordercolorlight="#C0C0C0" bordercolordark="#C0C0C0" height="25" align="right">
						<font color="#996633">email：</font>
					</td>
					<td bordercolorlight="#C0C0C0" bordercolordark="#C0C0C0" height="25" align="left">
						<input class="input7" type="text" name="email" value="<%=user.getEmail()%>"/>
					</td>
					<td bordercolorlight="#C0C0C0" bordercolordark="#C0C0C0" height="25" align="left">
						<font color="red">&nbsp;* </font>Please enter your email
					</td>
				</tr>
				<tr>
					<td bordercolorlight="#C0C0C0" bordercolordark="#C0C0C0" height="25" align="right">
						<font color="#996633">Post code：</font>
					</td>
					<td bordercolorlight="#C0C0C0" bordercolordark="#C0C0C0" height="25" align="left">
						<input class="input7" type="text" name="code" value="<%=user.getCode()%>"/>
					</td>
					<td bordercolorlight="#C0C0C0" bordercolordark="#C0C0C0" height="25" align="left">
						<font color="red">&nbsp;* </font>Please enter your post code</td>
				</tr>
				<tr><input type="hidden" name="id" value="<%=user.getId() %>">
					<td colspan="3" align="center" bordercolorlight="#C0C0C0" bordercolordark="#C0C0C0" height="25">
						<input type="submit" value="Modify" />
					</td>
				</tr>
				
			</table>
  </div>
  </form>
    
    
    
     </td>
  </tr>
  <tr>
    <td height="10">&nbsp;</td>
  </tr>
  <tr>
    <td height="50" align="center" valign="middle">&nbsp; 
   
        <jsp:include flush="false" page="copyright.jsp"/>
    </td>
  </tr>
  
</table>


 
</body>
</html>
