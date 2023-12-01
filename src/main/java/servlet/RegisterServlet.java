package servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.RegisterBean;

/**
 * Servlet implementation class RegisterServlet
 */
@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/registerCheck.jsp");
		dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		//変数宣言
		String title = request.getParameter("title");
		String start = request.getParameter("start");
		String end = request.getParameter("end");
		String allDay = request.getParameter("allDay");
		
		RegisterBean event = new RegisterBean(title, start, end, allDay);
		List<RegisterBean> EventList = new ArrayList<RegisterBean>();
		
		EventList.add(event);
		request.setAttribute("EventList", EventList);
		
		
		System.out.println("タイトル" + title);
		System.out.println("始まり" + start);
		System.out.println("終わり" + end);
		System.out.println("日にち" + allDay);
//		System.out.println(EventList.get(1));
		System.out.println(EventList);

		
		HttpSession session = request.getSession();
		session.setAttribute("event", event);
		
//		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/registerCheck.jsp");
//		dispatcher.forward(request, response);
	}

}
