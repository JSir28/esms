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

		int everyPage = 20;// 每页记录数
		int totalCount = 0;
		try {
			totalCount = dao.getkeyCount(rekey);
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
		//重判页数
		if (page.getCurrentPage() > page.getTotalPage()) {
			currentPage = (page.getTotalPage());
			page = PageUtil.createPage(everyPage, totalCount, currentPage);
		}
		
		
		if (rekey == null || rekey.equals("")) {
			try {
				//无关键字，查询所有信息
				list = dao.queryAll(page);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		else {
			try {
				//查询关键字信息
				list = dao.query(rekey, page);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		//绑定数据列表和参数信息，转发回jsp界面，实现分页
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
