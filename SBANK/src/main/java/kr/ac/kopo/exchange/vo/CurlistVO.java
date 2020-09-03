package kr.ac.kopo.exchange.vo;

public class CurlistVO {
  
  private int no;
  private String account_num;
  private String currencycode;
  private int balance;
  
  public int getNo() {
    return no;
  }
  public void setNo(int no) {
    this.no = no;
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
  public int getBalance() {
    return balance;
  }
  public void setBalance(int balance) {
    this.balance = balance;
  }
  
  
  
  public CurlistVO() {
    super();
  }
  
  public CurlistVO(int no, String account_num, String currencycode, int balance) {
    super();
    this.no = no;
    this.account_num = account_num;
    this.currencycode = currencycode;
    this.balance = balance;
  }
  
  @Override
  public String toString() {
    return "CurlistVO [no=" + no + ", account_num=" + account_num + ", currencycode=" + currencycode + ", balance=" + balance + "]";
  }
  
  
  
  
  
}
