package kr.ac.kopo.exchange.vo;

public class CurrencyStrVO {
  
  private String currency; // 통화
  private String cashbuyrate; // 현찰살때환율
  private String cashbuyspread;
  private String cashsellrate; // 현찰팔때환율
  private String cashsellspread;
  private String remittance; // 송금보낼대
  private String receive; // 송금받을때
  private String tcbuy;
  private String fcsell;
  private String basicrate; // 매매기준율
  private String conversion; // 환가로율
  private String usdrate; // 미화환산율
  
  public String getCurrency() {
    return currency;
  }
  public void setCurrency(String currency) {
    this.currency = currency;
  }
  public String getCashbuyrate() {
    return cashbuyrate;
  }
  public void setCashbuyrate(String cashbuyrate) {
    this.cashbuyrate = cashbuyrate;
  }
  public String getCashbuyspread() {
    return cashbuyspread;
  }
  public void setCashbuyspread(String cashbuyspread) {
    this.cashbuyspread = cashbuyspread;
  }
  public String getCashsellrate() {
    return cashsellrate;
  }
  public void setCashsellrate(String cashsellrate) {
    this.cashsellrate = cashsellrate;
  }
  public String getCashsellspread() {
    return cashsellspread;
  }
  public void setCashsellspread(String cashsellspread) {
    this.cashsellspread = cashsellspread;
  }
  public String getRemittance() {
    return remittance;
  }
  public void setRemittance(String remittance) {
    this.remittance = remittance;
  }
  public String getReceive() {
    return receive;
  }
  public void setReceive(String receive) {
    this.receive = receive;
  }
  public String getTcbuy() {
    return tcbuy;
  }
  public void setTcbuy(String tcbuy) {
    this.tcbuy = tcbuy;
  }
  public String getFcsell() {
    return fcsell;
  }
  public void setFcsell(String fcsell) {
    this.fcsell = fcsell;
  }
  public String getBasicrate() {
    return basicrate;
  }
  public void setBasicrate(String basicrate) {
    this.basicrate = basicrate;
  }
  public String getConversion() {
    return conversion;
  }
  public void setConversion(String conversion) {
    this.conversion = conversion;
  }
  public String getUsdrate() {
    return usdrate;
  }
  public void setUsdrate(String usdrate) {
    this.usdrate = usdrate;
  }
  
  
  
  
  public CurrencyStrVO() {
    super();
  }
  
  public CurrencyStrVO(String currency, String cashbuyrate, String cashbuyspread, String cashsellrate, String cashsellspread, String remittance, String receive, String tcbuy, String fcsell, String basicrate, String conversion, String usdrate) {
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
  
  @Override
  public String toString() {
    return "CurrencyStrVO [currency=" + currency + ", cashbuyrate=" + cashbuyrate + ", cashbuyspread=" + cashbuyspread + ", cashsellrate=" + cashsellrate + ", cashsellspread=" + cashsellspread + ", remittance=" + remittance + ", receive=" + receive + ", tcbuy=" + tcbuy + ", fcsell=" + fcsell + ", basicrate=" + basicrate + ", conversion=" + conversion + ", usdrate=" + usdrate + "]";
  }
  
  
  
  
  
  
}
