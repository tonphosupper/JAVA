package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bo.giohangbo;

/**
 * Servlet implementation class datmuacontroller
 */
@WebServlet("/datmuacontroller")
public class datmuacontroller extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public datmuacontroller() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String anh= request.getParameter("anh");
		String ms= request.getParameter("ms");
		String ts=request.getParameter("ts");
		String giatam=request.getParameter("gia");
		HttpSession session =request.getSession();
		if(ms!=null){
			giohangbo gh;
			if(session.getAttribute("gh")==null){ //mua lan dau
				gh=new giohangbo(); //
				session.setAttribute("gh",gh );
			}
			gh=(giohangbo)session.getAttribute("gh");
			gh.Themm(anh,ms, ts, Long.parseLong(giatam), 1);
			session.setAttribute("gh", gh);
			RequestDispatcher rd = request.getRequestDispatcher("htgio.jsp");
			rd.forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
