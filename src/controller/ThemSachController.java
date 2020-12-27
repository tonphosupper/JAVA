package controller;


import java.io.File;
import java.io.IOException;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import bean.sachbean;
import bo.sachbo;
import dao.DungChung;

/**
 * Servlet implementation class ThemSachController
 */
@WebServlet("/ThemSachController")
public class ThemSachController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ThemSachController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		DiskFileItemFactory factory = new DiskFileItemFactory();
		DiskFileItemFactory fileItemFactory = new DiskFileItemFactory();
		ServletFileUpload upload = new ServletFileUpload(fileItemFactory);
		String dirUrl1 = request.getServletContext().getRealPath("") + File.separator + "files";
		//response.getWriter().println(dirUrl1);
		String masach = "";
		String maloai ="";
		String tensach = "";
		String tacgia = "";
		String giat = "";
		String gia = "";
		String soluong ="";
		String soTap ="";
		String ngaynhap = "";
		String anh = "";
		try {
			List<FileItem> fileItems = upload.parseRequest(request);// Lấy về các đối tượng gửi lên
			// duyệt qua các đối tượng gửi lên từ client gồm file và các control
			for (FileItem fileItem : fileItems) {
				if (!fileItem.isFormField()) {// Nếu ko phải các control=>upfile lên
					// xử lý file
					String nameimg = fileItem.getName();
					if (!nameimg.equals("")) {
						// Lấy đường dẫn hiện tại, chủ ý xử lý trên dirUrl để có đường dẫn đúng
						String dirUrl = request.getServletContext().getRealPath("") + File.separator + "files";
						int vt = dirUrl.indexOf(".metadata");
						dirUrl = "D:\\HK1-Nam4\\Javanangcao\\QlSach\\WebContent\\image_sach";
						File dir = new File(dirUrl);
						if (!dir.exists()) {// nếu ko có thư mục thì tạo ra
							dir.mkdir();
						}
						anh = "image_sach/" + nameimg;
						String fileImg = dirUrl + File.separator + nameimg;
						File file = new File(fileImg);// tạo file
						try {
							fileItem.write(file);// lưu file
							System.out.println("UPLOAD THÀNH CÔNG...!");
							System.out.println("Đường dẫn lưu file là: " + dirUrl);
						} catch (Exception e) {
							e.printStackTrace();
						}
					}
				} else// Neu la control
				{
					String tentk = fileItem.getFieldName();
					if (tentk.equals("txtMaSach"))
						masach = fileItem.getString();
					if (tentk.equals("txtTenSach"))
						tensach = fileItem.getString();
					if (tentk.equals("txtTacGia"))
						tacgia = fileItem.getString();
					if (tentk.equals("txtGia"))
						gia = fileItem.getString();
					if (tentk.equals("txtSoLuong"))
						soluong = fileItem.getString();
					if (tentk.equals("txtNgayNhap"))
						ngaynhap = fileItem.getString();
					if (tentk.equals("txtMaLoai"))
						maloai = fileItem.getString();
					if (tentk.equals("txtSoTap"))
						soTap = fileItem.getString();
				}
			}
			sachbo sachbo = new sachbo();
			sachbean sachbean = new sachbean(masach, tensach, Long.parseLong(soluong), Long.parseLong(gia), maloai, Long.parseLong(soTap), anh, Date.valueOf(ngaynhap), tacgia);
			sachbo.themSach(sachbean);
		} catch (FileUploadException e) {
			e.printStackTrace();
		}
		RequestDispatcher rd = request.getRequestDispatcher("AdminQlSach");
		rd.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
	
}
