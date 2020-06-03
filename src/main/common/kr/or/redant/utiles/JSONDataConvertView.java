package kr.or.redant.utiles;

import java.io.PrintWriter;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.view.AbstractView;

@Component("jsonDataConvertView")
public class JSONDataConvertView extends AbstractView{
	
	@Override
	protected void renderMergedOutputModel(Map<String, Object> targetMap,
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		ObjectMapper mapper = new ObjectMapper();
		String jsonData = mapper.writeValueAsString(targetMap.get("flag"));
		
		response.setCharacterEncoding("UTF-8");
		response.setContentType("application/json; charset=UTF-8");
		
		PrintWriter out = response.getWriter();
		out.println(jsonData);
	}
}
