package controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.LinkedHashSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.NhaHang.bean.FoodGuestCall;
import com.NhaHang.bo.showQuanLyGoiMonBO;

/**
 * Servlet implementation class showQuanLyGoiMonServlet
 */
@WebServlet("/showQuanLyGoiMonServlet")
public class showQuanLyGoiMonServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public showQuanLyGoiMonServlet() {
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
		ArrayList<FoodGuestCall> listFoodGuestCall = showQuanLyGoiMonBO.getListFoodGuestCall();
		ArrayList<FoodGuestCall> listYeuCauThem = new ArrayList<FoodGuestCall>();
		
		if(listFoodGuestCall != null){
			LinkedHashSet<Integer> hs = new LinkedHashSet<Integer>();
			//loại bỏ trùng 
			//Qua LinkedHashSet: 15 4 15 9 4 9 ==> 15 4 9
			for(FoodGuestCall s : listFoodGuestCall){
				hs.add(s.getSoban());
			}
			
			listYeuCauThem = showQuanLyGoiMonBO.getListYeuCauThem(hs);
			
			request.setAttribute("listYeuCauThem", listYeuCauThem);
			request.setAttribute("hs", hs);
		}
		
		request.setAttribute("listFoodGuestCall", listFoodGuestCall);
		
		RequestDispatcher requestDispatcher=request.getRequestDispatcher("quanLyGoiMon.jsp");
		requestDispatcher.forward(request, response);
	}

}
