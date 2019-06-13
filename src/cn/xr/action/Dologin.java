package cn.xr.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import cn.xr.bean.User;
import cn.xr.dao.impl.UserDaoImpl;

/**
 * Servlet implementation class Dologin
 */
public class Dologin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Dologin() {
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
		PrintWriter out = response.getWriter();
		
		User user = new User();
		//获取url参数
		String username = request.getParameter("username");
		String password = request.getParameter("password");	
		int time = Integer.parseInt(request.getParameter("time"));
		user.setUsername(username);
		user.setPassword(password);

		int flag = 0;// 设置标记，默认登录失败
		
		try {
			boolean rs = new UserDaoImpl().queryUser(user);
			if (rs) {
				//设置session
				HttpSession session = request.getSession();
				session.setAttribute("user", user);
				session.setMaxInactiveInterval(time);//以秒为单位，设置time时间后session将失效
				flag = 1;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		out.print(flag);// 返回登录信息
		out.flush();
		out.close();
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
