package controller;

import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.NhaHang.bean.Food;
import com.NhaHang.bo.*;

/**
 * Servlet implementation class showHoaDonServlet
 */
@WebServlet("/showHoaDonServlet")
public class showHoaDonServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public showHoaDonServlet() {
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
		// TODO Auto-generated method stub
		String tableNumber = request.getParameter("tableNumber");
		request.setAttribute("tableNumber", tableNumber);
		
		ArrayList<Food> listFood = ShowHoaDonBO.getListFood(tableNumber);
		request.setAttribute("listFood", listFood);
		
		ArrayList<Integer> listMaGoiMon = new ArrayList<Integer>();
		
		listMaGoiMon.add(listFood.get(0).getMagoimon());
		int kt=0;
		
		for(Food s : listFood){
			kt=0;
			for(int i=0;i<listMaGoiMon.size();i++){
				if(listMaGoiMon.get(i)==s.getMagoimon()) kt=1;
			}
			
			if(kt==0) listMaGoiMon.add(s.getMagoimon());
		}
		ShowHoaDonBO.updateTrangThaiTinhTien(listMaGoiMon);
		ShowHoaDonBO.luuLichSuBanHang(listMaGoiMon);
		
		DateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
		Date date = new Date();		
		String gioHienTai = dateFormat.format(date);
		request.setAttribute("gioHienTai", gioHienTai);		
		
		RequestDispatcher requestDispatcher=request.getRequestDispatcher("hoaDon.jsp");
		requestDispatcher.forward(request, response);
	}

}
