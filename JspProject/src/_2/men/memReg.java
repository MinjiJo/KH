package _2.men;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/ch3/_2.mem/memReg")
public class memReg extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public memReg() {
        super();
        System.out.println("생성자");
    }
    
    public void init() throws ServletException {
		System.out.println("init()");
	}
    
    public void destory() {
		System.out.println("destroy()");
	}
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=euc-kr");
		String name = request.getParameter("name");
		String addr = request.getParameter("addr");
		String tel = request.getParameter("tel");
		String hobby = request.getParameter("hobby");
		
		PrintWriter out = response.getWriter();
		out.print("served at: " + request.getContextPath() + "<br>");
		out.print("이름: " + name + "<br>");
		out.print("주소: " + addr + "<br>");
		out.print("전화번호: " + tel + "<br>");
		out.print("취미: " + hobby + "<br>");
		out.close();
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=euc-kr");
		request.setCharacterEncoding("euc-kr");
		String name = request.getParameter("name");
		String addr = request.getParameter("addr");
		String tel = request.getParameter("tel");
		String hobby = request.getParameter("hobby");
		
		PrintWriter out = response.getWriter();
		out.print("served at: " + request.getContextPath() + "<br>");
		out.print("이름: " + name + "<br>");
		out.print("주소: " + addr + "<br>");
		out.print("전화번호: " + tel + "<br>");
		out.print("취미: " + hobby + "<br>");
		out.close();
	}
}