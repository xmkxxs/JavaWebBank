package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.User;
import dao.UserDao;

/**
 * 充值
 */
public class RechargeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");

		// 获取这个登陆用户的银行卡号
		User user = (User) request.getSession().getAttribute("user");
		String account = user.getAccount();

		String money = request.getParameter("money");
		double money1 = Double.parseDouble(money); 
		
		/**
		 * 充钱时的注意事项
		 * 在取钱的时候，有一个功能是对比数据库中的余额和用户输入的要取出的数量
		 * 其中数据库的余额是从User类中获取的，所以我们在做充钱的时候，不仅仅要把数据库中的余额增加，还要把User中的balance增加
		 * 
		 * 在做其他交易的时候也是，因为我们获取余额都是先从User中获取，所以我们每做一次转账或存钱，都不要忘了把User中的balance更新
		 * **/
		String nowmoney=user.getBalance();
		double nowmoney1=Double.parseDouble(nowmoney); 
		
		 UserDao dao=new UserDao(); 
		 boolean flag=dao.userRecharge(account, money1);
		 if(flag) {
			 request.setAttribute("recharge", "存钱成功！");
			 double sum=money1+nowmoney1;
			 String sum1=sum+"";
			 user.setBalance(sum1);
			 request.getRequestDispatcher("/user/user.jsp").forward(request, response);
		 }
		 
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
