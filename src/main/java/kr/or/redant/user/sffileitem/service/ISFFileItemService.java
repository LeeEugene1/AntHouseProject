package kr.or.redant.user.sffileitem.service;

import java.util.Map;

import kr.or.redant.vo.SFFileItemVO;

public interface ISFFileItemService {
	public SFFileItemVO sfFileItemInfo(Map<String, String> params) throws Exception;
}
