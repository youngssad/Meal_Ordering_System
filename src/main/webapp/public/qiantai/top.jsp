<%@page import="com.example.meal_ordering_system.entity.Users"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

<link href=${pageContext.request.contextPath}/public/qiantai/css/common.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${pageContext.request.contextPath}/public/qiantai/js/base.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/public/qiantai/js/common.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/public/qiantai/js/form.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/public/qiantai/js/blockui.js"></script>

</head>
<body style='background:transparent'>
<script language="JavaScript">
  function checkSession(){
    var session =${session.user_session}
    if(session==null){
      return false
    }
    check11()
  }
</script>


<div id='contain' style='width:900px;background:rgb(255,255,255);margin:0px auto;padding:0px'>

<div id='top' style='width:900px;height:108px;background:none transparent scroll repeat 0% 0%'>


<!-- 顶部菜单(一级) -->

<div id='pdv_3607' class='pdv_class'   style='width:395px;height:25px;top:0px;left:495px; z-index:4'>
<div id='spdv_3607' class='pdv_top' style='overflow:hidden;width:100%;height:100%'>
<div class="pdv_border" style="margin:0;padding:0;height:100%;border:0px  solid;background:;">
	
<div style="padding:0px">

<link href="${pageContext.request.contextPath}/public/qiantai/css/topmenu_bk.css" rel="stylesheet" type="text/css" />

<div id="topmenu" >

<a href="${pageContext.request.contextPath}/public/qiantai/login.jsp" target="_self">Login</a>|
<a href="${pageContext.request.contextPath}/public/qiantai/reg.jsp" target="_self" >Register</a>|
<a href="/users/logout" >Logout</a>|
<a href="${pageContext.request.contextPath}/public/qiantai/carry.jsp" target="_self">Delivery guide</a>|
<a href="${pageContext.request.contextPath}/public/qiantai/our.jsp" target="_self">About us</a>
</div>

</div>
</div>

</div>
</div>

<!-- 二级导航菜单 -->

<div id='pdv_3605' class='pdv_class'   style='width:898px;height:41px;top:65px;left:0px; z-index:6'>
<div id='spdv_3605' class='pdv_top' style='overflow:hidden;width:100%;height:100%'>
<div class="pdv_border" style="margin:0;padding:0;height:100%;border:0px  solid;background:;">
	<div style="height:25px;margin:1px;display:none;background:;">
		<div style="float:left;margin-left:12px;line-height:25px;font-weight:bold;color:">
		
		</div>
		<div style="float:right;margin-right:10px;display:none">
		<a href="-1" style="line-height:25px;color:">More</a>
		</div>
	</div>
<div style="padding:0px">

<link href="${pageContext.request.contextPath}/public/qiantai/css/A.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${pageContext.request.contextPath}/public/qiantai/js/channelmenu_dc.js"></script>

<div id="menu">
<div class="mainmenuleft"></div><div class="mainmenuright"></div>

<div id="mainmenu">
<ul>

<li ><a href="/menus/qiantai/allMenus" target="_self" >Fist page</a></li>

<li ><a href="${pageContext.request.contextPath}/public/qiantai/shoppingcar.jsp" target="_self">My cart</a></li>

<li ><a href="${pageContext.request.contextPath}/public/qiantai/order.jsp" target="_self">My order</a></li>
<li ><a href="${pageContext.request.contextPath}/public/qiantai/center.jsp" target="_self" onclick="checkSession()">User guide</a></li>

<li ><a href="${pageContext.request.contextPath}/public/qiantai/carry.jsp" target="_self">Delivery guide</a></li>

<li ><a href="${pageContext.request.contextPath}/public/qiantai/our.jsp" target="_self">About us</a></li>

<li ><a href="/users/logout" >Log out</a></li>
 
</ul></div>

<div id="smenu">
<div class="smenuleft"></div><div class="smenuright"></div>
<ul>

</ul>

<ul>
</ul>

<ul>
</ul>

<ul>
</ul>

<ul>
</ul>

<ul>
</ul>

<ul>
</ul>

</div>
</div>
<script>showMenu(0);

</script>


</div>
</div>

</div>
</div>

     <!-- 网站标志 -->
        <div id='pdv_3608' class='pdv_class'  title='' style='width:208px; height:100px; top:-22px; left:0px; z-index:9'>
          <div id='spdv_3608' class='pdv_top' style='overflow:hidden;width:100%;height:100%'>
            <div class="pdv_border" style="margin:0;padding:0;height:100%;border:0px  solid;background:;">
              
              <div style="padding:0px"> 
              <img src="${pageContext.request.contextPath}/public/qiantai/images/1257477260.gif" alt="" width="100%" border="0"  />
              </div>
            
              
              </div>
            </div>
          </div>
          
            <!-- 登录后欢迎界面 -->
        <div id='pdv_3699' class='pdv_class'  title='' style='width:300px; height:40; top:-120px; left:600px; z-index:10'>
          <div id='spdv_3608' class='pdv_top' style='overflow:hidden;width:100%;height:100%'>
            <div class="pdv_border" style="margin:0;padding:0;height:100%;border:0px  solid;background:;">
              <div style="height:25px;margin:1px;display:none;background:;">
                <div style="float:left;margin-left:12px;line-height:25px;font-weight:bold;color:"></div>
                <div style="float:right;margin-right:10px;display:none"> <a href="-1" style="line-height:25px;color:">More</a> </div>
                </div>
              <div style="padding:0px;font:bold 13px/43px 'Microsoft YaHei','SimSun',Arial,Sans-Serif;color:#feab43;"> 
             
                 <%
                   
                
                   if(session.getAttribute("user_session") != null ){
                   Users ur = (Users)session.getAttribute("user_session");
                   String name = "";
                   name=ur.getName();
                   %>
                   
                                                               Dear<%=name %>Welcome!
                
                   
                   <%} %>
           
              
              </div>
            
              
              </div>
            </div>
          </div>
          

</div>
</div>
</div>
</div>
</body>
</html>