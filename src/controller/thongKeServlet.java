package controller;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.NhaHang.bean.*;
import com.NhaHang.bo.*;

/**
 * Servlet implementation class thongKeServlet
 */
@WebServlet("/thongKeServlet")
public class thongKeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public thongKeServlet() {
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
		
		if("doanhThuThongKeThang".equals(action)){
			String nam = request.getParameter("nam");
			request.setAttribute("nam", nam);
			
			ArrayList<LichSuBanHang> listLichSu = ThongKeBO.getListLichSu(nam);			
			request.setAttribute("listLichSu", listLichSu);
			
			RequestDispatcher requestDispatcher=request.getRequestDispatcher("thongKeBanHangKQ.jsp");
			requestDispatcher.forward(request, response);
		}else if("doanhThuThongKeNam".equals(action)){
			String namBatDau = request.getParameter("namBatDau");
			String namKetThuc = request.getParameter("namKetThuc");
			
			if(namBatDau.equals(namKetThuc)){
				request.setAttribute("nam", namKetThuc);
				
				ArrayList<LichSuBanHang> listLichSu = ThongKeBO.getListLichSu(namKetThuc);			
				request.setAttribute("listLichSu", listLichSu);
				
				RequestDispatcher requestDispatcher=request.getRequestDispatcher("thongKeBanHangKQ.jsp");
				requestDispatcher.forward(request, response);
			}else{
				request.setAttribute("namBatDau", namBatDau);
				request.setAttribute("namKetThuc", namKetThuc);
				
				ArrayList<LichSuBanHang> listLichSu = ThongKeBO.getListLichSuNam(namBatDau, namKetThuc);			
				request.setAttribute("listLichSu", listLichSu);
				
				RequestDispatcher requestDispatcher=request.getRequestDispatcher("thongKeBanHangKQNam.jsp");
				requestDispatcher.forward(request, response);
			}
		}else if("doanhThuThongKeKTG".equals(action)){
			String tuNgay = request.getParameter("tuNgay");
			String denNgay = request.getParameter("denNgay");
			
			SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
			SimpleDateFormat formatOut = new SimpleDateFormat("dd/MM/yyyy");
			Date sDate = null;
			Date eDate = null;
			long diff = 0;	
			
			try {
				sDate = format.parse(tuNgay);
				eDate = format.parse(denNgay);
				diff = (eDate.getTime() - sDate.getTime())/(24 * 60 * 60 * 1000);
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			request.setAttribute("diff", diff+"");
			request.setAttribute("tuNgay", formatOut.format(sDate));
			request.setAttribute("denNgay", formatOut.format(eDate));
			
			ArrayList<LichSuBanHang> listLichSu = ThongKeBO.getListLichSuKTG(tuNgay, denNgay);	
			request.setAttribute("listLichSu", listLichSu);
			
			RequestDispatcher requestDispatcher=request.getRequestDispatcher("thongKeBanHangKQKTG.jsp");
			requestDispatcher.forward(request, response);
		}else if("thongKeMonAn".equals(action)){
			String startDay = request.getParameter("startDay") +" 00:00:00";
			String endDay = request.getParameter("endDay")+" 23:59:59";
			int sapXep = Integer.parseInt(request.getParameter("sapXep"));
			int top = Integer.parseInt(request.getParameter("top"));
			int type = Integer.parseInt(request.getParameter("type"));
			
			
			
			//Thống kê 1 là món ăn, 2 là thức uống
			
			//Lấy danh sách món ăn theo yêu cầu thống kê
			//===============================================================================================
			System.out.println("Thống kê "
					   + (top==0? "tất cả" : "top "+top)
					   + (type==1? " món ăn" : " thức uống")
					   + " bán được "
					   + (sapXep==1? "nhiều nhất": "ít nhất")
					   + " từ ngày "+startDay
					   + " đến ngày "+endDay);
			
			ArrayList<FoodInThongKe> listFood = ThongKeBO.getListThongKeMonAn(startDay, endDay, sapXep, top, type);	
			request.setAttribute("listFood", listFood);
			//================================================================================================
			
			//Lấy thông báo lựa chọn thống kê
			//========================================================================
			String message="Thống kê "
					   + (top==0? "tất cả" : "top "+top)
					   + (type==1? " món ăn" : " thức uống")
					   + " bán được "
					   + (sapXep==1? "nhiều nhất": "ít nhất");
			
			String sDay=request.getParameter("startDay");
			String eDay=request.getParameter("endDay");

			sDay=sDay.substring(8,10)+"/"+sDay.substring(5,7)+"/"+sDay.substring(0,4);
			eDay=eDay.substring(8,10)+"/"+eDay.substring(5,7)+"/"+eDay.substring(0,4);
			
			String message2="";
			if(sDay.equals(eDay)){
				message2="trong ngày "+eDay;
			}else{
				message2="từ ngày "+sDay+" đến ngày "+eDay;
			}
			
			request.setAttribute("message", message);
			request.setAttribute("message2", message2);
			//=============================================================================
			
			//Lấy ngày bắt đầu, ngày kết thúc
			//==============================================================
			SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
			SimpleDateFormat formatOut = new SimpleDateFormat("dd/MM/yyyy");
			Date sDate = null;
			Date eDate = null;			
			
			try {
				sDate = format.parse(request.getParameter("startDay"));
				eDate = format.parse(request.getParameter("endDay"));
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			request.setAttribute("tuNgay", formatOut.format(sDate));
			request.setAttribute("denNgay", formatOut.format(eDate));
			//================================================================
			
			RequestDispatcher requestDispatcher=request.getRequestDispatcher("thongKeMonAnKQ.jsp");
			requestDispatcher.forward(request, response);
		}
	}

}
