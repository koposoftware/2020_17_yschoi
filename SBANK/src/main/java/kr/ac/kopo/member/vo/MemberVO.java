package kr.ac.kopo.member.vo;

public class MemberVO { // table A_MEMBER임
	private String id;
	private String password;
	private String type;
	private String name;
	private String otpcode;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getOtpcode() {
    return otpcode;
  }
  public void setOtpcode(String otpcode) {
    this.otpcode = otpcode;
  }
  public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	
	
	
	
	public MemberVO() {
    super();
  }
	
	public MemberVO(String id, String password, String type, String name) {
    super();
    this.id = id;
    this.password = password;
    this.type = type;
    this.name = name;
  }
	
  public MemberVO(String id, String password, String type, String name, String otpcode) {
    super();
    this.id = id;
    this.password = password;
    this.type = type;
    this.name = name;
    this.otpcode = otpcode;
  }
  
  @Override
  public String toString() {
    return "MemberVO [id=" + id + ", password=" + password + ", type=" + type + ", name=" + name + ", otpcode=" + otpcode + "]";
  }
	
	

	
}
