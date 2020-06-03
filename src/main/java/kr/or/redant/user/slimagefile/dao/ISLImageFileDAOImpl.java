package kr.or.redant.user.slimagefile.dao;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.redant.vo.SFFileItemVO;
import kr.or.redant.vo.SLImageFileVO;
@Repository
public class ISLImageFileDAOImpl implements ISLImageFileDAO {
	@Autowired
	private SqlMapClient client; 
	
	@Override
	public void insertSLImageFile(List<SLImageFileVO> fileItemList)
			throws Exception {
		try {
			client.startTransaction();
			for(SLImageFileVO slImageFileInfo : fileItemList){
				client.insert("slImageFile.insertSLImageFile",slImageFileInfo);
			}
			client.commitTransaction();
		} finally{
			client.endTransaction();
		}
	}

	@Override
	public SLImageFileVO slImageFileInfo(Map<String, String> params)
			throws Exception {
		return (SLImageFileVO) client.queryForObject("slImageFile.slImageFileInfo",params);
	}

}
