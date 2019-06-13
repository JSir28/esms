package cn.xr.util;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import cn.xr.bean.User;

/**
 * Servlet Filter implementation class Loginfilter
 */
public class Loginfilter implements Filter {

    /**
     * Default constructor. 
     */
    public Loginfilter() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {
		// TODO Auto-generated method stub
	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		// TODO Auto-generated method stub
		// place your code here

		// pass the request along the filter chain
		HttpServletRequest req = (HttpServletRequest) request;
		HttpServletResponse resp = (HttpServletResponse) response;
		//登录过滤，获取路径
		String path = req.getContextPath();
		String loginurl = path + "/login.jsp";
		String url = req.getRequestURI();
		if (loginurl.equalsIgnoreCase(url)) {
			chain.doFilter(req, resp);
		} else {
			HttpSession session = req.getSession();
			User user = (User) session.getAttribute("user");
			if (user == null) {
				resp.sendRedirect(loginurl);
			} else {
				chain.doFilter(req, resp);
			}
		}
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

}
