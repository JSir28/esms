package cn.xr.action;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.xr.bean.Employee;
import cn.xr.bean.Page;
import cn.xr.dao.EmDao;
import cn.xr.dao.impl.EmDaoImpl;
import cn.xr.util.PageUtil;

/**
 * Servlet implementation class Emlookup
 */
public class Emlookup extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Emlookup() {
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

		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");

		String str = request.getParameter("str");
		List<Employee> list = new ArrayList<Employee>();
		EmDao dao = new EmDaoImpl();

		String scurrentPage = request.getParameter("currentPage");// 获取页数

		int everyPage = 20;// 每页记录数
		int totalCount = 0;
		try {
			if (str == null || str.equals("")) {
				totalCount = dao.getCountall();
			} else {
				totalCount = dao.getCountname_rank_depart(str);
			}
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
		// 重判页码
		if (page.getCurrentPage() > page.getTotalPage()) {
			currentPage = (page.getTotalPage());
			page = PageUtil.createPage(everyPage, totalCount, currentPage);
		}

		if (str == null || str.equals("")) {
			try {
				// 没有填写员工姓名，查询所有员工信息
				list = dao.queryall(page);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		} else {
			try {
				// 根据员工姓名查询员工信息
				list = dao.queryname_rank_depart(str, page);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		// 根据界面转发回数据列表
		request.setAttribute("emlist", list);
		request.setAttribute("str", str);
		request.setAttribute("page", page);
		request.getRequestDispatcher("emp.jsp").forward(request, response);
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
