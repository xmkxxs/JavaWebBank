package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.User;
import dao.UserDao;

/**
 * Servlet implementation class GetMoneyServlet
 */
public class GetMoneyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		String number=request.getParameter("number");//获得输入的取出金额
		double number1=Double.parseDouble(number);
		// 获取这个登陆用户的银行卡号
		User user = (User) request.getSession().getAttribute("user");
		String account = user.getAccount();
		
		//获取这个用户的余额
		String balance=user.getBalance();
		double balance1=Double.parseDouble(balance);
		
		if(number1<=balance1) {//如果用户输入的金额小于等于用户的余额，就可以提取
			UserDao dao=new UserDao();
			boolean flag=dao.userGetMoney(account, number1);
			if(flag) {
				request.setAttribute("getMoney", "取款成功！");
				double sum=balance1-number1;
				String sum1=sum+"";
				user.setBalance(sum1);
				request.getRequestDispatcher("/user/user.jsp").forward(request, response);
			}
		}else {//如果用户取的金额大于余额
			request.setAttribute("getMoney", "余额不足，请您查看余额后进行此操作！");
			request.getRequestDispatcher("/user/user.jsp").forward(request, response);
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
