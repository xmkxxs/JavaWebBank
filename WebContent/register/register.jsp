<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>注册</title>
	</head>
	<body>
	<!-- 请求发送到服务器，注册成功后服务器在request中放入是否成功信息，然后转发到此页面，此页面获取信息并展示 -->
	<%
		String message=(String)request.getAttribute("message");
		if(message!=null){							//--------------这儿要加判断，不然的话打开这个页面就会跳出提示框，信息为null
	%>
	<script>
		alert("<%=message%>");
	</script>
	<%} %>
	
		<!-- 表单中，姓名密码和电话不能为空，点击submit前会执行onsubmit，js代码会判断是否有空表单 -->
		<form action="<%=request.getContextPath() %>/registerServlet" method="post" onsubmit="return jiancha()">
		<table style="margin: 0 auto; padding-top: 5%;">
			<tr>
				<td>姓名</td>
				<td><input type="text" name="name" id="name"/></td>
				<td><div id="namediv"></div></td>
			</tr>
			<tr>
				<td>密码</td>
				<td><input type="password" name="password" id="password"/></td>
				<td><div id="passworddiv"></div></td>
			</tr>
			<tr>
				<td>电话</td>
				<td><input type="text" name="mobile" id="mobile"/></td>
				<td><div id="mobilediv"></div></td>
			</tr>
			<tr>
				<td>邮箱</td>
				<td><input type="text" name="email"/></td>
				<td><div></div></td>
			</tr>
			<tr>
				<td>密保问题</td>
				<td><input type="text" name="question" id="question"/></td>
				<td><div id="questiondiv"></div></td>
			</tr>
			<tr>
				<td>密保答案</td>
				<td><input type="text" name="answer" id="answer"/></td>
				<td><div id="answerdiv"></div></td>
			</tr>
		</table>
		<div style="text-align: center;">
			<input type="submit" value="注册" />
		</div>
		
		</form>
		
		<script>
			//判断姓名密码电话是否有空
			function jiancha(){
				if(document.getElementById("name").value==""){
					document.getElementById("namediv").innerHTML="<font style='color: red;'>姓名不能空!</font>";
				return false;
				}
				if(document.getElementById("name").value!=""){//如果先写密码点击后,会提示姓名为空,当我们姓名填写后将提示姓名为空的提示去掉
					document.getElementById("namediv").innerHTML="";
				}
				if(document.getElementById("password").value==""){
					document.getElementById("passworddiv").innerHTML="<font style='color: red;'>密码不能空!</font>";
				return false;
				}
				if(document.getElementById("password").value!=""){//如果先写密码点击后,会提示姓名为空,当我们姓名填写后将提示姓名为空的提示去掉
					document.getElementById("passworddiv").innerHTML="";
				}
				
				if(document.getElementById("mobile").value==""){
					document.getElementById("mobilediv").innerHTML="<font style='color: red;'>手机号不能空!</font>";
				return false;
				}
				if(document.getElementById("mobile").value!=""){//如果先写密码点击后,会提示姓名为空,当我们姓名填写后将提示姓名为空的提示去掉
					document.getElementById("mobilediv").innerHTML="";
				}
				if(document.getElementById("question").value==""){
					document.getElementById("questiondiv").innerHTML="<font style='color: red;'>密保问题不能空!</font>";
				return false;
				}
				if(document.getElementById("question").value!=""){
					document.getElementById("questiondiv").innerHTML="";
				}
				if(document.getElementById("answer").value==""){
					document.getElementById("answerdiv").innerHTML="<font style='color: red;'>密保答案不能空!</font>";
				return false;
				}
				if(document.getElementById("answer").value!=""){//如果先写密码点击后,会提示姓名为空,当我们姓名填写后将提示姓名为空的提示去掉
					document.getElementById("answerdiv").innerHTML="";
				}
				
				return true;
			}
		</script>
	</body>
</html>