package cn.xr.action;

import java.io.IOException;
import java.sql.SQLException;
import java.util.*;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.xr.bean.*;
import cn.xr.dao.*;
import cn.xr.dao.impl.EmDaoImpl;
import cn.xr.dao.impl.RewardDaoImpl;
import cn.xr.util.PageUtil;

/**
 * Servlet implementation class Emquery
 */
public class EmRequery extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public EmRequery() {
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

		String eno = request.getParameter("eno");
		String ename = request.getParameter("Ename");
		List<Reward> relist = new ArrayList<Reward>();
		RewardDao redao = new RewardDaoImpl();
		List<Employee> emlist = new ArrayList<Employee>();
		EmDao emdao = new EmDaoImpl();

		// 点击链接重新获取当前页
		String scurrentPage = request.getParameter("currentPage");

		int everyPage = 2;// 每页记录数
		int totalCount = 0;
		try {

			totalCount = redao.getCount(eno);

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
		//重判页数大小
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
			// 分别根据员工姓名查询员工信息列表，根据员工工号查询奖罚信息列表
			relist = redao.queryEmAll(eno, page);
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}

		//保存值、转发，实现分页
		request.setAttribute("eno", eno);
		request.setAttribute("ename", ename);
		request.setAttribute("relist", relist);
		request.setAttribute("emlist", emlist);
		request.setAttribute("page", page);
		request.getRequestDispatcher("reward.jsp").forward(request, response);
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
