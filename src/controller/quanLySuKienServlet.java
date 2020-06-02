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
 * Servlet implementation class quanLySuKienServlet
 */
@WebServlet("/quanLySuKienServlet")
public class quanLySuKienServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public quanLySuKienServlet() {
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
		
		
		if("delete".equals(action)){
			String listEvent = request.getParameter("listEvent");
			
			ArrayList<String> arrayEvent = new ArrayList<String>();
			String tam="";
			
			for(int i=0;i<listEvent.length();i++){
				if(listEvent.charAt(i) != ','){
					tam+=listEvent.charAt(i);
				}else{
					arrayEvent.add(tam);
					tam="";
				}
			}
			
			message = QuanLySuKienBO.deleteEvent(arrayEvent);
			
			response.getWriter().write(message);		
			return;
		}else if("add".equals(action)){
			String noidung = request.getParameter("noidung");
			String hienthi = request.getParameter("hienthi");
			noidung = noidung.trim();
			
			message = QuanLySuKienBO.addEvent(noidung, hienthi);
			
			response.getWriter().write(message);		
			return;
		}else if("showUpdate".equals(action)){
			String stt = request.getParameter("stt");
			
			SuKien event = QuanLySuKienBO.getEvent(stt);
			request.setAttribute("event", event);
			
			ArrayList<SuKien> listEvent = ShowQuanLySuKienBO.getEvent();
			request.setAttribute("listEvent", listEvent);
			
			RequestDispatcher requestDispatcher=request.getRequestDispatcher("quanLySuKienUpdate.jsp");
			requestDispatcher.forward(request, response);
		}else if("update".equals(action)){
			String noidung2 = request.getParameter("noidung2");
			String hienthi2 = request.getParameter("hienthi2");
			String stt2 = request.getParameter("stt2");
			
			noidung2 = noidung2.trim();
			
			message = QuanLySuKienBO.updateEvent(stt2, noidung2, hienthi2);
			
			response.getWriter().write(message);		
			return;
		}
	}

}
