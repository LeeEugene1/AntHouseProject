package kr.or.redant.user.qnafileitem.service;

import java.util.Map;

import kr.or.redant.vo.QNAFileItemVO;

public interface IQnaFileItemService {
	public QNAFileItemVO qnaFileItemInfo(Map<String, String> params) throws Exception;
}
