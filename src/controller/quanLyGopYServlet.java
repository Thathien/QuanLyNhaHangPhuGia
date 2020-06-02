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
 * Servlet implementation class quanLyGopYServlet
 */
@WebServlet("/quanLyGopYServlet")
public class quanLyGopYServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public quanLyGopYServlet() {
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
		
		if("xemChiTiet".equals(action)){
			String stt = request.getParameter("stt");
			
			message = QuanLyGopYBO.updateDaDoc(stt);
			
			response.getWriter().write(message);		
			return;
		}else if("delete".equals(action)){
			String listFeedBack = request.getParameter("listFeedBack");
			
			ArrayList<String> arrayFeedBack = new ArrayList<String>();
			String tam="";
			
			for(int i=0;i<listFeedBack.length();i++){
				if(listFeedBack.charAt(i) != ','){
					tam+=listFeedBack.charAt(i);
				}else{
					arrayFeedBack.add(tam);
					tam="";
				}
			}
			
			message = QuanLyGopYBO.deleteFeedBack(arrayFeedBack);
			
			response.getWriter().write(message);		
			return;
		}
	}

}
