package kr.ac.kopo.board.vo;

public class ControlVO {
  
  private int controlno;
  private String ip;
  private String pattern;
  private String reg_date;
  private String is_lift;
  
  public ControlVO() {
    super();
  }

  public ControlVO(int controlno, String ip, String pattern, String reg_date, String is_lift) {
    super();
    this.controlno = controlno;
    this.ip = ip;
    this.pattern = pattern;
    this.reg_date = reg_date;
    this.is_lift = is_lift;
  }

  
  public int getControlno() {
    return controlno;
  }

  public void setControlno(int controlno) {
    this.controlno = controlno;
  }

  public String getIp() {
    return ip;
  }

  public void setIp(String ip) {
    this.ip = ip;
  }

  public String getPattern() {
    return pattern;
  }

  public void setPattern(String pattern) {
    this.pattern = pattern;
  }

  public String getReg_date() {
    return reg_date;
  }

  public void setReg_date(String reg_date) {
    this.reg_date = reg_date;
  }

  public String getIs_lift() {
    return is_lift;
  }

  public void setIs_lift(String is_lift) {
    this.is_lift = is_lift;
  }

  @Override
  public String toString() {
    return "ControlVO [controlno=" + controlno + ", ip=" + ip + ", pattern=" + pattern + ", reg_date=" + reg_date + ", is_lift=" + is_lift + "]";
  }
  
  

  
  
  
}
