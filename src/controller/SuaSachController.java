package controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;


import bean.sachbean;
import bo.loaibo;
import dao.loaidao;
import dao.sachdao;

@WebServlet("/SuaSachController")
public class SuaSachController extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
    public SuaSachController() {
        super();
       }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		loaidao ldao = new loaidao();
		try {
			request.setAttribute("dsloai", ldao.getloai());		
		RequestDispatcher rd = request.getRequestDispatcher("suaSach.jsp");
		rd.forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");

		DiskFileItemFactory factory = new DiskFileItemFactory();
		DiskFileItemFactory fileItemFactory = new DiskFileItemFactory();
		ServletFileUpload upload = new ServletFileUpload(fileItemFactory);

		String masach = request.getParameter("ms");
		String anhcu = request.getParameter("anh");
		String tensach = null;
		String soluong = null;
		String gia = null;
		String maloai = null;
		String sotap = null;
		String ngaynhap = null;
		String tacgia = null;
		
		try {
			List<FileItem> fileItems = upload.parseRequest(request);// Lấy về các đối tượng gửi lên
			// duyệt qua các đối tượng gửi lên từ client gồm file và các control
			for (FileItem fileItem : fileItems) {
				if (!fileItem.isFormField()) {// Nếu ko phải các control=>upfile lên
					// xử lý file

					String nameimg = fileItem.getName();
					if(nameimg.equals("")) {
						request.setAttribute("anh", anhcu);
					}else {
						String anh2 = "image_sach/" + nameimg;
						request.setAttribute("anh", anh2);
					}
					
					if (!nameimg.equals("")) {
						// Lấy đường dẫn hiện tại, chủ ý xử lý trên dirUrl để có đường dẫn đúng
						String dirUrl = request.getServletContext().getRealPath("") + File.separator + "image_sach";
						int vt = dirUrl.indexOf(".metadata");
						dirUrl = "D:\\HK1-Nam4\\Javanangcao\\QlSach\\WebContent\\image_sach";
						File dir = new File(dirUrl);
						if (!dir.exists()) {// nếu ko có thư mục thì tạo ra
							dir.mkdir();
						}
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
					if (tentk.equals("txtTenSach"))
						tensach = fileItem.getString("UTF-8");
					if (tentk.equals("txtSoLuong"))
						soluong = fileItem.getString();
					if (tentk.equals("txtGia"))
						gia = fileItem.getString();
					if (tentk.equals("txtMaLoai"))
						maloai = fileItem.getString("UTF-8");
					if (tentk.equals("txtSoTap"))
						sotap = fileItem.getString();
					if (tentk.equals("txtNgayNhap"))
						ngaynhap = fileItem.getString();
					if (tentk.equals("txtTacGia"))
						tacgia = fileItem.getString("UTF-8");

				}
			}

			String anh = (String) request.getAttribute("anh");


			Long sltam = Long.parseLong(soluong);
			Long gtam = Long.parseLong(gia);
			Long sttam = Long.parseLong(sotap);
			Date ngayNhap = Date.valueOf(ngaynhap);
			
			sachbean sach = new sachbean();
			sach.setMasach(masach);
			sach.setTensach(tensach);
			sach.setSoluong(sltam);
			sach.setGia(gtam);
			sach.setMaloai(maloai);
			sach.setSotap(sttam);
			sach.setAnh(anh);
			sach.setNgaynhap(ngayNhap);
			sach.setTacgia(tacgia);

			sachdao.suasach(masach, tensach, sltam, gtam, maloai, sttam, anh,ngayNhap, tacgia);

			RequestDispatcher rd = request.getRequestDispatcher("AdminQlSach");
			rd.forward(request, response);

		}

		catch (FileUploadException e) {
			e.printStackTrace();
		}
	}

}
