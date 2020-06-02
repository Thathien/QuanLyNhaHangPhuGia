package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.NhaHang.bean.Food;
import com.NhaHang.bean.SuKien;
import com.NhaHang.bo.ShowGoiMonBO;
import com.NhaHang.bo.ShowMoiDaGoiBO;
import com.NhaHang.bo.ShowQuanLySuKienBO;

/**
 * Servlet implementation class showMonDaGoiServlet
 */
@WebServlet("/showMonDaGoiServlet")
public class showMonDaGoiServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public showMonDaGoiServlet() {
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
		HttpSession session=request.getSession(true);
		//Lấy số bàn
		String tableNumberSession = (String)session.getAttribute("tableNumberSession");
		session.setAttribute("tableNumberSession", tableNumberSession);
		if(ShowGoiMonBO.checkTable(tableNumberSession)){		
			//Lấy danh sách và thông tin món ăn đã gọi
			ArrayList<Food> listFoodCall = ShowMoiDaGoiBO.getListFoodCall(tableNumberSession);
			request.setAttribute("listFoodCall", listFoodCall);
			
			//Lấy danh sách sự kiện
			ArrayList<SuKien> listEvent = ShowQuanLySuKienBO.getEventForGuest();
			request.setAttribute("listEvent", listEvent);
			
			RequestDispatcher requestDispatcher=request.getRequestDispatcher("monDaGoi.jsp");
			requestDispatcher.forward(request, response);
		}else{
			 String message="ok";
			 request.setAttribute("message", message);
			 
			 RequestDispatcher requestDispatcher=request.getRequestDispatcher("showDangNhapServlet");
			 requestDispatcher.forward(request, response);
		}
	}

}
