package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import bean.User;
import dbUtil.DBConnection;

/**
 * 该类中包含对tb_user表进行操作的方法
 * **/
public class UserDao {
	//创建连接对象
	private Connection conn;
	
	//构造方法中包含工具类，连接到数据库
	public UserDao() {
		conn=new DBConnection().conn;
	}
//================================================================================================================================
	/**新用户注册
	 * 向数据库中插入用户信息
	 * **/
	public boolean insertUser(User user) {
		//插入信息语句
		String sql="insert into tb_user(account,name,password,mobile,email,balance,question,answer) values (?,?,?,?,?,?,?,?)";
		PreparedStatement ps;
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, user.getAccount());
			ps.setString(2, user.getName());
			ps.setString(3, user.getPassword());
			ps.setString(4, user.getMobile());
			ps.setString(5, user.getEmail());
			ps.setString(6, user.getBalance());
			ps.setString(7, user.getQuestion());
			ps.setString(8, user.getAnswer());
			
			ps.executeUpdate();
			ps.close();
			
			return true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		}
		
	}
//================================================================================================================================	
	/**
	 * 用于登陆
	 * 查看账户密码是否都正确
	 * 如果查询到返回一个User,否则就是空User
	 * 
	 * **/
	public User login(String account,String password) {
		User user=null;
		String sql="select * from tb_user where account=? and password=?";
		try {
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setString(1, account);
			ps.setString(2, password);
			ResultSet rs=ps.executeQuery();
			if(rs.next()) {
				user=new User();
				user.setAccount(rs.getString(1));
				user.setName(rs.getString(2));
				user.setPassword(rs.getString(3));
				user.setMobile(rs.getString(4));
				user.setEmail(rs.getString(5));
				user.setBalance(rs.getString(6));
				user.setQuestion(rs.getString(7));
				user.setAnswer(rs.getString(8));
			}
			rs.close();
			ps.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			
		}
		return user;
	}
//================================================================================================================================		
	/**根据登陆时输入的银行卡号返回用户信息
	 * 
	 * **/
	public User userInformation(String account) {
		User user = null;
		String sql="select * from tb_user where account=?";
		try {
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setString(1, account);
			ResultSet rs=ps.executeQuery();
			if(rs.next()) {
				user=new User();
				user.setAccount(rs.getString(1));
				user.setName(rs.getString(2));
				user.setPassword(rs.getString(3));
				user.setMobile(rs.getString(4));
				user.setEmail(rs.getString(5));
				user.setBalance(rs.getString(6));
				user.setQuestion(rs.getString(7));
				user.setAnswer(rs.getString(8));
			}
			rs.close();
			ps.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return user;
	}
//================================================================================================================================		
	/**
	 * 作用于用户存钱/转账
	 * 根据银行卡号
	 * 参数有银行卡号和重置钱数
	 * **/
	public boolean userRecharge(String account,double money) {
		String sql="update tb_user set balance=balance+? where account=?";
		try {
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setDouble(1, money);
			ps.setString(2, account);
			
			ps.executeUpdate();
			ps.close();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		}
		return true;
	}
//================================================================================================================================		
	/**作用于用户取钱/转账
	 * 根据银行卡号
	 * 参数有银行卡号和要取的钱数
	 * **/
	public boolean userGetMoney(String account,double money) {
		String sql="update tb_user set balance=balance-? where account=?";
		try {
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setDouble(1, money);
			ps.setString(2, account);
			ps.executeUpdate();
			ps.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		}
		return true;
	}
//================================================================================================================================	
	/**
	 * 作用于用户找回密码中的改密码
	 * 根据用户账户
	 * **/
	public boolean change(String account,String password) {
		String sql="update tb_user set password=? where account=?";
		try {
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setString(1, password);
			ps.setString(2, account);
			ps.executeUpdate();
			ps.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		}
		return true;
	}
//================================================================================================================================		
	/**
	 * 根据账户来删除这条记录
	 * 销户
	 * **/
	public boolean delete(String account) {
		String sql="delete from tb_user where account=?";
		try {
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setString(1, account);
			ps.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		}
		return true;
		
	}
	
	
	
	
	
	
}