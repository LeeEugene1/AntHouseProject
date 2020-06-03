package kr.or.redant.user.qnafileitem.dao;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.redant.vo.QNAFileItemVO;
@Repository
public class IQnaFileItemDAOImpl implements IQnaFileItemDAO {
	@Autowired
	private SqlMapClient client; 
	
	@Override
	public void insertQnaFileItem(List<QNAFileItemVO> fileItemList)
			throws Exception {
		try {
			client.startTransaction();
			for(QNAFileItemVO qnaFileItemInfo : fileItemList){
				client.insert("qnaFileItem.insertQnaFileItem",qnaFileItemInfo);
			}
			client.commitTransaction();
		} finally{
			client.endTransaction();
		}
	}

	@Override
	public QNAFileItemVO qnaFileItemInfo(Map<String, String> params)
			throws Exception {
		return (QNAFileItemVO) client.queryForObject("qnaFileItem.qnaFileItemInfo",params);
	}

}
