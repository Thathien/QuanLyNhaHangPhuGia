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
 * Servlet implementation class quanLyNhanVienServlet
 */
@WebServlet("/quanLyNhanVienServlet")
public class quanLyNhanVienServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public quanLyNhanVienServlet() {
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
			String listNhanVien = request.getParameter("listNhanVien");
			
			ArrayList<String> arrayNhanVien = new ArrayList<String>();
			String tam="";
			
			for(int i=0;i<listNhanVien.length();i++){
				if(listNhanVien.charAt(i) != ','){
					tam+=listNhanVien.charAt(i);
				}else{
					arrayNhanVien.add(tam);
					tam="";
				}
			}
			
			message = QuanLyNhanVienBO.deleteNhanVien(arrayNhanVien);
			
			response.getWriter().write(message);		
			return;
		}else if("add".equals(action)){
			String tenNV = request.getParameter("tenNV").trim();
			String gioiTinh = request.getParameter("gioiTinh");
			String ngaySinh = request.getParameter("ngaySinh")+" 00:00:00.000";
			String queQuan = request.getParameter("queQuan").trim();
			String cmnd = request.getParameter("cmnd");
			String dienThoai = request.getParameter("dienThoai");
			String chucVu = request.getParameter("chucVu");
			String luongCoBan = request.getParameter("luongCoBan");
			
			if(dienThoai == null) dienThoai = "";
			
			message = QuanLyNhanVienBO.addNhanVien(tenNV, gioiTinh, ngaySinh, queQuan, cmnd, dienThoai, chucVu, luongCoBan);
			
			response.getWriter().write(message);		
			return;
		}else if("showUpdate".equals(action)){
			String maNV = request.getParameter("maNV");
			
			NhanVien nhanVien = QuanLyNhanVienBO.getNhanVien(maNV);
			request.setAttribute("nhanVien", nhanVien);
			
			String sapXep = "9";
			
			ArrayList<NhanVien> listNhanVien = showQuanLyNhanVienBO.getListNhanVien(Integer.parseInt(sapXep));
			request.setAttribute("listNhanVien", listNhanVien);
			
			RequestDispatcher requestDispatcher=request.getRequestDispatcher("quanLyNhanVienUpdate.jsp");
			requestDispatcher.forward(request, response);
		}else if("update".equals(action)){
			String maNV = request.getParameter("maNV");
			String tenNV = request.getParameter("tenNV").trim();
			String gioiTinh = request.getParameter("gioiTinh");
			String ngaySinh = request.getParameter("ngaySinh");
			String queQuan = request.getParameter("queQuan").trim();
			String cmnd = request.getParameter("cmnd");
			String dienThoai = request.getParameter("dienThoai");
			String chucVu = request.getParameter("chucVu");
			String chucVuOld = request.getParameter("chucVuOld");
			String luongCoBan = request.getParameter("luongCoBan");
			
			if(dienThoai == null) dienThoai = "";
			
			//  05/07/2020 ==> 2020/07/05
			String ngay = ngaySinh.substring(0, 2);
			String thang = ngaySinh.substring(3, 5);
			String nam = ngaySinh.substring(6, 10);
						
			ngaySinh = nam+"/"+thang+"/"+ngay+" 00:00:00.000";
			
			
			message = QuanLyNhanVienBO.updateNhanVien(maNV, tenNV, gioiTinh, ngaySinh, queQuan, cmnd, dienThoai, chucVu, chucVuOld, luongCoBan);
			
			response.getWriter().write(message);		
			return;
		}
	}

}
