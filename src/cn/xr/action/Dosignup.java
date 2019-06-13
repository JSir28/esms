package cn.xr.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.xr.bean.User;
import cn.xr.dao.impl.UserDaoImpl;
import cn.xr.util.UUIDUtils;

/**
 * Servlet implementation class Dosignup
 */
public class Dosignup extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Dosignup() {
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
		String uid = UUIDUtils.getUUid();
		
		
		User user = new User();
		String username = request.getParameter("username");
		String password = request.getParameter("password");	
		String email = request.getParameter("email");
		user.setUid(uid);
		user.setUsername(username);
		user.setPassword(password);
		user.setEmail(email);
		user.setCode(UUIDUtils.getUUid() + UUIDUtils.getUUid());
		
		int flag = 0;  //默认登录失败
		//限制密码长度为6-20位
		if(password.length() >= 6 && password.length() <= 20) {
			try {
				flag = new UserDaoImpl().add(user);//注册
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		else if (password.length() > 20) {
			flag = -2;//密码过长
		}
		else{
			flag = -1;//密码过短
		}
		out.print(flag);// 返回注册信息
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
