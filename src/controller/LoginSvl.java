
  package controller;
  
  import java.io.IOException; import javax.servlet.ServletException; import
  javax.servlet.annotation.WebServlet; import javax.servlet.http.HttpServlet;
  import javax.servlet.http.HttpServletRequest; import
  javax.servlet.http.HttpServletResponse; import
  javax.servlet.http.HttpSession;
  
  import bo.dangkybo;
  
 /**
	 * Servlet implementation class LoginSvl
	 */

  
  @WebServlet("/LoginSvl") public class LoginSvl extends HttpServlet { private
  static final long serialVersionUID = 1L;
  
 /**
	 * @see HttpServlet#HttpServlet()
	 */

  
  
  public LoginSvl() { super(); // TODO Auto-generated constructor stub } 
  }
  
  
  
 /**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */

  
  protected void doGet(HttpServletRequest request, HttpServletResponse
  response) throws ServletException, IOException { String username =
  request.getParameter("txtusername"); String password =
  request.getParameter("txtpassword"); HttpSession session =
  request.getSession(); dangkybo dk = new dangkybo(); try { if
  (dk.KTdangnhap(username, password)) session.setAttribute("tendangnhap",
  username); else session.setAttribute("tendangnhap", "mời bạn đăng nhập");
  response.sendRedirect("SachControllerLogin"); } catch (Exception tt) {
  tt.printStackTrace(); } }
  
 /**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
		  protected void doPost(HttpServletRequest request, HttpServletResponse
		  response) throws ServletException, IOException { // TODO Auto-generated
		  doGet(request, response); }
		  
		  }
		 