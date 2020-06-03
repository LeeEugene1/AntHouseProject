package kr.or.redant.user.notice.dao;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.redant.vo.NoticeboardVO;
@Repository
public class INoticeboardDAOImpl implements INoticeboardDAO {

	@Autowired
	private SqlMapClient client;
	

	@Override
	public NoticeboardVO noticeboardInfo(Map<String, String> params) throws Exception {
		NoticeboardVO noticeboardInfo = null;
		try {
			client.startTransaction();
			client.update("noticeboard.updateHIT", params);
			noticeboardInfo = (NoticeboardVO) client.queryForObject("noticeboard.noticeboardInfo",params);
			client.commitTransaction();
		}finally{
			client.endTransaction();
		}
		return noticeboardInfo;
	}

	@Override
	public List<NoticeboardVO> noticeboardList(Map<String, String> params)
			throws Exception {
		return client.queryForList("noticeboard.noticeboardList", params);
	}
	
	@Override
	public List<NoticeboardVO> noticeboardList()
			throws Exception {
		return client.queryForList("noticeboard.noticeboardList");
	}
//	return client.queryForList("faqboard.faqboardList", params);


	@Override
	public String totalCount(Map<String, String> params) throws Exception {
		return (String) client.queryForObject("noticeboard.totalCount",params);
	}

	@Override
	public String insertNoticeboardInfo(NoticeboardVO noticeboardInfo) throws Exception {
		return (String) client.insert("noticeboard.insertNoticeboard",noticeboardInfo);
	}
	
	@Override
	public void updateNoticeboardInfo(NoticeboardVO noticeboardInfo) throws Exception {
		client.update("noticeboard.updateNoticeboard", noticeboardInfo);
	}

	@Override
	public void deleteNoticeboardInfo(Map<String, String> params) throws Exception {
		client.update("noticeboard.deleteNoticeboard", params);
	}





}
