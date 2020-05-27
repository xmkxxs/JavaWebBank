<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>取款</title>
	</head>
	<body>
	<script type="text/javascript" src="<%=request.getContextPath() %>/js/check.js"></script>
	
		<form name="qu" method="post" action="<%=request.getContextPath() %>/GetMoneyServlet" onsubmit="return checkCun(qu)">
			<table style="margin: 0 auto;padding-top: 100px;height:300px">
				<tr valign="bottom">
					<td>取出金额：<input type="text" name="number" /></td>
				</tr>
				<tr valign="top">
					<td align="center"><input type="submit" value="取款" /></td>
				</tr>
			</table>
		</form>
	</body>
</html>