package cn.xr.action;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.xr.bean.Rank;
import cn.xr.dao.RankDao;
import cn.xr.dao.impl.RankDaoImpl;

/**
 * Servlet implementation class Rankupdate
 */
public class Rankupdate extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Rankupdate() {
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
		
		int rno = Integer.parseInt(request.getParameter("rnoup"));
		String rname = request.getParameter("rnameup");
		int rsal = Integer.parseInt(request.getParameter("rsalup"));
		Rank rank = new Rank();
		rank.setRno(rno);
		rank.setRname(rname);
		rank.setRsal(rsal);
		RankDao rankdao = new RankDaoImpl();
		try {
			//更新奖罚信息
			rankdao.update(rank);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		//重定向至查询servlet，实现分页
		response.sendRedirect("/ESMS/Rankquery");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
