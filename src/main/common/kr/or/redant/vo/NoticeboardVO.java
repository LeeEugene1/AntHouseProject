package kr.or.redant.vo;
//공지사항 게시판
public class NoticeboardVO {
	private String notice_no;		//공지사항 번호	
	private String notice_title;	//공지사항 제목
	private String notice_content;	//공지사항 내용
	private String notice_hit;		//조회수
	private String notice_reg_date;	//최초등록일
	private String notice_status;	//게시글 상태
	private String admin_id;		//관리자 아이디
	private String notice_writer;
	private String notice_rnum;
	
	public String getNotice_writer() {
		return notice_writer;
	}
	public void setNotice_writer(String notice_writer) {
		this.notice_writer = notice_writer;
	}
	public String getNotice_rnum() {
		return notice_rnum;
	}
	public void setNotice_rnum(String notice_rnum) {
		this.notice_rnum = notice_rnum;
	}
	public String getNotice_no() {
		return notice_no;
	}
	public void setNotice_no(String notice_no) {
		this.notice_no = notice_no;
	}
	public String getNotice_title() {
		return notice_title;
	}
	public void setNotice_title(String notice_title) {
		this.notice_title = notice_title;
	}
	public String getNotice_content() {
		return notice_content;
	}
	public void setNotice_content(String notice_content) {
		this.notice_content = notice_content;
	}
	public String getNotice_hit() {
		return notice_hit;
	}
	public void setNotice_hit(String notice_hit) {
		this.notice_hit = notice_hit;
	}
	public String getNotice_reg_date() {
		return notice_reg_date;
	}
	public void setNotice_reg_date(String notice_reg_date) {
		this.notice_reg_date = notice_reg_date;
	}
	public String getNotice_status() {
		return notice_status;
	}
	public void setNotice_status(String notice_status) {
		this.notice_status = notice_status;
	}
	public String getAdmin_id() {
		return admin_id;
	}
	public void setAdmin_id(String admin_id) {
		this.admin_id = admin_id;
	}
	
	
}
