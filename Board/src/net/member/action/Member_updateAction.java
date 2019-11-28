package net.member.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.member.db.Member;
import net.member.db.MemberDAO;

public class Member_updateAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		
		ActionForward forward = new ActionForward();
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");
		MemberDAO mdao = new MemberDAO();
		Member m = mdao.member_info(id);
		
		if(m==null) {
			System.out.println("���� �������� ����");
			forward.setRedirect(false);
			request.setAttribute("message","���� �������� �����Դϴ�.");
			forward.setPath("error/error.jsp");
			return forward;
		}
		
		forward.setPath("member/updateForm.jsp");
		forward.setRedirect(false);
		request.setAttribute("member", m);
		return forward;
	}
}