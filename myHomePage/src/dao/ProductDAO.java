package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import common.DBManager;
import dto.ProductDTO;

  public class ProductDAO {
  	Connection conn = null;
  	PreparedStatement pstmt = null;
  	ResultSet rs = null;
  	int result = 0;
  	ArrayList<ProductDTO> bestList = new ArrayList<ProductDTO>();
  	ArrayList<ProductDTO> newList = new ArrayList<ProductDTO>();


	// 신상품 리스트
  	public ArrayList<ProductDTO> listNewProduct(){
  		newList = new ArrayList<>();
  		try {
  			conn = DBManager.getConnection();
  			String sql = "SELECT * FROM new_pro_view ";
  			pstmt = conn.prepareStatement(sql);
  			
  			rs= pstmt.executeQuery();
  			
  			while(rs.next()){
  				String p_code = rs.getString("p_code");
  				String p_name = rs.getString("p_name");
  				int p_price2 = rs.getInt("p_price2");
  				String p_img = rs.getString("p_img");
  				
  				ProductDTO productDto = new ProductDTO(p_code, p_name, p_price2, p_img);
  				newList.add(productDto);
  			}
  			
  				for(int i = 0; i < newList.size(); i++){
  					System.out.print(newList.get(i).getP_code());
  					System.out.print(newList.get(i).getP_name());
  					System.out.print(newList.get(i).getP_price2());
  					System.out.print(newList.get(i).getP_img());
  					System.out.println();
  				}
  			
  			
  		} catch (Exception e) {
  			e.printStackTrace();
  			
  		} finally{
  			
  		}
  		return newList;
  	}
	
  	//베스트상품 리스트
  	public ArrayList<ProductDTO> listBestProduct(){
  		bestList = new ArrayList<>();
  		try {
  			conn = DBManager.getConnection();
  			String sql = "SELECT * FROM best_pro_view";
  			pstmt = conn.prepareStatement(sql);
  			
  			rs= pstmt.executeQuery();
  			
  			while(rs.next()){
  				String p_code = rs.getString("p_code");
  				String p_name = rs.getString("p_name");
  				int p_price2 = rs.getInt("p_price2");
  				String p_img = rs.getString("p_img");
  				
  				ProductDTO productDto = new ProductDTO(p_code, p_name, p_price2, p_img);
  				bestList.add(productDto);
  			}
  			
  				for(int i = 0; i < bestList.size(); i++){
  					System.out.print(bestList.get(i).getP_code());
  					System.out.print(bestList.get(i).getP_name());
  					System.out.print(bestList.get(i).getP_price2());
  					System.out.print(bestList.get(i).getP_img());
  					System.out.println();
  				}
  			
  			
  		} catch (Exception e) {
  			e.printStackTrace();
  			
  		} finally{
  			
  		}
  		return bestList;
  	}
  	
  	// new 상품 상제정보
  	public ArrayList<ProductDTO> newProductDetail(String p_code){
  		try {
  			conn = DBManager.getConnection();
  			String sql = "SELECT * FROM new_pro_view"
  						+ " WHERE p_code = ? ";
  			pstmt = conn.prepareStatement(sql);
  			pstmt.setString(1, p_code);
  			
  			rs = pstmt.executeQuery();
			
  			while(rs.next()){
  				p_code = rs.getString("p_code");
  				String p_name = rs.getString("p_name");
  				int p_price2 = rs.getInt("p_price2");
  				String p_img = rs.getString("p_img");
  				
  				ProductDTO productDto = new ProductDTO(p_code, p_name, p_price2, p_img);
  				newList.add(productDto);
  			}
  			
  			
		} catch (Exception e) {
			e.printStackTrace();
		
		} finally {
			DBManager.close(conn, pstmt, rs);
			
		}
  		return newList;
  	}
  	
  	// best 상품 상세정보
	public ArrayList<ProductDTO> bestProductDetail(String p_code){
  		try {
  			conn = DBManager.getConnection();
  			String sql = "SELECT * FROM best_pro_view"
  						+ " WHERE p_code = ? ";
  			pstmt = conn.prepareStatement(sql);
  			pstmt.setString(1, p_code);
  			
  			rs = pstmt.executeQuery();
			
  			while(rs.next()){
  				p_code = rs.getString("p_code");
  				String p_name = rs.getString("p_name");
  				int p_price2 = rs.getInt("p_price2");
  				String p_img = rs.getString("p_img");
  				
  				ProductDTO productDto = new ProductDTO(p_code, p_name, p_price2, p_img);
  				bestList.add(productDto);
  			}
  			
  			
		} catch (Exception e) {
			e.printStackTrace();
		
		} finally {
			DBManager.close(conn, pstmt, rs);
			
		}
  		return bestList;
  	}
  	
  }


