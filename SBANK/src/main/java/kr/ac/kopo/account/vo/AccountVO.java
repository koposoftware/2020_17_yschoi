package kr.ac.kopo.account.vo;

public class AccountVO {
	private String id;
	private String bank_name;
	private String account_num;
	private int balance;
	private String nick_name;
	private String reg_date;
	
	
	public AccountVO() {
		super();
		// TODO Auto-generated constructor stub
	}


	public AccountVO(String id, String bank_name, String account_num, int balance, String nick_name, String reg_date) {
		super();
		this.id = id;
		this.bank_name = bank_name;
		this.account_num = account_num;
		this.balance = balance;
		this.nick_name = nick_name;
		this.reg_date = reg_date;
	}
	
	
	public AccountVO(String id, String bank_name, String account_num, int balance, String nick_name) {
		super();
		this.id = id;
		this.bank_name = bank_name;
		this.account_num = account_num;
		this.balance = balance;
		this.nick_name = nick_name;
	}


	public String getId() {
		return id;
	}


	public void setId(String id) {
		this.id = id;
	}


	public String getBank_name() {
		return bank_name;
	}


	public void setBank_name(String bank_name) {
		this.bank_name = bank_name;
	}


	public String getAccount_num() {
		return account_num;
	}


	public void setAccount_num(String account_num) {
		this.account_num = account_num;
	}


	public int getBalance() {
		return balance;
	}


	public void setBalance(int balance) {
		this.balance = balance;
	}


	public String getNick_name() {
		return nick_name;
	}


	public void setNick_name(String nick_name) {
		this.nick_name = nick_name;
	}


	public String getReg_date() {
		return reg_date;
	}


	public void setReg_date(String reg_date) {
		this.reg_date = reg_date;
	}


	@Override
	public String toString() {
		return "AccountVO [id=" + id + ", bank_name=" + bank_name + ", account_num=" + account_num + ", balance="
				+ balance + ", nick_name=" + nick_name + ", reg_date=" + reg_date + "]";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
