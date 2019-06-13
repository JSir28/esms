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
 * Servlet implementation class Emupdate
 */
public class Emupdate extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Emupdate() {
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
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		

		String eno = request.getParameter("eno");
		String ename = request.getParameter("ename");
		String str = request.getParameter("str");
		String education = request.getParameter("education");
		String telephone = request.getParameter("telephone");
		String address = request.getParameter("address");
		Date birthday = null;
		Date entrydate = null;
		try {
			birthday = df.parse(request.getParameter("birthday"));
			entrydate = df.parse(request.getParameter("entrydate"));
		} catch (ParseException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		
		Employee em = new Employee();
		
		em.setEno(eno);
		em.setEname(ename);
		em.setEbir(birthday);
		em.setEedu(education);
		em.setEtel(telephone);
		em.setEaddr(address);
		em.setEintime(entrydate);
		
		EmDao emdao = new EmDaoImpl();
		try {
			// 更新员工新消息
			emdao.update(em);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		// 重定向到查询servlet
		request.setAttribute("str", str);
		request.getRequestDispatcher("Emlookup").forward(request, response);
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
