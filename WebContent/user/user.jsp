<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="bean.*" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>欢迎您</title>
		<LINK rel=stylesheet type=text/css href="<%=request.getContextPath() %>/css/css.css">
		
		<SCRIPT type=text/javascript src="<%=request.getContextPath() %>/js/jquery.js"></SCRIPT>
		
		<SCRIPT type=text/javascript src="<%=request.getContextPath() %>/js/js.js"></SCRIPT>
	</head>
	<style>
		* {
			margin: 0;
			padding: 0;
		}

		#topdiv {	
			height: 100px;
			background-color: aquamarine;
			background-image: linear-gradient(to top, aquamarine, seagreen);
			/* 设计渐变色背景 */
			
		}

		#topdivson1 {
			float: right;
			height: 100px;
			width: 600px;
			text-align: center;
			line-height: 100px;
		}

		#topdivson1{
			color:  black; 
			font-size:  x-large;
		}
		#showTime{
			font-size: small;
		}
		#link{
			font-size:  large;
			font-style: oblique;
			font-weight:bold;
			text-shadow:1px 1px 1px yellow;
		}
		#link a:hover{			/*设置鼠标悬停超链接变红色*/
			color: white;
		}
		#link a{
			color: brown;
		}
	</style>
	<body bgcolor="azure">
	
			
	<%String message=(String)request.getAttribute("message"); /* 销户还有余额的话，失败跳转回user主页面，然后提示销毁失败 */
	if(message!=null){
	%>
	<script>
	alert("<%=message%>");
	</script>
	<%} %>
	
	<%
	
	User user=(User)session.getAttribute("user");//获取session中的User
	String userName=(String)user.getName();//获取登陆用的姓名，显示到页面中
	String recharge=(String)request.getAttribute("recharge");//获取充值成功的消息，转跳到此后显示提示
	String getMoney=(String)request.getAttribute("getMoney");//获取提款成功的消息，转跳到此后显示提示
	String transfers=(String)request.getAttribute("transfers");//获取转账成功的消息，转跳到此后显示提示
	
	String loginsuccess=(String)request.getAttribute("loginsuccess");//如果登陆成功，提示
	if(loginsuccess!=null){										
	%>
	<script type="text/javascript">
		alert("<%= loginsuccess%>");
	</script>
	<%} %>
	<%if(recharge!=null){ %>
	<script type="text/javascript">
		alert("<%= recharge%>");
	</script>
	<%} %>
	<%if(getMoney!=null){ %>
	<script type="text/javascript">
		alert("<%= getMoney%>");
	</script>
	<%} %>
	<%if(transfers!=null){ %>
	<script type="text/javascript">
		alert("<%= transfers%>");
	</script>
	<%} %>
	

		
		<script>
			window.onload=function(){
				getTime();
				setInterval("getTime()", 1000);
			}
			function getTime() {
				var d = new Date();
				var year = d.getFullYear(); //获取年份
				var mouth = d.getMonth() + 1; //几月,0~11
				var date = d.getDate(); //几号
				var week = d.getDay(); //周几
				
				var hour = d.getHours(); //获取几点
				var minutes = d.getMinutes(); //获取几分
				var seconds = d.getSeconds(); //获取几秒
				
				if (seconds < 10) {
					seconds = "0" + d.getSeconds();
				}
				if (seconds == 60) {
					seconds = 00;
				}
				
				var shuzi;
				if(week==1){
					shuzi="一";
				}else if(week==2){
					shuzi="二";
				}else if(week==3){
					shuzi="三";
				}
				else if(week==4){
					shuzi="四";
				}
				else if(week==5){
					shuzi="五";
				}
				else if(week==6){
					shuzi="六";
				}
				else{
					shuzi="日";
				}
					
				var s;
				if (hour >= 0 && hour < 6) {
					s = "凌晨";
				} else if (hour >= 6 && hour < 12) {
					s = "上午";
				} else if (hour >= 12 && hour < 18) {
					s = "下午";
				} else {
					s = "晚上";
				}

				document.getElementById("showTime").innerHTML =
					year + "年" +
					mouth + "月" +
					date + "号，" + "星期" +
					shuzi + " " +
					hour + ":" +
					minutes + ":" +
					seconds;
					
				document.getElementById("topdivson1").innerHTML=s+"好，欢迎您："+"<%= userName%>";
				
			}
		</script>
		
<!-- **********************************头部信息************************************************************************************************************** -->
		<div id="topdiv">
			<a href="<%=request.getContextPath() %>/user/user.jsp"><img src="<%=request.getContextPath() %>/picture/bankHead.jpg" style="height: 100px; width: 15%;" /></a>
			<div id="topdivson1"></div><!--留着获取登陆成功后给session复制，取出用户名在这儿-->
		</div>
<!-- ************************************************************************************************************************************************ -->
<!-- ************************************************************************************************************************************************ -->
			<div>
				
			<div style="background-color: skyblue;height: 40px;width: 15%; float: left;text-align: center;line-height: 40px;border-radius:60%;" id="showTime">
			</div><!-- logo下方显示时间用的div -->
			
			<div style="background-image: linear-gradient(to top, seagreen, aquamarine);height: 40px;" id="link"><!-- 时间右侧超链接表 -->
			<span style="padding-left: 10%;text-align: center;line-height: 40px;"><a href="<%=request.getContextPath() %>/CenterShow?action=cunqian" style="text-decoration:none">存钱</a></span>
			<span style="padding-left: 10%;text-align: center;line-height: 40px;"><a href="<%=request.getContextPath() %>/CenterShow?action=quqian" style="text-decoration:none">取钱</a></span>
			<span style="padding-left: 10%;text-align: center;line-height: 40px;"><a href="<%=request.getContextPath() %>/CenterShow?action=zhuan" style="text-decoration:none">转账</a></span>
			<span style="padding-left: 10%;text-align: center;line-height: 40px;"><a href="<%=request.getContextPath() %>/CenterShow?action=cha" style="text-decoration:none">查询余额</a></span>
			<span style="padding-left: 10%;text-align: center;line-height: 40px;"><a href="<%=request.getContextPath() %>/CenterShow?action=xiao" style="text-decoration:none">销户</a></span>
			<span style="padding-left: 10%;text-align: center;line-height: 40px;"><a href="<%=request.getContextPath() %>/Quit" style="text-decoration:none">退出</a></span>
			<!-- 超链接发送携带参数的请求到服务器，服务器根据不同的参数做不同的业务，返回Attribute -->
			</div>
			
			</div>
<!-- ************************************************************************************************************************************************ -->
<!-- ***********************************中间内容************************************************************************************************************* -->
			<!-- 获取服务器返回的Attribute，进行比对，用于在中间内容部分显示不同的业务页面 -->
			<div style="height: 500px;">
			<%String action=(String)request.getAttribute("yewu"); 
			if("cunqian".equals(action)){
			%>
			<%@include file="/business/recharge/recharge.jsp" %><!-- 储钱页面 -->
			
			<%}else if("quqian".equals(action)){%>
			<%@include file="/business/getMoney/getMoney.jsp" %><!-- 取钱页面 -->
			<%}else if("zhuan".equals(action)){%>
			<%@include file="/business/transfer/transfer.jsp" %><!-- 转账页面 -->
			<%}else if("cha".equals(action)){%>	<!-- 查余额页面 -->
			<%String money=(String)request.getAttribute("money"); %>
			<div style="text-align: center;padding-top:90px;font-size: xx-large; ">
			<span>您当前的账户余额为：</span>
			<span><%=money %>元</span>
			</div>
			<%}else if("xiao".equals(action)){%>
			<%@include file="/business/destruction/destruction.jsp" %><!-- 销户页面 -->
			<%}else{ %>
			<table style="">
				<tr>
					<td>
						<div class="area">
						
							<a id=prev class="prevBtn qq" href="javascript:void(0)"></a>
						
							<a id=next class="nextBtn qq" href="javascript:void(0)"></a>
						
							<div id=js class="js">
						
								<div class="box01">
						
									<img onClick=inc1() src="<%=request.getContextPath() %>/images/1.jpg" style="width: 100%;">
						
									<img onClick=inc2()  style="DISPLAY: none;width: 100%;" src="<%=request.getContextPath() %>/images/2.jpg"> 
						
									<img onClick=inc3() style="DISPLAY: none;width: 100%;"  src="<%=request.getContextPath() %>/images/3.jpg">
						
								</div>
						
								<div class="bg"></div>
						
								<div id=jsNav class=jsNav>	
						
									<a class="trigger imgSelected" href="javascript:void(0)">1</a>
						
									<a class="trigger" href="javascript:void(0)">2</a>
						
									<a class="trigger" href="javascript:void(0)">3</a>
						
								</div>
						
							</div>
						
						</div>
					</td>
				</tr>
			</table>
			<%} %>
			</div>
<!-- ************************************************************************************************************************************************ -->
<!-- ********************************尾部信息**************************************************************************************************************** -->
			<div style="padding-top: 2%;">
			<table style="margin: 0 auto;">
				<tr>
					<td>
						<div style="text-align: center;font-size: larger;">
						南京信息职业技术学院
						</div>
					</td>
				</tr>
				<tr>
					<td>
						<div style="text-align: center;font-size: larger;">
						技术支持：仙林校区4栋1单元402A室。Ming
						</div>
					</td>
				</tr>
			</table>
			</div>
		
<!-- ************************************************************************************************************************************************ -->
<!-- ************************************************************************************************************************************************ -->
		<script type="text/javascript">
		
		$(document).ready(function(){
		
		  $(".area").hover(function(){
		
			  $(this).find(".qq").show(100);}
		
			  ,function(){
		
				$(this).find(".qq").hide(100);
		
			});
		
		});
		
		</script>
		
		<script>
			function inc1(){
				window.open('http://ewealth.abchina.com/fs/NYAD193601.htm');
			}
			function inc2(){
				window.open('https://eapply.abchina.com/coin/');
			}
			function inc3(){
				window.open('http://ewealth.abchina.com/fs/AKSSF1.htm');
			}
		</script>

	</body>
</html>
