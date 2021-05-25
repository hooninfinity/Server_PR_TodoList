package com.callor.todo.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.callor.todo.config.DBInfo;
import com.callor.todo.model.TodoListVO;
import com.callor.todo.service.TodoListService;
import com.callor.todo.service.impl.TodoListServiceImplV1;

@WebServlet("/todo/*")
public class TodoListController extends HttpServlet {

	private static final long serialVersionUID = 1L;
	protected TodoListService tdService;

	public TodoListController() {
		tdService = new TodoListServiceImplV1();
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String subPath = req.getPathInfo();
		if (subPath.equals("/view")) {
			String strSeq = req.getParameter("td_seq");
			Long td_seq = Long.valueOf(strSeq);
			TodoListVO tdVO = tdService.findById(td_seq);
			// setAttribute("속성이름", 속성값) : 선택한 요소(req)의 속성값을 정함
			req.setAttribute("TD", tdVO);

			req.getRequestDispatcher("/WEB-INF/views/view.jsp").forward(req, resp);

		} else if (subPath.equals("/insert")) {

			TodoListVO tdVO = new TodoListVO();

			SimpleDateFormat sd = new SimpleDateFormat("yyyy-MM-dd");
			SimpleDateFormat st = new SimpleDateFormat("HH:mm:ss");
			Date date = new Date(System.currentTimeMillis());

			tdVO.setTd_seq(0L);
			tdVO.setTd_date(sd.format(date));
			tdVO.setTd_time(st.format(date));

			req.setAttribute("TD", tdVO);

			req.getRequestDispatcher("/WEB-INF/views/insert.jsp").forward(req, resp);

		} else if (subPath.equals("/delete")) {
			
			String strSeq = req.getParameter("td_seq");
			Long td_seq = Long.valueOf(strSeq);
			
			tdService.delete(td_seq);
			resp.sendRedirect("/todo");
			
		} else if (subPath.equals("/update")) {
			
			String strSeq = req.getParameter("td_seq");
			Long td_seq = Long.valueOf(strSeq);
			
			TodoListVO tdVO = tdService.findById(td_seq);
			req.setAttribute("TD", tdVO);
			
			req.getRequestDispatcher("/WEB-INF/views/write.jsp").forward(req, resp);
		}
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		req.setCharacterEncoding("UTF-8");
		String subPath = req.getPathInfo();
		// getParameter() : 사용자가 입력한 데이터를 가져옴
		String td_date = req.getParameter(DBInfo.td_date);
		String td_time = req.getParameter(DBInfo.td_time);
		String td_todo = req.getParameter(DBInfo.td_todo);
		String td_place = req.getParameter(DBInfo.td_place);

		TodoListVO tdVO = new TodoListVO();
		tdVO.setTd_date(td_date);
		tdVO.setTd_time(td_time);
		tdVO.setTd_todo(td_todo);
		tdVO.setTd_place(td_place);

//		System.out.println(tdVO.toString());

		if (subPath.equals("/insert")) {

			tdService.insert(tdVO);
			resp.sendRedirect("/todo/");

		} else if (subPath.equals("/update")) {
			
			String strSeq = req.getParameter("td_seq");
			Long td_seq = Long.valueOf(strSeq);
			
			tdVO.setTd_seq(td_seq);
			tdService.update(tdVO);
			resp.sendRedirect("/todo/");
			
		}

	}

}
