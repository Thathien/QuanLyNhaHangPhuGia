package controller;

import java.io.File;
import java.io.IOException;
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

import com.NhaHang.bo.*;

/**
 * Servlet implementation class quanLyThucDonServlet
 */
@WebServlet("/quanLyThucDonServlet")
public class quanLyThucDonServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public quanLyThucDonServlet() {
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
		// TODO Auto-generated method stub		
		String tenmon = null;
		String gia = null;
		String loai= null;
		String khuyendung = null;
		String anh="";
				
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
							anh = itemName;
						} 
					}
					
					if(anh == "" || anh == null) anh="noImage.png";
					
					tenmon = (String) params.get("tenmon");
					tenmon = new String (tenmon.getBytes ("iso-8859-1"), "UTF-8");
					tenmon = tenmon.trim();
					
					loai = (String) params.get("loai");
					gia = (String) params.get("gia");
					khuyendung = (String) params.get("khuyendung");
					
					String message=QuanLyThucDonBO.addFoodInMenu(tenmon, Integer.parseInt(loai), Double.parseDouble(gia), Integer.parseInt(khuyendung),anh);
					request.setAttribute("message",message);
					
					String sapXep = "1";
					request.setAttribute("sapXep",sapXep);
					
					RequestDispatcher requestDispatcher=request.getRequestDispatcher("showQuanLyThucDonServlet");
					requestDispatcher.forward(request, response);
				}
			}

}
