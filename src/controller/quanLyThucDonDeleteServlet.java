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
 * Servlet implementation class quanLyThucDonDeleteServlet
 */
@WebServlet("/quanLyThucDonDeleteServlet")
public class quanLyThucDonDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public quanLyThucDonDeleteServlet() {
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
		String listFood = request.getParameter("listFood");
		
		ArrayList<String> arrayFood = new ArrayList<String>();
		String tam="";
		
		for(int i=0;i<listFood.length();i++){
			if(listFood.charAt(i) != ','){
				tam+=listFood.charAt(i);
			}else{
				if(tam != ""){
					arrayFood.add(tam);
				}
				tam="";
			}
		}
		
		String message=QuanLyThucDonBO.deleteListFood(arrayFood);
		
		response.getWriter().write(message);		
		return;	
	}
}
