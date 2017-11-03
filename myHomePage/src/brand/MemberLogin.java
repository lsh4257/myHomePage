package brand;

import java.io.IOException;

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
 * Servlet implementation class MemberLogin
 */
@WebServlet("/MemberLogin")
public class MemberLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberLogin() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doPost memberLogin");
		HttpSession session = request.getSession(true);
		//true(default)
		//session을 반환 , 만약 세션이 존재하지 않을경우 새로운 세션 생성
		
		//false
		// Session을, 만약 세션이 존재하지 않을경우  NULL 을 반환
		String id = request.getParameter("input_id").trim();
		String pw = request.getParameter("input_pw").trim();
		
		System.out.println(id);
		System.out.println(pw);
		
		MemberDAO memberDao = new MemberDAO();
		MemberDTO memberDto = memberDao.checkLogin(id, pw);
		
		
		String code;
		if(memberDto.getS_id() != null && memberDto.getS_pw() != null){
			// 세션초기화 
			session.removeAttribute("s_id");
			session.setAttribute("loginUser", memberDto);
			
			code = "BrandIndex";
			
		} else {
			code = "loginPage.jsp";
			request.setAttribute("code", "2");	
		}
		
		RequestDispatcher dis = request.getRequestDispatcher(code);
		dis.forward(request, response);
		
		
		/*if(memberDto.getS_id() == null || memberDto.getS_pw() == null){
			RequestDispatcher dis = request.getRequestDispatcher("loginPage.jsp");
			dis.forward(request, response);
			
			System.out.println("로그인 실패");
			
		}else {
			RequestDispatcher dis = request.getRequestDispatcher("BrandIndex");
			dis.forward(request, response);
			
			System.out.println("로그인 성공");
		}*/
			
	}
}

