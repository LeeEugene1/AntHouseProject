package kr.or.redant.user.notice.dao;

import java.util.List;
import java.util.Map;

import kr.or.redant.vo.NoticeboardVO;

public interface INoticeboardDAO {
	public NoticeboardVO noticeboardInfo(Map<String, String> params) throws Exception;
	public List<NoticeboardVO> noticeboardList(Map<String, String> params) throws Exception;
	public List<NoticeboardVO> noticeboardList() throws Exception;
	public String insertNoticeboardInfo(NoticeboardVO noticeboardInfo) throws Exception;
	public void updateNoticeboardInfo(NoticeboardVO noticeboardInfo) throws Exception;
	public void deleteNoticeboardInfo(Map<String, String> params) throws Exception;
	public String totalCount(Map<String, String> params) throws Exception;
}
