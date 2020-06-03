package kr.or.redant.user.freefileitem.service;

import java.util.Map;

import kr.or.redant.vo.FreeFileItemVO;

public interface IFreeFileItemService {
	public FreeFileItemVO freeFileItemInfo(Map<String, String> params) throws Exception;
}
