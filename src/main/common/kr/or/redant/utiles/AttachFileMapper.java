package kr.or.redant.utiles;

import java.io.File;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import kr.or.redant.global.GlobalConstant;
import kr.or.redant.vo.FreeFileItemVO;
import kr.or.redant.vo.QNAFileItemVO;
import kr.or.redant.vo.SFFileItemVO;
import kr.or.redant.vo.SLImageFileVO;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.io.FilenameUtils;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;


@Component
public class AttachFileMapper {
	
   public List<QNAFileItemVO> qnaMapper(MultipartFile[] items, String qna_no) {
      List<QNAFileItemVO> fileItemList = new ArrayList<QNAFileItemVO>();
      
      if (items != null) {
    	  QNAFileItemVO fileItemInfo = null;
         for (MultipartFile item : items) {
        	if(item.getSize()>0){
            fileItemInfo = new QNAFileItemVO();
            
            fileItemInfo.setQna_no(qna_no);
            
            // a.png
            // D:\temp\a.png -> a.png
            String fileName = FilenameUtils.getName(item.getOriginalFilename());
            fileItemInfo.setQna_file_name(fileName);
            
            // a.png   a + UUTD랜덤값 + .png -> 실제 저장소 파일 저장
            String baseName = FilenameUtils.getBaseName(fileName);
            String extension = FilenameUtils.getExtension(fileName);   // 확장자
            
            String genID = UUID.randomUUID().toString().replace("-", "");
            
            String saveFileName = baseName + genID + "." + extension;
            fileItemInfo.setQna_file_save_name(saveFileName);
            
            fileItemInfo.setQna_file_type(item.getContentType());
            fileItemInfo.setQna_file_size(String.valueOf(item.getSize()));
            
            if(!fileName.equals("")){
            	fileItemList.add(fileItemInfo);
            }
            
            saveFile(saveFileName, item);
        	 }
         }
      }
      return fileItemList;
   }
   
   public List<FreeFileItemVO> freeMapper(MultipartFile[] items, String fr_bo_no) {
	      List<FreeFileItemVO> fileItemList = new ArrayList<FreeFileItemVO>();
	      
	      if (items != null) {
	    	  FreeFileItemVO fileItemInfo = null;
	         for (MultipartFile item : items) {
	        	if(item.getSize()>0){
	            fileItemInfo = new FreeFileItemVO();
	            
	            fileItemInfo.setFr_bo_no(fr_bo_no);
	            
	            // a.png
	            // D:\temp\a.png -> a.png
	            String fileName = FilenameUtils.getName(item.getOriginalFilename());
	            fileItemInfo.setFr_file_name(fileName);
	            
	            // a.png   a + UUTD랜덤값 + .png -> 실제 저장소 파일 저장
	            String baseName = FilenameUtils.getBaseName(fileName);
	            String extension = FilenameUtils.getExtension(fileName);   // 확장자
	            
	            String genID = UUID.randomUUID().toString().replace("-", "");
	            
	            String saveFileName = baseName + genID + "." + extension;
	            fileItemInfo.setFr_file_save_name(saveFileName);
	            
	            fileItemInfo.setFr_file_type(item.getContentType());
	            fileItemInfo.setFr_file_size(String.valueOf(item.getSize()));
	            
	            fileItemList.add(fileItemInfo);
	            
	            saveFile(saveFileName, item);
	        	}
	         }
	      }
	      return fileItemList;
	   }
   
   public List<SFFileItemVO> sfMapper(MultipartFile[] items, String sf_no) {
	      List<SFFileItemVO> fileItemList = new ArrayList<SFFileItemVO>();
	      if (items != null) {
	    	  SFFileItemVO fileItemInfo = null;
	         for (MultipartFile item : items) {
	        	if(item.getSize()>0){
	            fileItemInfo = new SFFileItemVO();
	            
	            fileItemInfo.setSf_no(sf_no);
	            
	            // a.png
	            // D:\temp\a.png -> a.png
	            String fileName = FilenameUtils.getName(item.getOriginalFilename());
	            fileItemInfo.setSf_file_name(fileName);
	            
	            // a.png   a + UUTD랜덤값 + .png -> 실제 저장소 파일 저장
	            String baseName = FilenameUtils.getBaseName(fileName);
	            String extension = FilenameUtils.getExtension(fileName);   // 확장자
	            
	            String genID = UUID.randomUUID().toString().replace("-", "");
	            
	            String saveFileName = baseName + genID + "." + extension;
	            fileItemInfo.setSf_file_save_name(saveFileName);
	            
	            fileItemInfo.setSf_file_type(item.getContentType());
	            fileItemInfo.setSf_file_size(String.valueOf(item.getSize()));
	            
	            fileItemList.add(fileItemInfo);
	            
	            saveFile(saveFileName, item);
	         	}
	         }
	      }
	      return fileItemList;
	   }
   
   public List<SLImageFileVO> slMapper(MultipartFile[] items, String sl_no) {
	      List<SLImageFileVO> fileItemList = new ArrayList<SLImageFileVO>();
	      
	      if (items != null) {
	    	  SLImageFileVO fileItemInfo = null;
	         for (MultipartFile item : items) {
	        	if(item.getSize()>0){
	            fileItemInfo = new SLImageFileVO();
	            
	            fileItemInfo.setSl_no(sl_no);
	            
	            // a.png
	            // D:\temp\a.png -> a.png
	            String fileName = FilenameUtils.getName(item.getOriginalFilename());
	            fileItemInfo.setSl_img_name(fileName);
	            
	            // a.png   a + UUTD랜덤값 + .png -> 실제 저장소 파일 저장
	            String baseName = FilenameUtils.getBaseName(fileName);
	            String extension = FilenameUtils.getExtension(fileName);   // 확장자
	            
	            String genID = UUID.randomUUID().toString().replace("-", "");
	            
	            String saveFileName = baseName + genID + "." + extension;
	            fileItemInfo.setSl_img_save_name(saveFileName);
	            
	            fileItemInfo.setSl_img_type(item.getContentType());
	            fileItemInfo.setSl_img_size(String.valueOf(item.getSize()));
	            
	            fileItemList.add(fileItemInfo);
	            
	            saveFile(saveFileName, item);
	        	}
	         }
	      }
	      return fileItemList;
	   }

   private void saveFile(String saveFileName, MultipartFile item) {
      File saveFile = new File(GlobalConstant.FILE_PATH, saveFileName);
      
      try {
         item.transferTo(saveFile);
      } catch (Exception e) {
         e.printStackTrace();
      }
      
   }
}












