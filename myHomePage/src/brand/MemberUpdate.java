package brand;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.MemberDAO;
import dto.MemberDTO;

/**
 * Servlet implementation class MemberUpdate
 */
@WebServlet("/MemberUpdate")
public class MemberUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public MemberUpdate() {
		super();
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
			
		System.out.println("doGet MemberUpdate");
	/*	  MemberDAO memberDao = new MemberDAO(); 
		  ArrayList<MemberDTO> memberList = new ArrayList<>(); 
		  request.setAttribute("memberList", memberList);
		  String s_id="1001"; memberList = memberDao.memberSearch(s_id);*/
		
		
		HttpSession session = request.getSession();
		session.getAttribute("loginUser");

		if (session.getAttribute("loginUser") == null) {
			response.sendRedirect("loginPage.jsp");
			System.out.println("로그인이 안되있습니다.");

		} else {
			RequestDispatcher dis = request.getRequestDispatcher("memberUpdate.jsp");
			dis.forward(request, response);
			/*response.sendRedirect("memberUpdate.jsp");*/
			
			System.out.println("로그인이 되있습니다.");
		}
		

		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8"); //한글깨짐 방지
		response.setContentType("text/html; charset=UTF-8");
		System.out.println("doPost MemberUpdate");
		
		MemberDAO memberDao = new MemberDAO();
		String s_id = request.getParameter("update_id");
		String s_name = request.getParameter("update_name");
		String s_pw = request.getParameter("update_pw");
		String s_zipnum = request.getParameter("update_zipnum");
		String s_addr = request.getParameter("update_addr");
		String s_addr2 = request.getParameter("update_addr2");
		String s_phone = request.getParameter("update_phone");
		String s_email = request.getParameter("update_email");
		
		MemberDTO memberDto = new MemberDTO(s_id, s_name, s_pw, s_zipnum, s_addr, s_addr2, s_phone, s_email);
		int result = memberDao.memberUpdate(memberDto);
		
		
		if(result > 0){
			System.out.println("회원수정 되었습니다.");
			
		}else{
			System.out.println("회원수정 실패하였습니다.");
		}
		
		HttpSession session = request.getSession();
		session.setAttribute("loginUser", memberDto);
		
		RequestDispatcher dis = request.getRequestDispatcher("BrandIndex");
		dis.forward(request, response);
		
	}

}
