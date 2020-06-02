package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.NhaHang.bo.GuiYeuCauBO;

/**
 * Servlet implementation class guiYeuCauServlet
 */
@WebServlet("/guiYeuCauServlet")
public class guiYeuCauServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public guiYeuCauServlet() {
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
		String noiDungYeuCau = request.getParameter("noiDungYeuCau").trim();
		String soBan = request.getParameter("tableNumber");
		String message = GuiYeuCauBO.insertFeedBack(soBan,noiDungYeuCau);
		response.getWriter().write(message);		
		return;
	}

}
