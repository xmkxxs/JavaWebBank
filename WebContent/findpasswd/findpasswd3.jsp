<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>找回密码3</title>
	</head>
	<body>
	<%String account=(String)request.getAttribute("account"); %><!-- 传给服务器用户根据账户修改密码 -->
	
	<%String message=(String)request.getAttribute("message");//如果更改密码成功提示
		if(message!=null){
		%>
		<script>
		alert("<%=message%>");
		</script>
		<%} %>
	
	<script>
			function yanZheng(form){
				for(var i=0;i<form.length;i++){
						if(form.elements[i].value==""){
							alert("表单不能为空");
							return false;
						}
					}
					return yiyang();
			}
			
			function yiyang(){
				
					var pwd1=document.getElementById("password1").value;
					var pwd2=document.getElementById("password2").value;
					
					if(pwd1!=pwd2){
						alert("两次密码不一致");
						return false;
					}
					return true;
			}
		</script> 
	
		<form  name="c" method="post" action="<%=request.getContextPath() %>/FindPassWdServlet?action=change" onsubmit="return yanZheng(c)">
		<input type="hidden" name="account" value="<%=account%>"/>
			<table style="margin: 0 auto;">
				<tr>
					<td>输入新密码：&nbsp;&nbsp;&nbsp;&nbsp;<input type="password" id="password1"/></td>
				</tr>
				<tr>
					<td>确认密码：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="password" id="password2" name="password"/></td>
				</tr>
				<tr  align="center">
					<td><input type="submit" value="提交"/></td>
				</tr>
			</table>
		</form>
	</body>
</html>