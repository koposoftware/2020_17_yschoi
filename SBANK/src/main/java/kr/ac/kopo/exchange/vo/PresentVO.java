package kr.ac.kopo.exchange.vo;

public class PresentVO {
  private String account_num;
  private String currencycode;
  private int balance;
  private String account_num_to;
  private String name;
  
  
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
  public int getBalance() {
    return balance;
  }
  public void setBalance(int balance) {
    this.balance = balance;
  }
  public String getAccount_num_to() {
    return account_num_to;
  }
  public void setAccount_num_to(String account_num_to) {
    this.account_num_to = account_num_to;
  }
  
  
  
  
  
  public PresentVO() {
    super();
  }
  
  public PresentVO(String account_num, String currencycode, int balance, String account_num_to) {
    super();
    this.account_num = account_num;
    this.currencycode = currencycode;
    this.balance = balance;
    this.account_num_to = account_num_to;
  }
  
  @Override
  public String toString() {
    return "PresentVO [account_num=" + account_num + ", currencycode=" + currencycode + ", balance=" + balance + ", account_num_to=" + account_num_to + "]";
  }
  
  
  
  
  
  
  
  
  
  
  
  
  
}
