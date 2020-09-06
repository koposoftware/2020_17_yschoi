package kr.ac.kopo.exchange.vo;

public class RevExchangeVO {
  private int exchangeNo;
  private String id;
  private String currencycode;
  private double exchangeprice;
  private double exchangecharge;
  private String exchangerate;
  private String account_num_from;
  private String account_num_to;
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
  public double getExchangeprice() {
    return exchangeprice;
  }
  public void setExchangeprice(double exchangeprice) {
    this.exchangeprice = exchangeprice;
  }
  public double getExchangecharge() {
    return exchangecharge;
  }
  public void setExchangecharge(double exchangecharge) {
    this.exchangecharge = exchangecharge;
  }
  public String getExchangerate() {
    return exchangerate;
  }
  public void setExchangerate(String exchangerate) {
    this.exchangerate = exchangerate;
  }
  public String getAccount_num_from() {
    return account_num_from;
  }
  public void setAccount_num_from(String account_num_from) {
    this.account_num_from = account_num_from;
  }
  public String getAccount_num_to() {
    return account_num_to;
  }
  public void setAccount_num_to(String account_num_to) {
    this.account_num_to = account_num_to;
  }
  public String getReg_date() {
    return reg_date;
  }
  public void setReg_date(String reg_date) {
    this.reg_date = reg_date;
  }
  
  
  
  
  
  public RevExchangeVO() {
    super();
  }
  
  public RevExchangeVO(int exchangeNo, String currencycode, double exchangeprice, double exchangecharge, String exchangerate, String account_num_from, String account_num_to, String reg_date) {
    super();
    this.exchangeNo = exchangeNo;
    this.currencycode = currencycode;
    this.exchangeprice = exchangeprice;
    this.exchangecharge = exchangecharge;
    this.exchangerate = exchangerate;
    this.account_num_from = account_num_from;
    this.account_num_to = account_num_to;
    this.reg_date = reg_date;
  }
  
  public RevExchangeVO(int exchangeNo, String id, String currencycode, double exchangeprice, double exchangecharge, String exchangerate, String account_num_from, String account_num_to, String reg_date) {
    super();
    this.exchangeNo = exchangeNo;
    this.id = id;
    this.currencycode = currencycode;
    this.exchangeprice = exchangeprice;
    this.exchangecharge = exchangecharge;
    this.exchangerate = exchangerate;
    this.account_num_from = account_num_from;
    this.account_num_to = account_num_to;
    this.reg_date = reg_date;
  }
  @Override
  public String toString() {
    return "RevExchangeVO [exchangeNo=" + exchangeNo + ", id=" + id + ", currencycode=" + currencycode + ", exchangeprice=" + exchangeprice + ", exchangecharge=" + exchangecharge + ", exchangerate=" + exchangerate + ", account_num_from=" + account_num_from + ", account_num_to=" + account_num_to + ", reg_date=" + reg_date + "]";
  }
  
  
  
  
  
  
  
  
  
  
  
  
  
  
}
