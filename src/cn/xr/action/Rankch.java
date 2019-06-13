package cn.xr.action;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.xr.bean.*;
import cn.xr.dao.EmDao;
import cn.xr.dao.impl.EmDaoImpl;

/**
 * Servlet implementation class Rankch
 */
public class Rankch extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Rankch() {
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
		
		EmDao emdao = new EmDaoImpl();
		String eno = request.getParameter("enoch");
		String rname = request.getParameter("rnamech");
		String ename = request.getParameter("Ename");
		List<Employee> list = null;
		
		try {
			//根据工号和职级名称调动职级
			emdao.rankch(eno, rname);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if (ename == null || ename.equals("")) {
			try {
				//没有输入，查询所有员工
				list = emdao.queryAll();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		else {
			try {
				//查询该姓名员工
				list = emdao.queryOnename(ename);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		//添加参数列表，返回显示
		request.setAttribute("emlist", list);
		request.getRequestDispatcher("rankch.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
