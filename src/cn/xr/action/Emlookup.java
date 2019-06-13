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

		String scurrentPage = request.getParameter("currentPage");// ��ȡҳ��

		int everyPage = 20;// ÿҳ��¼��
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
		} // ��ȡ�ܼ�¼��

		int currentPage = 1; // ��ǰҳ��Ĭ��1
		if (scurrentPage == null) {
			currentPage = 1;// �ӵ�һҳ��ʼ����
		} else {
			currentPage = Integer.parseInt(scurrentPage);
		}
		// ��ҳ��Ϣ
		Page page = PageUtil.createPage(everyPage, totalCount, currentPage);
		// ����ҳ��
		if (page.getCurrentPage() > page.getTotalPage()) {
			currentPage = (page.getTotalPage());
			page = PageUtil.createPage(everyPage, totalCount, currentPage);
		}

		if (str == null || str.equals("")) {
			try {
				// û����дԱ����������ѯ����Ա����Ϣ
				list = dao.queryall(page);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		} else {
			try {
				// ����Ա��������ѯԱ����Ϣ
				list = dao.queryname_rank_depart(str, page);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		// ���ݽ���ת���������б�
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
