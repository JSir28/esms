package cn.xr.action;

import java.io.IOException;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.xr.bean.*;
import cn.xr.dao.*;
import cn.xr.dao.impl.RewardDaoImpl;

/**
 * Servlet implementation class Emquery
 */
public class Reupdate extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Reupdate() {
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
		//时间格式
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");

		Reward re = new Reward();
		String rewnostr = request.getParameter("rewnoup");
		int rewno = Integer.parseInt(rewnostr);
		String rew_pun = request.getParameter("rew_punup");
		Date rewtime = null;
		try {
			//按照格式转换时间
			rewtime = simpleDateFormat.parse(request.getParameter("rewtimeup"));
		} catch (ParseException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		String rewcontent = request.getParameter("rewcontentup");
		Float rewmoney = Float.valueOf(request.getParameter("rewmoneyup"));
		String ename = request.getParameter("Ename");
		String emlist = request.getParameter("emlist");
		String eno = request.getParameter("enoup");
		String rekey = request.getParameter("rekeyup");
		re.setRewno(rewno);
		re.setEno(eno);
		re.setRew_pun(rew_pun);
		re.setRewtime(rewtime);
		re.setRewcontent(rewcontent);
		re.setRewmoney(rewmoney);
		RewardDao redao = new RewardDaoImpl();

		try {
			redao.update(re);
			//分别加参数值重定向，实现不同功能界面分页
			if (emlist != null) {
				request.getRequestDispatcher("EmRequery?currentPage=0&eno=" + eno + "&Ename=" + ename).forward(request, response);
			}
			else {
				request.getRequestDispatcher("Requery?currentPage=0&rekey=" + rekey).forward(request, response);
			}
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
