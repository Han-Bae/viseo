package com.viseo.controller.phg;

import java.io.*;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.*;
import javax.servlet.http.*;

import com.viseo.controller.*;
import com.viseo.dao.WriteDao;
import com.viseo.vo.WriteVO;

/**
 * 스케쥴 수정
 * 
 * @author	박형근
 * @since	2022.05.27
 * @version	v.1.0
 * 
 * 			작업이력	]
 * 				2022.05.27	-	담당자 : 박형근
 * 								내	용 : 스케쥴 수정
 */

public class UpdateTodo implements BlpInter {

	@Override
	public String exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		req.setAttribute("isRedirect", null);
		StringBuffer buff = new StringBuffer();
		
		// 로그인 확인
		String id = (String) req.getSession().getAttribute("SID");
		if(id == null) {
			req.setAttribute("isRedirect", true);
			return "/viseo/member/loginForm.blp";
		}
					
		String title = req.getParameter("title");	//제목
		String chcekDate = req.getParameter("chcekDate");	//지정날짜
		String chcekTime = req.getParameter("chcekTime");	//일정시간
		String todoRepeat = req.getParameter("todoRepeat");	//할일반복
		String memo = req.getParameter("memo");	//할일메모
		String alarmRepeat = req.getParameter("alarmRepeat");	//알람반복
		String category = req.getParameter("category");	//카테고리
		
		// vo에 담고
		WriteVO wVO = new WriteVO();
		wVO.setId(id);
		wVO.setTitle(title);
		wVO.setChcekDate(chcekDate);
		wVO.setChcekTime(chcekTime);
		wVO.setTodoRepeat(todoRepeat);
		wVO.setMemo(memo);
		wVO.setAlarmRepeat(alarmRepeat);
		wVO.setCategory(category);
		
		WriteDao wDao = new WriteDao();
		int result = wDao.writeUpdate(wVO);
		
		buff.append("{"); // {result:OK}
		buff.append("\"result\" : \"");
		if(result == 1) {	
			buff.append("OK"); //정상 저장처리된 경우 AJAX OK로 리턴
		} else {
			buff.append("NO"); //비정상 처리된 경우 AJAX NO로 리턴
		}
		buff.append("\"");
		buff.append("}");
		
		return buff.toString();
		
	}

}