<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.util.Date" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8" />
		<title>首页</title>
	</head>
	<style>
		/* 清除默认样式 */
		*{
			margin: 0;
			padding: 0;
		}
	</style>
<body>

	<!-- 销户成功后，跳转到登陆页面，并显示 -->
	<%String message=(String)request.getAttribute("message"); 
	if(message!=null){
	%>
	<script>
	alert("<%=message%>");
	</script>
	<%} %>
	
	

	<!-- 防止表单重复提交业务 -->
	<%
		String suiji=new Date().getTime()+"";//生成随机值
		session.setAttribute("suiji",suiji);
		/* 还有设置一个隐藏于，value也是这个同样的随机值，放在下面的表单里了 */
	%>
	


	<%
	String loginsuccess=(String)request.getAttribute("loginsuccess");//如果账户密码错误，获取登陆失败的信息并提示
	if(loginsuccess!=null){										//这儿要加判断，不然的话打开这个页面就会跳出提示框，信息为null
	%>
	<script type="text/javascript">
		alert("<%= loginsuccess%>");
	</script>
	<%} %>

	<!-- 银行logo -->
	<div style="text-align: center;">
		<img src="picture/bankHead.jpg" style="height: 100px; width: 10%;"/>
	</div>
	
	<!-- 登陆表单 --><!-- 提交表单前检测账号或密码是否为空 ,返回布尔值-->
	<form action="<%=request.getContextPath() %>/LoginServlet" method="post" onsubmit=" return jiancha()">
	<input type="hidden" name="suiji1" value="<%=suiji %>" /><!-- 接着设置一个隐藏域，放入随机值 -->
	<table style="margin:0 auto;">
		<tr>
			<td>账号：</td>
			<td><input type="text" name="user" id="user"></td>
		</tr>
		<tr>
			<td>密码：</td>
			<td><input type="password" name="password" id="password"></td>
		</tr>
	</table>
	<div style="text-align: center;">
	<!-- 登陆 -->
		<input type="submit" value="登陆" style="width: 200px;"/>
	</div>
	</form>
	
	<!-- 检测账号密码是否为空 -->
	<script>
		function jiancha(){
			if(document.getElementById("user").value==""){
				alert("账号为空!");
				return false;
			}
			if(document.getElementById("password").value==""){
				alert("密码为空");
				return false;
			}
			return true;
		}
	</script>
	
	<!-- 注册&忘记密码 -->
	<div style="text-align: center; padding-top: ;">
	<a href="register/register.jsp" target="_blank"><input type="button" value="注册卡号" /></a>
	<a href="findpasswd/findpasswd1.jsp" target="_blank"><input type="button" value="忘记密码" /></a>
	</div>
	
	<!-- 二维码&官网微信 -->
	<div style="height: 150px;width: 100%;background-color: turquoise;text-align: center;padding-top: 40px;margin-top: 18%;">
		<span style="margin-right: 10px;">
			<img src="picture/leftQR.png" />
		</span>
		<span style="margin-left: 10px;">
			<img src="picture/rightQR%20.png" />
		</span>
		<div style="padding-top: 20px;">
			<span style="margin-right: 10px;">下载掌上银行</span>
			<span style="margin-left: 10px;">关注官方微信</span>	
		</div>
	</div>
	
	<!-- 最底部链接 -->
	<div style="text-align: center; margin-top: 30px;">
		<span><a href="http://www.abchina.com/cn/PublicPlate/documents/201512/t20151228_817036.htm" target="_blank" style="color: darkgrey;text-decoration:none;">网站声明</a>&nbsp;&nbsp;&nbsp;&nbsp;</span>
		<span style="color: darkgrey;">|&nbsp;&nbsp;&nbsp;&nbsp;</span>
		<span><a href="http://www.abchina.com/cn/PublicPlate/websitemap_new/"  target="_blank" style="color: darkgrey;text-decoration:none;">网站地图</a>&nbsp;&nbsp;&nbsp;&nbsp;</span>
		<span style="color: darkgrey;">|&nbsp;&nbsp;&nbsp;&nbsp;</span>
		<span><a href="http://www.abchina.com/cn/AboutABC/ContactUs/"  target="_blank" style="color: darkgrey;text-decoration:none;">联系我们</a>&nbsp;&nbsp;&nbsp;&nbsp;</span>
		<span style="color: darkgrey;">|&nbsp;&nbsp;&nbsp;&nbsp;</span>
		<span style="color: darkgrey;">客服热线:<font color="orange">&nbsp;&nbsp;95599</font>&nbsp;&nbsp;&nbsp;&nbsp;</span>
	</div>
</body>
</html>