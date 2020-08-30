package kr.ac.kopo.exchange.vo;

public class ExchangeVO {
	
	private int exchangeNo;
	private String id;
	private String currencycode;
	private int exchangeprice;
	private String exchangerate;   //db에 넣을때 숫자로 변형
	private String exchangecharge;  //db에 넣을때 숫자로 변형
	private String name;
	private String exchange_date;
	private String exchange_place;
	private String account_num;
	private String reg_date;
	
	
	
	
	
	public int getExchangeNo() {
		return exchangeNo;
	}
	public void setExchangeNo(int exchangeNo) {
		this.exchangeNo = exchangeNo;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getCurrencycode() {
		return currencycode;
	}
	public void setCurrencycode(String currencycode) {
		this.currencycode = currencycode;
	}
	public int getExchangeprice() {
		return exchangeprice;
	}
	public void setExchangeprice(int exchangeprice) {
		this.exchangeprice = exchangeprice;
	}
	public String getExchangerate() {
		return exchangerate;
	}
	public void setExchangerate(String exchangerate) {
		this.exchangerate = exchangerate;
	}
	public String getExchangecharge() {
		return exchangecharge;
	}
	public void setExchangecharge(String exchangecharge) {
		this.exchangecharge = exchangecharge;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getExchange_date() {
		return exchange_date;
	}
	public void setExchange_date(String exchange_date) {
		this.exchange_date = exchange_date;
	}
	public String getExchange_place() {
		return exchange_place;
	}
	public void setExchange_place(String exchange_place) {
		this.exchange_place = exchange_place;
	}
	public String getAccount_num() {
		return account_num;
	}
	public void setAccount_num(String account_num) {
		this.account_num = account_num;
	}
	public String getReg_date() {
		return reg_date;
	}
	public void setReg_date(String reg_date) {
		this.reg_date = reg_date;
	}
	
	
	
	
	

	
	
	
	
	
	
	public ExchangeVO() {
		super();
	}
	
	
	
	


	public ExchangeVO(int exchangeNo, String id, String currencycode, int exchangeprice, String exchangerate,
			String exchangecharge, String name, String exchange_date, String exchange_place, String account_num,
			String reg_date) {
		super();
		this.exchangeNo = exchangeNo;
		this.id = id;
		this.currencycode = currencycode;
		this.exchangeprice = exchangeprice;
		this.exchangerate = exchangerate;
		this.exchangecharge = exchangecharge;
		this.name = name;
		this.exchange_date = exchange_date;
		this.exchange_place = exchange_place;
		this.account_num = account_num;
		this.reg_date = reg_date;
	}
	@Override
	public String toString() {
		return "ExchangeVO [exchangeNo=" + exchangeNo + ", id=" + id + ", currencycode=" + currencycode
				+ ", exchangeprice=" + exchangeprice + ", exchangerate=" + exchangerate + ", exchangecharge="
				+ exchangecharge + ", name=" + name + ", exchange_date=" + exchange_date + ", exchange_place="
				+ exchange_place + ", account_num=" + account_num + ", reg_date=" + reg_date + "]";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	


}
