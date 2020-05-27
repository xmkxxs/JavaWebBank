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
 * 销毁账户服务器
 */
public class DestructionServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		String action=request.getParameter("action");
		if("xiaohui".equals(action)) {//如果销毁
			HttpSession session=request.getSession();
			User user=(User) session.getAttribute("user");
			String balance1=user.getBalance();
			double balance2=Double.parseDouble(balance1);
			if(balance2>0) {//如果还有余额，无法销毁
				request.setAttribute("message", "账户仍存在余额，无法销户！");
				request.getRequestDispatcher("/user/user.jsp").forward(request, response);
			}else {
				String account=user.getAccount();//获取账户，根据账户删除一条记录
				UserDao dao=new UserDao();
				boolean flag=dao.delete(account);
				if(flag) {
				session.invalidate();//销毁session
				request.setAttribute("message", "销户成功,感谢您使用农业银行，我们有缘再会！");
				request.getRequestDispatcher("/index.jsp").forward(request, response);
				}
				
			}
		}
		
		if("quxiao".equals(action)) {//如果用户不想销户了，跳转回到user.jsp
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
