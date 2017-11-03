package dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import common.DBManager;
import dto.MemberDTO;

public class MemberDAO {
  Connection conn = null;
  PreparedStatement pstmt = null;
  ResultSet rs = null;
  int result = 0;
  MemberDTO memberDto = new MemberDTO();
  ArrayList<MemberDTO> memberList = new ArrayList<>();
  
  
  //회원가입
  public void memberAdd(MemberDTO memberDto){
	  try {		
		  conn = DBManager.getConnection();
		  String sql = "INSERT INTO "
				  	+ "shopmember(s_id, s_name, s_pw, s_zipnum, s_addr, s_addr2, s_phone, s_email) "
				  	+ "VALUES(?, ?, ?, ?, ?, ? ,?, ?)";
		  
		  pstmt = conn.prepareStatement(sql);
		  pstmt.setString(1, memberDto.getS_id());
		  pstmt.setString(2, memberDto.getS_name());
		  pstmt.setString(3, memberDto.getS_pw());
		  pstmt.setString(4, memberDto.getS_zipnum());
		  pstmt.setString(5, memberDto.getS_addr());
		  pstmt.setString(6, memberDto.getS_addr2());
		  pstmt.setString(7, memberDto.getS_phone());
		  pstmt.setString(8, memberDto.getS_email());
		  
		  pstmt.executeUpdate();
	
	  } catch (Exception e) {
		e.printStackTrace();
	
	  } finally {
		DBManager.close(conn, pstmt);
	}

  }
  
/*  // id로 아이디 찾기
  public ArrayList<MemberDTO> memberSearch(String s_id){
    try {
      conn = DBManager.getConntection();
      String sql = "SELECT * FROM shopmember WHERE s_id= ?";
      pstmt = conn.prepareStatement(sql);
     
      pstmt.setString(1, s_id);
      rs = pstmt.executeQuery();
     
      memberList = new ArrayList<>();
      while(rs.next()) {
        s_id = rs.getString("s_id");
        String s_name = rs.getString("s_name");
        String s_pw = rs.getString("s_pw");
        String s_zipnum = rs.getString("s_zipnum");
        String s_addr = rs.getString("s_addr");
        String s_addr2 = rs.getString("s_addr2");
        String s_phone = rs.getString("s_phone");
        String s_email = rs.getString("s_email");
        Date regdate = rs.getDate("regdate");
        
        MemberDTO memberDto = new MemberDTO(s_id, s_name, s_pw, s_zipnum, s_addr, s_addr2, s_phone, s_email, regdate);
        memberList.add(memberDto);
      }
      
    } catch (Exception e) {
      e.printStackTrace();
    
    } finally {
      DBManager.close(conn, pstmt, rs);
    }
    return memberList;
  }*/
  
  // 맴버 수정
  public int memberUpdate(MemberDTO memberDto) {
    try {
      conn = DBManager.getConnection();
      String sql = "UPDATE shopmember "
                  + "SET s_name=?, s_pw=?, s_zipnum, s_addr=?, s_addr2=?, s_phone=?, s_email=? "
                  + " WHERE s_id=? ";
      
      pstmt = conn.prepareStatement(sql);
      
      pstmt.setString(1, memberDto.getS_name());
      pstmt.setString(2, memberDto.getS_pw());
      pstmt.setString(3, memberDto.getS_addr());
      pstmt.setString(4, memberDto.getS_addr2());
      pstmt.setString(5, memberDto.getS_phone());
      pstmt.setString(6, memberDto.getS_email());
      pstmt.setString(7, memberDto.getS_id());
      
      result = pstmt.executeUpdate();
      
      
    } catch (Exception e) {
      e.printStackTrace();
   
    } finally {
      DBManager.close(conn, pstmt);
    }
    
    return result;
  }
  
  // 로그인
  public MemberDTO checkLogin(String s_id, String s_pw){
	  try {
		  conn = DBManager.getConnection();
		  String  sql = "SELECT * FROM shopmember "
		  		+ "WHERE s_id=? AND s_pw =?";
		  pstmt = conn.prepareStatement(sql);
		  
		  pstmt.setString(1, s_id);
		  pstmt.setString(2, s_pw);
		  
		  rs = pstmt.executeQuery();
		  
		  while(rs.next()){
			  	s_id = rs.getString("s_id");
		        String s_name = rs.getString("s_name");
		        s_pw = rs.getString("s_pw");
		        String s_zipnum = rs.getString("s_zipnum");
		        String s_addr = rs.getString("s_addr");
		        String s_addr2 = rs.getString("s_addr2");
		        String s_phone = rs.getString("s_phone");
		        String s_email = rs.getString("s_email");
		        Date regdate = rs.getDate("regdate");
		        
		        memberDto = new MemberDTO(s_id, s_name, s_pw, s_zipnum, s_addr, s_addr2, s_phone, s_email, regdate);
		  }
		
	} catch (Exception e) {
		e.printStackTrace();
	
	} finally{
		DBManager.close(conn, pstmt, rs);
	}
	  return memberDto;
  }
  
  // 중복된 아이디 찾기
  public int idCheck(String ckid){
	  try {
		  
		conn = DBManager.getConnection();
		String sql = "SELECT * FROM shopmember WHERE s_id = ? ";
		pstmt = conn.prepareStatement(sql);
		
		pstmt.setString(1, ckid);
		
		rs = pstmt.executeQuery();
		
		if(rs.next() == true){
			result = 1;
		
		}else {
			result = 0;
		}
		
		
	} catch (Exception e) {
		e.printStackTrace();
	} finally {
		DBManager.close(conn, pstmt, rs);
	}
	  return result;
  }
  
  
}
