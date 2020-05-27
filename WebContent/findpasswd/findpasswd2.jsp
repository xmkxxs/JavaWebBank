<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="bean.*" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>找回密码2</title>
	</head>
	<body>
	<%
	User user=(User)request.getAttribute("user"); 
	String question=user.getQuestion();
	String account=user.getAccount();
	%>
	
	<%String message=(String)request.getAttribute("message");//如果输入答案不正确提示
		if(message!=null){
		%>
		<script>
		alert("<%=message%>");
		</script>
		<%} %>
	
	<script>
			function yanZheng(form){
				for(var i=0;i<form.length;i++){
						if(form.elements[1].value==""){
							alert("表单不能为空");
							return false;
						}
					}
					return true;
			}
		</script> 
		<form name="c" method="post" action="<%=request.getContextPath() %>/FindPassWdServlet?action=right" onsubmit="return yanZheng(c)">
			<table style="margin: 0 auto;">
				<tr>
					<td>密保问题：&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" value="<%=question %>" readonly="readonly"/></td>
				</tr>
				<tr>
					<td>密保答案：&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="question"/></td>
				</tr>
				<tr align="center">
					<td><input type="submit" value="下一步"/></td>
				</tr>
				<tr>
					<td><input type="hidden" name="account" value="<%=account%>"></td>	<!-- 把账户获取给服务器，服务器通过这个账户获取User中的密保答案和用户写的答案对比 -->
				</tr>
			</table>
		</form>
	</body>
</html>