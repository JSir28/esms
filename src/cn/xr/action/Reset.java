package cn.xr.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.xr.bean.User;
import cn.xr.dao.UserDao;
import cn.xr.dao.impl.UserDaoImpl;

/**
 * Servlet implementation class Reset
 */
public class Reset extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Reset() {
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
		PrintWriter out = response.getWriter();

		User user = new User();
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		UserDao userdao = new UserDaoImpl();
		user.setUsername(username);
		user.setPassword(password);
		
		int flag = 0;  //默认重置密码失败
		//限制密码长度在6-20位
		if(password.length() >= 6 && password.length() <= 20) {
			try {
				flag = userdao.reset(user);//返回重置密码成功，若成功，返回1，若失败，返回0
				if (flag == 1) {
					request.getSession().removeAttribute("user");
				}
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
		// 返回jsp重置密码结果
		out.print(flag);
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
