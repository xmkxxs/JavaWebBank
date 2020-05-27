package bean;

public class User {
	private String account;
	private String name;
	private String password;
	private String mobile;
	private String email;
	private String balance;
	private String question;
	private String answer;
	
//========================================================================================================================
	public String getAccount() {
		return account;
	}
	public void setAccount(String account) {
		this.account = account;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getMobile() {
		return mobile;
	}
	public void setMobile(String mobile) {
		this.mobile = mobile;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String balance) {
		this.email = email;
	}
	public String getBalance() {
		return balance;
	}
	public void setBalance(String balance) {
		this.balance = balance;
	}
	
	public String getQuestion() {
		return question;
	}
	public void setQuestion(String question) {
		this.question = question;
	}
	
	public String getAnswer() {
		return answer;
	}
	public void setAnswer(String answer) {
		this.answer = answer;
	}
//========================================================================================================================
	public User(String account, String name, String password, String mobile, String email,String balance,String question,String answer) {
		super();
		this.account = account;
		this.name = name;
		this.password = password;
		this.mobile = mobile;
		this.email = email;
		this.balance = balance;
		this.question=question;
		this.answer=answer;
	}
//========================================================================================================================
	public User() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	

}
