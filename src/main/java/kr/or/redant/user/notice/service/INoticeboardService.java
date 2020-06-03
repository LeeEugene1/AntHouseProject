package kr.or.redant.user.notice.service;

import java.util.List;
import java.util.Map;


import kr.or.redant.qualifer.service.IService;
import kr.or.redant.vo.NoticeboardVO;

public interface INoticeboardService extends IService{
	public NoticeboardVO noticeboardInfo(Map<String, String> params) throws Exception;
	public List<NoticeboardVO> noticeboardList(Map<String, String> params) throws Exception;
	public List<NoticeboardVO> noticeboardList() throws Exception;
	public void insertNoticeboardInfo(NoticeboardVO noticeboardInfo) throws Exception;
	public void updateNoticeboardInfo(NoticeboardVO noticeboardInfo) throws Exception;
	public void deleteNoticeboardInfo(Map<String, String> params) throws Exception;
	public String totalCount(Map<String, String> params) throws Exception;
}
