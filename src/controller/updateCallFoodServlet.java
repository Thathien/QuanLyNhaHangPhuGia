package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.NhaHang.bo.updateCallFoodBO;

/**
 * Servlet implementation class updateCallFoodServlet
 */
@WebServlet("/updateCallFoodServlet")
public class updateCallFoodServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public updateCallFoodServlet() {
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
		request.setCharacterEncoding("UTF-8");
		String actor = request.getParameter("actor");
		
		if("chefs".equals(actor)){
			int stt = Integer.parseInt(request.getParameter("stt"));
			String trangthaigoi = request.getParameter("trangthaigoi").trim();
			String phanhoidaubep = request.getParameter("phanhoidaubep").trim();
			int soLuongCheBien = Integer.parseInt(request.getParameter("soLuongCheBien"));
			
			String message = updateCallFoodBO.updateCallFoodChefs(stt,trangthaigoi,phanhoidaubep, soLuongCheBien);
			request.setAttribute("message", message);
			
			RequestDispatcher requestDispatcher=request.getRequestDispatcher("showQuanLyGoiMonServlet");
			requestDispatcher.forward(request, response);
		}else if("guest".equals(actor)){
			String soLuong = request.getParameter("soLuong");
			int stt = Integer.parseInt(request.getParameter("stt"));
			String soBan = request.getParameter("soBan");
			
			String message = updateCallFoodBO.updateCallFoodGuest(stt,soLuong);
			request.setAttribute("message", message);
			
			HttpSession session=request.getSession(true);
			session.setAttribute("tableNumberSession", soBan);	
			
			RequestDispatcher requestDispatcher=request.getRequestDispatcher("showMonDaGoiServlet");
			requestDispatcher.forward(request, response);
		}
	}

}
