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
public class Readd extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Readd() {
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
		//设置时间格式
        SimpleDateFormat simpleDateFormat=new SimpleDateFormat("yyyy-MM-dd");
		
		Reward re = new Reward();
		String eno = request.getParameter("enoadd");
		String ename = request.getParameter("Ename");
		String rew_pun = request.getParameter("rew_punadd");
		Date rewtime = null;
		try {
			//转换时间格式
			rewtime = simpleDateFormat.parse(request.getParameter("rewtimeadd"));
		} catch (ParseException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		String rewcontent = request.getParameter("rewcontentadd");
		Float rewmoney = Float.valueOf(request.getParameter("rewmoneyadd"));
		re.setEno(eno);
		re.setRew_pun(rew_pun);
		re.setRewtime(rewtime);
		re.setRewcontent(rewcontent);
		re.setRewmoney(rewmoney);
		RewardDao redao = new RewardDaoImpl();
		
		try {
			//添加奖罚信息
			redao.add(re);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		//加参数值重定向，实现分页
		request.getRequestDispatcher("EmRequery?currentPage=0&eno=" + eno + "&Ename=" + ename).forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
