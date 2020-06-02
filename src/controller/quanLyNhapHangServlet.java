package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.NhaHang.bean.*;
import com.NhaHang.bo.*;

/**
 * Servlet implementation class quanLyNhapHangServlet
 */
@WebServlet("/quanLyNhapHangServlet")
public class quanLyNhapHangServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public quanLyNhapHangServlet() {
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
		String action = request.getParameter("action");
		String message = "";
		
		if("delete".equals(action)){
			String listHoaDon = request.getParameter("listHoaDon");
			
			ArrayList<String> arrayHoaDon = new ArrayList<String>();
			String tam="";
			
			for(int i=0;i<listHoaDon.length();i++){
				if(listHoaDon.charAt(i) != ','){
					tam+=listHoaDon.charAt(i);
				}else{
					arrayHoaDon.add(tam);
					tam="";
				}
			}
			
			message = QuanLyNhapHangBO.deleteHoaDon(arrayHoaDon);
			
			response.getWriter().write(message);		
			return;
		}else if("xemChiTiet".equals(action)){
			String madonhang = request.getParameter("madonhang");
			
			HoaDon donHang = QuanLyNhapHangBO.getDonHang(madonhang);
			request.setAttribute("donHang", donHang);
			
			ArrayList<HoaDon> chiTietHoaDon = QuanLyNhapHangBO.getChiTietHoaDon(madonhang);
			request.setAttribute("chiTietHoaDon", chiTietHoaDon);
			
			RequestDispatcher requestDispatcher=request.getRequestDispatcher("chiTietNhapHang.jsp");
			requestDispatcher.forward(request, response);
		}else if("add".equals(action)){
			String tendonhang = request.getParameter("tendonhang");
			String ngaythang = request.getParameter("ngaythang");
			
			tendonhang = tendonhang.trim();
			ngaythang = ngaythang+" 00:00:00.000";
			
			message = QuanLyNhapHangBO.addHoaDon(tendonhang, ngaythang);
			
			response.getWriter().write(message);		
			return;
		}else if("showAdd".equals(action)){
			String madonhang = request.getParameter("madonhang2");
			
			HoaDon donHang = QuanLyNhapHangBO.getDonHang(madonhang);
			request.setAttribute("donHang", donHang);

			ArrayList<HoaDon> chiTietHoaDon = QuanLyNhapHangBO.getChiTietHoaDon(madonhang);
			request.setAttribute("chiTietHoaDon", chiTietHoaDon);
			
			RequestDispatcher requestDispatcher=request.getRequestDispatcher("quanLyNhapHangAdd.jsp");
			requestDispatcher.forward(request, response);
		}else if("addMatHang".equals(action)){
			
			String madonhang = request.getParameter("madonhang");
			
			String tenhang = request.getParameter("tenhang");
			String donvitinh = request.getParameter("donvitinh");
			String soluong = request.getParameter("soluong");
			String gia = request.getParameter("gia");
			
			QuanLyNhapHangBO.addMatHang(madonhang, tenhang, donvitinh, soluong, gia);
			
			HoaDon donHang = QuanLyNhapHangBO.getDonHang(madonhang);
			request.setAttribute("donHang", donHang);

			ArrayList<HoaDon> chiTietHoaDon = QuanLyNhapHangBO.getChiTietHoaDon(madonhang);
			request.setAttribute("chiTietHoaDon", chiTietHoaDon);
			
			RequestDispatcher requestDispatcher=request.getRequestDispatcher("quanLyNhapHangAdd.jsp");
			requestDispatcher.forward(request, response);
		}else if("deleteMatHang".equals(action)){
			String listMatHang = request.getParameter("listMatHang");
			
			ArrayList<String> arrayMatHang = new ArrayList<String>();
			String tam="";
			
			for(int i=0;i<listMatHang.length();i++){
				if(listMatHang.charAt(i) != ','){
					tam+=listMatHang.charAt(i);
				}else{
					arrayMatHang.add(tam);
					tam="";
				}
			}
			
			message = QuanLyNhapHangBO.deleteMatHang(arrayMatHang);
			
			response.getWriter().write(message);		
			return;
		}else if("showUpdate".equals(action)){
			String madonhang = request.getParameter("madonhang3");
			
			HoaDon donHang = QuanLyNhapHangBO.getDonHang(madonhang);
			request.setAttribute("donHang", donHang);

			ArrayList<HoaDon> chiTietHoaDon = QuanLyNhapHangBO.getChiTietHoaDon(madonhang);
			request.setAttribute("chiTietHoaDon", chiTietHoaDon);
			
			RequestDispatcher requestDispatcher=request.getRequestDispatcher("quanLyNhapHangUpdate.jsp");
			requestDispatcher.forward(request, response);
		}else if("addMatHangUpdate".equals(action)){
			
			String madonhang = request.getParameter("madonhang");
			
			String tenhang = request.getParameter("tenhang");
			String donvitinh = request.getParameter("donvitinh");
			String soluong = request.getParameter("soluong");
			String gia = request.getParameter("gia");
			
			QuanLyNhapHangBO.addMatHang(madonhang, tenhang, donvitinh, soluong, gia);
			
			HoaDon donHang = QuanLyNhapHangBO.getDonHang(madonhang);
			request.setAttribute("donHang", donHang);

			ArrayList<HoaDon> chiTietHoaDon = QuanLyNhapHangBO.getChiTietHoaDon(madonhang);
			request.setAttribute("chiTietHoaDon", chiTietHoaDon);
			
			RequestDispatcher requestDispatcher=request.getRequestDispatcher("quanLyNhapHangUpdate.jsp");
			requestDispatcher.forward(request, response);
		}else if("update".equals(action)){
			String madonhang = request.getParameter("madonhang");
			String tendonhang = request.getParameter("tendonhang");
			String ngaythang = request.getParameter("ngayNhapNew");
			
			if(ngaythang == "" || ngaythang == null){
				ngaythang = request.getParameter("ngayNhapOld");
				//  26/04/2014 ==> 2014/04/26
				String ngay = ngaythang.substring(0, 2);
				String thang = ngaythang.substring(3, 5);
				String nam = ngaythang.substring(6, 10);
				
				ngaythang = nam+"/"+thang+"/"+ngay;
			}
			
			tendonhang = tendonhang.trim();
			ngaythang = ngaythang+" 00:00:00.000";
			
			QuanLyNhapHangBO.updateHoaDon(madonhang, tendonhang, ngaythang);
			
			HoaDon donHang = QuanLyNhapHangBO.getDonHang(madonhang);
			request.setAttribute("donHang", donHang);

			ArrayList<HoaDon> chiTietHoaDon = QuanLyNhapHangBO.getChiTietHoaDon(madonhang);
			request.setAttribute("chiTietHoaDon", chiTietHoaDon);
			
			RequestDispatcher requestDispatcher=request.getRequestDispatcher("quanLyNhapHangUpdate.jsp");
			requestDispatcher.forward(request, response);
		}
	}

}
