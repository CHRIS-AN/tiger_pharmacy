package yeonsup.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.Command;
import yeonsup.beans.FreeTalkDAO;
import yeonsup.beans.FreeTalkDTO;

public class searchCommand implements Command {
	
	int writePages;
	int pageRows;
	int totalPage;
	int curPage;
	String url;
	String add;
	String wordUrl;
	String s_colUrl;
	
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) { 
		FreeTalkDAO dao = new FreeTalkDAO();
		// 구분 = s_col, 검색 내용 = word 
		String s_col = request.getParameter("s_col");
		String word = request.getParameter("word");
		word = word.replace(" ", "");
		wordUrl = "word=" + word;
		s_colUrl = "s_col=" + s_col;
		
		String str = "";
		
		/*
		 총수량, 현재 페이지, 페이징에 표시될 수
		 total, cur, write
		 변수 선언 */
		writePages = 5;
		pageRows = 10;
		totalPage = 0;
		curPage = 1;
		
		add = request.getParameter("add");
		if(add == null) {add = "";}
		
		url = request.getRequestURL().toString() + "?page=";
		
		
		
		
		// total 만들기 
		// 1. 쿼리문 수행
		totalPage = dao.selectTotalBoardByWord(pageRows, s_col, word);
		request.setAttribute("totalPage", totalPage);
		
		totalPage = (int)Math.ceil(totalPage / (double)pageRows);
		
		// 파라미터로 넘어온 cur 페이지가 없으면 기본값 1
		// 1 > curPage = 1 
		// 총페이지수 > curPage = totalPage
		String pageParam = request.getParameter("page");
		
		if(pageParam != null && !pageParam.trim().equals("")){
			try {
				int p = Integer.parseInt(pageParam);
				if(p > 0) curPage = p;
			} catch(NumberFormatException e){
				e.printStackTrace();
			}
		}
		
		//str 에 string 추가
		str = makePageString(str);
		
		//파라미터로 str 값 넘기기
		request.setAttribute("str", str);
		
		
		
		
		
		// dao, dto
		dao = new FreeTalkDAO();
		FreeTalkDTO [] arr = null;
		
		arr = dao.selectSerach(s_col, word, curPage, pageRows);
		
		request.setAttribute("list", arr);
		request.setAttribute("curPage", curPage);

	}
	private String makePageString (String str) {
		
		int start_page = ( (int)( (curPage - 1) / writePages) ) * writePages + 1 ;
		int end_page = start_page + writePages -1;
		
		if (end_page >= totalPage ) {
			end_page = totalPage;
		}
		
		// ◆◆◆◆◆◆  페이지 수 계산 ◆◆◆◆◆◆
		// ◆   << 표시
		if (curPage > 1) {
			str += "<li><a href='" + url + "1" + add + "&" + wordUrl + "&" + s_colUrl + "' class='tooltip-top' title='처음'><i class='fa fa-angle-double-left'></i></a></li>\n";
		}
		
		// ◆   < 표시
		if (start_page >= 1 && curPage > 1) {
			if((start_page -1) != 0 )
				str += "<li><a href='" + url + (start_page - 1) + add + "&" + wordUrl + "&" + s_colUrl + "' class='tooltip-top' title='이전'><i class='fa fa-angle-left'></i></a></li>\n";
			else
				str += "<li><a href='" + url + "1" + add + "&" + wordUrl + "&" + s_colUrl + "' class='tooltip-top' title='이전'><i class='fa fa-angle-left'></i></a></li>\n";
		}
		
		// ◆  페이징 안의 '숫자' 표시
		if (totalPage >= 1) {
		    for (int k = start_page; k <= end_page; k++) {
		        if (curPage != k)
		            str += "<li><a href='" + url + k + add + "&" + wordUrl + "&" + s_colUrl + "'>" + k + "</a></li>\n";
		        else
		            str += "<li><a href='#' class='active tooltip-top' title='현재페이지'>" + k + "</a></li>\n";
		    }
		}
		
		// ◆ > 표시
		if (totalPage >= end_page && curPage != end_page){
			if(end_page + 1 <= totalPage)
				str += "<li><a href='" + url + (end_page + 1) + add + "&" + wordUrl + "&" + s_colUrl + "' class='tooltip-top' title='다음'><i class='fa fa-angle-right'></i></a></li>\n";
			else
				str += "<li><a href='" + url + (end_page) + add + "&" + wordUrl + "&" + s_colUrl + "' class='tooltip-top' title='다음'><i class='fa fa-angle-right'></i></a></li>\n";
	    }
		
		// ◆ >> 표시
		//■ >> 표시
	    if (curPage < totalPage) {
	        str += "<li><a href='" + url + totalPage + add + "&" + wordUrl + "&" + s_colUrl + "' class='tooltip-top' title='맨끝'><i class='fa fa-angle-double-right'></i></a></li>\n";
	    }
	    
		return str;
	}
}
