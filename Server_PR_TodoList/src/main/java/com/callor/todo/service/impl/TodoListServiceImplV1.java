package com.callor.todo.service.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.callor.todo.config.DBContract;
import com.callor.todo.config.DBInfo;
import com.callor.todo.model.TodoListVO;
import com.callor.todo.service.TodoListService;

public class TodoListServiceImplV1 implements TodoListService {
	
	protected Connection dbConn;
	public TodoListServiceImplV1() {
		dbConn = DBContract.getDBConnection();
	}
	
	// DBMS에 SQL을 보내고 결과를 받아서 List 데이터로 만들어주는 함수
	// 조회하는 메소드에서 공통으로 사용하기 때문에 만듬
	protected List<TodoListVO> select(PreparedStatement pStr) throws SQLException {
		// PreparedStatement : SQL구문을 실행시키는 기능을 갖는 객체
		
		// 결과를 추가할 리스트 배열 생성
		List<TodoListVO> tdList = new ArrayList<TodoListVO>();
		
		// ResultSet : SELECT의 결과를 저장하는 객체
		// executeQuery() : SELECT 쿼리를 실행할 때 사용. 실행결과를 ResultSet객체에 담아서 리턴
		ResultSet rSet = pStr.executeQuery();
		
		// ResultSet이 지원하는 next() : SELECT 쿼리의 결과를 행으로 저장. 커서의 다음 행이 존재할 경우 true를 리턴하고 커서를 그 행으로 이동
		while(rSet.next()) {
			TodoListVO tdVO = new TodoListVO();
			tdVO.setTd_seq(rSet.getLong(DBInfo.td_seq));
			tdVO.setTd_date(rSet.getString(DBInfo.td_date));
			tdVO.setTd_time(rSet.getString(DBInfo.td_time));
			tdVO.setTd_todo(rSet.getString(DBInfo.td_todo));
			tdVO.setTd_place(rSet.getString(DBInfo.td_place));
			tdList.add(tdVO);
		}
		System.out.println(tdList.toString());
		return tdList;
	}
	
	
	@Override
	public List<TodoListVO> selectAll() {
		// TODO 전체 리스트 조회
		String sql = " SELECT * FROM tbl_todolist ";
		sql += " ORDER BY td_date ASC ";
		
		PreparedStatement pStr = null;
		try {
			pStr = dbConn.prepareStatement(sql);
			// sql을 보내고 그 결과를 List 데이터로 만들어주는 select() 함수에게 위의 sql문의 결과를 담은 pStr을 보내고
			// 그 결과를 TodoListVO타입 List 객체로 생성
			List<TodoListVO> tdList = this.select(pStr);
			pStr.close();
			
			System.out.println(tdList.toString());
			return tdList;
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	

	@Override
	public TodoListVO findById(Long seq) {
		// TODO seq로 조회하기
		String sql = " SELECT * FROM tbl_todolist ";
		sql += " WHERE td_seq = ? ";
		
		PreparedStatement pStr = null;
		try {
			pStr = dbConn.prepareStatement(sql);
			pStr.setLong(1, seq);
			
			List<TodoListVO> tdList = this.select(pStr);
			pStr.close();
			
			if (tdList != null && tdList.size() > 0) {
				return tdList.get(0);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	

	@Override
	public Integer insert(TodoListVO tdVO) {
		// TODO 할일 데이터 추가
		String sql = " INSERT INTO tbl_todolist ";
		sql += " ( ";
		sql += " td_seq, ";
		sql += " td_date, ";
		sql += " td_time, ";
		sql += " td_todo, ";
		sql += " td_place) ";
		sql += " VALUES( ";
		sql += " seq_todolist.NEXTVAL, ";
		sql += " ?,?,?,? )";
		
		PreparedStatement pStr = null;
		try {
			pStr = dbConn.prepareStatement(sql);
			pStr.setString(1, tdVO.getTd_date());
			pStr.setString(2, tdVO.getTd_time());
			pStr.setString(3, tdVO.getTd_todo());
			pStr.setString(4, tdVO.getTd_place());
			return pStr.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public Integer update(TodoListVO tdVO) {
		// TODO 데이터 수정하기
		String sql = " UPDATE tbl_todolist SET ";
		sql += " td_date = ?, ";
		sql += " td_time = ?, ";
		sql += " td_todo = ?, ";
		sql += " td_place = ? ";
		
		sql += " WHERE td_seq = ? ";
		
		PreparedStatement pStr = null;
		try {
			pStr = dbConn.prepareStatement(sql);
			pStr.setString(1, tdVO.getTd_date());
			pStr.setString(2, tdVO.getTd_time());
			pStr.setString(3, tdVO.getTd_todo());
			pStr.setString(4, tdVO.getTd_place());
			
			pStr.setLong(5, tdVO.getTd_seq());
			
			return pStr.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public Integer delete(Long seq) {
		// TODO 데이터 삭제
		String sql = " DELETE FROM tbl_tololist ";
		sql += " WHERE td_seq = ? ";
		
		PreparedStatement pStr = null;
		try {
			pStr = dbConn.prepareStatement(sql);
			pStr.setLong(1, seq);
			return pStr.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return null;
	}

}
