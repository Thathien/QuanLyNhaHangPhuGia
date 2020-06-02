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
 * Servlet implementation class showQuanLyBanHangServlet_quanly
 */
@WebServlet("/showQuanLyBanHangServlet_quanly")
public class showQuanLyBanHangServlet_quanly extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public showQuanLyBanHangServlet_quanly() {
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
		ArrayList<Table> listTable = ShowQuanLyBanHangBO.getInfoListTable();
		request.setAttribute("listTable", listTable);
		
		RequestDispatcher requestDispatcher=request.getRequestDispatcher("quanLyBanHang_quanly.jsp");
		requestDispatcher.forward(request, response);
	}

}
