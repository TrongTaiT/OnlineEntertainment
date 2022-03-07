package com.oe.filter;

import java.io.IOException;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oe.entity.User;

@WebFilter({ "/like/*", "/share/*", "/change-password", "/admin/*", "/edit-profile", "/my-favorite" })
public class AuthFilter implements HttpFilter {

	@Override
	public void doFilter(HttpServletRequest req, HttpServletResponse resp, FilterChain chain)
			throws IOException, ServletException {
		String uri = req.getRequestURI();
		User user = (User) req.getSession().getAttribute("user");
		String message = "";

		if (user == null) { // chưa đăng nhập
			message = resp.encodeURL("Vui lòng đăng nhập!");
		} else if (!user.getAdmin() && uri.contains("/admin/")) { // không phải admin
			message = resp.encodeURL("Vui lòng đăng nhập với vai trò admin!");
		}

		if (!message.isEmpty()) { // truy cập không hợp lệ
			req.getSession().setAttribute("securi", uri);
			resp.sendRedirect("/oe/sign-in?message=" + resp.encodeURL(message));
		} else { // truy cập hợp lệ
			chain.doFilter(req, resp);
		}
//		chain.doFilter(req, resp);
	}

}
