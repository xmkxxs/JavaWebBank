<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>找回密码1</title>
	</head>
	<body>
		<%String message=(String)request.getAttribute("message");//如果输入账户不存在提示
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
						if(form.elements[0].value.length<15){
							alert("请输入15位银行卡号");
							return false;
						}
					}
					return true;
			}
		</script> 
		
		
		<form name="c" method="post" action="<%=request.getContextPath() %>/FindPassWdServlet?action=existence" onsubmit="return yanZheng(c)">
			<table style="margin: 0 auto;">
				<tr>
					<td>
						请输入您的15位银行卡号:&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="account" id="account"/>
					</td>
				</tr>
				<tr align="center">
					<td>
						&nbsp;&nbsp;&nbsp;&nbsp;<input type="submit" value="下一步" />
					</td>
				</tr>
			</table>
		</form>
		
		
	</body>
</html>