package kr.or.redant.user.sffileitem.dao;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.redant.vo.SFFileItemVO;
@Repository
public class ISFFileItemDAOImpl implements ISFFileItemDAO {
	@Autowired
	private SqlMapClient client; 
	
	@Override
	public void insertSFFileItem(List<SFFileItemVO> fileItemList)
			throws Exception {
		try {
			client.startTransaction();
			for(SFFileItemVO sfFileItemInfo : fileItemList){
				client.insert("sfFileItem.insertSFFileItem",sfFileItemInfo);
			}
			client.commitTransaction();
		} finally{
			client.endTransaction();
		}
	}

	@Override
	public SFFileItemVO sfFileItemInfo(Map<String, String> params)
			throws Exception {
		return (SFFileItemVO) client.queryForObject("sfFileItem.sfFileItemInfo",params);
	}

}
