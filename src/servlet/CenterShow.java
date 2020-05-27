package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.User;

/**
 * Servlet implementation class CenterShow
 */
public class CenterShow extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * 这个服务器的作用是，当我点击用户界面的每个业务超链接的时候，请求会发送到此服务器，每个不同的链接带着不同的参数
	 * 服务器获取参数，给不同的参数做不同的业务，返回一个Attribute，页面那边根据获取到的这个Attribute，来在中间的部分
	 * 显示不同的页面
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		String action=(String) request.getParameter("action");
		if("cunqian".equals(action)) {//做存钱业务
			request.setAttribute("yewu", action);
			request.getRequestDispatcher("/user/user.jsp").forward(request, response);
		}else if("quqian".equals(action)) {//做取钱业务
			request.setAttribute("yewu", action);
			request.getRequestDispatcher("/user/user.jsp").forward(request, response);
		}else if("zhuan".equals(action)) {//做转账业务
			request.setAttribute("yewu", action);
			User user=(User) request.getSession().getAttribute("user");
			String account=user.getAccount();
			request.setAttribute("account",account);
			
			request.getRequestDispatcher("/user/user.jsp").forward(request, response);
		}else if("cha".equals(action)) {//做查询余额业务
			HttpSession session=request.getSession();
			User user=(User) session.getAttribute("user");
			String money=user.getBalance();
			request.setAttribute("money", money);
			request.setAttribute("yewu", action);
			request.getRequestDispatcher("/user/user.jsp").forward(request, response);
		}else if("xiao".equals(action)) {//做销户业务
			request.setAttribute("yewu", action);
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
