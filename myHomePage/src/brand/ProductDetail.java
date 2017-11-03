package brand;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ProductDAO;
import dto.ProductDTO;

/**
 * Servlet implementation class ProductDetail
 */
@WebServlet("/ProductDetail")
public class ProductDetail extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProductDetail() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doGet");
		
		String bestCode = request.getParameter("bestCode");
		String newCode = request.getParameter("newCode");
		
		ArrayList<ProductDTO> bestList = new ArrayList<>();
		ArrayList<ProductDTO> newList = new ArrayList<>();
		ProductDAO productDao = new ProductDAO();
		
		bestList = productDao.bestProductDetail(bestCode);
		newList = productDao.newProductDetail(newCode);
		
		
		
		request.setAttribute("pDetail", bestList);
		request.setAttribute("pDetail", newList);
		
		RequestDispatcher dis = request.getRequestDispatcher("productDetail.jsp");
		dis.forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doPost");
/*		request.setCharacterEncoding("UTF-8"); //한글깨짐 방지
		response.setContentType("text/html; charset=UTF-8");
		
		String bestCode = request.getParameter("best_code");
		String newCode = request.getParameter("new_code");
		
		ArrayList<ProductDTO> bestList = new ArrayList<>();
		ArrayList<ProductDTO> newList = new ArrayList<>();
		ProductDAO productDao = new ProductDAO();
		
		bestList = productDao.bestProductDetail(bestCode);
		newList = productDao.newProductDetail(newCode);
		
		request.setAttribute("bestDetail", bestList);
		request.setAttribute("newList", newList);
		
		RequestDispatcher dis = request.getRequestDispatcher("productDetail.jsp");
		dis.forward(request, response);
		*/
	}

}
