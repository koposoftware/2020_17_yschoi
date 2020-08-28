package kr.ac.kopo.exchange.vo;

public class CurrencyVO {
	
	
	private String currency;
	private int cashbuyrate;
	private int cashbuyspread;
	private int cashsellrate;
	private int cashsellspread;
	private int remittance;
	private int receive;
	private int tcbuy;
	private int fcsell;
	private int basicrate;
	private int conversion;
	private int usdrate;
	private String regdate;
	private int commission;
	
	
	public String getCurrency() {
		return currency;
	}
	public void setCurrency(String currency) {
		this.currency = currency;
	}
	public int getCashbuyrate() {
		return cashbuyrate;
	}
	public void setCashbuyrate(int cashbuyrate) {
		this.cashbuyrate = cashbuyrate;
	}
	public int getCashbuyspread() {
		return cashbuyspread;
	}
	public void setCashbuyspread(int cashbuyspread) {
		this.cashbuyspread = cashbuyspread;
	}
	public int getCashsellrate() {
		return cashsellrate;
	}
	public void setCashsellrate(int cashsellrate) {
		this.cashsellrate = cashsellrate;
	}
	public int getCashsellspread() {
		return cashsellspread;
	}
	public void setCashsellspread(int cashsellspread) {
		this.cashsellspread = cashsellspread;
	}
	public int getRemittance() {
		return remittance;
	}
	public void setRemittance(int remittance) {
		this.remittance = remittance;
	}
	public int getReceive() {
		return receive;
	}
	public void setReceive(int receive) {
		this.receive = receive;
	}
	public int getTcbuy() {
		return tcbuy;
	}
	public void setTcbuy(int tcbuy) {
		this.tcbuy = tcbuy;
	}
	public int getFcsell() {
		return fcsell;
	}
	public void setFcsell(int fcsell) {
		this.fcsell = fcsell;
	}
	public int getBasicrate() {
		return basicrate;
	}
	public void setBasicrate(int basicrate) {
		this.basicrate = basicrate;
	}
	public int getConversion() {
		return conversion;
	}
	public void setConversion(int conversion) {
		this.conversion = conversion;
	}
	public int getUsdrate() {
		return usdrate;
	}
	public void setUsdrate(int usdrate) {
		this.usdrate = usdrate;
	}
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	
	
	
	
	public int getCommission() {
    return commission;
  }
  public void setCommission(int commission) {
    this.commission = commission;
  }
  
  
  public CurrencyVO(String currency, int cashbuyrate, int cashbuyspread, int cashsellrate, int cashsellspread,
			int remittance, int receive, int tcbuy, int fcsell, int basicrate, int conversion, int usdrate,
			String regdate) {
		super();
		this.currency = currency;
		this.cashbuyrate = cashbuyrate;
		this.cashbuyspread = cashbuyspread;
		this.cashsellrate = cashsellrate;
		this.cashsellspread = cashsellspread;
		this.remittance = remittance;
		this.receive = receive;
		this.tcbuy = tcbuy;
		this.fcsell = fcsell;
		this.basicrate = basicrate;
		this.conversion = conversion;
		this.usdrate = usdrate;
		this.regdate = regdate;
	}
	
	public CurrencyVO(String currency, int cashbuyrate, int cashbuyspread, int cashsellrate, int cashsellspread,
			int remittance, int receive, int tcbuy, int fcsell, int basicrate, int conversion, int usdrate) {
		super();
		this.currency = currency;
		this.cashbuyrate = cashbuyrate;
		this.cashbuyspread = cashbuyspread;
		this.cashsellrate = cashsellrate;
		this.cashsellspread = cashsellspread;
		this.remittance = remittance;
		this.receive = receive;
		this.tcbuy = tcbuy;
		this.fcsell = fcsell;
		this.basicrate = basicrate;
		this.conversion = conversion;
		this.usdrate = usdrate;

	}
	
	
	
	public CurrencyVO(String currency, int cashbuyrate, int cashbuyspread, int cashsellrate, int cashsellspread, int remittance, int receive, int tcbuy, int fcsell, int basicrate, int conversion, int usdrate, String regdate, int commission) {
    super();
    this.currency = currency;
    this.cashbuyrate = cashbuyrate;
    this.cashbuyspread = cashbuyspread;
    this.cashsellrate = cashsellrate;
    this.cashsellspread = cashsellspread;
    this.remittance = remittance;
    this.receive = receive;
    this.tcbuy = tcbuy;
    this.fcsell = fcsell;
    this.basicrate = basicrate;
    this.conversion = conversion;
    this.usdrate = usdrate;
    this.regdate = regdate;
    this.commission = commission;
  }
	
  @Override
  public String toString() {
    return "CurrencyVO [currency=" + currency + ", cashbuyrate=" + cashbuyrate + ", cashbuyspread=" + cashbuyspread + ", cashsellrate=" + cashsellrate + ", cashsellspread=" + cashsellspread + ", remittance=" + remittance + ", receive=" + receive + ", tcbuy=" + tcbuy + ", fcsell=" + fcsell + ", basicrate=" + basicrate + ", conversion=" + conversion + ", usdrate=" + usdrate + ", regdate=" + regdate + ", commission=" + commission + "]";
  }
  
	
	
	
	
	


}
