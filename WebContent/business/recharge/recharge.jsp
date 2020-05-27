<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>存款</title>
	</head>
	<body>
		<script type="text/javascript" src="<%=request.getContextPath() %>/js/check.js"></script>
		<form name="cun" method="post" action="<%=request.getContextPath() %>/RechargeServlet" onsubmit="return checkCun(cun)">
		
		<table style="margin: 0 auto; padding-top: 100px;height:300px">
			<tr valign="bottom">
				<td>存款金额：<input type="text" name="money"/></td>
			</tr>
			<tr valign="top">
				<td align="center"><input type="submit" value="提交" style="width:100px"/></td>
			</tr>
		</table>
		
		</form>
	</body>
</html>