package kr.ac.kopo.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import kr.ac.kopo.member.vo.MemberVO;

public class LoginInterceptor extends HandlerInterceptorAdapter {

	@Override
	public boolean preHandle(HttpServletRequest request,
							HttpServletResponse response,
							Object handler)
								throws Exception {
		
//		HandlerMethod method = (HandlerMethod)handler;
//		System.out.println("메소드 : " + method);
//		System.out.println("controller : " + method.getBean());
		
		// 로그인 여부 체크
		HttpSession session = request.getSession();
		
		MemberVO vo = new MemberVO();
//		vo.setId("user");
		vo.setId("cysun31");
		vo.setPassword("user");
		vo.setType("U");
		
		session.setAttribute("loginVO", vo);
		
		MemberVO loginVO = (MemberVO)session.getAttribute("loginVO");
		
		if(loginVO == null) {
						
			String uri = request.getRequestURI();
			uri = uri.substring(request.getContextPath().length());
//			System.out.println(uri);
			
			String query = request.getQueryString();
			System.out.println(query);
			
			if(query != null && query.length() != 0)
				uri = uri + "?" + query;
			session.setAttribute("dest", uri);
			
			response.sendRedirect(request.getContextPath() + "/login");
			
			return false;
		}
		
		return true;
	}


	
	
}
