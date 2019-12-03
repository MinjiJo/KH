package net.board.action;

import java.io.PrintWriter;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import net.board.db.BoardBean;
import net.board.db.BoardDAO;

public class BoardModifyAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// 파라미터로 가져올 때 한글이 깨지지 않도록 하기 위한 문장입니다.
		request.setCharacterEncoding("utf-8");
		
		BoardDAO boarddao = new BoardDAO();
		BoardBean boarddata = new BoardBean();
		ActionForward forward = new ActionForward();
		String realFolder="";
		
		//WebContent아래에 꼭 폴더 생성하세요.
		String saveFolder="boardupload";
		
		int fileSize = 10*1024*1024; //업로드할 파일의  최대 사이즈입니다. 10MB로 지정합니다.
		
		//실제 저장 경로를 지정합니다.
		ServletContext sc = request.getServletContext();
		realFolder = sc.getRealPath(saveFolder);
		
		System.out.println("realFolder = " + realFolder);
		boolean result = false;
		
		try{
			MultipartRequest multi=null;
			multi=new MultipartRequest(request,
					realFolder,
					fileSize,
					"utf-8",
					new DefaultFileRenamePolicy());
			//전달받은 파라미터 num 변수에 저장합니다.
			int num=Integer.parseInt(multi.getParameter("BOARD_NUM"));
			String pass = multi.getParameter("BOARD_PASS");
			//글쓴이인지 확인하기 위해 저장된 비밀번호와 입력한 비밀번호를 비교합니다.
			boolean usercheck = boarddao.isBoardWriter(num, pass);
			
			//비밀번호가 다른 경우
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
		
			//비밀번호가 일치하는 경우 수정 내용을 설정합니다.
			//BoardBean 객체에 글 등록 폼에서 입력 받은 정보들을 저장합니다.
			boarddata.setBOARD_NUM(num);
			boarddata.setBOARD_PASS(pass);
			boarddata.setBOARD_SUBJECT(multi.getParameter("BOARD_SUBJECT"));
			boarddata.setBOARD_CONTENT(multi.getParameter("BOARD_CONTENT"));
			
			String check = multi.getParameter("check");
			System.out.println("check=" + check);
			if(check!=null) {//기존파일 그대로 사용하는 경우입니다.
				boarddata.setBOARD_FILE(check);
			} else {
				//업로드된 파일의 시스템 상에 업로드된 실제 파일명을 얻어 옵니다.
				String filename = multi.getFilesystemName("BOARD_FILE");
				boarddata.setBOARD_FILE(filename);
			}
			
			//DAO에서 수정 메서드 호출하여 수정합니다.
			result = boarddao.boardModify(boarddata);
			
			// 수정에 실패한 경우
			if (result == false) {
				System.out.println("게시판 수정 실패");
				forward = new ActionForward();
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
		}catch(Exception ex){
			ex.printStackTrace();
		}
		return null;
	}
}