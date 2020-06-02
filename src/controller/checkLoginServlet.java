package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.NhaHang.bean.*;
import com.NhaHang.bo.*;

/**
 * Servlet implementation class checkLoginServlet
 */
@WebServlet("/checkLoginServlet")
public class checkLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public checkLoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String action = request.getParameter("action");
		if("ajax".equals(action)){
			String userName = request.getParameter("txtUser");
			String password = request.getParameter("txtPassword");
			String message="0";
			User user = CheckLoginBO.checkLogin(userName,password);
			if(user != null){
				message=""+user.getQuyen();
			}
			System.out.println("UserName: "+userName+" | Password: "+password+" | Role: "+message);
			response.getWriter().write(message);		
			return;
		}else if("form".equals(action)){
			HttpSession session = request.getSession(true);
			String quyen = request.getParameter("quyen");
			session.setAttribute("security", quyen);
			RequestDispatcher requestDispatcher;
			switch(Integer.parseInt(quyen)){
			case 1:
				requestDispatcher=request.getRequestDispatcher("homePageAdmin.jsp");
				requestDispatcher.forward(request, response);
				break;
			case 2:
				requestDispatcher=request.getRequestDispatcher("showQuanLyBanHangServlet_quanly");
				requestDispatcher.forward(request, response);
				break;
			case 3:
				requestDispatcher=request.getRequestDispatcher("showQuanLyGoiMonServlet");
				requestDispatcher.forward(request, response);
				break;
			case 4:
				requestDispatcher=request.getRequestDispatcher("showChonBanGuestServlet");
				requestDispatcher.forward(request, response);
			}
		}
	}

}
