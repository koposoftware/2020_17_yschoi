package kr.ac.kopo.exchange.vo;

public class CurrencyVO {

	private String currency; // 통화
	private double cashbuyrate; // 현찰살때환율
	private double cashbuyspread;
	private double cashsellrate; // 현찰팔때환율
	private double cashsellspread;
	private double remittance; // 송금보낼대
	private double receive; // 송금받을때
	private double tcbuy;
	private double fcsell;
	private double basicrate; // 매매기준율
	private double conversion; // 환가로율
	private double usdrate; // 미화환산율
	private String regdate;
	private Double commission;
	private String commission2;
	private Double commission3;
  private String commission4;
	
	public String getCurrency() {
		return currency;
	}
	public void setCurrency(String currency) {
		this.currency = currency;
	}
	public double getCashbuyrate() {
		return cashbuyrate;
	}
	public void setCashbuyrate(double cashbuyrate) {
		this.cashbuyrate = cashbuyrate;
	}
	public double getCashbuyspread() {
		return cashbuyspread;
	}
	public void setCashbuyspread(double cashbuyspread) {
		this.cashbuyspread = cashbuyspread;
	}
	public double getCashsellrate() {
		return cashsellrate;
	}
	public void setCashsellrate(double cashsellrate) {
		this.cashsellrate = cashsellrate;
	}
	public double getCashsellspread() {
		return cashsellspread;
	}
	public void setCashsellspread(double cashsellspread) {
		this.cashsellspread = cashsellspread;
	}
	public double getRemittance() {
		return remittance;
	}
	public void setRemittance(double remittance) {
		this.remittance = remittance;
	}
	public double getReceive() {
		return receive;
	}
	public void setReceive(double receive) {
		this.receive = receive;
	}
	public double getTcbuy() {
		return tcbuy;
	}
	public void setTcbuy(double tcbuy) {
		this.tcbuy = tcbuy;
	}
	public double getFcsell() {
		return fcsell;
	}
	public void setFcsell(double fcsell) {
		this.fcsell = fcsell;
	}
	public double getBasicrate() {
		return basicrate;
	}
	public void setBasicrate(double basicrate) {
		this.basicrate = basicrate;
	}
	public double getConversion() {
		return conversion;
	}
	public void setConversion(double conversion) {
		this.conversion = conversion;
	}
	public double getUsdrate() {
		return usdrate;
	}
	public void setUsdrate(double usdrate) {
		this.usdrate = usdrate;
	}
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	public Double getCommission() {
		return commission;
	}
	public void setCommission(Double commission) {
		this.commission = commission;
	}
	public String getCommission2() {
		return commission2;
	}
	public void setCommission2(String commission2) {
		this.commission2 = commission2;
	}
	public Double getCommission3() {
    return commission3;
  }
  public void setCommission3(Double commission3) {
    this.commission3 = commission3;
  }
  public String getCommission4() {
    return commission4;
  }
  public void setCommission4(String commission4) {
    this.commission4 = commission4;
  }
  
  
  
  
  public CurrencyVO() {
    super();
  }
  
  public CurrencyVO(String currency, double cashbuyrate, double cashbuyspread, double cashsellrate,
			double cashsellspread, double remittance, double receive, double tcbuy, double fcsell, double basicrate,
			double conversion, double usdrate) {
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
	}
	
	public CurrencyVO(String currency, double cashbuyrate, double cashbuyspread, double cashsellrate,
			double cashsellspread, double remittance, double receive, double tcbuy, double fcsell, double basicrate,
			double conversion, double usdrate, String regdate, Double commission, String commission2) {
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
		this.commission2 = commission2;
	}
	
	
	
	public CurrencyVO(String currency, double cashbuyrate, double cashbuyspread, double cashsellrate, double cashsellspread, double remittance, double receive, double tcbuy, double fcsell, double basicrate, double conversion, double usdrate, String regdate, Double commission, String commission2, Double commission3, String commission4) {
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
    this.commission2 = commission2;
    this.commission3 = commission3;
    this.commission4 = commission4;
  }
	
  @Override
  public String toString() {
    return "CurrencyVO [currency=" + currency + ", cashbuyrate=" + cashbuyrate + ", cashbuyspread=" + cashbuyspread + ", cashsellrate=" + cashsellrate + ", cashsellspread=" + cashsellspread + ", remittance=" + remittance + ", receive=" + receive + ", tcbuy=" + tcbuy + ", fcsell=" + fcsell + ", basicrate=" + basicrate + ", conversion=" + conversion + ", usdrate=" + usdrate + ", regdate=" + regdate + ", commission=" + commission + ", commission2=" + commission2 + ", commission3=" + commission3 + ", commission4=" + commission4 + "]";
  }
  
	
	
	
	
	
	
	
	


}
