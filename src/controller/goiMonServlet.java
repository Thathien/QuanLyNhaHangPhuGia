package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.NhaHang.bo.goiMonBO;

/**
 * Servlet implementation class goiMonServlet
 */
@WebServlet("/goiMonServlet")
public class goiMonServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public goiMonServlet() {
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
		String tableNumber = request.getParameter("tableNumber");
		String maMon = request.getParameter("maMon");
		String soLuong = request.getParameter("soLuong");
		
		String check = ""+maMon.charAt(0);
		
		//Loại bỏ ký tự s trong mã món khi chọn ở mục khuyên dùng
		//Mục đích của việc thêm ký tự s là để phân biệt món đã gọi ở mục khuyên dùng hay mục khác
		if("s".equals(check)){
			String temp="";
			for(int i=1;i<maMon.length();i++) temp+=maMon.charAt(i);
			maMon = temp;
		}
		
		System.out.println("Khách hàng bàn "+tableNumber+" đã gọi món ăn!" +"Mã món :"+maMon+" Số lượng:"+soLuong);
//		System.out.println("Mã món: "+maMon);
//		System.out.println("Số lượng: "+soLuong);
		
		String message= goiMonBO.callFood(tableNumber,Integer.parseInt(maMon),soLuong);
		
		response.getWriter().write(message);		
		return;
	}

}
