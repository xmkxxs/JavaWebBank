package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.User;
import dao.UserDao;

/**
 * Servlet implementation class FindPassWdServlet
 */
public class FindPassWdServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		/**
		 * 根据不同的参数做不同的业务
		 * **/
		String action=request.getParameter("action");
		if("existence".equals(action)) {//第一个找回密码页面，判断账户是否存在
			String account=request.getParameter("account");//获取用户输入的账户
			UserDao dao=new UserDao();
			User user=dao.userInformation(account);
			
			if(user!=null) {
				request.setAttribute("user", user);//传给第二个页面，用于默认显示出这个用户的密保
				request.getRequestDispatcher("/findpasswd/findpasswd2.jsp").forward(request, response);
			}else {
				request.setAttribute("message", "用户不存在！");
				request.getRequestDispatcher("/findpasswd/findpasswd1.jsp").forward(request, response);
			}
		}
		
		if("right".equals(action)) {//第二个找回密码页面，判断用户输入的密保问题是否正确
			String question1=request.getParameter("question");//获取用户输入的密保答案
			System.out.println(question1);
			String account=request.getParameter("account");
			System.out.println(account);
			UserDao dao=new UserDao();
			User user=dao.userInformation(account);
			String question2=user.getQuestion();//获取数据库中的密保答案
			if(question1.equals(question2)) {
				request.setAttribute("account", account);//账户传给第三个页面，第三个页面改密码调用的方法需要账户
				request.getRequestDispatcher("/findpasswd/findpasswd3.jsp").forward(request, response);
			}else {
				request.setAttribute("user", user);//继续传给第二个页面，不然空指针
				request.setAttribute("message", "答案错误！，重新输入 ");
				request.getRequestDispatcher("/findpasswd/findpasswd2.jsp").forward(request, response);
			}
		}
		
		if("change".equals(action)) {//第三个找回密码页面，往数据库中录入用户新修改的密码
			String password=request.getParameter("password");//获取用户输入的密码
			String account=request.getParameter("account");//获取这个用户的账户
			UserDao dao=new UserDao();
			boolean flag=dao.change(account, password);
			if(flag) {
				request.setAttribute("message", "找回密码并重置成功！");
				request.getRequestDispatcher("/findpasswd/findpasswd3.jsp").forward(request, response);
			}
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
