package kr.ac.kopo.board.vo;

import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Pattern;


import org.hibernate.validator.constraints.Length;

public class BoardVO {

	private int no;
	
//	@NotEmpty(message = "필수항목입니다")
	@Pattern(regexp = "^[A-Za-z0-9]*$",message = "특수기호는 사용하실 수 없습니다.")
	@Length(min = 3 , max = 200, message = "제목은 3글자 이상 입력하셔야 합니다.")
	private String title;
	
	@NotEmpty(message = "필수항목입니다")
	private String writer;
	
	@NotEmpty(message = "필수항목입니다")
	private String content;
	private int viewCnt;
	private String start_date;
	private String end_date;
	private String regDate;
	
	public BoardVO() {
		
	}

	public BoardVO(int no, String title, String writer, String content, int viewCnt, String regDate) {
		super();
		this.no = no;
		this.title = title;
		this.writer = writer;
		this.content = content;
		this.viewCnt = viewCnt;
		this.regDate = regDate;
	}
	
	
	
	

	public BoardVO(int no, @Pattern(regexp = "^[A-Za-z0-9]*$", message = "특수기호는 사용하실 수 없습니다.") @Length(min = 3, max = 200, message = "제목은 3글자 이상 입력하셔야 합니다.") String title, @NotEmpty(message = "필수항목입니다") String writer, @NotEmpty(message = "필수항목입니다") String content, int viewCnt, String start_date, String end_date, String regDate) {
    super();
    this.no = no;
    this.title = title;
    this.writer = writer;
    this.content = content;
    this.viewCnt = viewCnt;
    this.start_date = start_date;
    this.end_date = end_date;
    this.regDate = regDate;
  }

  public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public int getViewCnt() {
		return viewCnt;
	}

	public void setViewCnt(int viewCnt) {
		this.viewCnt = viewCnt;
	}
	
	

	public String getStart_date() {
    return start_date;
  }

  public void setStart_date(String start_date) {
    this.start_date = start_date;
  }

  public String getEnd_date() {
    return end_date;
  }

  public void setEnd_date(String end_date) {
    this.end_date = end_date;
  }

  public String getRegDate() {
		return regDate;
	}

	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}

  @Override
  public String toString() {
    return "BoardVO [no=" + no + ", title=" + title + ", writer=" + writer + ", content=" + content + ", viewCnt=" + viewCnt + ", start_date=" + start_date + ", end_date=" + end_date + ", regDate=" + regDate + "]";
  }

	
	
	

}
