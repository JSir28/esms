package cn.xr.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;

import cn.xr.bean.User;
import cn.xr.dao.UserDao;
import cn.xr.dao.impl.UserDaoImpl;
import cn.xr.util.MailUtil;


/**
 * Servlet implementation class Sendfpemail
 */
public class Sendfpemail extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Sendfpemail() {
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
		
		String username = request.getParameter("username");
		UserDao userdao = new UserDaoImpl();
		JSONObject obj = new JSONObject();
		
		int flag = 1;
		
		User user = null;
		try {
			//���ݹ���Ա������ѯ����Ա
			user = userdao.queryname(username);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if(user != null) {
			try {
				//�������������ʼ�
				MailUtil.sendMail(user);
				//��jsp���������ַ
				obj.put("email", user.getEmail());
				
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		else {
			flag = 0;
		}
		//���ز�ѯ�ͷ����ʼ�״̬
		obj.put("flag", flag);
		out.print(obj.toString());
		
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
