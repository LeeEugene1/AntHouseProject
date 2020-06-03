package kr.or.redant.user.freefileitem.dao;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.redant.vo.FreeFileItemVO;
@Repository
public class IFreeFileItemDAOImpl implements IFreeFileItemDAO {
	@Autowired
	private SqlMapClient client; 
	
	@Override
	public void insertFreeFileItem(List<FreeFileItemVO> fileItemList)
			throws Exception {
		System.out.println("여기?_-=========================================");
		try {
			client.startTransaction();
			for(FreeFileItemVO freeFileItemInfo : fileItemList){
				client.insert("freeFileItem.insertFreeFileItem",freeFileItemInfo);
			}
			client.commitTransaction();
		} finally{
			client.endTransaction();
		}
	}

	@Override
	public FreeFileItemVO freeFileItemInfo(Map<String, String> params)
			throws Exception {
		return (FreeFileItemVO) client.queryForObject("freeFileItem.freeFileItemInfo",params);
	}

}
