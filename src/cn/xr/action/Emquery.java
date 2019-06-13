package cn.xr.action;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.xr.bean.*;
import cn.xr.dao.*;
import cn.xr.dao.impl.EmDaoImpl;

/**
 * Servlet implementation class Emquery
 */
public class Emquery extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Emquery() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		// response.getWriter().append("Served at: ").append(request.getContextPath());
		
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");

		String ename = request.getParameter("Ename");
		String type = request.getParameter("type");//获取、区别员工查询的界面
		List<Employee> list = new ArrayList<Employee>();
		EmDao dao = new EmDaoImpl();
		if (ename == null || ename.equals("")) {
			try {
				//没有填写员工姓名，查询所有员工信息
				list = dao.queryAll();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		else {
			try {
				//根据员工姓名查询员工信息
				list = dao.queryOnename(ename);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		// 根据界面转发回数据列表
		request.setAttribute("emlist", list);
		if (type.equals("rew")) {
			request.getRequestDispatcher("reward.jsp").forward(request, response);
		}
		else if(type.equals("sal")) {
			request.getRequestDispatcher("salaryquery.jsp").forward(request, response);
		}
		else if(type.equals("out")) {
			request.getRequestDispatcher("emout.jsp").forward(request, response);
		}
		else if(type.equals("rch")) {
			request.getRequestDispatcher("rankch.jsp").forward(request, response);
		}
		else if(type.equals("dch")) {
			request.getRequestDispatcher("departch.jsp").forward(request, response);
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
