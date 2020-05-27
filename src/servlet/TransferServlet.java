package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.User;
import dao.UserDao;

/**
 * 转账服务器
 */
public class TransferServlet extends HttpServlet {
	/**
	 * 判断用户输入的金额是否是纯数字
	 * **/
	static boolean isNum(String s) {
		char[] ch = s.toCharArray();
		for (char c : ch) {
			if (!(c >= '0' && c <= '9')) {
				return false;
			}
		}
		return true;
	}
	
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		String account1=request.getParameter("account1");//获取转账账户
		String account2=request.getParameter("account2");//获取收款账户
		String number=request.getParameter("number");//获取转账数额
		boolean b=isNum(number);
		System.out.println(b);
		double number1;
		if(b) {//如果输入的字符串是纯数字
		number1=Double.parseDouble(number);
			
		if(account1.equals(account2)) {
			request.setAttribute("transfer", "请不要转账到自己的账户！！！");
			request.getRequestDispatcher("/CenterShow?action=zhuan").forward(request, response);
		}
		
		User user=(User) request.getSession().getAttribute("user");
		//获取这个用户的余额
		String balance=user.getBalance();
		double balance1=Double.parseDouble(balance);
		
		UserDao dao=new UserDao();
		
		
		User flag=dao.userInformation(account2);
		
		if(flag!=null) {//如果收款的账户存在
		if(number1<=balance1) {//如果转账的数额比余额小，就可以转账
			boolean zhuan=dao.userGetMoney(account1, number1);//转账（取出）
			boolean shou=dao.userRecharge(account2, number1);//收款（存入）
			if(zhuan && shou) {
				request.setAttribute("transfers", "转账成功！");//转账成功，直接跳到用户页面
				double sum=balance1-number1;
				String sum1=sum+"";
				user.setBalance(sum1);
				request.getRequestDispatcher("/user/user.jsp").forward(request, response);
			}
		}else {
			request.setAttribute("transfer", "你的余额不足，建议查看余额后进行转账");//如果余额不足，把请求发送到CenterShow显示服务器，
																				//CenterShow会将请求发送给user.jsp，因为user.jsp会
																				//通过CenterShow把转账页面包含，所以转账页面也会获得此参数
			request.getRequestDispatcher("/CenterShow?action=zhuan").forward(request, response);
			}
		}else{//如果收款账户不存在
			request.setAttribute("transfer", "收款账户错误或不存在，请输入15位卡号");
			request.getRequestDispatcher("/CenterShow?action=zhuan").forward(request, response);
		}
	}else {
		request.setAttribute("transfer", "请不要输入非法金额数！！！");
		request.getRequestDispatcher("/CenterShow?action=zhuan").forward(request, response);
	}
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
