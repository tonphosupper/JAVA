package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.Account;
import dao.AdminDAO;

/**
 * Servlet implementation class logincontroller
 */
@WebServlet("/logincontroller")
public class logincontroller extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public logincontroller() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		try {
			String username = request.getParameter("txtusername");
			String password = request.getParameter("txtpassword");

			boolean isValid = Account.checkLogin(username, password);
			boolean isValidAd = AdminDAO.checkLoginAdmin(username, password);
			HttpSession session = request.getSession();
			if (isValid) {

				session.setAttribute("tendangnhap", username);
				RequestDispatcher rd = request.getRequestDispatcher("SachControllerLogin");
				rd.forward(request, response);
			} else {
				if (isValidAd) {

					session.setAttribute("tendangnhap", username);
					RequestDispatcher rd = request.getRequestDispatcher("AdminController");
					rd.forward(request, response);
				} else {
					RequestDispatcher rd = request.getRequestDispatcher("SachController");
					rd.forward(request, response);
				}
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			out.close();
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
