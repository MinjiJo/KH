package net.member.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.member.db.MemberDAO;

public class LoginProcessAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = new ActionForward();
		request.setCharacterEncoding("utf-8");
		String id = request.getParameter("id");
		String pass = request.getParameter("pass");
		MemberDAO mdao = new MemberDAO();
		int result = mdao.isId(id, pass);
		System.out.println("결과는 " + result);
		
		if(result == 1) {
			HttpSession session = request.getSession();
			//로그인  성공
			session.setAttribute("id", id);
			forward.setRedirect(true);
			forward.setPath("BoardList.bo");
		} else {
			String message = "비밀번호가 일치하지 않습니다.";
			if(result == -1)
				message = "아이디가 존재하지 않습니다.";
			
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('" + message + "');");
			out.println("location.href='login.net';");
			out.println("</script>");
			out.close();
			return null;
		}
		return forward;
	}
}