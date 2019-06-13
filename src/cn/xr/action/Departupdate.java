package cn.xr.action;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.xr.bean.Department;
import cn.xr.dao.DepartDao;
import cn.xr.dao.impl.DepartDaoImpl;

/**
 * Servlet implementation class Departupdate
 */
public class Departupdate extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Departupdate() {
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

		int dno = Integer.parseInt(request.getParameter("dnoup"));
		String dname = request.getParameter("dnameup");
		String dbuss = request.getParameter("dbussup");
		Department depart = new Department();
		depart.setDno(dno);
		depart.setDname(dname);
		depart.setDbuss(dbuss);
		DepartDao dedao = new DepartDaoImpl();
		try {
			// 更新部门信息
			dedao.update(depart);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		// 重定向到查询servlet
		response.sendRedirect("/ESMS/Departquery");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
