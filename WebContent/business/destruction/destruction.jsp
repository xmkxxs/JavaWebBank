<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>销户</title>
	</head>
	<body>
		
		<script>
			function tip(){
				var flag=confirm("再次确定要销毁吗？")
				if(flag){
				return true;
				}else{
					return false;
				}
			}
		</script>
		
		<!-- 如果账户还有余额，无法销户 -->
		<div style="text-align: center;padding-top: 90px;font-size: xx-large;color: red;">
			<div>您的账户非常宝贵，您确定要摧毁账户？</div>
			
				<table style="margin: 0 auto;">
				<tr>
				<td><form action="<%=request.getContextPath() %>/DestructionServlet?action=xiaohui" method="post" name="queding" onsubmit="return tip(queding)"><table  style="padding-right: 5px;"><tr><td><input type="submit" value="确定" style="height: 30px;width: 50px;"/></td></tr></table></form></td>
				<td><form action="<%=request.getContextPath() %>/DestructionServlet?action=quxiao" method="post"><table  style="padding-left: 5px;"><tr><td><input type="submit" value="取消" style="height: 30px;width: 50px;"/></td></tr></table></form></td>
				</tr>
				</table>
		</div>
	</body>
</html>