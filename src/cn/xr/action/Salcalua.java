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
 * Servlet implementation class Salarycalua
 */
public class Salcalua extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Salcalua() {
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

		List<Employee> emlist = new ArrayList<Employee>();
		EmDao emdao = new EmDaoImpl();
		RankDao radao = new RankDaoImpl();
		RewardDao redao = new RewardDaoImpl();
		SalaryDao saldao = new SalaryDaoImpl();
		List<Salary> salmolist = new ArrayList<Salary>();

		String saltime = request.getParameter("saltime");

		Salary sal = new Salary();

		try {
			//查询所有员工信息
			emlist = emdao.queryAll();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		//循环列表，计算工资
		for (Employee em : emlist) {
			sal.setEno(em.getEno());
			sal.setSaltime(saltime);
			Rank ra = null;
			try {
				//根据职级名查职级
				ra = radao.query(em.getRname());
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			double salbase = ra.getRsal();
			sal.setSalbase(salbase);//职级工资
			try {
				//奖罚工资
				sal.setSalreward(redao.queryrew(em.getEno(), saltime));
				sal.setSalpunish(redao.querypun(em.getEno(), saltime));
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			double saltemp = sal.getSalbase() + sal.getSalreward() - sal.getSalpunish();
			sal.setInsu_fund(saltemp * 0.05);//五险一金
			sal.setSalall(saltemp * 0.95);//实际工资
			sal.setPertax(sal.getSalall() * 0.005);//个税
			sal.setSalactual(sal.getSalall() * 0.995);//实发工资
			try {
				//写入数据库
				saldao.salcalua(sal);
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			
		}
		
		String scurrentPage = request.getParameter("currentPage");

		int everyPage = 20;// 每页记录数
		int totalCount = 0;
		try {

			totalCount = saldao.getmonCount(saltime);

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

		try {
			//完成计算，根据工资月份查询工资信息，并转发会jsp界面，分页显示
			salmolist = saldao.querymonthAll(saltime, page);
			request.setAttribute("salmolist", salmolist);
			request.setAttribute("page", page);
			request.getRequestDispatcher("salarycal.jsp").forward(request, response);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
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
