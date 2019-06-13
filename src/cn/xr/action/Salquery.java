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
import cn.xr.dao.impl.*;
import cn.xr.util.PageUtil;

/**
 * Servlet implementation class Salaryquery
 */
public class Salquery extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Salquery() {
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

		String eno = request.getParameter("eno");
		String ename = request.getParameter("Ename");
		List<Salary> sallist = new ArrayList<Salary>();
		SalaryDao saldao = new SalaryDaoImpl();
		
		List<Employee> emlist = new ArrayList<Employee>();
		EmDao emdao = new EmDaoImpl();
		
		String scurrentPage = request.getParameter("currentPage");//获取页数

		int everyPage = 20;// 每页记录数
		int totalCount = 0;
		try {

			totalCount = saldao.getCount(eno);

		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		} // 获取总记录数

		int currentPage = 1; // 当前页，默认1
		if (scurrentPage == null) {
			currentPage = 1;// 从第一页开始访问
		} else {
			currentPage = Integer.parseInt(scurrentPage);
		}
		// 分页信息
		Page page = PageUtil.createPage(everyPage, totalCount, currentPage);
		//重判页码
		if (page.getCurrentPage() > page.getTotalPage()) {
			currentPage = (page.getTotalPage());
			page = PageUtil.createPage(everyPage, totalCount, currentPage);
		}
		if (ename == null || ename.equals("")) {
			try {
				//没有填写员工姓名，查询所有员工信息
				emlist = emdao.queryAll();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		else {
			try {
				//根据员工姓名查询员工信息
				emlist = emdao.queryOnename(ename);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		try {
			//根据员工的姓名查询员工列表和根据员工工号查询工资列表
			sallist = saldao.queryEmAll(eno, page);
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}

		//绑定列表数据和参数，转发回jsp界面
		request.setAttribute("eno", eno);
		request.setAttribute("ename", ename);
		request.setAttribute("page", page);
		request.setAttribute("emlist", emlist);
		request.setAttribute("sallist", sallist);
		request.getRequestDispatcher("salaryquery.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
