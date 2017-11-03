package brand;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MemberDAO;
import dto.MemberDTO;

/**
 * Servlet implementation class MemberAdd
 */
@WebServlet("/MemberAdd")
public class MemberAdd extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberAdd() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doGet MemberAdd");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doPost MemberAdd");	
		request.setCharacterEncoding("UTF-8"); //한글깨짐 방지
		response.setContentType("text/html; charset=UTF-8");
		
		MemberDAO memberDao = new MemberDAO();
		
		String s_id = request.getParameter("member_id");
		String s_name = request.getParameter("member_name");
		String s_pw = request.getParameter("member_pw");
		String s_zipnum = request.getParameter("member_zipnum");
		String s_addr = request.getParameter("member_addr");
		String s_addr2 = request.getParameter("member_addr2");
		String s_phone = request.getParameter("member_phone");
		String s_email = request.getParameter("member_email");
		
		MemberDTO memberDto = new MemberDTO(s_id, s_name, s_pw, s_zipnum, s_addr, s_addr2, s_phone, s_email);
		memberDao.memberAdd(memberDto);
		
		request.setAttribute("mName", s_name);
		RequestDispatcher dis = request.getRequestDispatcher("welcomePage.jsp");
		dis.forward(request, response);
	}

}
