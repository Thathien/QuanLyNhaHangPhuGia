package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.NhaHang.bo.*;

/**
 * Servlet implementation class thietLapTaiKhoanServlet
 */
@WebServlet("/thietLapTaiKhoanServlet")
public class thietLapTaiKhoanServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public thietLapTaiKhoanServlet() {
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
		String message = "";
		
		if("delete".equals(action)){
			String listUser = request.getParameter("listUser");
			
			ArrayList<String> arrayUser = new ArrayList<String>();
			String tam="";
			
			for(int i=0;i<listUser.length();i++){
				if(listUser.charAt(i) != ','){
					tam+=listUser.charAt(i);
				}else{
					arrayUser.add(tam);
					tam="";
				}
			}
			
			message = thietLapTaiKhoanBO.deleteUser(arrayUser);
			
			response.getWriter().write(message);		
			return;
		}else if("add".equals(action)){
			String tenTaiKhoan = request.getParameter("tenTaiKhoan");
			String matKhau = request.getParameter("matKhau");
			String phanQuyen = request.getParameter("phanQuyen");
			
			message = thietLapTaiKhoanBO.addUser(tenTaiKhoan, matKhau, phanQuyen);
			
			response.getWriter().write(message);
			return;
		}else if("change".equals(action)){
			String tenTaiKhoan = request.getParameter("tenTaiKhoan");
			String matKhauHienTai = request.getParameter("matKhauHienTai");
			String matKhauMoi = request.getParameter("matKhauMoi");
			
			message = thietLapTaiKhoanBO.changePassword(tenTaiKhoan, matKhauHienTai, matKhauMoi);
			
			response.getWriter().write(message);
			return;
		}
	}

}
