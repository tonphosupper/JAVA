package controller;

import java.io.IOException;
import java.util.Random;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.KHbean;
import bo.dangkybo;


/**
 * Servlet implementation class dangkycontroller
 */
@WebServlet("/dangkycontroller")
public class dangkycontroller extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public dangkycontroller() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			
			Random makh = new Random();
			int ID = makh.nextInt();
			 
			String hoten = request.getParameter("txthoten");
			String diachi = request.getParameter("txtdiachi");
			String sodt = request.getParameter("txtsdt");
			String email = request.getParameter("txtemail");
			String un=request.getParameter("txttendn");
			String pass=request.getParameter("txtpass");
			
			dangkybo dk = new dangkybo();
			KHbean kh = new KHbean(ID, hoten, diachi, sodt, email, un, pass);
			dk.dangkyKH(kh);
			
			RequestDispatcher rd = request.getRequestDispatcher("SachController");
			rd.forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
