package yeonsup.command;

import java.io.IOException;
import java.util.Arrays;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.jdom2.Document;
import org.jdom2.Element;
import org.jdom2.output.Format;
import org.jdom2.output.XMLOutputter;
import org.json.JSONArray;
import org.json.JSONObject;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.dataformat.xml.XmlMapper;

import yeonsup.beans.CommentDTO;

public class AjaxListCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		
		// parameter 받아오기, 없으면 json 으로 response(디폴트)
		String regType = request.getParameter("reqType"); // 이 파라미터가 없으며 json 리턴
		
		if(regType == null) regType = "json";
		
		// "xml" 혹은 "json" 으로 response 하기
		switch(regType) {
		
		case "xml":
			//responseXML(request, response); // jdom 사용하여 xml response
			responseXML(request, response);
			break;
		case "json":
			//responseJSON(request, response); // org.json 사용하여 xml response
			responseJSON(request, response);
			break;
		default:
			responseJSON(request, response); // org.json 사용하여 xml response
			break;
		
		} // end switch
		
	} // end execute()

//	private void responseJSON2(HttpServletRequest request, HttpServletResponse response) {
//		CommentDto [] dtoArr = (CommentDto [])request.getAttribute("list");
//		
//		AjaxBoardListJSON list = new AjaxBoardListJSON(); // response 할 Java 객체
//		
//		if(dtoArr == null) {
//			list.setStatus("FAIL");
//		} else {
//			list.setStatus("OK");
//			list.setCount(dtoArr.length);
//			list.setList(Arrays.asList(dtoArr));
//		}
//		
//		ObjectMapper mapper = new ObjectMapper(); // Json 매핑 수행하는 객체
//		
//		try {
//			String jsonString = mapper.writeValueAsString(list);
//			
//			
//			response.setContentType("application/json; charset=utf-8");
//			response.getWriter().write(jsonString);
//			
//			
//			
//		} catch (JsonProcessingException e) {
//			e.printStackTrace();
//		} catch (IOException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
//		
//	}
//
//	private void responseXML2(HttpServletRequest request, HttpServletResponse response) {
//		//WriteDTO [] dtoArr = (WriteDTO [])request.getAttribute("list");
//		
//		//AjaxBoardListXML list = new AjaxBoardListXML(); // response 할 자바 객체
//		
//		XmlMapper mapper = new XmlMapper(); // XML 매핑 수행 객체
//		
//		if(dtoArr == null) {
//			list.setStatus("FAIL");
//		} else {
//			list.setStatus("OK");
//			list.setCount(dtoArr.length);
//			list.setList(Arrays.asList(dtoArr));
//		}
//		
//		try {
//			String xmlString = mapper.writeValueAsString(list);
//			
//			response.setContentType("application/xml; charset=utf-8");
//			response.getWriter().write(xmlString);
//			
//		} catch (JsonProcessingException e) {
//			e.printStackTrace();
//		} catch (IOException e) {
//			e.printStackTrace();
//		}
//		
//		
//		
//	}

	private void responseJSON(HttpServletRequest request, HttpServletResponse response) {

		CommentDTO [] dtoArr = (CommentDTO[])request.getAttribute("list");
		
		JSONObject jsonOutput = new JSONObject(); // 최종결과는 object
		// 데이터 개수
		if(dtoArr == null) {
			jsonOutput.put("status", "FAIL");
		} else {
			jsonOutput.put("status", "OK");
			int count = dtoArr.length;
			jsonOutput.put("count", count);
			
			JSONArray dataArr = new JSONArray(); // array
			for(int i = 0; i < count; i++) {
				JSONObject dataObj = new JSONObject();
				
				dataObj.put("c_uid", dtoArr[i].getC_uid());
				dataObj.put("b_uid", dtoArr[i].getB_uid());
				dataObj.put("u_uid", dtoArr[i].getU_uid());
				dataObj.put("c_pw", dtoArr[i].getC_pw());
				dataObj.put("reply", dtoArr[i].getReply());
				dataObj.put("c_regdate", dtoArr[i].getC_regdate());
				dataObj.put("u_nickname", dtoArr[i].getU_nickName());
				
				
				// array 에 추가
				dataArr.put(dataObj);
			}
			
			jsonOutput.put("data", dataArr);
		}
		
		try {
			String jsonString = jsonOutput.toString(); // JSONObject 를 문자열 변환
			System.out.println(jsonString);
			
			response.setContentType("application/json; charset=utf-8");
			response.getWriter().write(jsonString); // response 내보내기
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
		
		
	} // end resposneJSON()

	private void responseXML(HttpServletRequest request, HttpServletResponse response) {
		CommentDTO [] dtoArr = (CommentDTO []) request.getAttribute("list");
		
		Document dom = new Document(); // org.jdom2.Document
		Element rootElement = new Element("WriteList"); // org.jdom2.Element
														// <WriteList> ... <WriteList>
		dom.setRootElement(rootElement);
		
		Element statusElement = null;
		if(dtoArr == null) {
			statusElement = new Element("status").setText("FAIL"); // <status>FAIL</status>
		} else {
			statusElement = new Element("status").setText("OK"); // <status>OK</status>
			
			// 데이터 개수
			int count = dtoArr.length;
			Element countElement = new Element("count")
							.setText(count + "")
							.setAttribute("id", "ccc") // attribute 가 필요하면 setAttribute() 사용
							.setAttribute("pw", "xxx");
			
			rootElement.addContent(countElement);
			
			for(int i = 0; i < count; i++) {
				Element dataElement = new Element("Data"); // <Data> ...</Data>
				
//				dataElement.addContent(new Element("uid").setText(dtoArr[i].getUid() + ""));
//				dataElement.addContent(new Element("name").setText(dtoArr[i].getName() + ""));
//				dataElement.addContent(new Element("subject").setText(dtoArr[i].getSubject() + ""));
//				dataElement.addContent(new Element("content").setText(dtoArr[i].getContent() + ""));
//				dataElement.addContent(new Element("viewcnt").setText(dtoArr[i].getViewCnt() + ""));
//				dataElement.addContent(new Element("regdate").setText(dtoArr[i].getRegDate() + ""));
				
				rootElement.addContent(dataElement);
			}
			
			
		}
		
		rootElement.addContent(statusElement);
		
		
		
		// response
		XMLOutputter xmlOutputter = new XMLOutputter(Format.getPrettyFormat());
		
		try {
			response.setContentType("application/xml; charset=utf-8");
			response.getWriter().write(xmlOutputter.outputString(dom));
			System.out.println(xmlOutputter.outputString(dom));
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		
	} // end responseXML()

}

























