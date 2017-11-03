package dto;

import java.sql.Date;

public class MemberDTO {
    private String s_id;
    private String s_name;
    private String s_pw;
    private String s_zipnum;
    private String s_addr;
    private String s_addr2;
    private String s_phone;
    private String s_email;
    private Date regdate;
    
    
    //기본 생성자
    public MemberDTO(){
    	
    }


	// 회원 정보 전체 출력
    public MemberDTO(String s_id, String s_name, String s_pw, String s_zipnum, String s_addr, String s_addr2, String s_phone, String s_email, Date regdate) {
		super();
		this.s_id = s_id;
		this.s_name = s_name;
		this.s_pw = s_pw;
		this.s_zipnum = s_zipnum;
		this.s_addr = s_addr;
		this.s_addr2 = s_addr2;
		this.s_phone = s_phone;
		this.s_email = s_email;
		this.regdate = regdate;
	}


	// 회원가입 , 회원정보 수정
	public MemberDTO(String s_id, String s_name, String s_pw, String s_zipnum, String s_addr, String s_addr2, String s_phone, String s_email) {
		super();
		this.s_id = s_id;
		this.s_name = s_name;
		this.s_pw = s_pw;
		this.s_zipnum = s_zipnum;
		this.s_addr = s_addr;
		this.s_addr2 = s_addr2;
		this.s_phone = s_phone;
		this.s_email = s_email;
	}


	
  public String getS_zipnum() {
		return s_zipnum;
	}


	public void setS_zipnum(String s_zipnum) {
		this.s_zipnum = s_zipnum;
	}


public String getS_id() {
    return s_id;
  }


  public void setS_id(String s_id) {
    this.s_id = s_id;
  }


  public String getS_name() {
    return s_name;
  }


  public void setS_name(String s_name) {
    this.s_name = s_name;
  }


  public String getS_pw() {
    return s_pw;
  }


  public void setS_pw(String s_pw) {
    this.s_pw = s_pw;
  }


  public String getS_addr() {
    return s_addr;
  }


  public void setS_addr(String s_addr) {
    this.s_addr = s_addr;
  }


  public String getS_addr2() {
    return s_addr2;
  }


  public void setS_addr2(String s_addr2) {
    this.s_addr2 = s_addr2;
  }


  public String getS_phone() {
    return s_phone;
  }


  public void setS_phone(String s_phone) {
    this.s_phone = s_phone;
  }


  public String getS_email() {
    return s_email;
  }


  public void setS_email(String s_email) {
    this.s_email = s_email;
  }


  public Date getRegdate() {
    return regdate;
  }


  public void setRegdate(Date regdate) {
    this.regdate = regdate;
  }
	
}
