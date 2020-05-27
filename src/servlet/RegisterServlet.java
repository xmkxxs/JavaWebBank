package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.User;
import dao.UserDao;

/**用户注册请求提交到此服务器
 * 服务器包含一个方法，创建一个随机15位的数字作为银行卡号，
 * 然后获取用户注册的表单信息
 * 调用userDao中的插入用户信息方法录入数据库
 * 
 * **/
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		//生成3个5位数，连在一起成为15位作为银行卡号id
		int a=(int)(Math.random()*90000)+10000;
		int b=(int)(Math.random()*90000)+10000;
		int c=(int)(Math.random()*90000)+10000;
		String sum=a+""+b+""+c;
		
		String name=request.getParameter("name");//获取注册用户姓名
		String password=request.getParameter("password");
		String mobile=request.getParameter("mobile");
		String email=request.getParameter("email");
		String question=request.getParameter("question");
		String answer=request.getParameter("answer");
		
		//调用UserDao中的插入用户信息方法
		UserDao dao=new UserDao();
		boolean result=dao.insertUser(new User(sum,name,password,mobile,email,"0",question,answer));//因为是第一次注册，账户余额为0
		
		if(result) {
			request.setAttribute("message", "注册成功,您的卡号为："+sum);
			request.getRequestDispatcher("register/register.jsp").forward(request, response);
		}else {
			request.setAttribute("message", "注册失败，请重试");
			request.getRequestDispatcher("register/register.jsp").forward(request, response);
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
