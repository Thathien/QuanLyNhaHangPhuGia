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
 * Servlet implementation class showChonBanGuestServlet
 */
@WebServlet("/showChonBanGuestServlet")
public class showChonBanGuestServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public showChonBanGuestServlet() {
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
	    	
		 RequestDispatcher requestDispatcher=request.getRequestDispatcher("chonBanGuest.jsp");
		 requestDispatcher.forward(request, response);
	}

}
