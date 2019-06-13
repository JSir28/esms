package cn.xr.action;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Date;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.FileItemIterator;
import org.apache.tomcat.util.http.fileupload.FileItemStream;
import org.apache.tomcat.util.http.fileupload.disk.DiskFileItemFactory;
import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;
import org.apache.tomcat.util.http.fileupload.util.Streams;
import org.json.JSONObject;

/**
 * Servlet implementation class Fileupload
 */
public class Fileupload extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Fileupload() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		// response.getWriter().append("Served at: ").append(request.getContextPath());

		response.setContentType("text/html");
		response.setCharacterEncoding("UTF-8");
		//找到文件根目录
		String realDir = request.getSession().getServletContext().getRealPath("/");
		//找到项目名称
		String contextpath = request.getContextPath().replace("/", "\\");
		//根据workspace目录找到实际存放项目的目录
		File file = new File(realDir);
		for (int i = 0; i < 6; i++) {
			file = new File(file.getParent());
		}
		//找到webcontent文件夹
		String path = file.getPath() + contextpath + "\\WebContent";
				
		try {
			//设置上传照片的目录，项目目录和实际目录
			String filePath = "images";
			String realPath = path + "\\" + filePath;
			String realpath = realDir + "\\" + filePath;

			//若不存在，则创建该目录
			File dir = new File(realPath);
			if (!dir.isDirectory())
				dir.mkdir();
			dir = new File(realpath);
			if (!dir.isDirectory())
				dir.mkdir();

			if (ServletFileUpload.isMultipartContent(request)) {
				DiskFileItemFactory dff = new DiskFileItemFactory();
				dff.setRepository(dir);
				dff.setSizeThreshold(1024000);
				ServletFileUpload sfu = new ServletFileUpload(dff);
				FileItemIterator fii = null;
				fii = sfu.getItemIterator(request);
				String title = ""; 
				String url = ""; // 文件目录ַ
				String fileName = "";
				String state = "200";//状态码
				String realFileName = "";//上传文件的真实文件名
				while (fii.hasNext()) {
					FileItemStream fis = fii.next();
					try {
						if (!fis.isFormField() && fis.getName().length() > 0) {
							fileName = fis.getName();
							//文件类型
							Pattern reg = Pattern.compile("[.]jpg|png|jpeg|gif$");
							Matcher matcher = reg.matcher(fileName);
							if (!matcher.find()) {
								state = "500";
								break;
							}
							//生成文件名
							realFileName = new Date().getTime() + fileName.substring(fileName.lastIndexOf("."), fileName.length());
							url = realPath + "\\" + realFileName;
							//缓冲输入流、文件输出流、缓冲输出流
							BufferedInputStream in = new BufferedInputStream(fis.openStream());
							FileOutputStream a = new FileOutputStream(new File(url));
							BufferedOutputStream output = new BufferedOutputStream(a);
							//复制/上传文件到目标目录
							Streams.copy(in, output, true);
							// 打开输入流
							FileInputStream fis2 = new FileInputStream(new File(url));
							url = realpath + "\\" + realFileName;
							System.out.println(url);
							// 打开输出流
							FileOutputStream fos2 = new FileOutputStream(new File(url));
							// 读取和写入信息
							int len = 0;
							// 创建一个字节数组，当做缓冲区
							byte[] b = new byte[1024];
							while ((len = fis2.read(b)) != -1) {
								fos2.write(b, 0, len);
							}
							// 关闭流 先开后关 后开先关
							fos2.close(); // 后开先关
							fis2.close(); // 先开后关
							
						} else {
							String fname = fis.getFieldName();
							if (fname.indexOf("pictitle") != -1) {
								BufferedInputStream in = new BufferedInputStream(fis.openStream());
								byte c[] = new byte[10];
								int n = 0;
								while ((n = in.read(c)) != -1) {
									title = new String(c, 0, n);
									System.out.println(title);
									break;
								}
							}
						}

					} catch (Exception e) {
						e.printStackTrace();
					}
				}
				if (state.equals("200")) {
					response.setStatus(200);
					String retxt = "{src:'" + filePath + "/" + realFileName + "',status:success}";

					System.out.println(retxt);
					//绑定json数据，返回jsp
					JSONObject obj = new JSONObject();
					obj.put("fileName", filePath + "/" + realFileName);
					response.getWriter().print(obj.toString());
				}

			}
		} catch (Exception ee) {
			ee.printStackTrace();
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
