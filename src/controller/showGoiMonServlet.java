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
import com.NhaHang.bo.ShowQuanLySuKienBO;

/**
 * Servlet implementation class showGoiMonServlet
 */
@WebServlet("/showGoiMonServlet")
public class showGoiMonServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public showGoiMonServlet() {
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
		String tableNumberSession = request.getParameter("tableNumber");

		if(tableNumberSession == null){
			
			//Nếu không phải vừa đăng nhập thì lấy số bàn lưu trong session
			tableNumberSession = (String)session.getAttribute("tableNumberSession");
		}
		//Nếu bàn này chưa xóa trong CSDL thì cho phép chọn và hiển thị gọi món
		if(ShowGoiMonBO.checkTable(tableNumberSession)){
			System.out.println("Table: "+tableNumberSession);
			session.setAttribute("tableNumberSession", tableNumberSession);		
					
			//Lấy danh sách và thông tin món ăn
			ArrayList<Food> listFood = ShowGoiMonBO.getListFood();
			request.setAttribute("listFood", listFood);
					
			//Lấy tên từng loại món ăn
			ArrayList<String> listTypeFood = ShowGoiMonBO.getListTypeFood();
			request.setAttribute("listTypeFood", listTypeFood);
					
			//Lấy danh sách sự kiện
			ArrayList<SuKien> listEvent = ShowQuanLySuKienBO.getEventForGuest();
			request.setAttribute("listEvent", listEvent);
					
			RequestDispatcher requestDispatcher=request.getRequestDispatcher("goiMon.jsp");
			requestDispatcher.forward(request, response);
		}else{
				String message="ok";
				request.setAttribute("message", message);
					 
				RequestDispatcher requestDispatcher=request.getRequestDispatcher("showDangNhapServlet");
				requestDispatcher.forward(request, response);
			}
	}

}
