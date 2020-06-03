package kr.or.redant.user.qnafileitem.dao;

import java.util.List;
import java.util.Map;

import kr.or.redant.vo.QNAFileItemVO;

public interface IQnaFileItemDAO {
	public void insertQnaFileItem(List<QNAFileItemVO> fileItemList) throws Exception;
	public QNAFileItemVO qnaFileItemInfo(Map<String, String> params) throws Exception;
}
