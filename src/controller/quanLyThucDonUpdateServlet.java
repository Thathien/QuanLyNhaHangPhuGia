package controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Hashtable;
import java.util.Iterator;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.NhaHang.bean.*;
import com.NhaHang.bo.*;

/**
 * Servlet implementation class quanLyThucDonUpdateServlet
 */
@WebServlet("/quanLyThucDonUpdateServlet")
public class quanLyThucDonUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public quanLyThucDonUpdateServlet() {
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
		
		if("show".equals(action)){
			String mamon = request.getParameter("mamon");
			Food food = ShowQuanLyThucDonBO.getFood(mamon);
			request.setAttribute("food", food);
			
			String sapXep = "1";	
			
			ArrayList<Food> listFood = ShowQuanLyThucDonBO.getListFood(Integer.parseInt(sapXep));
			request.setAttribute("listFood", listFood);
			
			RequestDispatcher requestDispatcher=request.getRequestDispatcher("quanLyThucDonUpdate.jsp");
			requestDispatcher.forward(request, response);
		}else{
			String tenmon2 = null;
			String gia2 = null;
			String loai2 = null;
			String khuyendung2 = null;
			String anh2="";
			String mamon=null;
			
			boolean isMultipart = ServletFileUpload.isMultipartContent(request);
			if (!isMultipart) {
			} else {
				FileItemFactory factory = new DiskFileItemFactory();
				ServletFileUpload upload = new ServletFileUpload(factory);
				List items = null;
				try {
					items = upload.parseRequest(request);
				} catch (FileUploadException e) {
					e.printStackTrace();
				}
				Iterator itr = items.iterator();
				Hashtable params = new Hashtable();
				while (itr.hasNext()) {
					FileItem item = (FileItem) itr.next();
					if (item.isFormField()) {
						params.put(item.getFieldName(), item.getString());
					}else{
						ServletContext context = getServletContext(); // Inherited
						// from
						// HttpServlet.
						String path = context.getRealPath("/");
						String itemName = item.getName();
						System.out.println(path +"upload\\"+itemName); 
						File savedFile = new File(path +"admin/upload\\"+itemName);
						try {
							item.write(savedFile);
						} catch (Exception e) {
							e.printStackTrace();
						}
						anh2 = itemName;
					} 
				}
				
				if(anh2 == "" || anh2 == null) anh2=(String) params.get("oldFoodImg2");
				
				tenmon2 = (String) params.get("tenmon2");
				tenmon2 = new String (tenmon2.getBytes ("iso-8859-1"), "UTF-8");
				tenmon2 = tenmon2.trim();
				
				loai2 = (String) params.get("loai2");
				gia2 = (String) params.get("gia2");
				khuyendung2 = (String) params.get("khuyendung2");
				mamon = (String) params.get("mamon");
				
				String message=QuanLyThucDonBO.updateFoodInMenu(mamon, tenmon2, Integer.parseInt(loai2), Double.parseDouble(gia2), Integer.parseInt(khuyendung2),anh2);
				request.setAttribute("message",message);
				
				String sapXep = "1";
				request.setAttribute("sapXep",sapXep);
				
				RequestDispatcher requestDispatcher=request.getRequestDispatcher("showQuanLyThucDonServlet");
				requestDispatcher.forward(request, response);
			}
		}
	}

}
