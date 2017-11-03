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
 * Servlet implementation class BrandIndex
 */
@WebServlet("/BrandIndex")
public class BrandIndex extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BrandIndex() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doGet BrandIndex");
		
		ProductDAO productDao = new ProductDAO();
		ArrayList<ProductDTO> newList = productDao.listNewProduct();
		ArrayList<ProductDTO> bestList = productDao.listBestProduct();
		
		request.setAttribute("newList", newList);
		request.setAttribute("bestList", bestList);
		
		RequestDispatcher dis = request.getRequestDispatcher("index.jsp");
		dis.forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doPost BrandIndex");
		
		ProductDAO productDao = new ProductDAO();
		ArrayList<ProductDTO> newList = productDao.listNewProduct();
		ArrayList<ProductDTO> bestList = productDao.listBestProduct();
		
		request.setAttribute("newList", newList);
		request.setAttribute("bestList", bestList);
		
		RequestDispatcher dis = request.getRequestDispatcher("index.jsp");
		dis.forward(request, response);
	}

}
