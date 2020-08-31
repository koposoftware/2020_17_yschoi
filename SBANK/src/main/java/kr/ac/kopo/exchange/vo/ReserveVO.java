package kr.ac.kopo.exchange.vo;

public class ReserveVO {
  
  private int reserveno;
  private String id;
  private String account_num;
  private String currencycode;
  private double exchangeprice;
  private double exchangerate;
  private double exchangecharge;
  private String isalarm;
  private String isexchange;
  private String iscancle;
  private String max_date;
  private String reg_date;
  
  
  public int getReserveno() {
    return reserveno;
  }
  public void setReserveno(int reserveno) {
    this.reserveno = reserveno;
  }
  public String getId() {
    return id;
  }
  public void setId(String id) {
    this.id = id;
  }
  public String getAccount_num() {
    return account_num;
  }
  public void setAccount_num(String account_num) {
    this.account_num = account_num;
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
  public double getExchangerate() {
    return exchangerate;
  }
  public void setExchangerate(double exchangerate) {
    this.exchangerate = exchangerate;
  }
  public double getExchangecharge() {
    return exchangecharge;
  }
  public void setExchangecharge(double exchangecharge) {
    this.exchangecharge = exchangecharge;
  }
  public String getIsalarm() {
    return isalarm;
  }
  public void setIsalarm(String isalarm) {
    this.isalarm = isalarm;
  }
  public String getIsexchange() {
    return isexchange;
  }
  public void setIsexchange(String isexchange) {
    this.isexchange = isexchange;
  }
  public String getIscancle() {
    return iscancle;
  }
  public void setIscancle(String iscancle) {
    this.iscancle = iscancle;
  }
  public String getMax_date() {
    return max_date;
  }
  public void setMax_date(String max_date) {
    this.max_date = max_date;
  }
  public String getReg_date() {
    return reg_date;
  }
  public void setReg_date(String reg_date) {
    this.reg_date = reg_date;
  }
  
  
  public ReserveVO() {
    super();
  }
  
  public ReserveVO( String id, String account_num, String currencycode, double exchangeprice, double exchangerate, double exchangecharge, String isalarm, String isexchange, String iscancle, String max_date) {
    super();
    this.id = id;
    this.account_num = account_num;
    this.currencycode = currencycode;
    this.exchangeprice = exchangeprice;
    this.exchangerate = exchangerate;
    this.exchangecharge = exchangecharge;
    this.isalarm = isalarm;
    this.isexchange = isexchange;
    this.iscancle = iscancle;
    this.max_date = max_date;
  }
  
  public ReserveVO( String id, String account_num, String currencycode, double exchangeprice, double exchangerate, double exchangecharge, String isalarm, String isexchange, String iscancle, String max_date, String reg_date) {
    super();
    this.id = id;
    this.account_num = account_num;
    this.currencycode = currencycode;
    this.exchangeprice = exchangeprice;
    this.exchangerate = exchangerate;
    this.exchangecharge = exchangecharge;
    this.isalarm = isalarm;
    this.isexchange = isexchange;
    this.iscancle = iscancle;
    this.max_date = max_date;
    this.reg_date = reg_date;
  }
  
  public ReserveVO(int reserveno, String id, String account_num, String currencycode, double exchangeprice, double exchangerate, double exchangecharge, String isalarm, String isexchange, String iscancle, String max_date) {
    super();
    this.reserveno = reserveno;
    this.id = id;
    this.account_num = account_num;
    this.currencycode = currencycode;
    this.exchangeprice = exchangeprice;
    this.exchangerate = exchangerate;
    this.exchangecharge = exchangecharge;
    this.isalarm = isalarm;
    this.isexchange = isexchange;
    this.iscancle = iscancle;
    this.max_date = max_date;
  }
  
  public ReserveVO(int reserveno, String id, String account_num, String currencycode, double exchangeprice, double exchangerate, double exchangecharge, String isalarm, String isexchange, String iscancle, String max_date, String reg_date) {
    super();
    this.reserveno = reserveno;
    this.id = id;
    this.account_num = account_num;
    this.currencycode = currencycode;
    this.exchangeprice = exchangeprice;
    this.exchangerate = exchangerate;
    this.exchangecharge = exchangecharge;
    this.isalarm = isalarm;
    this.isexchange = isexchange;
    this.iscancle = iscancle;
    this.max_date = max_date;
    this.reg_date = reg_date;
  }
  
  @Override
  public String toString() {
    return "ReserveVO [reserveno=" + reserveno + ", id=" + id + ", account_num=" + account_num + ", currencycode=" + currencycode + ", exchangeprice=" + exchangeprice + ", exchangerate=" + exchangerate + ", exchangecharge=" + exchangecharge + ", isalarm=" + isalarm + ", isexchange=" + isexchange + ", iscancle=" + iscancle + ", max_date=" + max_date + ", reg_date=" + reg_date + "]";
  }
  
  
  
  
  
  
  
  
  
  
  
}
