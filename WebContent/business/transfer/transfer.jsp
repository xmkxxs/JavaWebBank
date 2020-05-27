<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="bean.*" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>转账</title>
	</head>
	<body>
	<%
	String account=(String)request.getAttribute("account");//用于显示付款账户的默认值
	String transfer=(String)request.getAttribute("transfer");
	if(transfer!=null){
	%>
	<script>
	alert("<%=transfer%>")
	</script>
	<%} %>
	
	
	<script type="text/javascript" src="<%=request.getContextPath() %>/js/check.js"></script>
	
		<form method="post" action="<%=request.getContextPath() %>/TransferServlet" name="zhuan" onsubmit="return checkZhuan(zhuan)">
			<table style="margin: 0 auto;padding-top: 100px;height:300px">
				<tr valign="bottom">
					<td>付款账户：<input type="text" name="account1" value="<%=account %>" readonly="readonly"></td><!-- 设置为当前用户的银行卡号，不可点击 -->
				</tr>
				<tr>
					<td>收款账户：<input type="text" name="account2" id="account"/></td>
				</tr>
				<tr valign="top">
					<td>转账金额：<input type="text" name="number" id="number" value="请输入转账金额" onclick="biankong()" autocomplete="off"/></td>
					<!-- 设置输入框默认值，点击后默认值消失，autocomplete="off"页面刷新后继续显示默认值 -->
				</tr>
				<tr style="text-align:center" valign="top" >
					<td><input type="submit" value="转账" style="width: 200px;"/></td>
				</tr>
			</table>
		</form>
		
		<script>
			function biankong(){
				document.getElementById("number").value="";
			}
		</script>
	</body>
</html>