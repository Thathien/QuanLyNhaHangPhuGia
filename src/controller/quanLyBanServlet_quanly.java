package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import  com.NhaHang.bo.QuanLyBanBO;;

/**
 * Servlet implementation class quanLyBanServlet_quanly
 */
@WebServlet("/quanLyBanServlet_quanly")
public class quanLyBanServlet_quanly extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public quanLyBanServlet_quanly() {
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
		String message="";
		
		switch (action) {
		//Xóa bàn (chỉ update trạng thái bàn ẩn đi)
		case "delete":	String listTable = request.getParameter("listTable");
		
						ArrayList<String> arrayTable = new ArrayList<String>();
						String tam="";
						
						for(int i=0;i<listTable.length();i++){
							if(listTable.charAt(i) != ','){
								tam+=listTable.charAt(i);
							}else{
								arrayTable.add(tam);
								tam="";
							}
						}
						message=QuanLyBanBO.deleteListTable(arrayTable);
						
						response.getWriter().write(message);		
						return;	
		//Thêm mới bàn
		case "add":	 	int soLuong = Integer.parseInt(request.getParameter("soLuong"));
						message=QuanLyBanBO.addTable(soLuong);
					
					 	response.getWriter().write(message);		
					 	return;	
		//Chuyển bàn	
		case "change":	int from = Integer.parseInt(request.getParameter("from"));
						int to = Integer.parseInt(request.getParameter("to"));
						
						QuanLyBanBO.changeTable(from,to);
						
						RequestDispatcher requestDispatcher=request.getRequestDispatcher("showQuanLyBanHangServlet_quanly");
						requestDispatcher.forward(request, response);
		}
	}

}
