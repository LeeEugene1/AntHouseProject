package kr.or.redant.utiles;

import javax.servlet.http.HttpServletRequest;

import org.apache.tiles.Attribute;
import org.apache.tiles.AttributeContext;
import org.apache.tiles.context.TilesRequestContext;
import org.apache.tiles.preparer.ViewPreparer;

// tiles-def.xml
//   <definition name=user/*/* extends=user/main>
//       <put-attribute name=header value=/WEB-INF/views/user/layout/header.jsp /> 
//       <put-attribute name=content value=/WEB-INF/views/user/{1}/{2}.jsp />
public class TilesCustomViewPrepare implements ViewPreparer {

	// 컨트롤러 클래스 내 컨트롤러 메서드의 반환값(void, model, modelMap, String, ModelAndView....)이
	// 타일즈뷰리솔버(order=1) 전달
	//       void, model, modelMap, vo = 클라이언트 요청시 서블릿 패스를 기준으로 View(tiles,class, internalresourceviewresolver) 결정
	//                                  View의 경로가 request.setAttribute("viewName", "서블릿패스로부터 추출한 경로");
	//       ModelAndView = View 경로와 명 설정
	//                      View의 경로가 request.setAttribute("viewName", "설정된 View의 경로와 명");
	@Override
	public void execute(TilesRequestContext tilesContext,
			            AttributeContext attributeContext) {
		HttpServletRequest request = (HttpServletRequest) tilesContext.getRequestObjects()[0];
		
		String tileViewName = (String) request.getAttribute("tilesViewName");
		
		System.out.println("---------------------------------------"+tileViewName);
		
		
		 
		// 1. 요번에 접근해야하는 타일즈의 definition 내 선언된 put-attribute의 name 속성값
		// 2. Attribute : put-attribute name 속성값, View의 경로
		// <put-attribute value=/WEB-INF/views/user/freeboard/freeboardList.jsp
		// <put-attribute value=/WEB-INF/views/user/freeboard/freeboardForm.jsp
//		Attribute attribute = new Attribute(GlobalConstant.PREFIX_PATH + "user/freeboard/freeboardForm" + GlobalConstant.SUFFIX_PATH);
//		attributeContext.putAttribute("content", attribute);

	}

}
