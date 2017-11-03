package brand;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.ws.Dispatch;

import dao.MemberDAO;
import dto.MemberDTO;
import jdk.nashorn.internal.ir.RuntimeNode.Request;
import oracle.jdbc.OracleResultSetMetaData.SecurityAttribute;
import sun.rmi.server.Dispatcher;

/**
 * Servlet implementation class IdCheckAction
 */
@WebServlet("/IdCheckAction")
public class IdCheckAction extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public IdCheckAction() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doGet");
		String ckid = request.getParameter("ckid");
		System.out.println("아이디값 = " +  ckid);
		
		MemberDAO memberDao = new MemberDAO();
		int result = memberDao.idCheck(ckid);
	
		if(result == 1){
			System.out.println("존재하는 아이디입니다.");
		
		}else if(result == 0) {
			System.out.println("사용해도 되는 아이디 입니다.");	
			
		}
		
		request.setAttribute("idCount", result);
		request.setAttribute("message", ckid); // 아이디를 변경하고나서 다시 체크할때 비교하기 위한값
	
		RequestDispatcher dis = request.getRequestDispatcher("idCheck.jsp");
		dis.forward(request, response);
		
		
	
		

	}
	
	
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doPost");
		
		request.setCharacterEncoding("UTF-8"); //한글깨짐 방지
		response.setContentType("text/html; charset=UTF-8");
		
		String ckid = request.getParameter("reckid");
		System.out.println("아이디값 = " +  ckid);
		
		MemberDAO memberDao = new MemberDAO();
		int result = memberDao.idCheck(ckid);
	
		if(result == 1){
			System.out.println("존재하는 아이디입니다.");
		
		}else if(result == 0) {
			System.out.println("사용해도 되는 아이디 입니다.");	
			
		}
		
		request.setAttribute("idCount", result);
		request.setAttribute("message", ckid); // 아이디를 변경하고나서 다시 체크할때 비교하기 위한값
	
		RequestDispatcher dis = request.getRequestDispatcher("idCheck.jsp");
		dis.forward(request, response);
	}

}
