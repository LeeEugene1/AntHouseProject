package kr.or.redant.file.filecontroller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/file/")
public class FileController {
	
//	@RequestMapping("qnaFileDownload")
//	public ModelAndView qnaFileDownload(String qna_file_Name,ModelAndView andView)throws Exception{
//		
//		andView.addObject("targetFileName", qna_file_Name);
//	    andView.setViewName("fileDownloadView");
//	      
//	    return andView;
//	    
//	}
	
	@RequestMapping("fileDownload")
	public ModelAndView fileDownload(String fileName, ModelAndView andView) throws Exception{
		andView.addObject("targetFileName", fileName);
		andView.setViewName("fileDownloadView");
		
		return andView;
		
	}
}
