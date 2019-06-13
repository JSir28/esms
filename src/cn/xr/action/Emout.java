package cn.xr.action;

import java.io.IOException;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.xr.bean.Employee;
import cn.xr.dao.*;
import cn.xr.dao.impl.*;

/**
 * Servlet implementation class Emout
 */
public class Emout extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Emout() {
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

		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");//设置日期格式
		String date = df.format(new Date());// new Date()为获取当前系统时间，也可使用当前时间戳
		
		String eno = request.getParameter("eno");
		String ename = request.getParameter("Ename");
		EmDao emdao = new EmDaoImpl();
		List<Employee> list = null;
		try {
			// 员工离职
			emdao.emout(eno, date);
			if (ename == null || ename.equals("")) {
				// 没有员工姓名输入，查询所有员工
				list = emdao.queryAll();
			}
			else {
				// 根据姓名查询所有员工
				list = emdao.queryOnename(ename);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		// 添加数据列表，转发回jsp
		request.setAttribute("emlist", list);
		request.getRequestDispatcher("emout.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
