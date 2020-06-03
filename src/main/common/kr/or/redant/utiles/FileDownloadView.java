package kr.or.redant.utiles;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.PageContext;

import kr.or.redant.global.GlobalConstant;

import org.springframework.web.servlet.view.AbstractView;

public class FileDownloadView extends AbstractView{

	@Override
	protected void renderMergedOutputModel(Map<String, Object> model,
		HttpServletRequest request, HttpServletResponse response) throws Exception {
		String targetFileName = (String) model.get("targetFileName");
		File downloadFile = new File(GlobalConstant.FILE_PATH, targetFileName);
		String fileName = "";
		if(downloadFile.exists()){
			fileName = URLEncoder.encode(targetFileName, "UTF-8");
			response.setHeader("Content-Disposition", "attachment;fileName=" + fileName);
			response.setContentType("application/octet-stream");
			response.setContentLength((int)downloadFile.length());
			
			byte[] buffer = new byte[(int)downloadFile.length()];
			BufferedInputStream inputStream = null;
			BufferedOutputStream outputStream = null;
			inputStream = new BufferedInputStream(
			                    new FileInputStream(downloadFile));
			outputStream = new BufferedOutputStream(response.getOutputStream());
			int readCNT = 0;
			while((readCNT = inputStream.read(buffer)) != -1){
				outputStream.write(buffer);
			}
			inputStream.close();
			outputStream.close();
		}
		
	}
}
