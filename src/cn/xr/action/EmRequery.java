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

		// ����������»�ȡ��ǰҳ
		String scurrentPage = request.getParameter("currentPage");

		int everyPage = 2;// ÿҳ��¼��
		int totalCount = 0;
		try {

			totalCount = redao.getCount(eno);

		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		} // ��ȡ�ܼ�¼��

		int currentPage = 1; // ��ǰҳ��Ĭ��1
		if (scurrentPage == null) {
			currentPage = 1;// �ӵ�һҳ��ʼ����
		} else {
			currentPage = Integer.parseInt(scurrentPage);
		}
		// ��ҳ��Ϣ
		Page page = PageUtil.createPage(everyPage, totalCount, currentPage);
		//����ҳ����С
		if (page.getCurrentPage() > page.getTotalPage()) {
			currentPage = (page.getTotalPage());
			page = PageUtil.createPage(everyPage, totalCount, currentPage);
		}

		if (ename == null || ename.equals("")) {
			try {
				//û����дԱ����������ѯ����Ա����Ϣ
				emlist = emdao.queryAll();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		else {
			try {
				//����Ա��������ѯԱ����Ϣ
				emlist = emdao.queryOnename(ename);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		try {
			// �ֱ����Ա��������ѯԱ����Ϣ�б�������Ա�����Ų�ѯ������Ϣ�б�
			relist = redao.queryEmAll(eno, page);
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}

		//����ֵ��ת����ʵ�ַ�ҳ
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