package net.board.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.board.db.BoardBean;
import net.board.db.BoardDAO;

public class BoardModifyAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// 파라미터로 가져올 때 한글이 깨지지 않도록 하기 위한 문장입니다.
		request.setCharacterEncoding("utf-8");

		ActionForward forward = new ActionForward();
		boolean result = false;
		
		//전달받은 파라미터 num 변수에 저장합니다.
		int num=Integer.parseInt(request.getParameter("BOARD_NUM"));
		
		BoardDAO boarddao = new BoardDAO();
		BoardBean boarddata = new BoardBean();
		
		//글쓴이인지 확인하기 위해 저장된 비밀번호와 입력한 비밀번호를 비교합니다.
		boolean usercheck = boarddao.isBoardWriter(num, request.getParameter("BOARD_PASS"));
		
		if(usercheck == false) {
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('비밀번호가 다릅니다.');");
			out.println("history.back();");
			out.println("</script>");
			out.close();
			return null;
		}
		//비밀번호가 일치하는 경우
		//수정 내용을 설정합니다.
		boarddata.setBOARD_NUM(num);
		boarddata.setBOARD_SUBJECT(request.getParameter("BOARD_SUBJECT"));
		boarddata.setBOARD_CONTENT(request.getParameter("BOARD_CONTENT"));

		//DAO에서 수정 메서드 호출하여 수정합니다.
		result = boarddao.boardModify(boarddata);
		
		// 수정에 실패한 경우
		if (result == false) {
			System.out.println("게시판 수정 실패");
			forward.setRedirect(false);
			request.setAttribute("meesage", "게시판 수정 실패입니다.");
			forward.setPath("error/error.jsp");
			return forward;
		}
		
		// 수정이 제대로 된 경우
		System.out.println("게시판 수정 완료");
		forward.setRedirect(true);
		// 수정한 글 내용을 보여주기 위해 글 내용 보기 페이지를 경로로 설정합니다.
		forward.setPath("BoardDetailAction.bo?num=" + boarddata.getBOARD_NUM());
		return forward;
	}
}