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
import cn.xr.dao.impl.RewardDaoImpl;
import cn.xr.util.PageUtil;

/**
 * Servlet implementation class Emquery
 */
public class Requery extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Requery() {
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
		
		String rekey = request.getParameter("rekey");
		List<Reward> list = new ArrayList<Reward>();
		RewardDao dao = new RewardDaoImpl();
		
		String scurrentPage = request.getParameter("currentPage");

		int everyPage = 20;// ÿҳ��¼��
		int totalCount = 0;
		try {
			totalCount = dao.getkeyCount(rekey);
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
		//����ҳ��
		if (page.getCurrentPage() > page.getTotalPage()) {
			currentPage = (page.getTotalPage());
			page = PageUtil.createPage(everyPage, totalCount, currentPage);
		}
		
		
		if (rekey == null || rekey.equals("")) {
			try {
				//�޹ؼ��֣���ѯ������Ϣ
				list = dao.queryAll(page);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		else {
			try {
				//��ѯ�ؼ�����Ϣ
				list = dao.query(rekey, page);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		//�������б�Ͳ�����Ϣ��ת����jsp���棬ʵ�ַ�ҳ
		request.setAttribute("rekey", rekey);
		request.setAttribute("relist", list);
		request.setAttribute("page", page);
		request.getRequestDispatcher("reward.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
