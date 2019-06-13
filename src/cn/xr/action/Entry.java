package cn.xr.action;

import java.io.IOException;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.xr.bean.Employee;
import cn.xr.dao.EmDao;
import cn.xr.dao.impl.EmDaoImpl;

/**
 * Servlet implementation class Entry
 */
public class Entry extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Entry() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
        SimpleDateFormat simpleDateFormat=new SimpleDateFormat("yyyy-MM-dd");
		

		String ename = request.getParameter("ename");
		String sex = request.getParameter("sex");
		String education = request.getParameter("education");
		String telephone = request.getParameter("telephone");
		String address = request.getParameter("address");
		String department = request.getParameter("department");
		String rank = request.getParameter("rank");
		Date birthday = null;
		Date entrydate = null;
		try {
			birthday = simpleDateFormat.parse(request.getParameter("birthday"));
			entrydate = simpleDateFormat.parse(request.getParameter("entrydate"));
		} catch (ParseException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		// 获取照片服务器路径
		String imgsrc = request.getParameter("photo");
		
		Employee em = new Employee();
		em.setEname(ename);
		em.setEsex(sex);
		em.setEbir(birthday);
		em.setEedu(education);
		em.setEtel(telephone);
		em.setEaddr(address);
		em.setDname(department);
		em.setRname(rank);
		em.setEintime(entrydate);
		em.setEstate("在职");
		em.setImgsrc(imgsrc);
		
		EmDao emdao = new EmDaoImpl();
		
		boolean flag = false;
		try {
			// 员工入职
			flag = emdao.entry(em);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		// 返回员工入职成功或失败
		if (flag) {
			response.getWriter().print("<script>window.location.href='entry.jsp';alert('员工入职成功！')</script>");
		}
		else {
			response.getWriter().print("<script>window.location.href='entry.jsp';alert('员工入职失败！')</script>");
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
