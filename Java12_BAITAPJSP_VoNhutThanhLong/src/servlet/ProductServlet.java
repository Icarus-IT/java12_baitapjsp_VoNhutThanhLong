
package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import entity.Product;

/**
 *
 * @author USER
 */
@WebServlet(name = "ProductServlet", urlPatterns = { "/ProductServlet" })
public class ProductServlet extends HttpServlet {

	private final String PRODUCT_PAGE = "product.jsp";

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		ArrayList<Product> list = new ArrayList<Product>();
		list.add(new Product("Điện thoại Nokia", 20, 1500000));
		list.add(new Product("Điện thoại Samsung", 50, 5500000));
		HttpSession session = request.getSession();
		session.setAttribute("PRODUCTLIST", list);
		response.setCharacterEncoding("UTF-8");
		String url = PRODUCT_PAGE;
		RequestDispatcher rd = request.getRequestDispatcher(url);
		rd.forward(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			String name = request.getParameter("txtName");
			int quantity = Integer.parseInt(request.getParameter("txtQuantity"));
			float price = Float.parseFloat(request.getParameter("txtPrice"));
			HttpSession session = request.getSession();
			ArrayList<Product> list = (ArrayList<Product>) session.getAttribute("PRODUCTLIST");
			Product newProduct = new Product(name, quantity, price);
			if (!list.contains(newProduct)) {
				list.add(newProduct);
				request.setAttribute("SUCCESS", "Add product successfully");
			} else {

				request.setAttribute("FAIL", "Add product failed!!!, Duplicate product!!!");
			}

		} catch (Exception e) {
			request.setAttribute("FAIL", "Add product failed");
		} finally {
			String url = PRODUCT_PAGE;
			RequestDispatcher rd = request.getRequestDispatcher(url);
			rd.forward(request, response);
		}
	}

	@Override
	public String getServletInfo() {
		return "Short description";
	}// </editor-fold>

}
