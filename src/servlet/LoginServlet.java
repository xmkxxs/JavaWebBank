package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.User;
import dao.UserDao;

/**
 * 登陆服务器，index点击登陆按钮，将请求发送到此服务器进行处理
 * 服务器获取用户在登陆的表单里填写的账号和密码，然后发送到dao类的方法中，方法用于比对数据库中account和密码是否正确
 */
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		/*
		 * HttpSession session=request.getSession(); Object
		 * s1=session.getAttribute("suiji"); String s2=request.getParameter("suiji1");
		 * System.out.println(s1+","+s2);
		 * 
		 * if(s1!=null && s1.equals(s2)) { session.removeAttribute("suiji");
		 * 
		 * 
		 * 
		 * }else { request.getRequestDispatcher("/user/user.jsp").forward(request,
		 * response); }
		 */
		 
		
		String account = request.getParameter("user");
		String password = request.getParameter("password");
		UserDao dao = new UserDao();
		User user1 = dao.login(account, password);// 匹配账户密码是否和数据库一致
		User user=dao.userInformation(account);//根据登陆卡号获取这个用户的信息 String
		if (user1!=null) {
			request.setAttribute("loginsuccess", "登陆成功");
			request.getSession().setAttribute("user", user);
			request.getRequestDispatcher("/user/user.jsp").forward(request, response);
			
		} else {
			request.setAttribute("loginsuccess", "登陆失败，账户或密码错误");
			request.getRequestDispatcher("/index.jsp").forward(request, response);
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
